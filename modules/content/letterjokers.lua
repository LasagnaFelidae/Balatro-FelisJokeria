---@type SMODS.Joker
AKYRS.LetterJoker = SMODS.Joker:extend{
    akyrs_is_letter = true,
    in_pool = function (self, args)
        return G.GAME.akyrs_character_stickers_enabled and G.GAME.akyrs_wording_enabled or false
    end
}


--- WORD MULTIPLIERS

AKYRS.LetterJoker {
    key = "tby_dbw",
    atlas = 'tbyJokers',
    pos = { x = 5, y = 0 },
    unlocked = true,
    blueprint_compat = true,
    rarity = 2,
    cost = 6,
	config = { extra = { xchips = 2, xmult = 2, odds = 4 } },
    loc_vars = function(self, info_queue, card)
		local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'tby_dbw')
        return { vars = { card.ability.extra.xchips, card.ability.extra.xmult, numerator, denominator} }
    end,
    calculate = function(self, card, context)
		if context.joker_main then
			if SMODS.pseudorandom_probability(card, 'tby_dbw', 1, card.ability.extra.odds) and #context.scoring_hand > 3 then
				return{
					xchips = card.ability.extra.xchips,
					xmult = card.ability.extra.xmult
				}	
			end	
		end
    end
}
AKYRS.LetterJoker {
    key = "tby_tpw",
    atlas = 'tbyJokers',
    pos = { x = 6, y = 0 },
	pools = {["Letter"] = true },
    unlocked = true,
    blueprint_compat = true,
    rarity = 3,
    cost = 12,
	config = { extra = { xchips = 3, xmult = 3, odds = 6 } },
    loc_vars = function(self, info_queue, card)
		local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'tby_tpw')
        return { vars = { card.ability.extra.xchips, card.ability.extra.xmult, numerator, denominator} }
    end,
    calculate = function(self, card, context)
		if context.joker_main then
			if SMODS.pseudorandom_probability(card, 'tby_tpw', 1, card.ability.extra.odds) and #context.scoring_hand > 5 then
				return{
					xchips = card.ability.extra.xchips,
					xmult = card.ability.extra.xmult
				}	
			end	
		end
    end
}
AKYRS.LetterJoker {
    key = "tby_qdw",
    atlas = 'tbyJokers',
    pos = { x = 7, y = 0 },
	pools = {["Letter"] = true },
    unlocked = true,
    blueprint_compat = true,
    rarity = 4,
    cost = 18,
	config = { extra = { xchips = 4, xmult = 4, odds = 8 } },
    loc_vars = function(self, info_queue, card)
		local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'tby_qdw')
        return { vars = { card.ability.extra.xchips, card.ability.extra.xmult, numerator, denominator} }
    end,
    calculate = function(self, card, context)
		if context.joker_main then
			if SMODS.pseudorandom_probability(card, 'tby_qdw', 1, card.ability.extra.odds) and #context.scoring_hand > 7 then
				return{
					xchips = card.ability.extra.xchips,
					xmult = card.ability.extra.xmult
				}	
			end	
		end
    end
}

--- LETTER MULTIPLIERS

AKYRS.LetterJoker {
    key = "tby_dbl",
    atlas = 'tbyJokers',
    pos = { x = 2, y = 0 },
	pools = {["Letter"] = true },
    unlocked = true,
    blueprint_compat = false,
    rarity = 1,
    cost = 4,
	config = { extra = { cap = 5, repetitions = 1, odds = 8} },
    loc_vars = function(self, info_queue, card)
		local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'tby_dbl')
        return { vars = { card.ability.extra.repetitions, card.ability.extra.cap, numerator, denominator } }
    end,
    calculate = function(self, card, context)
		if context.before and not context.blueprint and not context.retrigger_joker then
				card.ability.targets = {}
				local cap_count = 0
				for i = 1, #context.scoring_hand do -- I'm not sure about this one, did you mean context.scoring_hand?
					if cap_count >= card.ability.extra.cap then break end
					if SMODS.pseudorandom_probability(card, 'tby_dbl', 1, card.ability.extra.odds) then
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

AKYRS.LetterJoker {
    key = "tby_tpl",
    atlas = 'tbyJokers',
    pos = { x = 3, y = 0 },
	pools = {["Letter"] = true },
    unlocked = true,
    blueprint_compat = false,
    rarity = 2,
    cost = 8,
	config = { extra = { cap = 4, odds = 10, repetitions = 2 } },
    loc_vars = function(self, info_queue, card)
		local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'tby_tpl')
        return { vars = { card.ability.extra.repetitions, card.ability.extra.cap, numerator, denominator } }
    end,
    calculate = function(self, card, context)
		if context.before and not context.blueprint and not context.retrigger_joker then
				card.ability.targets = {}
				local cap_count = 0
				for i = 1, #context.scoring_hand do -- I'm not sure about this one, did you mean context.scoring_hand?
					if cap_count >= card.ability.extra.cap then break end
					if SMODS.pseudorandom_probability(card, 'tby_tpl', 1, card.ability.extra.odds) then
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

AKYRS.LetterJoker {
    key = "tby_qdl",
    atlas = 'tbyJokers',
    pos = { x = 4, y = 0 },
	pools = {["Letter"] = true },
    unlocked = true,
    blueprint_compat = false,
    rarity = 3,
    cost = 12,
	config = { extra = { cap = 3, odds = 12, repetitions = 3 } },
    loc_vars = function(self, info_queue, card)
		local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'tby_qdl')
        return { vars = { card.ability.extra.repetitions, card.ability.extra.cap, numerator, denominator } }
    end,
    calculate = function(self, card, context)
		if context.before and not context.blueprint and not context.retrigger_joker then
				card.ability.targets = {}
				local cap_count = 0
				for i = 1, #context.scoring_hand do -- I'm not sure about this one, did you mean context.scoring_hand?
					if cap_count >= card.ability.extra.cap then break end
					if SMODS.pseudorandom_probability(card, 'tby_qdl', 1, card.ability.extra.odds) then
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
AKYRS.LetterJoker {
    atlas = 'feliJoker',
    pos = { x = 0, y = 0 },
	soul_pos = {
        x = 1, y = 0, draw = function (card, scale_mod, rotate_mod)
            card.children.floating_sprite:draw_shader('dissolve',0, nil, nil, card.children.center,scale_mod, rotate_mod,0,0 - 0.1,nil, 0.2)
            card.children.floating_sprite:draw_shader('dissolve', nil, nil, nil, card.children.center, scale_mod, rotate_mod,0,0-0.2)
        end
    },
    pools = {["Letter"] = true },
    key = "feli_leg",
    rarity = 4,
    cost = 16,
	config = { extra = { chips = 5, dollars = 1, xmult = 0.1, odds1 = 6, odds2 = 8, odds3 = 10} },
    loc_vars = function(self, info_queue, card)
		local n1, d1 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds1, 'feli_1')

		return { vars = { card.ability.extra.chips, n1, d1} }
    end,
    calculate = function(self, card, context)
        if G.GAME.akyrs_character_stickers_enabled and G.GAME.akyrs_wording_enabled and G.GAME.aiko_current_word then
            local word = G.GAME.aiko_current_word    
            if not word then return {} end
            word = string.lower(word)
            
			if context.joker_main then     
				if FELIJO.garf_words[word] then	
					if SMODS.pseudorandom_probability(card, 'feli_1', 1, card.ability.extra.odds1) then
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
			end
		end
	end,
    blueprint_compat = true,
}
--- OTHERS

AKYRS.LetterJoker {
    key = "tby_cleanslate",
    atlas = 'tbyJokers',
    pos = { x = 8, y = 0 },
    unlocked = true,
	pools = {["Letter"] = true },
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
					dollars = card.ability.extra.dollars,
					}	
			end
		end	
	end
}
