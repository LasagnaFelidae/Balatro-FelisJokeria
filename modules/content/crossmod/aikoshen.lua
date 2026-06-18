
local as_disabled = false
if FELIJO.is_mod_loaded("aikoyorisshenanigans") then
	as_disabled = false
else
	as_disabled = true
end

local old_check_word = AKYRS.check_word

AKYRS.check_word = function(str_arr_in)
    local AKYRS_WORDS_REF = AKYRS_WORDS

    local temp_french_check = nil

    if next(SMODS.find_card("j_felijo_akyrs_lexicographer")) then
        AKYRS_WORDS = LEXICOGRAPHER_DICT
    end

    local result = old_check_word(str_arr_in)
    
    if temp_french_check then
        AKYRS_WORDS = FRENCH_DICT
    end

    if result == nil then
        result = old_check_word(str_arr_in)
    end
    
    
    AKYRS_WORDS = old_dict

    if result == nil then
        result = old_check_word(str_arr_in)
    end
    return result
end

FELIJO.LetterJoker = SMODS.Joker:extend{
    akyrs_is_letter = true,
    in_pool = function (self, args)
        return G.GAME.akyrs_character_stickers_enabled and G.GAME.akyrs_wording_enabled or false
    end,
	no_collection = as_disabled,
	unlocked = true,
	discovered = false,
	set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_aikoshen'), HEX('753F8E'), HEX('A4CA5A'), 1 )
	end,
}




FELIJO.LetterJoker {
    key = "felijo_akyrs_lexicographer",
    atlas = 'pronounpalace',
    pos = { x = 0, y = 0 },
	pools = {["FelisJokeria"] = true, ["Letter"] = true, ["Scrabble"] = true, ["Human"] = true, ["Pronoun Palace"] = true,  },
	pronouns = "she_her",
    blueprint_compat = true,
    rarity = 1,
    cost = 4,
	config = { extra = {}, letter_opener = {used = false, max_wilds= 2} },
	can_use = function(self, card)
        return not card.ability.letter_opener.used and G.GAME.blind.in_blind
    end,
	set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_pronounpalace'), HEX('E8C99A'), G.C.UI.TEXT_DARK,  1 )
		badges[#badges+1] = create_badge(localize('k_felijo_aikoshen'), HEX('A4CA5A'), HEX('753F8E'),  1 )
	end,

	use = function(self, card, area, copier)
        AKYRS.simple_event_add(
            function ()
                AKYRS.fill_hand()
                for i = 1, card.ability.letter_opener.max_wilds do
                    AKYRS.simple_event_add(
                        function ()
                            local wldcrd = Card(11.5,15,G.CARD_W,G.CARD_H,pseudorandom_element(G.P_CARDS,pseudoseed("lexicographer")),G.P_CENTERS['c_base'],{playing_card = G.playing_card})
                            wldcrd.is_null = true
                            wldcrd.ability.akyrs_self_destructs = true
                            AKYRS.change_letter_to(wldcrd,"#")
                            G.hand:emplace(wldcrd)
                            return true
                        end, 0.1
                    )
                end
                card.ability.letter_opener.used = true
                return true
            end, 0
        )
    end,
    loc_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = { key = "akyrs_self_destructs", set = "Other",}
        info_queue[#info_queue+1] = { key = "felijo_akyrs_wildcard", set = "Other",}
		local is_used = card.ability.letter_opener.used == true and "Used" or "Active"
		local is_used_clr = card.ability.letter_opener.used == true and G.C.RED or G.C.GREEN
        return { vars = { card.ability.letter_opener.max_wilds, localize{type = 'name_text', key = "akyrs_self_destructs", set = 'Other'}, is_used, colours = {is_used_clr}}, } 
    end,
    calculate = function(self, card, context)
		if context.ante_change and context.ante_end then
			if card.ability.letter_opener.used == true then 
				card.ability.letter_opener.used = false 
				return {
					message = localize("k_reset")
				}
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
