SMODS.Shader({ key = 'subspace', path = 'subspace.fs' })

SMODS.Edition{
	key = "subspace",
	order = 2,
	badge_colour = HEX 'F400F0',
	weight = 0,
	discovered = true,
	unlocked = true,
	shader = "subspace",
	in_shop = true,
	extra_cost = 3,
	config = { xblindsize = 0.9, trigger = nil },
	get_weight = function(self)
		return G.GAME.edition_rate * self.weight
	end,
	loc_vars = function(self, info_queue)
		return { vars = { 1-self.config.xblindsize } }
	end,
	calculate = function(self, card, context)
		if
			(context.edition and context.cardarea == G.jokers and card.config.trigger)
			or (context.main_scoring and context.cardarea == G.hand)
		then
			return { h_xblindsize = self.config.xblindsize } 
		end
		if context.joker_main then
			card.config.trigger = true 
		end

		if context.after then
			card.config.trigger = nil
		end
	end,
}