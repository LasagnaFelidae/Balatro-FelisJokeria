FELIJO.TotemSigil = SMODS.Sticker:extend{
    needs_enable_flag = true,
	apply = function(self,card,val)
		card.ability[self.key] = val
	end,
	default_compat = false,
	no_collection =  true,
}

FELIJO.TotemSigil {
    key = "felijo_ttm_sgl_undying",
	atlas = "inscryptionTotemSigils",
    pos = {x = 0, y = 0},
    badge_colour = HEX('BD894B'),
	no_collection = true,
	apply = function(self,card,val)
		if card.ability.eternal then 
			card:remove_sticker('eternal') 
		end
		if card.ability.perishable then 
			card:remove_sticker('perishable') 
		end
		card.ability[self.key] = val
	end,
    calculate = function(self, card, context)
		if context.joker_type_destroyed and context.card == card and #G.jokers.cards <= G.jokers.config.card_limit then 
			card.ability.extra_slots_used = -1
			local ouroboros = SMODS.add_card { 
				key = card.config.center.key,
				edition = card.edition,
				no_edition = true,
				stickers = nil,
			}
				
			ouroboros.ability.extra_slots_used = 0
			ouroboros.ability.felijo_ttm_sgl_undying = true
			
			if #G.jokers.cards < G.jokers.config.card_limit then
				G.E_MANAGER:add_event(Event({
					blocking = false,
					delay = 1,
					trigger = 'after',
					func = function()
						ouroboros:start_materialize()
						return true
					end
				}))
			end
			
			return ouroboros
		end
	end
}

FELIJO.TotemSigil {
    key = "felijo_ttm_sgl_swap",
    atlas = "inscryptionTotemSigils",
    pos = {x = 1, y = 0},
    badge_colour = HEX('BD894B'),
	no_collection = true,
    calculate = function(self, card, context)
		if context.joker_main then
			local old_m = mult
			mult = mod_mult(hand_chips)
			hand_chips = mod_chips(old_m)
			update_hand_text({delay=0}, {chips = hand_chips, mult = mult})
		end
	end
}

FELIJO.TotemSigil {
    key = "felijo_ttm_sgl_bifurcated",
    atlas = "inscryptionTotemSigils",
    pos = {x = 2, y = 0},
    badge_colour = HEX('BD894B'),
	no_collection = true,
    calculate = function(self, card, context)
		if context.retrigger_joker_check and not context.retrigger_joker and context.other_card == card then
			return{
				repetitions = 1,
			}
		end
	end
}

FELIJO.TotemSigil {
    key = "felijo_ttm_sgl_midas",
	atlas = "inscryptionTotemSigils",
	config = { extra = { dollars = 1 } },
	loc_vars = function(self, info_queue, card)
		return { vars = {self.config.extra.dollars} }
    end,
    pos = {x = 3, y = 0},
    badge_colour = HEX('BD894B'),
	no_collection = true,
    calculate = function(self, card, context)
		if context.joker_main then
			card_eval_status_text(card, 'extra', nil, nil, nil, {message = "+$"..(self.config.extra.dollars),volume = 0, colour = G.C.MONEY})
			ease_dollars(self.config.extra.dollars)
		end
	end
}

FELIJO.TotemSigil {
    key = "felijo_ttm_sgl_cardbearer",
    atlas = "inscryptionTotemSigils",
    pos = {x = 8, y = 0},
    badge_colour = HEX('BD894B'),
	no_collection = true,
    calculate = function(self, card, context)
		if context.joker_main then
			SMODS.add_card{ 
				set = "Playing Card", 
				area = G.deck
			}
		end
	end
}

FELIJO.TotemSigil {
    key = "felijo_ttm_sgl_omnistrike",
    atlas = "inscryptionTotemSigils",
    pos = {x = 5, y = 0},
    badge_colour = HEX('BD894B'),
	no_collection = true,
    calculate = function(self, card, context)
		if context.cardarea == G.play
			and context.repetition
			and context.other_card then
			return{
				repetitions = 1,
			}
		end
	end
}


FELIJO.TotemSigil {
    key = "felijo_ttm_sgl_repulsive",
    atlas = "inscryptionTotemSigils",
    pos = {x = 6, y = 0},
    badge_colour = HEX('BD894B'),
	no_collection = true,
    calculate = function(self, card, context)
	end
}

FELIJO.TotemSigil {
    key = "felijo_ttm_sgl_stinky",
	atlas = "inscryptionTotemSigils",
	config = { extra = { xbscore = 0.20 } },
	loc_vars = function(self, info_queue, card)
		return { vars = {self.config.extra.xbscore*100} }
    end,
    pos = {x = 7, y = 0},
    badge_colour = HEX('BD894B'),
	no_collection = true,
    calculate = function(self, card, context)
		if context.joker_main then
			card_eval_status_text(card, 'extra', nil, nil, nil, {message = "-"..(self.config.extra.xbscore*100).."% Blind Req.",volume = 0.5,sound = "gong", colour = G.C.GOLD})
			return {
				func = function()
					G.E_MANAGER:add_event(Event({
						func = function()
							G.GAME.blind.chips = math.floor(G.GAME.blind.chips * (1 - self.config.extra.xbscore))
                            G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
							return true
						end
					}))
				end
			}
		end
	end
}




FELIJO.TotemSigil {
    key = "felijo_ttm_sgl_giftbearer",
    atlas = "inscryptionTotemSigils",
    pos = {x = 4, y = 0},
    badge_colour = HEX('BD894B'),
	no_collection = true,
    calculate = function(self, card, context)
		if ((context.joker_type_destroyed and context.card == card) or context.selling_self) 
		then
			local roll = pseudorandom("ihaveagiftforyou"..G.GAME.round..G.GAME.pseudorandom.seed)
			local cons = FELIJO.quick_pool_pick(FELIJO.consumeables_table, roll)
			G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
			SMODS.add_card{ set = cons, no_edition = true }
			G.GAME.consumeable_buffer = 0
		end
	end
}

FELIJO.TotemSigil {
    key = "felijo_ttm_sgl_leader",
	atlas = "inscryptionTotemSigils",
	config = {extra = { mult = 0, mult_mod = 5}},
	loc_vars = function(self, info_queue, card)
		local my_pos = nil
		local count = 0
        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i] == card then
                my_pos = i
                break
            end
        end
        if my_pos and G.jokers.cards[my_pos + 1] then
            count = count + 1
        end
		if my_pos and G.jokers.cards[my_pos - 1] then
			count = count + 1
		end
		return { vars = {self.config.extra.mult_mod, self.config.extra.mult_mod*count } }
    end,
    pos = {x = 9, y = 0},
    badge_colour = HEX('BD894B'),
	no_collection = true,
    calculate = function(self, card, context)
		if context.joker_main and not context.blueprint then
			self.config.extra.mult = 0
			local my_pos = nil
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then
                    my_pos = i
                    break
                end
            end
            if my_pos and G.jokers.cards[my_pos + 1] then
               self.config.extra.mult = self.config.extra.mult + self.config.extra.mult_mod
            end
			if my_pos and G.jokers.cards[my_pos - 1] then
               self.config.extra.mult = self.config.extra.mult + self.config.extra.mult_mod
            end
			return {
				mult = self.config.extra.mult
			}
		end
	end
}