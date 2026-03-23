FELIJO.Tribe = SMODS.Consumable:extend{
	set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_ins'), HEX('7f1232'), HEX('f2a655'), 1 )
	end,
}

SMODS.ConsumableType {
    key = 'felijo_tribe',
    default = 'c_felijo_trb_feline',
    primary_colour = HEX('ffffff'),
    secondary_colour = HEX('545454'),
    collection_rows = { 5, 5 },
    shop_rate = 0,
	in_pool = function(self, args)
		return (args and (args.source == "felijo_tribe" or args.source == "felijo_tribe_p") ) or false
	end,
}


for _, data in ipairs(FELIJO.tribe_table) do
    FELIJO.Tribe {
        key = "felijo_" .. data.tribe_card_key,
        set = "felijo_tribe",
        atlas = "insTribeC",
        pos = {x = data.totem_x, y = 0},
        cost = 10,
        can_use = function(self, card)
			return G.jokers and #G.jokers.cards < G.jokers.config.card_limit
		end,
        use = function(self, card, area, copier)
			 G.E_MANAGER:add_event(Event({
				trigger = 'after',
				delay = 0.4,
				func = function()
					play_sound('timpani')
					rf = pseudorandom_element(FELIJO.pool_merge({"Inscryption",data.key}), pseudoseed(data.key))
					SMODS.add_card{set = 'Joker', key = rf}
					card:juice_up(0.3, 0.5)
					return true
				end
			}))
			delay(0.6)
        end,
    }
end
