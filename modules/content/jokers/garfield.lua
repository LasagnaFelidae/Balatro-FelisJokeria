FELIJO.GarfieldJoker = SMODS.Joker:extend {
	atlas = 'felijo_garfield',
	set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_garfield'), G.ARGS.LOC_COLOURS.felijo_garf_bg ,G.C.BLACK, 1 )
	end,
}

FELIJO.glass_list =
{
	["m_glass"] = true,
	["m_felijo_glass_t2"] = true,
	["m_felijo_glass_t3"] = true,
	["m_felijo_glass_t4"] = true,
	["m_bd_misprintglass"] = true,
	["m_felijo_glass_t2_mp"] = true,
	["m_felijo_glass_t3_mp"] = true,
	["m_felijo_glass_t4_mp"] = true,
}

FELIJO.tower_list =
{
	["c_tower"] = true,
	["c_felijo_t2_tower"] = true,
	["c_felijo_t2_tower_mp"] = true,
	["c_felijo_t3_tower"] = true,
	["c_felijo_t3_tower_mp"] = true,
	["c_felijo_t4_tower"] = true,
	["c_felijo_t4_tower_mp"] = true,
	["c_bd_towprint"] = true,
}

FELIJO.GarfieldJoker { --2, 0, biting the bolster
	pos = { x = 0, y = 0 },
	pools = {["FelisJokeria"] = true, ["Feline"] = true, },
	key = "felijo_grf_defenestration",
	rarity = 2,
	cost = 6,
	config = {
		extra = {xmult_gain = 0.20, xmult = 1, felijo_gc_triggered = false},
	},	
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = {key = 'felijo_tiered', set = 'Other'}
		info_queue[#info_queue+1] = G.P_CENTERS.m_glass
		return { vars = { card.ability.extra.xmult_gain, card.ability.extra.xmult  }}
	end,
	calculate = function(self, card, context)
		if context.remove_playing_cards and not context.blueprint then
			local glass_cards = 0
			for _, removed_card in ipairs(context.removed) do
				if removed_card.shattered then glass_cards = glass_cards + 1 end
			end
			if glass_cards > 0 and card.ability.extra.felijo_gc_triggered == false then
				G.E_MANAGER:add_event(Event({
					func = function()
						G.E_MANAGER:add_event(Event({
							func = function()
								felijo_gc_triggered = true
								card.ability.extra.xmult = 1
								return true
							end
						}))
						SMODS.calculate_effect(
						{
							message = localize("k_reset")
						}, card)
						
						return true
					end
				}))
				return nil, true
			end
		end
		if context.after then
			card.ability.extra.felijo_gc_triggered = false
		end
		if context.individual and FELIJO.glass_list[context.other_card.config.center.key] and context.cardarea == G.play then
			card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_gain
			SMODS.calculate_effect(
			{message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.xmult_gain} }}, card)
		end
		if context.joker_main then
			return { xmult = card.ability.extra.xmult }
		end
	end,
	blueprint_compat = true,
	in_pool = function(self,args)
		for i, playing_card in ipools(G.playing_cards) do
			if FELIJO.glass_list[playing_card.config.center.key] then
				return true
			end
		end
		return false
	end,
}
--[[FELIJO.GarfieldJoker { -- Pipe Strip
pos = { x = 1, y = 0 },
pools = {["FelisJokeria"] = true, ["Feline"] = true, },
key = "felijo_grf_pipe",
rarity = 2,
cost = 6,
config = {
extra = {chips = 40},
},	
loc_vars = function(self, info_queue, card)
info_queue[#info_queue+1] = {key = 'felijo_tiered', set = 'Other'}
info_queue[#info_queue+1] = G.P_CENTERS.c_tower
return { vars = { card.ability.extra.chips,localize { type = 'name_text', set = 'Tarot', key = "c_tower" }}, }
end,
calculate = function(self, card, context)
if context.joker_main then
	local triggered = false
	local towers =
	{
	"c_tower",
	"c_felijo_t2_tower",
	"c_felijo_t2_tower_mp",
	"c_felijo_t3_tower",
	"c_felijo_t3_tower_mp",
	"c_felijo_t4_tower",
	"c_felijo_t4_tower_mp",
	"c_bd_towprint",
	}
	for _, v in ipairs(G.consumeables.cards) do
		for _, key in ipairs(towers) do
			if v.config.center.key == key then
				triggered = true
				SMODS.calculate_effect(
				{chips = card.ability.extra.chips, juice_card = v, message_card = v},
				card
				)
				break
			end
		end
	end
	if triggered then return nil, true end
end
end,
blueprint_compat = true,
}
]]
FELIJO.GarfieldJoker { -- Busy Boy
	pos = { x = 2, y = 0 },
	pools = {["FelisJokeria"] = true, ["Feline"] = true, },
	key = "felijo_grf_busyboy",
	rarity = 2,
	cost = 6,
	config = {
		extra = {chips = 40},
	},	
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = {key = 'felijo_tiered', set = 'Other'}
		info_queue[#info_queue+1] = G.P_CENTERS.c_tower
		return { vars = { card.ability.extra.chips,localize { type = 'name_text', set = 'Tarot', key = "c_tower" }}, }
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			local triggered = false
			for _, v in ipairs(G.consumeables.cards) do
				if FELIJO.tower_list[v.config.center.key]then
						triggered = true
						SMODS.calculate_effect(
						{chips = card.ability.extra.chips, juice_card = v, message_card = v},
						card
					)
					break

				end
			end
			if triggered then return nil, true end
		end
	end,
	blueprint_compat = true,
	in_pool = function(self,args)
		for i, cons in ipools(G.consumeables.cards) do
			if FELIJO.tower_list[cons.config.center.key] then
				return true
			end
		end
		return false
	end,
}

FELIJO.GarfieldJoker { -- Recipe for Success - Oven of out hot eat the food
	pos = { x = 3, y = 0 },
	pools = {["FelisJokeria"] = true, ["Feline"] = true, },
	key = "felijo_grf_lasagnarecipe",
	rarity = 2,
	cost = 6,
	config = {
		extra = {n1 = 1, d1 = 8},
	},	
	loc_vars = function(self, info_queue, card)
		local numerator, denominator = SMODS.get_probability_vars(card, card.ability.extra.n1, card.ability.extra.d1, 'felijo_grf_lasagnarecipe')
		return { vars = { numerator, denominator}, }
	end,
	calculate = function(self, card, context)
		if context.after then
			if SMODS.last_hand_oneshot then
				for i, joker in ipairs(G.jokers.cards) do
					if (joker.config.center.pools or {}).Food or joker:has_attribute('food') then
						if SMODS.pseudorandom_probability(card, "felijo_grf_lasagnarecipe", card.ability.extra.n1, card.ability.extra.d1, "felijo_grf_lasagnarecipe") then
							joker:set_ability(joker.config.center.key)
							SMODS.calculate_effect(
							{message = localize("k_reset"), juice_card = v, message_card = v},
							card
						)
						else
							SMODS.calculate_effect(
							{message = localize("k_nope_ex"), juice_card = v, message_card = v},
							card
						)
						end
					end
				end
			end
		end
	end,
	blueprint_compat = true,
	in_pool = function(self,args)
		for i, jkr in ipools(G.jokers.cards) do
			if (jkr.config.center.pools or {}).Food or jkr:has_attribute('food') then
				return true
			end
		end
		return false
	end,
}





