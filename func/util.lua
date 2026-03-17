FELIJO.is_mod_loaded = function(var) -- credit aiko
    if not var then return false end
    return (SMODS.Mods[var] and SMODS.Mods[var].can_load) and true or false
end

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


-- https://stackoverflow.com/questions/2353211/hsl-to-rgb-color-conversion + Aikoyori (Aikoshen), rainbow function.
function FELIJO.hsl2rgb(h,s,l,al) 
    local a=s*math.min(l,1-l);
    local f = function(n, k) k = math.fmod((n+h/30),12); return l - a*math.max(math.min(k-3,9-k,1),-1) end
    return {f(0),f(8),f(4),al};
end

if SMODS.DynaTextEffect then
	SMODS.DynaTextEffect {
			key = "pink",
			func = function (dynatext, index, letter)
				letter.colour = HEX 'F400F0'
			end
		}
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
This takes a table for it to pick from:
key can be a variable, as long as it is defined during game initialization.
pool = {
	{returned key, weight}, 
	{returned key, weight},
	{returned key, weight},
	{returned key, weight},
}
]]--
FELIJO.quick_pool_pick = function(pool, roll)
	if type(pool) == "table" then
		roll = roll or pseudorandom(pseudoseed('poolroll'))
		local total = 0
		
		for _, v in ipairs(pool) do
			local w = v.weight or v[2] or 1
			total = total + w
		end
		
		local target = roll * total
		local sum = 0
		
		for _, v in ipairs(pool) do
			local w = v.weight or v[2] or 1
			sum = sum + w
			if target <= sum then
				return v.key or v[1]
			end
		end
	elseif pool then
		error("pool is not a table ({key, weight}")
	else
		error("pool is nil")
	end
end

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
	
	if op == "AND" then -- merge if its in all pools
        local pool = get_current_pool(pools[1])
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
        local pool = get_current_pool(pools[1])
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