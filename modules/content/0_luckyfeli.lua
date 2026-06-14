SMODS.Joker {
	atlas = 'luckyfeliJoker',
	pos = { x = 0, y = 0 },
	pools = {["FelisJokeria"] = true, ["Feline"] = true, },
	key = "felijo_lucky_feli",
	rarity = 2,
	cost = 6,
	config = {
		extra = { xmult = 0.01, money = 266.00,},
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



