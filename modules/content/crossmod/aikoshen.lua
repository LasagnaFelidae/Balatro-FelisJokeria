---@type SMODS.Joker
FELIJO.LetterJoker = SMODS.Joker:extend{
    akyrs_is_letter = true,
    in_pool = function (self, args)
        return G.GAME.akyrs_character_stickers_enabled and G.GAME.akyrs_wording_enabled or false
    end
}



--- WORD MULTIPLIERS

FELIJO.LetterJoker {
    key = "felijo_ltr_dbw",
    atlas = 'aikoJokers',
    pos = { x = 5, y = 0 },
	pools = {["FelisJokeria"] = true, ["Letter"] = true, ["Scrabble"] = true  },
    unlocked = true,
    blueprint_compat = true,
    rarity = 1,
    cost = 6,
	config = { extra = { xchips = 2, xmult = 2, odds = 4 } },
    loc_vars = function(self, info_queue, card)
		local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'felijo_ltr_dbw')
        return { vars = { card.ability.extra.xchips, card.ability.extra.xmult, numerator, denominator} }
    end,
    calculate = function(self, card, context)
		if context.joker_main then
			if SMODS.pseudorandom_probability(card, 'felijo_ltr_dbw', 1, card.ability.extra.odds) and #context.scoring_hand > 3 then
				return{
					xchips = card.ability.extra.xchips,
					xmult = card.ability.extra.xmult
				}	
			end	
		end
    end
}
FELIJO.LetterJoker {
    key = "felijo_ltr_tpw",
    atlas = 'aikoJokers',
    pos = { x = 6, y = 0 },
	pools = {["FelisJokeria"] = true, ["Letter"] = true, ["Scrabble"] = true  },
    unlocked = true,
    blueprint_compat = true,
    rarity = 2,
    cost = 12,
	config = { extra = { xchips = 3, xmult = 3, odds = 6 } },
    loc_vars = function(self, info_queue, card)
		local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'felijo_ltr_tpw')
        return { vars = { card.ability.extra.xchips, card.ability.extra.xmult, numerator, denominator} }
    end,
    calculate = function(self, card, context)
		if context.joker_main then
			if SMODS.pseudorandom_probability(card, 'felijo_ltr_tpw', 1, card.ability.extra.odds) and #context.scoring_hand > 5 then
				return{
					xchips = card.ability.extra.xchips,
					xmult = card.ability.extra.xmult
				}	
			end	
		end
    end
}
FELIJO.LetterJoker {
    key = "felijo_ltr_qdw",
    atlas = 'aikoJokers',
    pos = { x = 7, y = 0 },
	pools = {["FelisJokeria"] = true, ["Letter"] = true, ["Scrabble"] = true  },
    unlocked = true,
    blueprint_compat = true,
    rarity = 3,
    cost = 18,
	config = { extra = { xchips = 4, xmult = 4, odds = 8 } },
    loc_vars = function(self, info_queue, card)
		local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'felijo_ltr_qdw')
        return { vars = { card.ability.extra.xchips, card.ability.extra.xmult, numerator, denominator} }
    end,
    calculate = function(self, card, context)
		if context.joker_main then
			if SMODS.pseudorandom_probability(card, 'felijo_ltr_qdw', 1, card.ability.extra.odds) and #context.scoring_hand > 7 then
				return{
					xchips = card.ability.extra.xchips,
					xmult = card.ability.extra.xmult
				}	
			end	
		end
    end
}

--- LETTER MULTIPLIERS

FELIJO.LetterJoker {
    key = "felijo_ltr_dbl",
    atlas = 'aikoJokers',
    pos = { x = 2, y = 0 },
	pools = {["FelisJokeria"] = true, ["Letter"] = true, ["Scrabble"] = true },
    unlocked = true,
    blueprint_compat = false,
    rarity = 1,
    cost = 6,
	config = { extra = { cap = 5, repetitions = 1, odds = 8} },
    loc_vars = function(self, info_queue, card)
		local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'felijo_ltr_dbl')
        return { vars = { card.ability.extra.repetitions, card.ability.extra.cap, numerator, denominator } }
    end,
    calculate = function(self, card, context)
		if context.before and not context.blueprint and not context.retrigger_joker then
				card.ability.targets = {}
				local cap_count = 0
				for i = 1, #context.scoring_hand do -- I'm not sure about this one, did you mean context.scoring_hand?
					if cap_count >= card.ability.extra.cap then break end
					if SMODS.pseudorandom_probability(card, 'felijo_ltr_dbl', 1, card.ability.extra.odds) then
						cap_count = cap_count + 1
						card.ability.targets[#card.ability.targets+1] = context.scoring_hand[i] -- here too
					end
				end
			end
		if context.repetition and context.cardarea == G.play then
			if type(card.ability.targets) == "table" then
				for i = 1, #card.ability.targets do
					if context.other_card == card.ability.targets[i] then
						return {
							repetitions = card.ability.extra.repetitions
						}
					end
				end
			end
		end
	end
}

FELIJO.LetterJoker {
    key = "felijo_ltr_tpl",
    atlas = 'aikoJokers',
    pos = { x = 3, y = 0 },
	pools = {["FelisJokeria"] = true, ["Letter"] = true, ["Scrabble"] = true  },
    unlocked = true,
    blueprint_compat = false,
    rarity = 2,
    cost = 8,
	config = { extra = { cap = 4, odds = 10, repetitions = 2 } },
    loc_vars = function(self, info_queue, card)
		local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'felijo_ltr_tpl')
        return { vars = { card.ability.extra.repetitions, card.ability.extra.cap, numerator, denominator } }
    end,
    calculate = function(self, card, context)
		if context.before and not context.blueprint and not context.retrigger_joker then
				card.ability.targets = {}
				local cap_count = 0
				for i = 1, #context.scoring_hand do -- I'm not sure about this one, did you mean context.scoring_hand?
					if cap_count >= card.ability.extra.cap then break end
					if SMODS.pseudorandom_probability(card, 'felijo_ltr_tpl', 1, card.ability.extra.odds) then
						cap_count = cap_count + 1
						card.ability.targets[#card.ability.targets+1] = context.scoring_hand[i] -- here too
					end
				end
			end
		if context.repetition and context.cardarea == G.play then
			if type(card.ability.targets) == "table" then
				for i = 1, #card.ability.targets do
					if context.other_card == card.ability.targets[i] then
						return {
							repetitions = card.ability.extra.repetitions
						}
					end
				end
			end
		end
	end
}

FELIJO.LetterJoker {
    key = "felijo_ltr_qdl",
    atlas = 'aikoJokers',
    pos = { x = 4, y = 0 },
	pools = {["FelisJokeria"] = true, ["Letter"] = true, ["Scrabble"] = true  },
    unlocked = true,
    blueprint_compat = false,
    rarity = 3,
    cost = 10,
	config = { extra = { cap = 3, odds = 12, repetitions = 3 } },
    loc_vars = function(self, info_queue, card)
		local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'felijo_ltr_qdl')
        return { vars = { card.ability.extra.repetitions, card.ability.extra.cap, numerator, denominator } }
    end,
    calculate = function(self, card, context)
		if context.before and not context.blueprint and not context.retrigger_joker then
				card.ability.targets = {}
				local cap_count = 0
				for i = 1, #context.scoring_hand do -- I'm not sure about this one, did you mean context.scoring_hand?
					if cap_count >= card.ability.extra.cap then break end
					if SMODS.pseudorandom_probability(card, 'felijo_ltr_qdl', 1, card.ability.extra.odds) then
						cap_count = cap_count + 1
						card.ability.targets[#card.ability.targets+1] = context.scoring_hand[i] -- here too
					end
				end
			end
		if context.repetition and context.cardarea == G.play then
			if type(card.ability.targets) == "table" then
				for i = 1, #card.ability.targets do
					if context.other_card == card.ability.targets[i] then
						return {
							repetitions = card.ability.extra.repetitions
						}
					end
				end
			end
		end
	end
}

--- FELI LEGENDARY

--- OTHERS

FELIJO.LetterJoker {
    key = "felijo_ltr_cleanslate",
    atlas = 'aikoJokers',
    pos = { x = 8, y = 0 },
    unlocked = true,
	pools = {["FelisJokeria"] = true, ["Letter"] = true, ["Scrabble"] = true  },
    blueprint_compat = true,
    rarity = 1,
    cost = 6,
	config = { extra = { chips = 50, dollars = 5} },
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.chips, card.ability.extra.dollars} }
    end,
    calculate = function(self, card, context)
		if context.joker_main then
			if  G.hand.config.card_limit - #context.scoring_hand == 0 then
				return{
					chips = card.ability.extra.chips,
					dollars = card.ability.extra.dollars
					}	
			end
		end	
	end
}
