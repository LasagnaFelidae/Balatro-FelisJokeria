SMODS.Joker {
	atlas = 'luckyfeliJoker',
	pos = { x = 0, y = 0 },
	pools = {["FelisJokeria"] = true, ["Feline"] = true, },
	key = "felijo_lucky_feli",
	rarity = 2,
	cost = 6,
	config = {
		extra = { xmult = 0.01, money = 149.00,},
	},	
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.xmult, 1+(card.ability.extra.xmult*card.ability.extra.money), card.ability.extra.money} }
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				xmult = 1 + (card.ability.extra.xmult * card.ability.extra.money)
			}
		end
	end,
	blueprint_compat = true,
}

SMODS.Joker {
	atlas = 'bodyandblood',
	pos = { x = 0, y = 0 },
	pools = {["FelisJokeria"] = true, ["Feline"] = true, },
	key = "felijo_unlovable",
	no_collection = true,
	rarity = 2,
	cost = 6,
	config = {
		extra = { xmult = 0.01, money = 125.00,},
		imm = {n1 = 1, d1 = 6,},
	},	
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = {key = 'felijo_tiered', set = 'Other'}
		info_queue[#info_queue+1] = {key = 'felijo_immutable', set = 'Other'}
		info_queue[#info_queue+1] = G.P_CENTERS.c_lovers
		return { vars = { card.ability.imm.n1, card.ability.imm.d1, localize { type = 'name_text', set = 'Tarot', key = "c_lovers" }} }
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			local extra = card.ability.extra
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
				return { message = localize("k_nope_ex")}
			end
		end
	end,
	blueprint_compat = true,
}


