
G.GAME.felijo_peltchance = 1
FELIJO.Pelt = SMODS.Enhancement:extend{
    in_pool = function (self, args)
        return G.GAME.felijo_pelts_enabled or false
    end,
	replace_base_card = true,
	no_rank = true,
	no_suit = true,
	always_scores = true,
	get_weight = function(self)
		return self.weight * G.GAME.felijo_peltchance
	end,
	
}


-- Bunny Pelt
FELIJO.Pelt {
	key = 'plt_bny',
	atlas = 'insPelts',
	pos = { x = 0, y = 0 },
	config = { 
		extra = { 
			dollars = 1,
			sold = false
		}
	},
	weight = 7,
	badge_colour = HEX 'F0C590',
	text_colour = HEX '351A09',
	set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_pelt'), HEX('F0C590'), HEX('351A09'), 1.2 )
	end,
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.dollars,
				colours = { 
					HEX('F0C590'), 
					HEX('351A09'), 
					HEX('00ECE4'), 
					HEX('002838'), 
				},
			}
		}
	end,
	

	calculate = function(self, card, context)
		if context.discard and context.other_card == card and not card.ability.extra.sold then
			card.ability.extra.sold = true

			if G.GAME.felijo_pelts_sale then
				card:start_dissolve({G.C.MONEY}, true)
				return {
					dollars = card.ability.extra.dollars or 0,
					remove = true
				}
			else
				card.ability.extra.sold = false
				return { chips = 0, mult = 0 }
			end
		end
	end,
}

-- Wolf Pelt
FELIJO.Pelt {
	key = 'plt_wlf',
	atlas = 'insPelts',
	pos = { x = 1, y = 0 },
	config = { 
		extra = { 
			dollars = 2,
			sold = false
		}
	},
	weight = 5,
	badge_colour = HEX 'F0C590',
	text_colour = HEX '351A09',
	set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_pelt'), HEX('F0C590'), HEX('351A09'), 1.2 )
	end,
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.dollars,
				colours = { 
					HEX('F0C590'), 
					HEX('351A09'), 
					HEX('00ECE4'), 
					HEX('002838'), 
				},
			}
		}
	end,

	calculate = function(self, card, context)
		if context.discard and context.other_card == card and not card.ability.extra.sold then
			card.ability.extra.sold = true

			if G.GAME.felijo_pelts_sale then
				card:start_dissolve({G.C.MONEY}, true)
				return {
					dollars = card.ability.extra.dollars or 0,
					remove = true
				}
			else
				card.ability.extra.sold = false
				return { chips = 0, mult = 0 }
			end
		end
	end,

}



-- Golden Pelt
FELIJO.Pelt {
	key = 'plt_gold',
	atlas = 'insPelts',
	pos = { x = 2, y = 0 },
	config = { 
		extra = { 
			dollars = 3,
			sold = false,
		}
	},
	weight = 2,
	badge_colour = HEX 'E19B4B',
	text_colour = HEX '4D3D2C',
	set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_pelt'), HEX('E19B4B'), HEX('4D3D2C'), 1.2 )
	end,
	loc_vars = function(self, info_queue, card)	
		return {
			vars = {
				card.ability.extra.dollars,
				colours = { 
					HEX('F0C590'), 
					HEX('351A09'), 
					HEX('00ECE4'), 
					HEX('002838'), 
				},
			}
		}
	end,

	calculate = function(self, card, context)
		if context.discard and context.other_card == card and not card.ability.extra.sold then
			card.ability.extra.sold = true

			if G.GAME.felijo_pelts_sale then
				card:start_dissolve({G.C.MONEY}, true)
				return {
					dollars = card.ability.extra.dollars or 0,
					remove = true
				}
			else
				card.ability.extra.sold = false
				return { chips = 0, mult = 0 }
			end
		end
	end,
}

FELIJO.Pelt {
	key = 'plt_olddata',
	atlas = 'insPelts',
	pos = { x = 3, y = 0 },
	config = { 
		extra = { 
			dollars = 5,
			sold = false,
		}
	},
	weight = 0.01 * (G.GAME.felijo_peltchance or 1),
	badge_colour = HEX '3E493E',
	text_colour = HEX 'FF0000',
	no_collection = true,
	set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_olddata'), HEX('3E493E'), HEX('FF0000'), 1.2 )
	end,
	loc_vars = function(self, info_queue, card)		
		return {
			vars = {
				card.ability.extra.dollars,
				colours = { 
					HEX('E29F55'), 
					HEX('3D2B18'), 
					HEX('00ECE4'), 
					HEX('002838'), 
				},
			}
		}
	end,

	calculate = function(self, card, context)
		if context.discard and context.other_card == card and not card.ability.extra.sold then
			card.ability.extra.sold = true
			if G.GAME.felijo_pelts_sale then
				card:start_dissolve({G.C.MONEY}, true)
				return {
					dollars = card.ability.extra.dollars or 0,
					remove = true
				}
			else
				card.ability.extra.sold = false
				return { chips = 0, mult = 0 }
			end
		end
	end,
}

-- Golden Pelt
FELIJO.Pelt {
	key = 'trn_goldn',
	atlas = 'insPelts',
	pos = { x = 4, y = 0 },
	config = { 
		extra = { 
			dollars = 3,
			sold = false,
		}
	},
	badge_colour = HEX 'E19B4B',
	text_colour = HEX '4D3D2C',
	set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_terrain'), HEX('E19B4B'), HEX('4D3D2C'), 1.2 )
	end,
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.dollars,
				colours = { 
					HEX('F0C590'), 
					HEX('351A09'), 
					HEX('00ECE4'), 
					HEX('002838'), 
				},
			}
		}
	end,

	calculate = function(self, card, context)
		if context.discard and context.other_card == card and not card.ability.extra.sold then
			card.ability.extra.sold = true

			if G.GAME.felijo_pelts_sale then
				card:start_dissolve({G.C.MONEY}, true)
				return {
					dollars = card.ability.extra.dollars or 0,
					remove = true
				}
			else
				card.ability.extra.sold = false
				return { chips = 0, mult = 0 }
			end
		end
	end,
}
