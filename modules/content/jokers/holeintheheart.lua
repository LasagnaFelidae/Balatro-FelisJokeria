
FELIJO.LoverJoker = SMODS.Joker:extend {
	in_pool = function(self)
		local lovers =
		{
			"c_lovers",
			"c_felijo_t2_lovers",
			"c_felijo_t2_lovers_mp",
			"c_felijo_t3_lovers",
			"c_felijo_t3_lovers_mp",
			"c_felijo_t4_lovers",
			"c_felijo_t4_lovers_mp",
			"c_bd_loverprints",
		}
		for _, v in ipairs(G.consumeables.cards) do
			for _, key in ipairs(lovers) do
				if v.config.center.key == key then
					return true
				end
			end
		end
		return false
	end,
	set_sprites = function(self, card, front)
		if FELIJO.config["directors_cut"] == false and card.config.center.discovered and card.children and card.children.center then
			card.children.center:set_sprite_pos({
				x = card.children.center.sprite_pos.x,
				y = 1
			})
		end

	end
}

FELIJO.LoverJoker { --2, 0, biting the bolster
	atlas = 'bodyandblood',
	pos = { x = 2, y = 0 },
	pools = {["FelisJokeria"] = true, ["Feline"] = true, },
	key = "felijo_unlovable",
	rarity = 2,
	cost = 6,
	config = {
		imm = {n1 = 1, d1 = 3, n2 = 1, d2 = 30},
	},	
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = {key = 'felijo_tiered', set = 'Other'}
		info_queue[#info_queue+1] = {key = 'felijo_immutable', set = 'Other'}
		info_queue[#info_queue+1] = G.P_CENTERS.c_lovers
		return { vars = { card.ability.imm.n1, card.ability.imm.d1, localize { type = 'name_text', set = 'Tarot', key = "c_lovers" },card.ability.imm.n2, card.ability.imm.d2,} }
	end,
	set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_bnb'), HEX('660000'), HEX('000000'), 1 )
	end,
	calculate = function(self, card, context)
		if context.press_play then
			local immutable = card.ability.imm
			local roll = SMODS.pseudorandom_probability(card, "bodyandblood", immutable.n2, immutable.d2, "felijo_unlovable2", true)
			if roll then
				SMODS.destroy_cards(card,true)
			end
		end
		if context.joker_main then
			local immutable = card.ability.imm
			local roll = SMODS.pseudorandom_probability(card, "bodyandblood", immutable.n1, immutable.d1, "felijo_unlovable", true)
			local loverstable = 
			{
				{key = "c_lovers", weight = 1},
				{key = "c_felijo_t2_lovers", weight = 0.4},
				{key = "c_felijo_t3_lovers", weight = 0.2},
				{key = "c_felijo_t4_lovers", weight = 0.005},
			}
			local loverscard = FELIJO.quick_pool_pick(loverstable, pseudorandom("bodyandblood"))
			if roll then
				SMODS.add_card({key=loverscard, edition="e_negative", area=G.consumeables})
			else
				return { message = localize("k_nope_ex"), colour = G.C.RED}
			end
		end
	end,
	blueprint_compat = true,
}

FELIJO.LoverJoker { --4, 0, do not come near
	atlas = 'bodyandblood',
	pos = { x = 4, y = 0 },
	pools = {["FelisJokeria"] = true, ["Feline"] = true, },
	key = "felijo_desperatemeasures",
	rarity = 2,
	cost = 6,
	config = {
		extra = {xmult = 2.2},
		imm = {n2 = 1, d2 = 30},
	},	
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = {key = 'felijo_tiered', set = 'Other'}
		info_queue[#info_queue+1] = {key = 'felijo_immutable', set = 'Other'}
		info_queue[#info_queue+1] = G.P_CENTERS.c_lovers
		return { vars = { card.ability.extra.xmult, localize { type = 'name_text', set = 'Tarot', key = "c_lovers" },card.ability.imm.n2, card.ability.imm.d2,} }
	end,
	set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_bnb'), HEX('660000'), HEX('000000'), 1 )
	end,
	calculate = function(self, card, context)
		if context.press_play then
			local immutable = card.ability.imm
			local roll = SMODS.pseudorandom_probability(card, "bodyandblood", immutable.n2, immutable.d2, "felijo_unlovable2", true)
			if roll then
				SMODS.destroy_cards(card,true)
			end
		end
		if context.joker_main then
			local triggered = false
			local lovers =
			{
				"c_lovers",
				"c_felijo_t2_lovers",
				"c_felijo_t2_lovers_mp",
				"c_felijo_t3_lovers",
				"c_felijo_t3_lovers_mp",
				"c_felijo_t4_lovers",
				"c_felijo_t4_lovers_mp",
				"c_bd_loverprints",
			}
			for _, v in ipairs(G.consumeables.cards) do
				for _, key in ipairs(lovers) do
					if v.config.center.key == key then
						triggered = true
						SMODS.calculate_effect(
						{xmult = card.ability.extra.xmult, juice_card = v, message_card = v},
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

FELIJO.LoverJoker { --3, 0, true religion
	atlas = 'bodyandblood',
	pos = { x = 3, y = 0 },
	pools = {["FelisJokeria"] = true, ["Feline"] = true, },
	key = "felijo_truereligion",
	rarity = 2,
	cost = 6,
	config = {
		extra = {xmult = 2.2},
		imm = {n2 = 1, d2 = 30},
	},	
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = {key = 'felijo_tiered', set = 'Other'}
		info_queue[#info_queue+1] = {key = 'felijo_immutable', set = 'Other'}
		info_queue[#info_queue+1] = G.P_CENTERS.c_lovers
		return { vars = { card.ability.extra.repetitions, localize { type = 'name_text', set = 'Tarot', key = "c_lovers" },card.ability.imm.n2, card.ability.imm.d2,} }
	end,
	set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_bnb'), HEX('660000'), HEX('000000'), 1 )
	end,
	calculate = function(self, card, context)
		if context.press_play then
			local immutable = card.ability.imm
			local roll = SMODS.pseudorandom_probability(card, "bodyandblood", immutable.n2, immutable.d2, "felijo_unlovable2", true)
			if roll then
				SMODS.destroy_cards(card,true)
			end
		end
		if context.repetition and context.cardarea == G.play and context.other_card then
			local lovers =
			{
				"c_lovers",
				"c_felijo_t2_lovers",
				"c_felijo_t2_lovers_mp",
				"c_felijo_t3_lovers",
				"c_felijo_t3_lovers_mp",
				"c_felijo_t4_lovers",
				"c_felijo_t4_lovers_mp",
				"c_bd_loverprints",
			}
			local count = 0
			for _, v in ipairs(G.consumeables.cards) do
				for _, key in ipairs(lovers) do
					if v.config.center.key == key then
						count = count + 1
					end
				end
			end
			if context.other_card.base.suit == "Hearts" then 
				return { repetitions = count}
			end
		end
	end,
	blueprint_compat = true,
}
FELIJO.LoverJoker { --0, 0, product of fear
	atlas = 'bodyandblood',
	pos = { x = 0, y = 0 },
	pools = {["FelisJokeria"] = true, ["Feline"] = true, },
	key = "felijo_productoffear",
	rarity = 2,
	cost = 6,
	config = {
		imm = {n2 = 1, d2 = 30},
	},	
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = {key = 'felijo_tiered', set = 'Other'}
		info_queue[#info_queue+1] = {key = 'felijo_immutable', set = 'Other'}
		info_queue[#info_queue+1] = G.P_CENTERS.c_lovers
		return { vars = { localize { type = 'name_text', set = 'Tarot', key = "c_lovers" },card.ability.imm.n2, card.ability.imm.d2,} }
	end,
	set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_bnb'), HEX('660000'), HEX('000000'), 1 )
	end,
	calculate = function(self, card, context)
		if context.press_play then
			local immutable = card.ability.imm
			local roll = SMODS.pseudorandom_probability(card, "bodyandblood", immutable.n2, immutable.d2, "felijo_unlovable2", true)
			if roll then
				SMODS.destroy_cards(card,true)
			end
		end
	end,
	blueprint_compat = true,
}

FELIJO.LoverJoker { -- 1, 0 Redcap, arm cut
	atlas = 'bodyandblood',
	pos = { x = 1, y = 0 },
	pools = {["FelisJokeria"] = true, ["Feline"] = true, },
	key = "felijo_redcap",
	rarity = 2,
	cost = 6,
	config = {
		extra = {xblindsize = 0.9, mult = 0.5},
		imm = {n2 = 1, d2 = 30},
	},	
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = {key = 'felijo_tiered', set = 'Other'}
		info_queue[#info_queue+1] = {key = 'felijo_immutable', set = 'Other'}
		info_queue[#info_queue+1] = G.P_CENTERS.c_lovers
		return { vars = { card.ability.extra.xblindsize,card.ability.extra.mult,localize { type = 'name_text', set = 'Tarot', key = "c_lovers" },card.ability.imm.n2, card.ability.imm.d2,}, }
	end,
	set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_bnb'), HEX('660000'), HEX('000000'), 1 )
	end,
	calculate = function(self, card, context)
		if context.press_play then
			local immutable = card.ability.imm
			local roll = SMODS.pseudorandom_probability(card, "bodyandblood", immutable.n2, immutable.d2, "felijo_unlovable2", true)
			if roll then
				SMODS.destroy_cards(card,true)
			end
		end
		if context.joker_main then
			local triggered = false
			local lovers =
			{
				"c_lovers",
				"c_felijo_t2_lovers",
				"c_felijo_t2_lovers_mp",
				"c_felijo_t3_lovers",
				"c_felijo_t3_lovers_mp",
				"c_felijo_t4_lovers",
				"c_felijo_t4_lovers_mp",
				"c_bd_loverprints",
			}
			for _, v in ipairs(G.consumeables.cards) do
				for _, key in ipairs(lovers) do
					if v.config.center.key == key then
						triggered = true
						SMODS.calculate_effect(
						{xblindsize = card.ability.extra.xblindsize, mult = -card.ability.extra.mult, juice_card = v, message_card = v},
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

FELIJO.LoverJoker { -- 7, 0 Spear Flowers
	atlas = 'bodyandblood',
	pos = { x = 7, y = 0 },
	pools = {["FelisJokeria"] = true, ["Feline"] = true, },
	key = "felijo_spearflowers",
	rarity = 2,
	cost = 6,
	config = {
		extra = {money = 4},
		imm = {n2 = 1, d2 = 30},
	},	
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = {key = 'felijo_tiered', set = 'Other'}
		info_queue[#info_queue+1] = {key = 'felijo_immutable', set = 'Other'}
		info_queue[#info_queue+1] = G.P_CENTERS.c_lovers
		return { vars = { card.ability.extra.money,localize { type = 'name_text', set = 'Tarot', key = "c_lovers" },card.ability.imm.n2, card.ability.imm.d2,} }
	end,
	set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_bnb'), HEX('660000'), HEX('000000'), 1 )
	end,
	calculate = function(self, card, context)
		if context.press_play then
			local immutable = card.ability.imm
			local roll = SMODS.pseudorandom_probability(card, "bodyandblood", immutable.n2, immutable.d2, "felijo_unlovable2", true)
			if roll then
				SMODS.destroy_cards(card,true)
			end
		end
		if context.end_of_round and context.game_over and context.main_eval then
			local lovers =
			{
				"c_lovers",
				"c_felijo_t2_lovers",
				"c_felijo_t2_lovers_mp",
				"c_felijo_t3_lovers",
				"c_felijo_t3_lovers_mp",
				"c_felijo_t4_lovers",
				"c_felijo_t4_lovers_mp",
				"c_bd_loverprints",
			}
			for _, v in ipairs(G.consumeables.cards) do
				for _, key in ipairs(lovers) do
					if v.config.center.key == key then
						G.E_MANAGER:add_event(Event({
							func = function()
								G.hand_text_area.blind_chips:juice_up()
								G.hand_text_area.game_chips:juice_up()
								play_sound('tarot1')
								SMODS.destroy_cards(card, nil, true)
								ease_dollars(card.ability.extra.money, true)
								return true
							end
						}))
						return nil

					end
				end
			end
		end
	end,
	blueprint_compat = true,
}
FELIJO.LoverJoker { -- 6, 0 Grazing On Fear
	atlas = 'bodyandblood',
	pos = { x = 6, y = 0 },
	pools = {["FelisJokeria"] = true, ["Feline"] = true, },
	key = "felijo_grazingonfear",
	rarity = 2,
	cost = 6,
	config = {
		extra = {xblindsize = 0},
		imm = {n2 = 1, d2 = 30},
	},	
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = {key = 'felijo_tiered', set = 'Other'}
		info_queue[#info_queue+1] = {key = 'felijo_immutable', set = 'Other'}
		info_queue[#info_queue+1] = G.P_CENTERS.c_lovers
		return { vars = { card.ability.extra.xblindsize, card.ability.imm.n2, card.ability.imm.d2,} }
	end,
	set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_bnb'), HEX('660000'), HEX('000000'), 1 )
	end,
	calculate = function(self, card, context)
		if context.press_play then
			local immutable = card.ability.imm
			local roll = SMODS.pseudorandom_probability(card, "bodyandblood", immutable.n2, immutable.d2, "felijo_unlovable2", true)
			if roll then
				local lovers =
				{
					"c_lovers",
					"c_felijo_t2_lovers",
					"c_felijo_t2_lovers_mp",
					"c_felijo_t3_lovers",
					"c_felijo_t3_lovers_mp",
					"c_felijo_t4_lovers",
					"c_felijo_t4_lovers_mp",
					"c_bd_loverprints",
				}
				for _, v in ipairs(G.consumeables.cards) do
					for _, key in ipairs(lovers) do
						if v.config.center.key == key then
							return { xblindsize = card.ability.extra.xblindsize,}
						end
					end
				end
				SMODS.destroy_cards(card,true)
			end
		end
	end,
	blueprint_compat = true,
}
FELIJO.LoverJoker { -- 5, 0 hole in the heart
	atlas = 'bodyandblood',
	pos = { x = 5, y = 0 },
	pools = {["FelisJokeria"] = true, ["Feline"] = true, },
	key = "felijo_holeintheheart",
	rarity = 2,
	cost = 6,
	config = {
		extra = {chips = 10, mult = 1},
		imm = {n2 = 1, d2 = 30},
	},	
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = {key = 'felijo_tiered', set = 'Other'}
		info_queue[#info_queue+1] = {key = 'felijo_immutable', set = 'Other'}
		info_queue[#info_queue+1] = G.P_CENTERS.c_lovers
		return { vars = { card.ability.extra.chips, card.ability.extra.mult, localize { type = 'name_text', set = 'Tarot', key = "c_lovers" },card.ability.imm.n2, card.ability.imm.d2,} }
	end,
	set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_bnb'), HEX('660000'), HEX('000000'), 1 )
	end,
	calculate = function(self, card, context)
		if context.press_play then
			local immutable = card.ability.imm
			local roll = SMODS.pseudorandom_probability(card, "bodyandblood", immutable.n2, immutable.d2, "felijo_unlovable2", true)
			if roll then
				SMODS.destroy_cards(card,true)
			end
		end
		if context.joker_main then
			local lovers =
			{
				"c_lovers",
				"c_felijo_t2_lovers",
				"c_felijo_t2_lovers_mp",
				"c_felijo_t3_lovers",
				"c_felijo_t3_lovers_mp",
				"c_felijo_t4_lovers",
				"c_felijo_t4_lovers_mp",
				"c_bd_loverprints",
			}
			for _, v in ipairs(G.consumeables.cards) do
				for _, key in ipairs(lovers) do
					if v.config.center.key == key then
						return { chips = -card.ability.extra.chips, mult = card.ability.extra.mult}
					end
				end
			end
		end
	end,
	blueprint_compat = true,
}