--[[
PREFACE:
Any perma score, perma blind score card modifier was made possible thanks to
Aikoyori's code.


I will avoid using score modifiers and just do perma blind since i modified a bit for it to work
Thank you so much Aiko for inspiring me to mod.

]]

table.insert(SMODS.other_calculation_keys, "felijo_score")
table.insert(SMODS.other_calculation_keys, "felijo_h_score")
table.insert(SMODS.other_calculation_keys, "felijo_xscore")
table.insert(SMODS.other_calculation_keys, "felijo_h_xscore")
table.insert(SMODS.other_calculation_keys, "felijo_bscore")
table.insert(SMODS.other_calculation_keys, "felijo_h_bscore")
table.insert(SMODS.other_calculation_keys, "felijo_xbscore")
table.insert(SMODS.other_calculation_keys, "felijo_h_xbscore")



FELIJO.mod_score = function(score_mod)
    FELIJO.simple_event_add(
        function()
            FELIJO.mod_score_instant(score_mod)
            return true
        end, 0.2
    )
end

FELIJO.mod_score_instant = function(score_mod)
    score_mod = score_mod or {}
    local score_fx = {}
    local score_cal = score_mod.set or G.GAME.chips
    local old = G.GAME.chips
    G.FELIJO_DISPLAY_QUEUE = G.FELIJO_DISPLAY_QUEUE or {}
    if score_mod.pow then
        score_cal = score_cal ^ score_mod.pow
        table.insert(G.FELIJO_DISPLAY_QUEUE, old)
        table.insert(score_fx, {"k_felijo_score_exp", score_mod.pow, "gong"})
    end
    if score_mod.mult and score_mod.mult ~= 1 then
        score_cal = math.floor(score_cal * score_mod.mult)
        table.insert(G.FELIJO_DISPLAY_QUEUE, old)
        table.insert(score_fx, {"k_felijo_score_x", score_mod.mult, "gong"})
    end
    if score_mod.add and score_mod.add ~= 0 then
        score_cal = score_cal + score_mod.add
        table.insert(G.FELIJO_DISPLAY_QUEUE, old)
        table.insert(score_fx, {FELIJO.compare(score_mod.add, "<", 0) and "k_felijo_score_minus" or "k_felijo_score_add", score_mod.add, "gong"})
    end
	

	G.GAME.chips = math.floor(score_cal) + 1

    
    if score_mod.card then
        for _, values in ipairs(score_fx) do
            card_eval_status_text(score_mod.card, 'jokers', nil, percent, nil, {message = localize{type='variable',key= values[1],vars={values[2]}}, volume = 0.5, sound = values[3], colour =  G.C.SUITS.Diamonds})
        end
    else
        G.FELIJO_DISPLAY_QUEUE = nil
    end
    delay(0.2)
end

function FELIJO.compare(val1, sign, val2)
    local value1 = Talisman and to_big(val1) or val1
    local value2 = Talisman and to_big(val2) or val2
    if sign == "==" then return value1 == value2 end
    if sign == ">=" then return value1 >= value2 end
    if sign == "<=" then return value1 <= value2 end
    if sign == ">" then return value1 > value2 end
    if sign == "<" then return value1 < value2 end
    if sign == "~=" or sign == "!=" then return value1 ~= value2 end
end

FELIJO.mod_blind = function(blind_mod)
    FELIJO.simple_event_add(
        function()
            FELIJO.mod_blind_instant(blind_mod)
            return true
        end, 0.2
    )
end

FELIJO.mod_blind_instant = function(blind_mod)
    blind_mod = blind_mod or {}
    local blind_fx = {}
    local blind_cal = blind_mod.set or G.GAME.blind.chips
    local old = G.GAME.blind.chips
    G.FELIJO_DISPLAY_QUEUE = G.FELIJO_DISPLAY_QUEUE or {}
    if blind_mod.pow then
        blind_cal = blind_cal ^ blind_mod.pow
        table.insert(G.FELIJO_DISPLAY_QUEUE, old)
        table.insert(blind_fx, {"k_felijo_bscore_exp", blind_mod.pow, "gong"})
    end
    if blind_mod.mult and blind_mod.mult ~= 1 then
        blind_cal = blind_cal * blind_mod.mult
        table.insert(G.FELIJO_DISPLAY_QUEUE, old)
        table.insert(blind_fx, {FELIJO.compare(blind_mod.mult, "<", 1) and "k_felijo_bscore_perc" or "k_felijo_bscore_x",FELIJO.compare(blind_mod.mult, "<", 1) and (1 - blind_mod.mult)*100 or blind_mod.mult, "gong"})
    end
    if blind_mod.add and blind_mod.add ~= 0 then
        blind_cal = blind_cal + blind_mod.add
        table.insert(G.FELIJO_DISPLAY_QUEUE, old)
        table.insert(blind_fx, {FELIJO.compare(blind_mod.add, "<", 0) and "k_felijo_bscore_minus" or "k_felijo_bscore_add", blind_mod.add, "gong"})
    end

    
	G.GAME.blind.chips = math.floor(blind_cal)
	G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)

    
    if blind_mod.card then
        for _, values in ipairs(blind_fx) do
            card_eval_status_text(blind_mod.card, 'jokers', nil, percent, nil, {message = localize{type='variable',key=values[1],vars={values[2]}}, volume = 0.5, sound = values[3], colour =  G.C.GOLD})
        end
    else
        G.FELIJO_DISPLAY_QUEUE = nil
    end
    delay(0.2)
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