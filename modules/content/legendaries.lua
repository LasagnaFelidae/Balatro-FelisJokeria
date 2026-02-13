SMODS.Joker {
    atlas = 'feliJoker',
    pos = { x = 0, y = 0 },
	soul_pos = {
        x = 1, y = 0, draw = function (card, scale_mod, rotate_mod)
            card.children.floating_sprite:draw_shader('dissolve',0, nil, nil, card.children.center,scale_mod, rotate_mod,0,0 - 0.1,nil, 0.2)
            card.children.floating_sprite:draw_shader('dissolve', nil, nil, nil, card.children.center, scale_mod, rotate_mod,0,0-0.2)
        end
    },
    pools = {["Letter"] = true },
    key = "felijo_lgd_feli",
    rarity = 4,
    cost = 20,
	config = { extra = { chips = 5, dollars = 1, odds = 6} },
	
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


--[[
SMODS.Joker {
    atlas = 'misprintRekoj',
    pos = { x = 0, y = 0 },
	soul_pos = {
        x = 1, y = 0, draw = function (card, scale_mod, rotate_mod)
			card.children.floating_sprite:draw_shader('dissolve',0, nil, nil, card.children.center,scale_mod, rotate_mod,0,0 - 0.1,nil, 0.2)
			card.children.floating_sprite:draw_shader('dissolve', nil, nil, nil, card.children.center, scale_mod, rotate_mod,0,0-0.05)
        end
    },
    pools = {["Letter"] = true },
    key = "felijo_misprint",
    rarity = 4,
    cost = 20,
	config = { extra = {} },
    loc_vars = function(self, info_queue, card)
		return { vars = {} }
		
	end,
    calculate = function(self, card, context)
	end,
    blueprint_compat = true,
}
]]


