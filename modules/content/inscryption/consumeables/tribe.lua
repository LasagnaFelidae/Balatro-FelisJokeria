FELIJO.Tribe = SMODS.Consumable:extend{
	
}

SMODS.ConsumableType {
	key = 'felijo_tribe',
	default = 'c_felijo_trb_feline',
	primary_colour = HEX('ffffff'),
	secondary_colour = HEX('545454'),
	collection_rows = { 5, 5 },
	shop_rate = 0,
	discovered = false,
	unlocked = true,
	in_pool = function(self, args)
		return (args and (args.source == "felijo_tribe" or args.source == "felijo_tribe_p") ) or false
	end,
	loc_txt = {
		undiscovered = {
			name = "Not Discovered",
			text = {
				"Purchase or use",
				"this card in an",
				"unseeded run to",
				"learn what it does"
			},
		},
	},
}
SMODS.UndiscoveredSprite{
	key = 'felijo_tribe',
	atlas = "consUndis",
	pos = {x=4, y=0}
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
		set_badges = function(self, card, badges)
			badges[#badges+1] = create_badge(localize('k_felijo_ins'), HEX('7f1232'), HEX('f2a655'), 1 )
			if data.key == "Banana" or data.key == "Printer" then
				badges[#badges+1] = create_badge(localize('k_felijo_revo'), HEX('7E7AFF'), HEX('40093A'), 1 )
			end
		end,
		use = function(self, card, area, copier)
			local pool = {}
			if (data.key == "Banana" or data.key == "Printer") then
				if data.key == "Banana" then
					pool = get_current_pool("BananaPool")
				else
					G.E_MANAGER:add_event(Event({
						trigger = 'after',
						delay = 0.4,
						func = function()
							play_sound('timpani')
							SMODS.add_card{set = 'Joker', rarity = 'crv_p'}
							card:juice_up(0.3, 0.5)
							return true
						end
					}))
				end
			else
				pool = FELIJO.pool_merge({"Inscryption",data.key})
			end
			if data.key ~= "Printer" then
				G.E_MANAGER:add_event(Event({
					trigger = 'after',
					delay = 0.4,
					func = function()
						play_sound('timpani')
						rf = pseudorandom_element(pool, pseudoseed(data.key))
						local iterations = 1
						while rf == 'UNAVAILABLE' do
							iterations = iterations + 1
							rf = pseudorandom_element(pool, pseudoseed(data.key)..iterations)
						end
						SMODS.add_card{set = "Joker", key = rf}
						card:juice_up(0.3, 0.5)
						return true
					end
				}))
			end
		end
	}
end