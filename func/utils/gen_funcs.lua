FELIJO.is_mod_loaded = function(var) -- credit aiko
    if not var then return false end
    return (SMODS.Mods[var] and SMODS.Mods[var].can_load) and true or false
end

--[[
Copy a card table into a new card object.

Parameters:
  card (table): required original card to copy.
  new_card (table|nil): optional existing card object to fill; if provided, preserves deck membership if required.
  area (table|nil): optional area to place card into if not already in deck/area; defaults to new_card.area or card.area or G.jokers.

Returns:
  copy (table): the newly copied card. Returns nil if card is nil.
]]--

FELIJO.copy_card = function(card, new_card, area) -- credit somethingcom515
    if not card then return nil end
    local area = area or (new_card and new_card.area) or card.area or G.jokers
    local cardwasindeck = new_card and new_card.added_to_deck or nil
    local copy = copy_card(card, new_card)
    if new_card and cardwasindeck then copy:remove_from_deck() end
    if card.playing_card then
        G.playing_card = (G.playing_card and G.playing_card + 1) or 1
        copy.playing_card = G.playing_card
        G.deck.config.card_limit = G.deck.config.card_limit + 1
        table.insert(G.playing_cards, copy)
    end
    if (new_card and cardwasindeck) or not new_card then copy:add_to_deck() end
    if not new_card then area:emplace(copy) end
    return copy
end

FELIJO.number_to_pip = function(n)
    if n == 14 or n == 1 then return "A"
    elseif n == 13 then return "K"
    elseif n == 12 then return "Q"
    elseif n == 11 then return "J"
    else return tostring(math.floor(n))
    end
end
				
FELIJO.rank_to_chips = function(n)
	if n == 14 or n == 1 then return 11
    elseif n <= 13 and n >= 11 then return 10
    else return tostring(math.floor(n))
    end
end
			

--[[
Explode a card with sound and destroy it.

Parameters:
  card (table): required card to explode.
  sound (any): currently ignored; function uses global explosion/delete checks.
]]--
function FELIJO.explodeCard(card, sound)
	sound = sound or "explosion"
	if sound == "delete" then
		play_sound("felijo_rbx_delete")
	elseif sound == "explosion" then
		play_sound("felijo_rbx_explosion")
	end
    playEffect("explosion",card.tilt_var.mx,card.tilt_var.my)
    SMODS.destroy_cards(card)
end

--[[
Apply subspace explosion effects to hand, jokers, and consumables.

No parameters.
]]--
function FELIJO.subspaceExplode()
	play_sound("felijo_rbx_subspace")
	Blind:change_colour(HEX('F400F0')) -- Blind box
	ease_background_colour{new_colour = HEX('F400F0')}
	for _, _c in ipairs(G.hand.cards) do
		_c:set_edition("e_felijo_subspace")
	end
	for _, _c in ipairs(G.jokers.cards) do
		_c:set_edition("e_felijo_subspace")
	end
	for _, _c in ipairs(G.consumeables.cards) do
		_c:set_edition("e_felijo_subspace")
		
	end
end



function FELIJO.createTail(card)
	if card.ability.felijo_tailed then
		return
	end
	local copied_joker = copy_card(card, nil, nil, nil, card.edition and card.edition.negative)
					
	copied_joker.ability.felijo_tailed = true
					
    if copied_joker.ability.invis_rounds then copied_joker.ability.invis_rounds = 0 end
    if type(copied_joker.ability.extra) == "table" and copied_joker.ability.extra.invis_rounds then copied_joker.ability.extra.invis_rounds = 0 end

    local tribes = FELIJO.getCardTribe(card)
	local tribe = type(tribes) == "table" and tribes[1] or "Other"

    local pools = card and card.config and card.config.center and card.config.center.pools
    if pools and pools["Tentacle"] then
        tribe = "Tentacle"
    end
	if card and card.ability and card.ability.minty_cat_ears then
		tribe = "Feline"
	end

	local tailtable = {
		{key = "Avian",		x=3,  	akey = "_avi"},
		{key = "Canine",	x=1, 	akey = "_fur"},
		{key = "Feline",	x=1,	akey = "_fur"},
		{key = "Hooved",	x=6,	akey = "_hoo"},
		{key = "Insect",	x=5,	akey = "_ins"},
		{key = "Reptile",	x=0,	akey = nil},
		{key = "Vermin",	x=1,	akey = "_fur"},
		{key = "Object",	x=7,	akey = "_obj"},
		{key = "Other", 	x=0,	akey = nil},
		{key = "All", 		x=0,	akey = nil},
		{key = "Human", 	x=2,	akey = "_hum"},
		{key = "Tentacle", 	x=4,	akey = "_ten"},
		{key = "Banana", 	x=0,	akey = nil}, --Temporary :)
		{key = "Printer", 	x=0,	akey = nil},
	}
	local tail_x = 0
	local keyapp = nil
	for _, _tribe in ipairs(tailtable) do
        if _tribe.key == tribe then
            tail_x = _tribe.x
			keyapp = _tribe.akey
            break
        end
    end
	
	local newtail = SMODS.add_card { 
		key = "j_felijo_ins_tail", 
		key_append = "felijo_tail", 
		no_edition = true,
		stickers = nil,
	}
	copied_joker:add_to_deck()
    G.jokers:emplace(copied_joker)
	if newtail and newtail.children and newtail.children.center then
        newtail.children.center:set_sprite_pos({x = tail_x, y = 0})
		newtail.ability.key_app = keyapp
		newtail.ability.felijo_sgl_tail = false
    end
	


end

-- https://stackoverflow.com/questions/2353211/hsl-to-rgb-color-conversion + Aikoyori (Aikoshen), rainbow function.
function FELIJO.hsl2rgb(h,s,l,al) 
    local a=s*math.min(l,1-l);
    local f = function(n, k) k = math.fmod((n+h/30),12); return l - a*math.max(math.min(k-3,9-k,1),-1) end
    return {f(0),f(8),f(4),al};
end

FELIJO.add_event = function (func, delay, queue, config)
    config = config or {}
    G.E_MANAGER:add_event(Event{
        trigger = config.trigger or 'after',
        delay = delay or 0.1,
        func = func,
        blocking = config.blocking,
        blockable = config.blockable,
    }, queue, config.front)
end


--[[
Quick weighted pool pick.

Parameters:
  pool (table): required. A list of entries where each entry is either
    {key = value, weight = number} or {value, weight}.
    Example:
      {
        {key = 'j_foo', weight = 2},
        {'j_bar', 1},
      }

  roll (number|nil): optional. If provided, should be a [0,1) random float.
    You can pass either:
      pseudorandom(pseudoseed('myseed'))
    or a local variable storing that value.
    If omitted, it defaults to pseudorandom(pseudoseed('poolroll')).

Returns:
  selected key/value from pool based on weights.
]]--
FELIJO.quick_pool_pick = function(pool, roll)
	if type(pool) == "table" then
		roll = roll or pseudorandom(pseudoseed('cottoncandysweetiegoldletmeseethetootseeroll'))
		local total = 0
		
		for _, v in ipairs(pool) do
			local w = v.weight or v[2] or 1
			total = total + w
		end
		
		local _roll = roll * total
		local w_sum = 0
		
		for _, v in ipairs(pool) do
			local w = v.weight or v[2] or 1
			w_sum = w_sum + w
			if _roll <= w_sum then
				return v.key or v[1]
			end
		end
	elseif pool then
		error("pool is not a table ({key, weight}")
	else
		error("pool is nil")
	end
end

--[[
Merge multiple pools by set logic.

Params:
  pools (table): required list of pool names (strings). Example: {'FelisJokeria', 'Inscryption'}.
  op (string|nil): optional operation: "AND", "OR", or "NOT". Defaults to "AND".
  inject (boolean|nil): optional. If true and inject_pool provided, new cards are injected for results.
  inject_pool (table|nil): optional UI pool object with .cards used for injection.

Returns:
  table of merged card center keys.
]]--
FELIJO.pool_merge = function(pools, op, inject, inject_pool)
    local result = {}
    if #pools <= 1 then return result end
	op = op or "AND"
	inject = inject or false
	inject_pool = inject_pool or nil

    local lookups = {} -- make a lookup table of every pool 
    for _, name in ipairs(pools) do
		local lookup = {}
		local pool = get_current_pool(name) or {}

		for _, key in ipairs(pool) do
			if G.P_CENTERS[key] then
				lookup[key] = true
			end
		end

		table.insert(lookups, lookup)
	end

	local injected_set = {}
    if inject and inject_pool then
        for _, k in ipairs(inject_pool.cards or {}) do
            injected_set[k] = true
        end
    end
	local pool = get_current_pool(pools[1])
	if op == "AND" then -- merge if its in all pools
        for _, key in ipairs(pool) do -- go through pools from largest to smallest
			if G.P_CENTERS[key] then
				local in_all = true
				for i = 2, #lookups do
					if not lookups[i][key] then
						in_all = false -- make lookup false if not in pool
						break
					end
				end
				if in_all then
					result[#result + 1] = key
					if inject and inject_pool and not injected_set[key] then
						inject_pool:inject_card(G.P_CENTERS[key])
						injected_set[key] = true
					end
				end
			end
        end

    elseif op == "OR" then -- merge all pools regardless
		for _, lookup in ipairs(lookups) do
			for key,_ in pairs(lookup) do
				if G.P_CENTERS[key] then
					if not injected_set[key] then
						result[#result + 1] = key
						if inject and inject_pool then
							inject_pool:inject_card(G.P_CENTERS[key])
						end
						injected_set[key] = true
					end
				end
			end
		end

    elseif op == "NOT" then -- removes all cards from pools after the first one
        for _, key in ipairs(pool) do
			if G.P_CENTERS[key] then
				local in_others = false
				for i = 2, #lookups do
					if lookups[i][key] then
						in_others = true
						break
					end
				end
				if not in_others then
					result[#result + 1] = key
					if inject and inject_pool and not injected_set[key] then
						inject_pool:inject_card(G.P_CENTERS[key])
						injected_set[key] = true
					end
				end
			end
        end
    else
        error("Unknown op: "..tostring(op))
    end

    return result
end

--[[
Get the most played hand type.

Returns:
  string: the key of the most played hand type.
]]--
FELIJO.get_most_played_hand = function()
	local _handname, _played = 'High Card', -1
	for hand_key, hand in pairs(G.GAME.hands) do
		if hand.played > _played then
			_played = hand.played
			_handname = hand_key
		end
	end
	local most_played = _handname
	return most_played
end

--[[
Get the least played hand type.

Returns:
  string: the key of the least played hand type.
]]--
FELIJO.get_least_played_hand = function()
	local _handname, _played = 'Flush Five', 9999999999
	for hand_key, hand in pairs(G.GAME.hands) do
		if hand.played < _played then
			_played = hand.played
			_handname = hand_key
		end
	end
	local least_played = _handname
	return least_played
end

--[[
Get the planet card for the given hand

Params:
  hand (string): the key of the hand type.

Returns:
  string: the key of the planet card.
]]--
FELIJO.get_planet_for_hand = function(hand)
	local planet
	for _, center in pairs(G.P_CENTER_POOLS.Planet) do
		if center.config.hand_type == hand then
			planet = center.key
		end
	end
	return planet
end

--[[
Check if card is in card area

Params:
  card (table): card
  area (table): cardarea (G.jokers)

Returns:
  boolean: true if card is in cardarea
]]--

FELIJO.is_in_cardarea = function(card, area)
	local check = (area == G.playing_cards) and G.playing_cards or area.cards
	for _, _c in ipairs(check) do
		if _c == card then print("true") return true end
	end
	return false
end


--[[
Get the current card tier

Returns:
  return card tier
]]--
FELIJO.get_card_tier = function(card)
	if not (card and card.base and card.base.name) then return nil end
	for _, enh in ipairs(FELIJO.enhancement_tiers) do
		if card.config.center.key == enh.key then
			return enh.tier
		end
	end
	if not next(SMODS.get_enhancements(card)) then return 0 end
	return 1
end