SMODS.Joker { -- Rare Ouro
    atlas = 'inscryptionJokers',
    pos = { x = 9, y = 0 },
    pools = {
		["FelisJokeria"]=true,
		["Inscryption"] = true, 
		["Beast"] = true,
		["Reptile"] = true, 
	},
    key = "felijo_ins_ouro",
	unlocked = true,
	discovered = true,
    rarity = 3,
    cost = 4,
	pronouns = "he_him",
	config = { extra = { xchips = 1, xmult = 1, gain = 0.2}, sell = {curr = 0, limit = 2} },
	set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_ins'), HEX('7f1232'), HEX('f2a655'), 1 )
	end,
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.xchips, card.ability.extra.xmult, card.ability.extra.gain, card.ability.sell.curr, card.ability.sell.limit, colours = { HEX('F0C590'), HEX('351A09') } } } 
    end,
    calculate = function(self, card, context)
		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            card.ability.sell.curr = card.ability.sell.curr + 1
            if card.ability.sell.curr == card.ability.sell.limit then
                local eval = function(card) return not card.REMOVED end
                juice_card_until(card, eval, true)
            end
            return {
                message = (card.ability.sell.curr < card.ability.sell.limit) and
                    (card.ability.sell.curr .. '/' .. card.ability.sell.limit) or
                    localize('k_active_ex'),
                colour = G.C.FILTER
            }
        end
        if (not card.ability.felijo_copied == true and not card.ability.akyrs_self_destructs == true )
		and	((context.selling_self and (card.ability.sell.curr >= card.ability.sell.limit)) -- sacrifice by sale
		or (context.joker_type_destroyed and context.card == card and #G.jokers.cards <= G.jokers.config.card_limit)) then -- sacrifice by dagger
			card.ability.extra_slots_used = -1
			
			local ouroboros = SMODS.add_card { 
				key = "j_felijo_ins_ouro", 
				key_append = "felijo_ouro", 
				edition = card.edition,
				no_editon = true,
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
			
			return ouroboros
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