local all_sets = {}
for i,k in pairs(G.P_CENTER_POOLS) do
    all_sets[i] = true
end

SMODS.Sticker{
	key = "stk_blunder",
	badge_colour = HEX 'F400F0',
	atlas = "otherStickers",
	needs_enable_flag = false,
	pos = { x=0 , y=0 },
	sets = {Default, Joker},
	no_collection = true,
	config = {
        xbscore = 1.1,
        mult = 1
    },
	loc_vars = function(self, info_queue, card)
        return { vars = {self.config.xbscore,self.config.mult} }
    end,
	apply = function(self, card, val)
		card.ability[self.key] = val
	end,
	
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				felijo_xbscore = self.config.xbscore,
                mult = self.config.mult
			}
		end
    end,
}