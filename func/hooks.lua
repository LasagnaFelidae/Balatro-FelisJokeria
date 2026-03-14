
-- for a Boss/Showdown Blind... Thank you TOGA!
local blindkillref = Blind.defeat
function Blind:defeat(silent)
	blindkillref(self, silent)
	if not G.GAME.login and self.name == 'bl_toga_login' then G.GAME.login = true end
	
end


local orig_card_drag = Card.drag
function Card:drag()
    if self.area and self.area == G.jokers then
        SMODS.calculate_context({dragging = true, drag_target = self})
    end
    local ret = orig_card_drag(self)
    return ret
end


local cardSetCostHook = Card.set_cost
function Card:set_cost()
    local ret = cardSetCostHook(self)
    if self.ability.felijo_copied then
        self.cost = 1
        self.sell_cost = 1
    end
    return ret
end

function Card:felijo_get_perma_score()
    
    if self.debuff then return 0 end
    local ret = (self.ability.felijo_perma_score or 0)
    -- TARGET: felijo_get_perma_score
    return ret
end
function Card:felijo_get_perma_h_score()
    
    if self.debuff then return 0 end
    local ret = (self.ability.felijo_perma_h_score or 0)
    -- TARGET: felijo_get_perma_h_score
    return ret
end
function Card:felijo_get_perma_xscore()
    
    if self.debuff then return 1 end
    local ret = (self.ability.felijo_perma_xscore or 1)
    -- TARGET: felijo_get_perma_xscore
    return ret
end
function Card:felijo_get_perma_h_xscore()
    
    if self.debuff then return 1 end
    local ret = (self.ability.felijo_perma_h_xscore or 1)
    -- TARGET: felijo_get_perma_h_xscore
    return ret
end

function Card:felijo_get_perma_bscore()
    
    if self.debuff then return 0 end
    local ret = (self.ability.felijo_perma_bscore or 0)
    -- TARGET: felijo_get_perma_score
    return ret
end
function Card:felijo_get_perma_h_bscore()
    
    if self.debuff then return 0 end
    local ret = (self.ability.felijo_perma_h_bscore or 0)
    -- TARGET: felijo_get_perma_h_score
    return ret
end
function Card:felijo_get_perma_xbscore()
    
    if self.debuff then return 100 end
    local ret = (self.ability.felijo_perma_xbscore or 1)
    -- TARGET: felijo_get_perma_xscore
    return ret
end
function Card:felijo_get_perma_h_xbscore()
    
    if self.debuff then return 100 end
    local ret = (self.ability.felijo_perma_h_xbscore or 1)
    -- TARGET: felijo_get_perma_h_xscore
    return ret
end

local calc_indiv_fx = SMODS.calculate_individual_effect
SMODS.calculate_individual_effect = function(effect, scored_card, key, amount, from_edition)
    local ret = {calc_indiv_fx(effect, scored_card, key, amount, from_edition)}        
        if (key == 'felijo_score' or key == "felijo_h_score") and amount ~= 0 then
            if effect.card and effect.card ~= scored_card then juice_card(effect.card) end
            FELIJO.mod_score_instant({ add = amount, card = effect.message_card or effect.juice_card or scored_card or effect.card or effect.focus })
            return true
        end
        if (key == 'felijo_xscore' or key == "felijo_h_xscore") and amount ~= 0 then
            if effect.card and effect.card ~= scored_card then juice_card(effect.card) end
            FELIJO.mod_score_instant({ mult = amount, card = effect.message_card or effect.juice_card or scored_card or effect.card or effect.focus })
            return true
        end
        if (key == 'felijo_escore' or key == "felijo_h_escore") and amount ~= 0 then
            if effect.card and effect.card ~= scored_card then juice_card(effect.card) end
            FELIJO.mod_score_instant({ pow = amount, card = effect.message_card or effect.juice_card or scored_card or effect.card or effect.focus })
            return true
        end
		if (key == 'felijo_bscore' or key == "felijo_h_bscore") and amount ~= 0 then
            if effect.card and effect.card ~= scored_card then juice_card(effect.card) end
            FELIJO.mod_blind_instant({ add = amount, card = effect.message_card or effect.juice_card or scored_card or effect.card or effect.focus })
            return true
        end
        if (key == 'felijo_xbscore' or key == "felijo_h_xbscore") and amount ~= 0 then
            if effect.card and effect.card ~= scored_card then juice_card(effect.card) end
            FELIJO.mod_blind_instant({ mult = amount, card = effect.message_card or effect.juice_card or scored_card or effect.card or effect.focus })
            return true
        end
        if (key == 'felijo_ebscore' or key == "felijo_h_ebscore") and amount ~= 0 then
            if effect.card and effect.card ~= scored_card then juice_card(effect.card) end
            FELIJO.mod_blind_instant({ pow = amount, card = effect.message_card or effect.juice_card or scored_card or effect.card or effect.focus })
            return true
        end
    return unpack(ret)
end