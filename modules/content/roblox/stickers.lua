local all_sets = {}
for i,k in pairs(G.P_CENTER_POOLS) do
    all_sets[i] = true
end


SMODS.Sticker{
	key = "stk_subspace",
	badge_colour = HEX 'F400F0',
	atlas = "subspace",
	needs_enable_flag = true,
	pos = { x=0 , y=0 },
	sets = all_sets,
	no_collection = true, 
	config = {},
	loc_vars = function(self, info_queue, card)
        return { vars = { } }
    end,
	apply = function(self, card, val)
		card.ability[self.key] = val
		
		if card.ability.eternal then 
			card:remove_sticker('eternal') 
		end
		if card.ability.perishable then 
			card:remove_sticker('perishable') 
		end

    end,
	
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				chips = card.ability.perma_h_chips
			}
		end
    end,
	draw = function (self, card, layer)
        G.shared_stickers[self.key].role.draw_major = card
        G.shared_stickers[self.key]:draw_shader('dissolve', nil, nil, nil, card.children.center)
    end
}

SMODS.Sticker{
    key = "copied",
    default_compat = true,
	needs_enable_flag = true,
    atlas = "copied",
    pos = {x = 0, y = 0},
    rate = 0,
    badge_colour = G.C.RED,
    sets =  all_sets,
	no_collection = true, 
	config = {},
	loc_vars = function(self, info_queue, card)
        return { vars = { } }
    end,
    calculate = function(self, card, context)
		if context.end_of_round then
			SMODS.destroy_cards(card)
		end
    end,
    apply = function(self, card, val)
        card.ability[self.key] = val
        card:set_cost()
    end
}