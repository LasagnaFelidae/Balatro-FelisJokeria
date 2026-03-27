

FELIJO.BlindsideBlind({
    key = 'bld_pin',
    atlas = 'blindsideBlinds',
    pos = {x = 0, y = 0},
    pools = {
        ["bld_obj_blindcard_cool"] = true,
        ["bld_obj_blindcard_single"] = true,
        ["bld_obj_blindcard_purple"] = true,
    },
    config = {
        extra = {
            value = 13,
            x_score = 1.5,
            x_score_mod = 1.00,
            score = 1000,
            blow = false,
            score_mod = 1500,
            active = false,
            hues = {"Purple"},
        }
    },
    weight = 5,
    hues = {"Purple"},
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.main_scoring and #context.scoring_hand >= 4 then
            return {
                felijo_xscore = card.ability.extra.x_score
            }
        end
        if context.cardarea == G.play and context.main_scoring and #context.scoring_hand < 4 then
            card.ability.extra.blow = true
            return {
                felijo_score = card.ability.extra.score
            }
        end
        if context.cardarea == G.play and context.after and card.ability.extra.blow == true and #context.scoring_hand < 4 then
            G.E_MANAGER:add_event(Event({
					func = function()
                        FELIJO.explodeCard(card,"delete")
                    return true
				end
			}))
        end
    end,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {key = 'felijo_bld_explode', set = 'Other'}
        return {
            vars = {
                card.ability.extra.x_score, card.ability.extra.score
            }
        }
    end,
    upgrade = function(card) 
        if not card.ability.extra.upgraded then
            card.ability.extra.x_score = card.ability.extra.x_score + card.ability.extra.x_score_mod
            card.ability.extra.score = card.ability.extra.score + card.ability.extra.score_mod
            card.ability.extra.upgraded = true
        end
    end,
    
})

----------------------------------------------
------------MOD CODE END----------------------