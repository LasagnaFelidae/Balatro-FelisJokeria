FELIJO.Reptile = SMODS.Joker:extend{
    atlas = 'felijo_insReptile',
	pools = {
		["FelisJokeria"]=true,
		["Inscryption"] = true, 
		["Beast"] = true,
		["Reptile"] = true, 
	},
	unlocked = true,
	discovered = false,
	set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_ins'), HEX('7f1232'), HEX('f2a655'), 1 )
	end,
}




FELIJO.Reptile { -- Common Geck
    pos = { x = 3, y = 0 },
    key = "felijo_ins_geck",
    rarity = 1,
    cost = 0,
	blueprint_compat = true,
	eternal_compat = true,
	pronouns = "he_him",
	config = { extra = { chips = 1, mult = 1,}},
	attributes = {"chips", "mult",},
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.chips, card.ability.extra.mult, colours = { HEX('F0C590'), HEX('351A09') } } } 
    end,
    calculate = function(self, card, context)
		if context.joker_main then
			return {
				mult = card.ability.extra.mult,
				chips = card.ability.extra.chips
			}
        end
	end,
}

FELIJO.Reptile { -- common Rattler
    pos = { x = 4, y = 0 },
    key = "felijo_ins_rattler",
    rarity = 1,
    cost = 4,
	blueprint_compat = true,
	eternal_compat = true,
	pronouns = "he_him",
	config = { extra = { chips = 3, mult = 1,}},
	attributes = {"chips", "mult",},
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.chips, card.ability.extra.mult, colours = { HEX('F0C590'), HEX('351A09') } } } 
    end,
    calculate = function(self, card, context)
		if context.joker_main then
			return {
				mult = card.ability.extra.mult,
				chips = card.ability.extra.chips
			}
        end
	end,
}

FELIJO.Reptile { -- Uncommon Adder
    pos = { x = 1, y = 0 },
    key = "felijo_ins_adder",
    rarity = 2,
    cost = 6,
	blueprint_compat = true,
	eternal_compat = true,
	pronouns = "he_him",
	config = { extra = { chips = 1, mult = 1,}},
	attributes = {"chips", "mult", "boss_blind",},
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.chips, card.ability.extra.mult, colours = { HEX('F0C590'), HEX('351A09') } } } 
    end,
	remove_from_deck = function(self,card,from_debuff)
		if from_debuff == true then
			G.E_MANAGER:add_event(Event({
				blocking = false,
				func = function()
					if G.STATE == G.STATES.SELECTING_HAND then
						SMODS.calculate_effect({ message = localize('k_nope_ex') }, card)
						G.GAME.chips = G.GAME.blind.chips
						G.STATE = G.STATES.HAND_PLAYED
						G.STATE_COMPLETE = true
						end_round()
						return true
					end
				end
			}))
		end

	end,
    calculate = function(self, card, context)
		if context.joker_main then
			return {
				mult = card.ability.extra.mult,
				chips = card.ability.extra.chips
			}
        end
	end,
}

FELIJO.Reptile { -- uncommon River Snapper
    pos = { x = 6, y = 0 },
    key = "felijo_ins_riversnapper",
    rarity = 1,
    cost = 4,
	blueprint_compat = true,
	eternal_compat = true,
	pronouns = "he_him",
	attributes = {"chips", "mult",},
	config = { extra = { chips = 1, mult = 6,}},
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.chips, card.ability.extra.mult, colours = { HEX('F0C590'), HEX('351A09') } } } 
    end,
    calculate = function(self, card, context)
		if context.joker_main then
			return {
				mult = card.ability.extra.mult,
				chips = card.ability.extra.chips
			}
        end
	end,
}

FELIJO.Reptile { -- uncommon Skink
    pos = { x = 5, y = 0 },
    key = "felijo_ins_skink",
    rarity = 1,
    cost = 4,
	blueprint_compat = true,
	eternal_compat = false,
	perishable_compat = false,
	pronouns = "he_him",
	attributes = {"chips", "mult", "joker"},
	config = { extra = { chips = 1, mult = 2, tailed = false}},
    loc_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = {key = 'felijo_sgl_tail', set = 'Other'}
		return { vars = { card.ability.extra.chips, card.ability.extra.mult, colours = { HEX('F0C590'), HEX('351A09') } } } 
    end,
    calculate = function(self, card, context)
		if ((not card.ability.felijo_copied == true and not card.ability.akyrs_self_destructs == true and not card.ability.eterbal == true and not card.ability.extra.tailed == true)
		and	((context.joker_type_destroyed and context.card == card ))) and not context.retrigger_joker then 
			
			FELIJO.createTail(card)

			
			return {no_retrigger = true}
		end
		if context.joker_main then
			return {chips = card.ability.extra.chips, mult = card.ability.extra.mult}
		end
	end,
}













FELIJO.Reptile { -- Rare Ouro
    pos = { x = 0, y = 0 },
    key = "felijo_ins_ouro",
    rarity = 3,
    cost = 8,
	pronouns = "he_him",
	attributes = {"xchips", "xmult", "on_sell"},
	config = { extra = { xchips = 1, xmult = 1, gain = 0.2}, sell = {curr = 0, limit = 2} },
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.xchips, card.ability.extra.xmult, card.ability.extra.gain, card.ability.sell.curr, card.ability.sell.limit, colours = { HEX('F0C590'), HEX('351A09') } } } 
    end,
    calculate = function(self, card, context)
		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint and not context.retrigger_joker then
            card.ability.sell.curr = card.ability.sell.curr + 1
            if card.ability.sell.curr == card.ability.sell.limit then
                local eval = function(card) return not card.REMOVED end
                juice_card_until(card, eval, true)
            end
            return {
                message = (card.ability.sell.curr < card.ability.sell.limit) and
                    (card.ability.sell.curr .. '/' .. card.ability.sell.limit) or
                    localize('k_active_ex'),
                colour = G.C.FILTER, 
				no_retrigger = true
            }
        end
        if ((not card.ability.felijo_copied == true and not card.ability.akyrs_self_destructs == true )
		and	((context.selling_self and (card.ability.sell.curr >= card.ability.sell.limit)) -- sacrifice by sale
		or (context.joker_type_destroyed and context.card == card and #G.jokers.cards <= G.jokers.config.card_limit))) and not context.retrigger_joker then -- sacrifice by dagger
			card.ability.extra_slots_used = -1
			
			local ouroboros = SMODS.add_card { 
				key = "j_felijo_ins_ouro", 
				key_append = "felijo_ouro", 
				edition = card.edition,
				no_edition = true,
				stickers = nil,
			}
				
			ouroboros.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.gain
			ouroboros.ability.extra.xchips = card.ability.extra.xmult + card.ability.extra.gain
			ouroboros.ability.extra_slots_used = 0
			
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
			
			return {ouroboros, no_retrigger = true}
		end
		
		if context.joker_main then
			return {
				xmult = card.ability.extra.xmult,
				xchips = card.ability.extra.xchips
			}
        end
	end,
    blueprint_compat = true,
	eternal_compat = false,
}