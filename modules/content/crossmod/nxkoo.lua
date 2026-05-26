SMODS.Enhancement {
	key = 'enh_sup_mp',
	atlas = 'lover_tieredEnhancements',
	pos = { x = 0, y = 7 },
	config = { extra = {xchips = 0.33}, mod = {min = 0.7, max = 1.8}},
	discovered = true,
	unlocked = true,
	replace_base_card = false,
	no_rank = false,
	no_suit = false,
	always_scores = false,
	weight = 0,
	set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_revo'), HEX('7E7AFF'), HEX('40093A'), 1 )
	end,
	
	
	in_pool = function(self)
		return false
	end,
	
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.xchips*100, card.ability.mod.min, card.ability.mod.max } }
	end,

	calculate = function(self, card, context)
		if context.main_scoring and context.cardarea == G.play then
            local modifier = pseudorandom(pseudoseed("sayasukakamu"), card.ability.mod.min, card.ability.mod.max)
			return {
				xchips = math.max(0.6,(card.base.id * card.ability.extra.xchips) * modifier)
			}
		end
	end,
}

FELIJO.T2Enhancement {
	key = 'enh_sup_t2_mp',
	atlas = 'lover_tieredEnhancements',
	pos = { x = 1, y = 7 },
	config = { extra = {xchips = 0.45}, mod = {min = 0.7, max = 2}},
	discovered = true,
	unlocked = true,
	replace_base_card = false,
	no_rank = false,
	no_suit = false,
	always_scores = false,
	weight = 0,
	set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_revo'), HEX('7E7AFF'), HEX('40093A'), 1 )
	end,
	
	
	in_pool = function(self)
		return false
	end,
	
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.xchips*100, card.ability.mod.min, card.ability.mod.max } }
	end,

	calculate = function(self, card, context)
		if context.main_scoring and context.cardarea == G.play then
            local modifier = pseudorandom(pseudoseed("sayasukakamu"), card.ability.mod.min, card.ability.mod.max)
			return {
				xchips = math.max(0.7,(card.base.id * card.ability.extra.xchips) * modifier)
			}
		end
	end,
}

FELIJO.T3Enhancement {
	key = 'enh_sup_t3_mp',
	atlas = 'lover_tieredEnhancements',
	pos = { x = 2, y = 7 },
	config = { extra = {xchips = 0.65}, mod = {min = 0.8, max = 2.2}},
	discovered = true,
	unlocked = true,
	replace_base_card = false,
	no_rank = false,
	no_suit = false,
	always_scores = false,
	weight = 0,
	set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_revo'), HEX('7E7AFF'), HEX('40093A'), 1 )
	end,
	
	
	in_pool = function(self)
		return false
	end,
	
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.xchips*100, card.ability.mod.min, card.ability.mod.max } }
	end,

	calculate = function(self, card, context)
		if context.main_scoring and context.cardarea == G.play then
            local modifier = pseudorandom(pseudoseed("my name jeff"), card.ability.mod.min, card.ability.mod.max)
			return {
				xchips = math.max(0.8,(card.base.id * card.ability.extra.xchips) * modifier)
			}
		end
	end,
}

FELIJO.T4Enhancement {
	key = 'enh_sup_t4_mp',
	atlas = 'lover_tieredEnhancements',
	pos = { x = 3, y = 7 },
	config = { extra = {xchips = 0.85}, mod = {min = 0.9, max = 2.5}},
	discovered = true,
	unlocked = true,
	replace_base_card = false,
	no_rank = false,
	no_suit = false,
	always_scores = false,
	weight = 0,
	set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_revo'), HEX('7E7AFF'), HEX('40093A'), 1 )
	end,
	
	in_pool = function(self)
		return false
	end,
	
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.xchips*100, card.ability.mod.min, card.ability.mod.max } }
	end,

	calculate = function(self, card, context)
		if context.main_scoring and context.cardarea == G.play then
            local modifier = pseudorandom(pseudoseed("my name jeff"), card.ability.mod.min, card.ability.mod.max)
			return {
				xchips = math.max(1,(card.base.id * card.ability.extra.xchips) * modifier)
			}
		end
	end,
}

-- Bonus
FELIJO.T2Enhancement {
	atlas = 'lover_tieredEnhancements',
    key = 'bonus_t2_mp',
    pos = { x = 1, y = 0 },
    config = { extra = {chips = 60}, mod = {min = 0.7, max = 2}},
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.mod.min, card.ability.mod.max } }
    end,
	calculate = function(self, card, context)
		if context.main_scoring and context.cardarea == G.play then
            local modifier = pseudorandom(pseudoseed("sayasukakamu"), card.ability.mod.min, card.ability.mod.max)
			return {
				chips = math.max(0.7,(card.base.id * card.ability.extra.chips) * modifier)
			}
		end
	end,
}

FELIJO.T3Enhancement {
	atlas = 'lover_tieredEnhancements',
    key = 'bonus_t3_mp',
    pos = { x = 2, y = 0 },
    config = { extra = {chips = 120}, mod = {min = 0.8, max = 2.2}},
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.mod.min, card.ability.mod.max } }
    end,
	calculate = function(self, card, context)
		if context.main_scoring and context.cardarea == G.play then
            local modifier = pseudorandom(pseudoseed("sayasukakamu"), card.ability.mod.min, card.ability.mod.max)
			return {
				chips = math.max(0.8,(card.base.id * card.ability.extra.chips) * modifier)
			}
		end
	end,
}

FELIJO.T4Enhancement {
	atlas = 'lover_tieredEnhancements',
    key = 'bonus_t4_mp',
	weight = 0,
    pos = { x = 3, y = 0 },
    config = { extra = {chips = 240}, mod = {min = 0.9, max = 2.5}},
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.mod.min, card.ability.mod.max } }
    end,
	calculate = function(self, card, context)
		if context.main_scoring and context.cardarea == G.play then
            local modifier = pseudorandom(pseudoseed("sayasukakamu"), card.ability.mod.min, card.ability.mod.max)
			return {
				chips = math.max(1,(card.base.id * card.ability.extra.chips) * modifier)
			}
		end
	end,
}

-- Mult
FELIJO.T2Enhancement {
    atlas = 'lover_tieredEnhancements',
    key = 'mult_t2_mp',
    pos = { x = 1, y = 1 },
    config = { extra = {mult = 8}, mod = {min = 0.7, max = 2.5}},
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, card.ability.mod.min, card.ability.mod.max } }
    end,
	calculate = function(self, card, context)
		if context.main_scoring and context.cardarea == G.play then
            local modifier = pseudorandom(pseudoseed("sayasukakamu"), card.ability.mod.min, card.ability.mod.max)
			return {
				mult = math.max(1,(card.base.id * card.ability.extra.mult) * modifier)
			}
		end
	end,
}

FELIJO.T3Enhancement {
    atlas = 'lover_tieredEnhancements',
    key = 'mult_t3_mp',
    pos = { x = 2, y = 1 },
    config = { extra = {mult = 16 }, mod = {min = 0.8, max = 3} },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, card.ability.mod.min, card.ability.mod.max } }
    end,
	calculate = function(self, card, context)
		if context.main_scoring and context.cardarea == G.play then
            local modifier = pseudorandom(pseudoseed("sayasukakamu"), card.ability.mod.min, card.ability.mod.max)
			return {
				mult = math.max(1,(card.base.id * card.ability.extra.mult) * modifier)
			}
		end
	end,
}

FELIJO.T4Enhancement {
    atlas = 'lover_tieredEnhancements',
    key = 'mult_t4_mp',
    pos = { x = 3, y = 1 },
    config = { extra = {mult = 32}, mod = {min = 0.9, max = 4} },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, card.ability.mod.min, card.ability.mod.max } }
    end,
	calculate = function(self, card, context)
		if context.main_scoring and context.cardarea == G.play then
            local modifier = pseudorandom(pseudoseed("sayasukakamu"), card.ability.mod.min, card.ability.mod.max)
			return {
				mult = math.max(1,(card.base.id * card.ability.extra.mult) * modifier)
			}
		end
	end,
}

-- Glass
FELIJO.T2Enhancement {
	atlas = 'lover_tieredEnhancements',
    key = 'glass_t2_mp',
    pos = { x = 1, y = 3 },
    config = { extra = {xmult = 2.5, odds = 4 }, mod = {min = 0.7, max = 2.5}  },
    shatters = true,
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'felijo_glass')
        return { vars = { card.ability.extra.xmult, numerator, denominator, card.ability.mod.min,card.ability.mod.max, } }
    end,
    calculate = function(self, card, context)
        if context.destroy_card and context.cardarea == G.play and context.destroy_card == card and
            SMODS.pseudorandom_probability(card, 'felijo_glass', 1, card.ability.extra.odds) then
            card.glass_trigger = true -- SMODS addition
            return { remove = true }
		elseif context.main_scoring and context.cardarea == G.play then
			local modifier = pseudorandom(pseudoseed("sayasukakamu"), card.ability.mod.min, card.ability.mod.max)
			return {xmult = math.max(0.7,(card.base.id * card.ability.extra.xmult) * modifier)}
		end
    end,
}

FELIJO.T3Enhancement {
	atlas = 'lover_tieredEnhancements',
    key = 'glass_t3_mp',
    pos = { x = 2, y = 3 },
    config = { extra = {xmult = 3, odds = 6 }, mod = {min = 0.8, max = 3}  },
    shatters = true,
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'felijo_glass')
        return { vars = { card.ability.extra.xmult, numerator, denominator, card.ability.mod.min,card.ability.mod.max,  } }
    end,
    calculate = function(self, card, context)
        if context.destroy_card and context.cardarea == G.play and context.destroy_card == card and
            SMODS.pseudorandom_probability(card, 'felijo_glass', 1, card.ability.extra.odds) then
            card.glass_trigger = true -- SMODS addition
            return { remove = true }
		elseif context.main_scoring and context.cardarea == G.play then
			local modifier = pseudorandom(pseudoseed("sayasukakamu"), card.ability.mod.min, card.ability.mod.max)
			return {xmult = math.max(0.7,(card.base.id * card.ability.extra.xmult) * modifier)}
		end
    end,
}

FELIJO.T4Enhancement {
	atlas = 'lover_tieredEnhancements',
    key = 'glass_t4_mp',
    pos = { x = 3, y = 3 },
    config = { extra = {xmult = 5, odds = 8 }, mod = {min = 0.9, max = 3.5}  },
    shatters = true,
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'felijo_glass')
        return { vars = { card.ability.extra.xmult, numerator, denominator, card.ability.mod.min,card.ability.mod.max,  } }
    end,
    calculate = function(self, card, context)
        if context.destroy_card and context.cardarea == G.play and context.destroy_card == card and
            SMODS.pseudorandom_probability(card, 'felijo_glass', 1, card.ability.extra.odds) then
            card.glass_trigger = true -- SMODS addition
            return { remove = true }
		elseif context.main_scoring and context.cardarea == G.play then
			local modifier = pseudorandom(pseudoseed("sayasukakamu"), card.ability.mod.min, card.ability.mod.max)
			return {xmult = math.max(0.7,(card.base.id * card.ability.extra.xmult) * modifier)}
		end
    end,
}

-- Steel
FELIJO.T2Enhancement {
	atlas = 'lover_tieredEnhancements',
    key = 'steel_t2_mp',
    pos = { x = 1, y = 4 },
    config = { extra = {xmult = 2.5}, mod = {min = 0.5, max = 1.5}  },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult, card.ability.mod.min, card.ability.mod.max,  } }
    end,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.hand then
			local modifier = pseudorandom(pseudoseed("sayasukakamu"), card.ability.mod.min, card.ability.mod.max)
			return {xmult = math.max(0.7,(card.base.id * card.ability.extra.xmult) * modifier)}
		end
    end,
}

FELIJO.T2Enhancement {
	atlas = 'lover_tieredEnhancements',
    key = 'steel_t3_mp',
    pos = { x = 2, y = 4 },
    config = { extra = {xmult = 3}, mod = {min = 0.6, max = 2.5}  },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult, card.ability.mod.min, card.ability.mod.max,  } }
    end,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.hand then
			local modifier = pseudorandom(pseudoseed("sayasukakamu"), card.ability.mod.min, card.ability.mod.max)
			return {xmult = math.max(0.7,(card.base.id * card.ability.extra.xmult) * modifier)}
		end
    end,
}

FELIJO.T2Enhancement {
	atlas = 'lover_tieredEnhancements',
    key = 'steel_t4_mp',
    pos = { x = 3, y = 4 },
    config = { extra = {xmult = 4}, mod = {min = 0.8, max = 3}  },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult, card.ability.mod.min, card.ability.mod.max,  } }
    end,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.hand then
			local modifier = pseudorandom(pseudoseed("sayasukakamu"), card.ability.mod.min, card.ability.mod.max)
			return {xmult = math.max(0.7,(card.base.id * card.ability.extra.xmult) * modifier)}
		end
    end,
}

-- Stone
FELIJO.T2Enhancement {
	atlas = 'lover_tieredEnhancements',
    key = 'stone_t2_mp',
    pos = { x = 1, y = 5 },
    config = { extra= {bonus = 75}, mod = {min = 0.4, max = 2}   },
    replace_base_card = true,
    no_rank = true,
    no_suit = true,
    always_scores = true,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.bonus, card.ability.mod.min, card.ability.mod.max} }
    end,
	calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
			local modifier = pseudorandom(pseudoseed("sayasukakamu"), card.ability.mod.min, card.ability.mod.max)
			return {chips = math.max(0.7,(card.base.id * card.ability.extra.bonus) * modifier)}
		end
    end,
}
FELIJO.T3Enhancement {
	atlas = 'lover_tieredEnhancements',
    key = 'stone_t3_mp',
    pos = { x = 2, y = 5 },
    config = { extra= {bonus = 150, mult = 2}, mod = {min = 0.6, max = 3}   },
    replace_base_card = true,
    no_rank = true,
    no_suit = true,
    always_scores = true,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.bonus, card.ability.mult, card.ability.mod.min, card.ability.mod.max } }
    end,
	calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
			local modifier = pseudorandom(pseudoseed("sayasukakamu"), card.ability.mod.min, card.ability.mod.max)
			return {
				chips = math.max(0.7,(card.base.id * card.ability.extra.bonus) * modifier),
				mult = math.max(0.7,(card.base.id * card.ability.extra.mult) * modifier)
			}
		end
    end,
}
FELIJO.T4Enhancement {
	atlas = 'lover_tieredEnhancements',
    key = 'stone_t4_mp',
    pos = { x = 3, y = 5 },
    config = { extra= {bonus = 250, mult = 4}, mod = {min = 0.7, max = 4}   },
    replace_base_card = true,
    no_rank = true,
    no_suit = true,
    always_scores = true,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.bonus, card.ability.mult, card.ability.mod.min, card.ability.mod.max } }
    end,
	calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
			local modifier = pseudorandom(pseudoseed("sayasukakamu"), card.ability.mod.min, card.ability.mod.max)
			return {
				chips = math.max(0.7,(card.base.id * card.ability.extra.bonus) * modifier),
				mult = math.max(0.7,(card.base.id * card.ability.extra.mult) * modifier)
			}
		end
    end,
}

-- Gold
FELIJO.T2Enhancement {
	atlas = 'lover_tieredEnhancements',
    key = 'gold_t2_mp',
    pos = { x = 1, y = 6 },
    config = { extra = {h_dollars = 4, p_dollars = 1}, mod = {min = 0.4, max = 2} },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.h_dollars, card.ability.extra.p_dollars, card.ability.mod.min, card.ability.mod.max  } }
    end,
	calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.hand then
			local modifier = pseudorandom(pseudoseed("sayasukakamu"), card.ability.mod.min, card.ability.mod.max)
			return {dollars = math.max(0.7,(card.base.id * card.ability.extra.h_dollars) * modifier)}
		end
		if context.main_scoring and context.cardarea == G.play then
			local modifier = pseudorandom(pseudoseed("sayasukakamu"), card.ability.mod.min, card.ability.mod.max)
			return {dollars = math.max(0.7,(card.base.id * card.ability.extra.p_dollars) * modifier)}
		end
    end,
}
FELIJO.T3Enhancement {
	atlas = 'lover_tieredEnhancements',
    key = 'gold_t3_mp',
    pos = { x = 2, y = 6 },
    config = { extra = {h_dollars = 6, p_dollars = 2}, mod = {min = 0.6, max = 3} },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.h_dollars, card.ability.extra.p_dollars, card.ability.mod.min, card.ability.mod.max  } }
    end,
	calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.hand then
			local modifier = pseudorandom(pseudoseed("sayasukakamu"), card.ability.mod.min, card.ability.mod.max)
			return {dollars = math.max(0.7,(card.base.id * card.ability.extra.h_dollars) * modifier)}
		end
		if context.main_scoring and context.cardarea == G.play then
			local modifier = pseudorandom(pseudoseed("sayasukakamu"), card.ability.mod.min, card.ability.mod.max)
			return {dollars = math.max(0.7,(card.base.id * card.ability.extra.p_dollars) * modifier)}
		end
    end,
}
FELIJO.T4Enhancement {
	atlas = 'lover_tieredEnhancements',
    key = 'gold_t4_mp',
    pos = { x = 3, y = 6 },
    config = { extra = {h_dollars = 8, p_dollars = 4}, mod = {min = 0.7, max = 4} },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.h_dollars, card.ability.extra.p_dollars, card.ability.mod.min, card.ability.mod.max  } }
    end,
	calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.hand then
			local modifier = pseudorandom(pseudoseed("sayasukakamu"), card.ability.mod.min, card.ability.mod.max)
			return {dollars = math.max(0.7,(card.base.id * card.ability.extra.h_dollars) * modifier)}
		end
		if context.main_scoring and context.cardarea == G.play then
			local modifier = pseudorandom(pseudoseed("sayasukakamu"), card.ability.mod.min, card.ability.mod.max)
			return {dollars = math.max(0.7,(card.base.id * card.ability.extra.p_dollars) * modifier)}
		end
    end,
}

-- Lucky
FELIJO.T2Enhancement {
	atlas = 'lover_tieredEnhancements',
    key = 'lucky_t2_mp',
    pos = { x = 1, y = 2 },
    config = { extra = { mult = 30, chips = 100, dollars = 30, mult_odds = 5, chips_odds = 5, dollars_odds = 15 }, mod = {min = 0.4, max = 2.5} },
    loc_vars = function(self, info_queue, card)
        local mult_numerator, mult_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.mult_odds,
            'felijo_lucky_mult')
		local chips_numerator, chips_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.chips_odds,
            'felijo_lucky_chips')
        local dollars_numerator, dollars_denominator = SMODS.get_probability_vars(card, 1,
            card.ability.extra.dollars_odds, 'felijo_lucky_money')
        return { vars = { mult_numerator, dollars_numerator, card.ability.extra.mult, mult_denominator, card.ability.extra.dollars, dollars_denominator, chips_numerator, chips_denominator, card.ability.extra.chips, card.ability.mod.min, card.ability.mod.max} }
    end,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
			local modifier = pseudorandom(pseudoseed("sayasukakamu"), card.ability.mod.min, card.ability.mod.max)
            local ret = {}
            if SMODS.pseudorandom_probability(card, 'felijo_lucky_mult', 1, card.ability.extra.mult_odds) then
                card.lucky_trigger = true
                ret.mult = math.max(0.7,(card.base.id * card.ability.extra.mult) * modifier)
            end
			if SMODS.pseudorandom_probability(card, 'felijo_lucky_chips', 1, card.ability.extra.mult_odds) then
                card.lucky_trigger = true
                ret.chips = math.max(0.7,(card.base.id * card.ability.extra.chips) * modifier)
            end
            if SMODS.pseudorandom_probability(card, 'felijo_lucky_money', 1, card.ability.extra.dollars_odds) then
                card.lucky_trigger = true
                ret.dollars = math.max(0.7,(card.base.id * card.ability.extra.dollars) * modifier)
            end
            return ret
        end
    end,
}
FELIJO.T3Enhancement {
	atlas = 'lover_tieredEnhancements',
    key = 'lucky_t3_mp',
    pos = { x = 2, y = 2 },
    config = { extra = { mult = 35, chips = 150, dollars = 35, mult_odds = 4, chips_odds = 4, dollars_odds = 12 }, mod = {min = 0.7, max = 3}  },
    loc_vars = function(self, info_queue, card)
        local mult_numerator, mult_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.mult_odds,
            'felijo_lucky_mult')
		local chips_numerator, chips_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.chips_odds,
            'felijo_lucky_chips')
        local dollars_numerator, dollars_denominator = SMODS.get_probability_vars(card, 1,
            card.ability.extra.dollars_odds, 'felijo_lucky_money')
        return { vars = { mult_numerator, dollars_numerator, card.ability.extra.mult, mult_denominator, card.ability.extra.dollars, dollars_denominator, chips_numerator, chips_denominator, card.ability.extra.chips, card.ability.mod.min, card.ability.mod.max} }
    end,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            local ret = {}
			local modifier = pseudorandom(pseudoseed("sayasukakamu"), card.ability.mod.min, card.ability.mod.max)
            if SMODS.pseudorandom_probability(card, 'felijo_lucky_mult', 1, card.ability.extra.mult_odds) then
                card.lucky_trigger = true
                ret.mult = math.max(0.7,(card.base.id * card.ability.extra.mult) * modifier)
            end
			if SMODS.pseudorandom_probability(card, 'felijo_lucky_chips', 1, card.ability.extra.mult_odds) then
                card.lucky_trigger = true
                ret.chips = math.max(0.7,(card.base.id * card.ability.extra.chips) * modifier)
            end
            if SMODS.pseudorandom_probability(card, 'felijo_lucky_money', 1, card.ability.extra.dollars_odds) then
                card.lucky_trigger = true
                ret.dollars = math.max(0.7,(card.base.id * card.ability.extra.dollars) * modifier)
            end
            return ret
        end
    end,
}
FELIJO.T4Enhancement {
	atlas = 'lover_tieredEnhancements',
    key = 'lucky_t4_mp',
    pos = { x = 3, y = 2 },
    config = { extra = { mult = 40, chips = 250, dollars = 40, mult_odds = 4, chips_odds = 4, dollars_odds = 12 }, mod = {min = 0.9, max = 4} },
    loc_vars = function(self, info_queue, card)
        local mult_numerator, mult_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.mult_odds,
            'felijo_lucky_mult')
		local chips_numerator, chips_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.chips_odds,
            'felijo_lucky_chips')
        local dollars_numerator, dollars_denominator = SMODS.get_probability_vars(card, 1,
            card.ability.extra.dollars_odds, 'felijo_lucky_money')
        return { vars = { mult_numerator, dollars_numerator, card.ability.extra.mult, mult_denominator, card.ability.extra.dollars, dollars_denominator, chips_numerator, chips_denominator, card.ability.extra.chips, card.ability.mod.min, card.ability.mod.max} }
    end,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            local ret = {}
			local modifier = pseudorandom(pseudoseed("sayasukakamu"), card.ability.mod.min, card.ability.mod.max)
            if SMODS.pseudorandom_probability(card, 'felijo_lucky_mult', 1, card.ability.extra.mult_odds) then
                card.lucky_trigger = true
                ret.mult = math.max(0.7,(card.base.id * card.ability.extra.mult) * modifier)
            end
			if SMODS.pseudorandom_probability(card, 'felijo_lucky_chips', 1, card.ability.extra.mult_odds) then
                card.lucky_trigger = true
                ret.chips = math.max(0.7,(card.base.id * card.ability.extra.chips) * modifier)
            end
            if SMODS.pseudorandom_probability(card, 'felijo_lucky_money', 1, card.ability.extra.dollars_odds) then
                card.lucky_trigger = true
                ret.dollars = math.max(0.7,(card.base.id * card.ability.extra.dollars) * modifier)
            end
            return ret
        end
    end,
}