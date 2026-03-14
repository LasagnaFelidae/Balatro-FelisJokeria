--[[
SMODS.calculate_effect({
    felijo_h_score = card.ability.extra.h_score
}, card)
return {
    func = function ()
		card.ability.extra.h_score = card.ability.extra.h_score + card.ability.extra.h_score_gain
	end
}



]]



-- Bonus
SMODS.Enhancement {
	atlas = 'tieredEnhancements',
    key = 'bonus_t2',
    pos = { x = 1, y = 0 },
    config = { bonus = 60 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.bonus } }
    end,
}

SMODS.Enhancement {
	atlas = 'tieredEnhancements',
    key = 'bonus_t3',
    pos = { x = 2, y = 0 },
    config = { bonus = 120 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.bonus } }
    end,
}

SMODS.Enhancement {
	atlas = 'tieredEnhancements',
    key = 'bonus_t4',
	discovered = true,
	unlocked = true,
	weight = 0,
    pos = { x = 3, y = 0 },
    config = { bonus = 240 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.bonus } }
    end,
}

-- Mult
SMODS.Enhancement {
    atlas = 'tieredEnhancements',
    key = 'mult_t2',
    pos = { x = 1, y = 1 },
    config = { mult = 8 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.mult } }
    end,
}

SMODS.Enhancement {
    atlas = 'tieredEnhancements',
    key = 'mult_t3',
    pos = { x = 2, y = 1 },
    config = { mult = 16 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.mult } }
    end,
}

SMODS.Enhancement {
    atlas = 'tieredEnhancements',
    key = 'mult_t4',
	discovered = true,
	unlocked = true,
	weight = 0,
    pos = { x = 3, y = 1 },
    config = { mult = 32 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.mult } }
    end,
}


-- Glass
SMODS.Enhancement {
	atlas = 'tieredEnhancements',
    key = 'glass_t2',
    pos = { x = 1, y = 3 },
    config = { Xmult = 2.5, extra = { odds = 4 } },
    shatters = true,
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'felijo_glass')
        return { vars = { card.ability.Xmult, numerator, denominator } }
    end,
    calculate = function(self, card, context)
        if context.destroy_card and context.cardarea == G.play and context.destroy_card == card and
            SMODS.pseudorandom_probability(card, 'felijo_glass', 1, card.ability.extra.odds) then
            card.glass_trigger = true -- SMODS addition
            return { remove = true }
        end
    end,
}

SMODS.Enhancement {
	atlas = 'tieredEnhancements',
    key = 'glass_t3',
    pos = { x = 2, y = 3 },
    config = { Xmult = 3, extra = { odds = 6 } },
    shatters = true,
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'felijo_glass')
        return { vars = { card.ability.Xmult, numerator, denominator } }
    end,
    calculate = function(self, card, context)
        if context.destroy_card and context.cardarea == G.play and context.destroy_card == card and
            SMODS.pseudorandom_probability(card, 'felijo_glass', 1, card.ability.extra.odds) then
            card.glass_trigger = true -- SMODS addition
            return { remove = true }
        end
    end,
}

SMODS.Enhancement {
	atlas = 'tieredEnhancements',
    key = 'glass_t4',
	discovered = true,
	unlocked = true,
	weight = 0,
    pos = { x = 3, y = 3 },
    config = { Xmult = 5, extra = { odds = 8 } },
    shatters = true,
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'felijo_glass')
        return { vars = { card.ability.Xmult, numerator, denominator } }
    end,
    calculate = function(self, card, context)
        if context.destroy_card and context.cardarea == G.play and context.destroy_card == card and
            SMODS.pseudorandom_probability(card, 'felijo_glass', 1, card.ability.extra.odds) then
            card.glass_trigger = true
            return { remove = true }
        end
    end,
}

-- Steel
SMODS.Enhancement {
	atlas = 'tieredEnhancements',
    key = 'steel_t2',
    pos = { x = 1, y = 4 },
    config = { h_x_mult = 2.5 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.h_x_mult } }
    end,
}

SMODS.Enhancement {
	atlas = 'tieredEnhancements',
    key = 'steel_t3',
    pos = { x = 2, y = 4 },
    config = { h_x_mult = 3},
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.h_x_mult} }
    end,
}

SMODS.Enhancement {
	atlas = 'tieredEnhancements',
    key = 'steel_t4',
	discovered = true,
	unlocked = true,
	weight = 0,
    pos = { x = 3, y = 4 },
    config = { h_x_mult = 4},
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.h_x_mult} }
    end,
}

-- Stone
SMODS.Enhancement {
	atlas = 'tieredEnhancements',
    key = 'stone_t2',
    pos = { x = 1, y = 5 },
    config = { bonus = 75 },
    replace_base_card = true,
    no_rank = true,
    no_suit = true,
    always_scores = true,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.bonus } }
    end,
}
SMODS.Enhancement {
	atlas = 'tieredEnhancements',
    key = 'stone_t3',
    pos = { x = 2, y = 5 },
    config = { bonus = 150, mult = 2 },
    replace_base_card = true,
    no_rank = true,
    no_suit = true,
    always_scores = true,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.bonus, card.ability.mult } }
    end,
}
SMODS.Enhancement {
	atlas = 'tieredEnhancements',
    key = 'stone_t4',
	discovered = true,
	unlocked = true,
	weight = 0,
    pos = { x = 3, y = 5 },
    config = { bonus = 250, mult = 4},
    replace_base_card = true,
    no_rank = true,
    no_suit = true,
    always_scores = true,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.bonus, card.ability.mult } }
    end,
}

-- Gold
SMODS.Enhancement {
	atlas = 'tieredEnhancements',
    key = 'gold_t2',
    pos = { x = 1, y = 6 },
    config = { h_dollars = 4, p_dollars = 1 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.h_dollars, card.ability.p_dollars  } }
    end,
}
SMODS.Enhancement {
	atlas = 'tieredEnhancements',
    key = 'gold_t3',
    pos = { x = 2, y = 6 },
    config = { h_dollars = 6, p_dollars = 2 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.h_dollars, card.ability.p_dollars  } }
    end,
}
SMODS.Enhancement {
	atlas = 'tieredEnhancements',
    key = 'gold_t4',
	discovered = true,
	unlocked = true,
	weight = 0,
    pos = { x = 3, y = 6 },
    config = { h_dollars = 8, p_dollars = 4 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.h_dollars, card.ability.p_dollars  } }
    end,
}

-- Lucky
SMODS.Enhancement {
	atlas = 'tieredEnhancements',
    key = 'lucky_t2',
    pos = { x = 1, y = 2 },
    config = { extra = { mult = 30, chips = 100, dollars = 30, mult_odds = 5, chips_odds = 5, dollars_odds = 15 } },
    loc_vars = function(self, info_queue, card)
        local mult_numerator, mult_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.mult_odds,
            'felijo_lucky_mult')
		local chips_numerator, chips_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.chips_odds,
            'felijo_lucky_chips')
        local dollars_numerator, dollars_denominator = SMODS.get_probability_vars(card, 1,
            card.ability.extra.dollars_odds, 'felijo_lucky_money')
        return { vars = { mult_numerator, dollars_numerator, card.ability.extra.mult, mult_denominator, card.ability.extra.dollars, dollars_denominator, chips_numerator, chips_denominator, card.ability.extra.chips} }
    end,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            local ret = {}
            if SMODS.pseudorandom_probability(card, 'felijo_lucky_mult', 1, card.ability.extra.mult_odds) then
                card.lucky_trigger = true
                ret.mult = card.ability.extra.mult
            end
			if SMODS.pseudorandom_probability(card, 'felijo_lucky_chips', 1, card.ability.extra.mult_odds) then
                card.lucky_trigger = true
                ret.chips = card.ability.extra.chips
            end
            if SMODS.pseudorandom_probability(card, 'felijo_lucky_money', 1, card.ability.extra.dollars_odds) then
                card.lucky_trigger = true
                ret.dollars = card.ability.extra.dollars
            end
            return ret
        end
    end,
}
SMODS.Enhancement {
	atlas = 'tieredEnhancements',
    key = 'lucky_t3',
    pos = { x = 2, y = 2 },
    config = { extra = { mult = 35, chips = 150, dollars = 35, mult_odds = 4, chips_odds = 4, dollars_odds = 12 } },
    loc_vars = function(self, info_queue, card)
        local mult_numerator, mult_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.mult_odds,
            'felijo_lucky_mult')
		local chips_numerator, chips_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.chips_odds,
            'felijo_lucky_chips')
        local dollars_numerator, dollars_denominator = SMODS.get_probability_vars(card, 1,
            card.ability.extra.dollars_odds, 'felijo_lucky_money')
        return { vars = { mult_numerator, dollars_numerator, card.ability.extra.mult, mult_denominator, card.ability.extra.dollars, dollars_denominator, chips_numerator, chips_denominator, card.ability.extra.chips} }
    end,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            local ret = {}
            if SMODS.pseudorandom_probability(card, 'felijo_lucky_mult', 1, card.ability.extra.mult_odds) then
                card.lucky_trigger = true
                ret.mult = card.ability.extra.mult
            end
			if SMODS.pseudorandom_probability(card, 'felijo_lucky_chips', 1, card.ability.extra.mult_odds) then
                card.lucky_trigger = true
                ret.chips = card.ability.extra.chips
            end
            if SMODS.pseudorandom_probability(card, 'felijo_lucky_money', 1, card.ability.extra.dollars_odds) then
                card.lucky_trigger = true
                ret.dollars = card.ability.extra.dollars
            end
            return ret
        end
    end,
}
SMODS.Enhancement {
	atlas = 'tieredEnhancements',
    key = 'lucky_t4',
	discovered = true,
	unlocked = true,
	weight = 0,
    pos = { x = 3, y = 2 },
    config = { extra = { mult = 40, chips = 250, dollars = 40, mult_odds = 4, chips_odds = 4, dollars_odds = 12 } },
    loc_vars = function(self, info_queue, card)
        local mult_numerator, mult_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.mult_odds,
            'felijo_lucky_mult')
		local chips_numerator, chips_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.chips_odds,
            'felijo_lucky_chips')
        local dollars_numerator, dollars_denominator = SMODS.get_probability_vars(card, 1,
            card.ability.extra.dollars_odds, 'felijo_lucky_money')
        return { vars = { mult_numerator, dollars_numerator, card.ability.extra.mult, mult_denominator, card.ability.extra.dollars, dollars_denominator, chips_numerator, chips_denominator, card.ability.extra.chips} }
    end,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            local ret = {}
            if SMODS.pseudorandom_probability(card, 'felijo_lucky_mult', 1, card.ability.extra.mult_odds) then
                card.lucky_trigger = true
                ret.mult = card.ability.extra.mult
            end
			if SMODS.pseudorandom_probability(card, 'felijo_lucky_chips', 1, card.ability.extra.mult_odds) then
                card.lucky_trigger = true
                ret.chips = card.ability.extra.chips
            end
            if SMODS.pseudorandom_probability(card, 'felijo_lucky_money', 1, card.ability.extra.dollars_odds) then
                card.lucky_trigger = true
                ret.dollars = card.ability.extra.dollars
            end
            return ret
        end
    end,
}