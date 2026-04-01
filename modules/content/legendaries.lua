SMODS.Joker {
	atlas = 'feliJoker',
	pos = { x = 0, y = 0 },
	soul_pos = {
		x = 1, y = 0, draw = function (card, scale_mod, rotate_mod)
			card.children.floating_sprite:draw_shader('dissolve',0, nil, nil, card.children.center,scale_mod, rotate_mod,0,0 - 0.1,nil, 0.2)
			card.children.floating_sprite:draw_shader('dissolve', nil, nil, nil, card.children.center, scale_mod, rotate_mod,0,0-0.2)
		end
	},
	pools = {["FelisJokeria"] = true, ["Feline"] = true,  ["Letter"] = true, },
	key = "felijo_lgd_feli",
	rarity = 4,
	cost = 20,
	config = {
		extra = { chips = 5, odds = 6},
	},	
	loc_vars = function(self, info_queue, card)
		local numerator, denumerator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'felijo_lgd_feli')
		return { vars = { card.ability.extra.chips, numerator, denumerator} }
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			if G.GAME.akyrs_character_stickers_enabled and G.GAME.akyrs_wording_enabled and G.GAME.aiko_current_word then
				local word = G.GAME.aiko_current_word    
				if not word then return {} end
				word = string.lower(word)			
				if FELIJO.garf_words[word] then	
					if SMODS.pseudorandom_probability(card, 'felijo_lgd_feli', 1, card.ability.extra.odds) then
						return {
							chips = card.ability.extra.chips * #word * G.GAME.hands[context.scoring_name].played,
							level_up = true,
							message = localize('k_felijo_lvl_succ')
						}
					else
						return {
							chips = card.ability.extra.chips * #word * G.GAME.hands[context.scoring_name].played
						}
					end
				end
				
			else
				return {
					chips = card.ability.extra.chips * #context.scoring_hand * G.GAME.hands[context.scoring_name].played
				}
			end
		end
	end,
	blueprint_compat = true,
}

local getMPHand = function()
	local _handname, _played = 'High Card', -1
	for hand_key, hand in pairs(G.GAME.hands) do
		if hand.played > _played then
			_played = hand.played
			_handname = hand_key
		end
	end
	local most_played = _handname
	return most_played
end

--[[
SMODS.Sound({key = "jokerpp_ascend", path = "jokerpp_ascend.ogg"})

SMODS.Joker {
	atlas = 'JokerPP',
	pos = { x = 0, y = 0 },
	soul_pos = {
		x = 0, y = 1,
	},
	pools = {["FelisJokeria"] = true,},
	key = "felijo_lgd_jokerpp",
	rarity = 1,
	cost = 7,
	blueprint_compat = true,
	eternal_compat = true,
	config = {
		extra = { mult = 6, mult_mod = 1, count = 0, max_c = 5, ascended = false},
	},	
	loc_vars = function(self, info_queue, card)
		key = self.key
		if card.ability.extra.ascended == true then
			key = self.key .. "_a"
		end
		return { vars = {card.ability.extra.mult, card.ability.extra.mult_mod}, key = key }
	end,
	load = function (self,card)
		G.E_MANAGER:add_event(Event({
			func = function() 
				if card.ability and card.ability.extra.ascended and card.ability.extra.ascended == true then
					card.config.center.pos = ({x = 0, y = 2})
					card.config.center.soul_pos = {x = card.config.center.soul_pos.x, y = 3}
					card:set_sprites(card.config.center)
				end
				return true 
			end
		}))
	end,
	
	calculate = function(self, card, context)
		if context.before then
			local mph = getMPHand()
			if context.scoring_hand ~= mph and card.ability.extra.ascended == true then
				card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod
				return {
					message = localize('k_upgrade_ex'),
					colour = G.C.GOLD,
					no_juice = false
				}
			end
			if context.scoring_hand ~= mph and card.ability.extra.count < card.ability.extra.max_c then
				card.ability.extra.count = card.ability.extra.count + 1
			elseif card.ability.extra.ascended == false and card.ability.extra.count >= card.ability.extra.max_c then
				play_sound('felijo_jokerpp_ascend', 1)
				card.ability.extra.ascended = true
				card.ability.extra.mult = 10
				card.config.center.pos = ({x = 0, y = 2})
				card.config.center.soul_pos = {x = card.config.center.soul_pos.x, y = 3}
				card:set_sprites(card.config.center)
			end
		end
		if context.joker_main then
			return {
				mult = card.ability.extra.mult
			}
		end
	end,
}


 ]]