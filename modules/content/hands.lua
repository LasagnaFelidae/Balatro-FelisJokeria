SMODS.PokerHand {
    key = "tier2_highcard",
    chips = 5,
    mult = 2,
    l_chips = 10,
    l_mult = 2,
    visible = false,
    example = {
        { 'D_K',    true, enhancement = "m_felijo_mult_t2" },
        { 'S_Q',    false, },
        { 'S_7',    false, },
        { 'D_8',    false,},
        { 'H_3',    false, },
    },

    evaluate = function(parts, hand)
        if not next(parts._highest) then return {} end
        local eligible_cards = {}

        for i, card in ipairs(hand) do
            if #eligible_cards <= #hand and FELIJO.get_card_tier(card) == 2 then
                eligible_cards[#eligible_cards + 1] = card
            end
        end
        
        if #eligible_cards == 0 then
            return {}
        end

        local high_card = eligible_cards[1]

        for i = 2, #eligible_cards do
            if eligible_cards[i]:get_id() > high_card:get_id() then
                high_card = eligible_cards[i]
            end
        end

        return {{high_card}}
    end,
}


SMODS.PokerHand {
    key = "tier2_pair",
    chips = 10,
    mult = 3,
    l_chips = 20,
    l_mult = 2,
    visible = false,
    example = {
        { 'D_7',    true, enhancement = "m_felijo_mult_t2" },
        { 'S_K',    false },
        { 'S_7',    true, enhancement = "m_felijo_bonus_t2" },
        { 'D_8',    false,},
        { 'H_3',    false },
    },

    evaluate = function(parts, hand)
        if not next(parts._2) then return {} end
        local cards = parts._2[1]
        for i, card in ipairs(cards) do
            if not (FELIJO.get_card_tier(card) == 2) then return {} end
        end
        return { cards }
    end,
}


SMODS.PokerHand {
    key = "tier2_two_pair",
    chips = 20,
    mult = 3,
    l_chips = 25,
    l_mult = 2,
    visible = false,
    example = {
        { 'D_7',    true, enhancement = "m_felijo_mult_t2" },
        { 'S_8',    true, enhancement = "m_felijo_steel_t2" },
        { 'S_7',    true, enhancement = "m_felijo_bonus_t2" },
        { 'D_8',    false, enhancement = "m_felijo_lucky_t2" },
        { 'H_3',    false },
    },

    evaluate = function(parts, hand)
        if not next(parts._2) then return {} end
        if #parts._2 < 2 then return {} end
        local eligible_cards = {}

        for i, card in ipairs(hand) do
            if #eligible_cards <= 4 and FELIJO.get_card_tier(card) == 2 then
                eligible_cards[#eligible_cards + 1] = card
            end
        end
        
        if #eligible_cards == 4 then return{eligible_cards} else return {} end
    end,
}
SMODS.PokerHand {
    key = "tier2_3oak",
    chips = 35,
    mult = 3,
    l_chips = 25,
    l_mult = 3,
    visible = false,
    example = {
        { 'D_7',    true, enhancement = "m_felijo_mult_t2" },
        { 'S_K',    false },
        { 'S_7',    true, enhancement = "m_felijo_bonus_t2" },
        { 'D_7',    true, enhancement = "m_felijo_lucky_t2" },
        { 'H_3',    false },
    },

    evaluate = function(parts, hand)
        if not next(parts._3) then return {} end
        local cards = parts._3[1]
        for i, card in ipairs(cards) do
            if not (FELIJO.get_card_tier(card) == 2) then return {} end
        end
        return { cards }
    end,
}

SMODS.PokerHand {
    key = "tier2_straight",
    chips = 35,
    mult = 4,
    l_chips = 35,
    l_mult = 4,
    visible = false,
    example = {
        { 'D_7',    true, enhancement = "m_felijo_mult_t2" },
        { 'S_6',    true, enhancement = "m_felijo_steel_t2" },
        { 'S_5',    true, enhancement = "m_felijo_bonus_t2" },
        { 'D_4',    true, enhancement = "m_felijo_lucky_t2" },
        { 'H_3',    true, enhancement = "m_felijo_mult_t2" },
    },
    evaluate = function(parts, hand)
        if not next(parts._straight) then return {} end
        local eligible_cards = {}

        for i, card in ipairs(hand) do
            if FELIJO.get_card_tier(card) == 2 then
                eligible_cards[#eligible_cards + 1] = card
            end
        end
        
        if #eligible_cards > 0 then return{eligible_cards} else return {} end
    end,
}

SMODS.PokerHand {
    key = "tier2_flush",
    chips = 35,
    mult = 5,
    l_chips = 20,
    l_mult = 3,
    visible = false,
    example = {
        { 'S_7',    true, enhancement = "m_felijo_mult_t2" },
        { 'S_7',    true, enhancement = "m_felijo_steel_t2" },
        { 'S_7',    true, enhancement = "m_felijo_bonus_t2" },
        { 'S_4',    true, enhancement = "m_felijo_lucky_t2" },
        { 'S_3',    true, enhancement = "m_felijo_mult_t2" },
    },
    evaluate = function(parts, hand)
        if not next(parts._flush) then return {} end
        local eligible_cards = {}

        for i, card in ipairs(hand) do
            if FELIJO.get_card_tier(card) == 2 then
                eligible_cards[#eligible_cards + 1] = card
            end
        end
        
        if #eligible_cards > 0 then return{eligible_cards} else return {} end
    end,
}

SMODS.PokerHand {
    key = "tier2_house",
    chips = 40,
    mult = 5,
    l_chips = 30,
    l_mult = 3,
    visible = false,
    example = {
        { 'D_7',    true, enhancement = "m_felijo_mult_t2" },
        { 'S_7',    true, enhancement = "m_felijo_steel_t2" },
        { 'S_7',    true, enhancement = "m_felijo_bonus_t2" },
        { 'D_3',    true, enhancement = "m_felijo_lucky_t2" },
        { 'H_3',    true, enhancement = "m_felijo_mult_t2" },
    },
    evaluate = function(parts, hand)
        if #parts._3 < 1 or #parts._2 < 2 then return {} end
        local eligible_cards = {}

        for i, card in ipairs(hand) do
            if FELIJO.get_card_tier(card) == 2 then
                eligible_cards[#eligible_cards + 1] = card
            end
        end
        
        if #eligible_cards >= 5 then return{eligible_cards} else return {} end
    end,
}

SMODS.PokerHand {
    key = "tier2_4oak",
    chips = 60,
    mult = 8,
    l_chips = 40,
    l_mult = 4,
    visible = false,
    example = {
        { 'D_7',    true, enhancement = "m_felijo_mult_t2" },
        { 'S_7',    true, enhancement = "m_felijo_mult_t2" },
        { 'S_7',    true, enhancement = "m_felijo_bonus_t2" },
        { 'D_7',    true, enhancement = "m_felijo_lucky_t2" },
        { 'H_3',    false },
    },

    evaluate = function(parts, hand)
        if not next(parts._4) then return {} end
        local cards = parts._4[1]
        for i, card in ipairs(cards) do
            if not (FELIJO.get_card_tier(card) == 2) then return {} end
        end
        return { cards }
    end,
}

SMODS.PokerHand {
    key = "tier2_straight_flush",
    mult = 9,
    chips = 100,
    l_mult = 5,
    l_chips = 50,
    visible = false,
    example = {
        { 'D_7',    true, enhancement = "m_felijo_mult_t2" },
        { 'D_6',    true, enhancement = "m_felijo_steel_t2" },
        { 'D_5',    true, enhancement = "m_felijo_bonus_t2" },
        { 'D_4',    true, enhancement = "m_felijo_lucky_t2" },
        { 'D_3',    true, enhancement = "m_felijo_mult_t2" },
    },

    evaluate = function(parts, hand)
        if not next(parts._straight) or not next(parts._flush) then return {} end

        local eligible_cards = {}

        for i, card in ipairs(hand) do
            if FELIJO.get_card_tier(card) == 2 then
                eligible_cards[#eligible_cards + 1] = card
            end
        end
        
        if #eligible_cards > 0 then return{eligible_cards} else return {} end
    end,
    modify_display_text = function(self, cards, scoring_hand)
        local royal = true
        for j = 1, #scoring_hand do
            local rank = SMODS.Ranks[scoring_hand[j].base.value]
            royal = royal and (rank.key == 'Ace' or rank.key == '10' or rank.face)
        end
        if royal then
            return 'felijo_tier2_royal'
        end
    end
}

SMODS.PokerHand {
    key = "tier2_5oak",
    chips = 120,
    mult = 13,
    l_chips = 40,
    l_mult = 4,
    visible = false,
    example = {
        { 'D_7',    true, enhancement = "m_felijo_mult_t2" },
        { 'S_7',    true, enhancement = "m_felijo_mult_t2" },
        { 'S_7',    true, enhancement = "m_felijo_bonus_t2" },
        { 'D_7',    true, enhancement = "m_felijo_lucky_t2" },
        { 'H_7',    true, enhancement = "m_felijo_mult_t2" },
    },

    evaluate = function(parts, hand)
        if not next(parts._5) then return {} end
        local cards = parts._5[1]
        for i, card in ipairs(cards) do
            if not (FELIJO.get_card_tier(card) == 2) then return {} end
        end
        return { cards }
    end,
}
SMODS.PokerHand {
    key = "tier2_flushhouse",
    chips = 140,
    mult = 15,
    l_chips = 40,
    l_mult = 5,
    visible = false,
    example = {
        { 'C_7',    true, enhancement = "m_felijo_mult_t2" },
        { 'C_7',    true, enhancement = "m_felijo_steel_t2" },
        { 'C_7',    true, enhancement = "m_felijo_bonus_t2" },
        { 'C_3',    true, enhancement = "m_felijo_lucky_t2" },
        { 'C_3',    true, enhancement = "m_felijo_mult_t2" },
    },

    evaluate = function(parts, hand)
        if #parts._3 < 1 or #parts._2 < 2 or not next(parts._flush) then return {} end
        local eligible_cards = {}

        for i, card in ipairs(hand) do
            if FELIJO.get_card_tier(card) == 2 then
                eligible_cards[#eligible_cards + 1] = card
            end
        end
        
        if #eligible_cards >= 5 then return{eligible_cards} else return {} end
    end,
}
SMODS.PokerHand {
    key = "tier2_flushfive",
    chips = 160,
    mult = 17,
    l_chips = 50,
    l_mult = 5,
    visible = false,
    example = {
        { 'C_7',    true, enhancement = "m_felijo_mult_t2" },
        { 'C_7',    true, enhancement = "m_felijo_steel_t2" },
        { 'C_7',    true, enhancement = "m_felijo_bonus_t2" },
        { 'C_7',    true, enhancement = "m_felijo_lucky_t2" },
        { 'C_7',    true, enhancement = "m_felijo_mult_t2" },
    },

    evaluate = function(parts, hand)
        if not next(parts._5) or not next(parts._flush) then return {} end
        local eligible_cards = {}

        for i, card in ipairs(hand) do
            if FELIJO.get_card_tier(card) == 2 then
                eligible_cards[#eligible_cards + 1] = card
            end
        end
        
        if #eligible_cards >= 5 then return{eligible_cards} else return {} end
    end,
}



-- TIER 3
SMODS.PokerHand {
    key = "tier3_highcard",
    chips = 5,
    mult = 3,
    l_chips = 10,
    l_mult = 3,
    visible = false,
    example = {
        { 'D_K',    true, enhancement = "m_felijo_mult_t3" },
        { 'S_Q',    false, },
        { 'S_7',    false, },
        { 'D_8',    false,},
        { 'H_3',    false, },
    },

    evaluate = function(parts, hand)
        if not next(parts._highest) then return {} end
        local eligible_cards = {}

        for i, card in ipairs(hand) do
            if #eligible_cards <= #hand and FELIJO.get_card_tier(card) == 3 then
                eligible_cards[#eligible_cards + 1] = card
            end
        end
        
        if #eligible_cards == 0 then
            return {}
        end

        local high_card = eligible_cards[1]

        for i = 2, #eligible_cards do
            if eligible_cards[i]:get_id() > high_card:get_id() then
                high_card = eligible_cards[i]
            end
        end

        return {{high_card}}
    end,
}

SMODS.PokerHand {
    key = "tier3_pair",
    chips = 10,
    mult = 4,
    l_chips = 30,
    l_mult = 3,
    visible = false,
    example = {
        { 'D_7',    true, enhancement = "m_felijo_mult_t3" },
        { 'S_K',    false },
        { 'S_7',    true, enhancement = "m_felijo_bonus_t3" },
        { 'D_8',    false,},
        { 'H_3',    false },
    },

    evaluate = function(parts, hand)
        if not next(parts._2) then return {} end
        local cards = parts._2[1]
        for i, card in ipairs(cards) do
            if not (FELIJO.get_card_tier(card) == 3) then return {} end
        end
        return { cards }
    end,
}

SMODS.PokerHand {
    key = "tier3_two_pair",
    chips = 20,
    mult = 4,
    l_chips = 35,
    l_mult = 3,
    visible = false,
    example = {
        { 'D_7',    true, enhancement = "m_felijo_mult_t3" },
        { 'S_8',    true, enhancement = "m_felijo_steel_t3" },
        { 'S_7',    true, enhancement = "m_felijo_bonus_t3" },
        { 'D_8',    true, enhancement = "m_felijo_lucky_t3" },
        { 'H_3',    false },
    },

    evaluate = function(parts, hand)
        if not next(parts._2) then return {} end
        if #parts._2 < 2 then return {} end
        local eligible_cards = {}

        for i, card in ipairs(hand) do
            if #eligible_cards <= 4 and FELIJO.get_card_tier(card) == 3 then
                eligible_cards[#eligible_cards + 1] = card
            end
        end
        
        if #eligible_cards == 4 then return{eligible_cards} else return {} end
    end,
}
SMODS.PokerHand {
    key = "tier3_3oak",
    chips = 35,
    mult = 4,
    l_chips = 35,
    l_mult = 4,
    visible = false,
    example = {
        { 'D_7',    true, enhancement = "m_felijo_mult_t3" },
        { 'S_K',    false },
        { 'S_7',    true, enhancement = "m_felijo_bonus_t3" },
        { 'D_7',    true, enhancement = "m_felijo_lucky_t3" },
        { 'H_3',    false },
    },

    evaluate = function(parts, hand)
        if not next(parts._3) then return {} end
        local cards = parts._3[1]
        for i, card in ipairs(cards) do
            if not (FELIJO.get_card_tier(card) == 3) then return {} end
        end
        return { cards }
    end,
}

SMODS.PokerHand {
    key = "tier3_straight",
    chips = 40,
    mult = 4,
    l_chips = 40,
    l_mult = 4,
    visible = false,
    example = {
        { 'D_7',    true, enhancement = "m_felijo_mult_t3" },
        { 'S_6',    true, enhancement = "m_felijo_steel_t3" },
        { 'S_5',    true, enhancement = "m_felijo_bonus_t3" },
        { 'D_4',    true, enhancement = "m_felijo_lucky_t3" },
        { 'H_3',    true, enhancement = "m_felijo_mult_t3" },
    },
    evaluate = function(parts, hand)
        if not next(parts._straight) then return {} end
        local eligible_cards = {}

        for i, card in ipairs(hand) do
            if FELIJO.get_card_tier(card) == 2 then
                eligible_cards[#eligible_cards + 1] = card
            end
        end
        
        if #eligible_cards > 0 then return{eligible_cards} else return {} end
    end,
}

SMODS.PokerHand {
    key = "tier3_flush",
    chips = 35,
    mult = 6,
    l_chips = 30,
    l_mult = 3,
    visible = false,
    example = {
        { 'S_7',    true, enhancement = "m_felijo_mult_t3" },
        { 'S_6',    true, enhancement = "m_felijo_steel_t3" },
        { 'S_5',    true, enhancement = "m_felijo_bonus_t3" },
        { 'S_4',    true, enhancement = "m_felijo_lucky_t3" },
        { 'S_3',    true, enhancement = "m_felijo_mult_t3" },
    },
    evaluate = function(parts, hand)
        if not next(parts._flush) then return {} end
        local eligible_cards = {}

        for i, card in ipairs(hand) do
            if FELIJO.get_card_tier(card) == 3 then
                eligible_cards[#eligible_cards + 1] = card
            end
        end
        
        if #eligible_cards > 0 then return{eligible_cards} else return {} end
    end,
}

SMODS.PokerHand {
    key = "tier3_house",
    chips = 40,
    mult = 6,
    l_chips = 40,
    l_mult = 4,
    visible = false,
    example = {
        { 'D_5',    true, enhancement = "m_felijo_mult_t3" },
        { 'S_5',    true, enhancement = "m_felijo_steel_t3" },
        { 'S_5',    true, enhancement = "m_felijo_bonus_t3" },
        { 'D_3',    true, enhancement = "m_felijo_lucky_t3" },
        { 'H_3',    true, enhancement = "m_felijo_mult_t3" },
    },
    evaluate = function(parts, hand)
        if #parts._3 < 1 or #parts._2 < 2 then return {} end
        local eligible_cards = {}

        for i, card in ipairs(hand) do
            if FELIJO.get_card_tier(card) == 3 then
                eligible_cards[#eligible_cards + 1] = card
            end
        end
        
        if #eligible_cards >= 5 then return{eligible_cards} else return {} end
    end,
}

SMODS.PokerHand {
    key = "tier3_4oak",
    chips = 60,
    mult = 8,
    l_chips = 50,
    l_mult = 5,
    visible = false,
    example = {
        { 'D_7',    true, enhancement = "m_felijo_mult_t3" },
        { 'D_7',    true, enhancement = "m_felijo_steel_t3" },
        { 'S_7',    true, enhancement = "m_felijo_bonus_t3" },
        { 'D_7',    true, enhancement = "m_felijo_lucky_t3" },
        { 'H_3',    false },
    },

    evaluate = function(parts, hand)
        if not next(parts._4) then return {} end
        local cards = parts._4[1]
        for i, card in ipairs(cards) do
            if not (FELIJO.get_card_tier(card) == 3) then return {} end
        end
        return { cards }
    end,
}

SMODS.PokerHand {
    key = "tier3_straight_flush",
    mult = 10,
    chips = 100,
    l_mult = 6,
    l_chips = 60,
    visible = false,
    example = {
        { 'D_7',    true, enhancement = "m_felijo_mult_t3" },
        { 'D_6',    true, enhancement = "m_felijo_steel_t3" },
        { 'D_5',    true, enhancement = "m_felijo_bonus_t3" },
        { 'D_4',    true, enhancement = "m_felijo_lucky_t3" },
        { 'D_3',    true, enhancement = "m_felijo_mult_t3" },
    },

    evaluate = function(parts, hand)
        if not next(parts._straight) or not next(parts._flush) then return {} end

        local eligible_cards = {}

        for i, card in ipairs(hand) do
            if FELIJO.get_card_tier(card) == 3 then
                eligible_cards[#eligible_cards + 1] = card
            end
        end
        
        if #eligible_cards > 0 then return{eligible_cards} else return {} end
    end,
    modify_display_text = function(self, cards, scoring_hand)
        local royal = true
        for j = 1, #scoring_hand do
            local rank = SMODS.Ranks[scoring_hand[j].base.value]
            royal = royal and (rank.key == 'Ace' or rank.key == '10' or rank.face)
        end
        if royal then
            return 'felijo_tier3_royal'
        end
    end
}

SMODS.PokerHand {
    key = "tier3_5oak",
    chips = 120,
    mult = 13,
    l_chips = 50,
    l_mult = 5,
    visible = false,
    example = {
        { 'D_7',    true, enhancement = "m_felijo_mult_t3" },
        { 'S_7',    true, enhancement = "m_felijo_steel_t3" },
        { 'S_7',    true, enhancement = "m_felijo_bonus_t3" },
        { 'D_7',    true, enhancement = "m_felijo_lucky_t3" },
        { 'H_7',    true, enhancement = "m_felijo_gold_t3" },
    },

    evaluate = function(parts, hand)
        if not next(parts._5) then return {} end
        local cards = parts._5[1]
        for i, card in ipairs(cards) do
            if not (FELIJO.get_card_tier(card) == 3) then return {} end
        end
        return { cards }
    end,
}
SMODS.PokerHand {
    key = "tier3_flushhouse",
    chips = 140,
    mult = 16,
    l_chips = 40,
    l_mult = 6,
    visible = false,
    example = {
        { 'C_7',    true, enhancement = "m_felijo_mult_t3" },
        { 'C_7',    true, enhancement = "m_felijo_steel_t3" },
        { 'C_7',    true, enhancement = "m_felijo_bonus_t3" },
        { 'C_3',    true, enhancement = "m_felijo_lucky_t3" },
        { 'C_3',    true, enhancement = "m_felijo_mult_t3" },
    },

    evaluate = function(parts, hand)
        if #parts._3 < 1 or #parts._2 < 2 or not next(parts._flush) then return {} end
        local eligible_cards = {}

        for i, card in ipairs(hand) do
            if FELIJO.get_card_tier(card) == 3 then
                eligible_cards[#eligible_cards + 1] = card
            end
        end
        
        if #eligible_cards >= 5 then return{eligible_cards} else return {} end
    end,
}
SMODS.PokerHand {
    key = "tier3_flushfive",
    chips = 160,
    mult = 18,
    l_chips = 60,
    l_mult = 6,
    visible = false,
    example = {
        { 'C_7',    true, enhancement = "m_felijo_mult_t3" },
        { 'C_7',    true, enhancement = "m_felijo_steel_t3" },
        { 'C_7',    true, enhancement = "m_felijo_bonus_t3" },
        { 'C_7',    true, enhancement = "m_felijo_lucky_t3" },
        { 'C_7',    true, enhancement = "m_felijo_mult_t3" },
    },

    evaluate = function(parts, hand)
        if not next(parts._5) or not next(parts._flush) then return {} end
        local eligible_cards = {}

        for i, card in ipairs(hand) do
            if FELIJO.get_card_tier(card) == 3 then
                eligible_cards[#eligible_cards + 1] = card
            end
        end
        
        if #eligible_cards >= 5 then return{eligible_cards} else return {} end
    end,
}
SMODS.PokerHand {
    key = "tier4_highcard",
    chips = 5,
    mult = 4,
    l_chips = 10,
    l_mult = 4,
    visible = false,
    example = {
        { 'D_K',    true, enhancement = "m_felijo_mult_t4" },
        { 'S_Q',    false, },
        { 'S_7',    false, },
        { 'D_8',    false,},
        { 'H_3',    false, },
    },

    evaluate = function(parts, hand)
        if not next(parts._highest) then return {} end
        local eligible_cards = {}

        for i, card in ipairs(hand) do
            if #eligible_cards <= #hand and FELIJO.get_card_tier(card) == 4 then
                eligible_cards[#eligible_cards + 1] = card
            end
        end
        
        if #eligible_cards == 0 then
            return {}
        end

        local high_card = eligible_cards[1]

        for i = 2, #eligible_cards do
            if eligible_cards[i]:get_id() > high_card:get_id() then
                high_card = eligible_cards[i]
            end
        end

        return {{high_card}}
    end,
}

SMODS.PokerHand {
    key = "tier4_pair",
    chips = 10,
    mult = 5,
    l_chips = 50,
    l_mult = 4,
    visible = false,
    example = {
        { 'D_7',    true, enhancement = "m_felijo_mult_t4" },
        { 'S_K',    false },
        { 'S_7',    true, enhancement = "m_felijo_bonus_t4" },
        { 'D_8',    false,},
        { 'H_3',    false },
    },

    evaluate = function(parts, hand)
        if not next(parts._2) then return {} end
        local cards = parts._2[1]
        for i, card in ipairs(cards) do
            if not (FELIJO.get_card_tier(card) == 4) then return {} end
        end
        return { cards }
    end,
}

SMODS.PokerHand {
    key = "tier4_two_pair",
    chips = 20,
    mult = 5,
    l_chips = 50,
    l_mult = 5,
    visible = false,
    example = {
        { 'D_7',    true, enhancement = "m_felijo_mult_t4" },
        { 'S_8',    true, enhancement = "m_felijo_steel_t4" },
        { 'S_7',    true, enhancement = "m_felijo_bonus_t4" },
        { 'D_8',    true, enhancement = "m_felijo_lucky_t4" },
        { 'H_3',    false },
    },

    evaluate = function(parts, hand)
        if not next(parts._2) then return {} end
        if #parts._2 < 2 then return {} end
        local eligible_cards = {}

        for i, card in ipairs(hand) do
            if #eligible_cards <= 4 and FELIJO.get_card_tier(card) == 4 then
                eligible_cards[#eligible_cards + 1] = card
            end
        end
        
        if #eligible_cards == 4 then return{eligible_cards} else return {} end
    end,
}
SMODS.PokerHand {
    key = "tier4_3oak",
    chips = 35,
    mult = 3,
    l_chips = 50,
    l_mult = 5,
    visible = false,
    example = {
        { 'D_7',    true, enhancement = "m_felijo_mult_t4" },
        { 'S_K',    false },
        { 'S_7',    true, enhancement = "m_felijo_bonus_t4" },
        { 'D_7',    true, enhancement = "m_felijo_lucky_t4" },
        { 'H_3',    false },
    },

    evaluate = function(parts, hand)
        if not next(parts._3) then return {} end
        local cards = parts._3[1]
        for i, card in ipairs(cards) do
            if not (FELIJO.get_card_tier(card) == 4) then return {} end
        end
        return { cards }
    end,
}

SMODS.PokerHand {
    key = "tier4_straight",
    chips = 45,
    mult = 4,
    l_chips = 45,
    l_mult = 4,
    visible = false,
    example = {
        { 'D_7',    true, enhancement = "m_felijo_mult_t4" },
        { 'S_6',    true, enhancement = "m_felijo_steel_t4" },
        { 'S_5',    true, enhancement = "m_felijo_bonus_t4" },
        { 'D_4',    true, enhancement = "m_felijo_lucky_t4" },
        { 'H_3',    true, enhancement = "m_felijo_mult_t4" },
    },
    evaluate = function(parts, hand)
        if not next(parts._straight) then return {} end
        local eligible_cards = {}

        for i, card in ipairs(hand) do
            if FELIJO.get_card_tier(card) == 4 then
                eligible_cards[#eligible_cards + 1] = card
            end
        end
        
        if #eligible_cards > 0 then return{eligible_cards} else return {} end
    end,
}

SMODS.PokerHand {
    key = "tier4_flush",
    chips = 35,
    mult = 7,
    l_chips = 35,
    l_mult = 6,
    visible = false,
    example = {
        { 'S_7',    true, enhancement = "m_felijo_mult_t4" },
        { 'S_6',    true, enhancement = "m_felijo_steel_t4" },
        { 'S_5',    true, enhancement = "m_felijo_bonus_t4" },
        { 'S_4',    true, enhancement = "m_felijo_lucky_t4" },
        { 'S_3',    true, enhancement = "m_felijo_mult_t4" },
    },
    evaluate = function(parts, hand)
        if not next(parts._flush) then return {} end
        local eligible_cards = {}

        for i, card in ipairs(hand) do
            if FELIJO.get_card_tier(card) == 4 then
                eligible_cards[#eligible_cards + 1] = card
            end
        end
        
        if #eligible_cards > 0 then return{eligible_cards} else return {} end
    end,
}

SMODS.PokerHand {
    key = "tier4_house",
    chips = 40,
    mult = 7,
    l_chips = 50,
    l_mult = 5,
    visible = false,
    example = {
        { 'D_7',    true, enhancement = "m_felijo_mult_t4" },
        { 'S_7',    true, enhancement = "m_felijo_steel_t4" },
        { 'S_7',    true, enhancement = "m_felijo_bonus_t4" },
        { 'D_3',    true, enhancement = "m_felijo_lucky_t4" },
        { 'H_3',    true, enhancement = "m_felijo_mult_t4" },
    },
    evaluate = function(parts, hand)
        if #parts._3 < 1 or #parts._2 < 2 then return {} end
        local eligible_cards = {}

        for i, card in ipairs(hand) do
            if FELIJO.get_card_tier(card) == 4 then
                eligible_cards[#eligible_cards + 1] = card
            end
        end
        
        if #eligible_cards >= 5 then return{eligible_cards} else return {} end
    end,
}

SMODS.PokerHand {
    key = "tier4_4oak",
    chips = 60,
    mult = 9,
    l_chips = 60,
    l_mult = 6,
    visible = false,
    example = {
        { 'D_7',    true, enhancement = "m_felijo_mult_t4" },
        { 'D_7',    true, enhancement = "m_felijo_mult_t4" },
        { 'S_7',    true, enhancement = "m_felijo_bonus_t4" },
        { 'D_7',    true, enhancement = "m_felijo_lucky_t4" },
        { 'H_3',    false },
    },

    evaluate = function(parts, hand)
        if not next(parts._4) then return {} end
        local cards = parts._4[1]
        for i, card in ipairs(cards) do
            if not (FELIJO.get_card_tier(card) == 4) then return {} end
        end
        return { cards }
    end,
}

SMODS.PokerHand {
    key = "tier4_straight_flush",
    mult = 11,
    chips = 100,
    l_mult = 7,
    l_chips = 70,
    visible = false,
    example = {
        { 'D_7',    true, enhancement = "m_felijo_mult_t4" },
        { 'D_6',    true, enhancement = "m_felijo_steel_t4" },
        { 'D_5',    true, enhancement = "m_felijo_bonus_t4" },
        { 'D_4',    true, enhancement = "m_felijo_lucky_t4" },
        { 'D_3',    true, enhancement = "m_felijo_mult_t4" },
    },

    evaluate = function(parts, hand)
        if not next(parts._straight) or not next(parts._flush) then return {} end

        local eligible_cards = {}

        for i, card in ipairs(hand) do
            if FELIJO.get_card_tier(card) == 4 then
                eligible_cards[#eligible_cards + 1] = card
            end
        end
        
        if #eligible_cards > 0 then return{eligible_cards} else return {} end
    end,
    modify_display_text = function(self, cards, scoring_hand)
        local royal = true
        for j = 1, #scoring_hand do
            local rank = SMODS.Ranks[scoring_hand[j].base.value]
            royal = royal and (rank.key == 'Ace' or rank.key == '10' or rank.face)
        end
        if royal then
            return 'felijo_tier4_royal'
        end
    end
}

SMODS.PokerHand {
    key = "tier4_5oak",
    chips = 120,
    mult = 14,
    l_chips = 40,
    l_mult = 4,
    visible = false,
    example = {
        { 'D_7',    true, enhancement = "m_felijo_mult_t4" },
        { 'D_7',    true, enhancement = "m_felijo_lucky_t4" },
        { 'S_7',    true, enhancement = "m_felijo_bonus_t4" },
        { 'D_7',    true, enhancement = "m_felijo_lucky_t4" },
        { 'D_7',    true, enhancement = "m_felijo_steel_t4" },
    },

    evaluate = function(parts, hand)
        if not next(parts._5) then return {} end
        local cards = parts._5[1]
        for i, card in ipairs(cards) do
            if not (FELIJO.get_card_tier(card) == 4) then return {} end
        end
        return { cards }
    end,
}
SMODS.PokerHand {
    key = "tier4_flushhouse",
    chips = 140,
    mult = 17,
    l_chips = 40,
    l_mult = 6,
    visible = false,
    example = {
        { 'C_7',    true, enhancement = "m_felijo_mult_t4" },
        { 'C_7',    true, enhancement = "m_felijo_steel_t4" },
        { 'C_7',    true, enhancement = "m_felijo_bonus_t4" },
        { 'C_3',    true, enhancement = "m_felijo_lucky_t4" },
        { 'C_3',    true, enhancement = "m_felijo_mult_t4" },
    },

    evaluate = function(parts, hand)
        if #parts._3 < 1 or #parts._2 < 2 or not next(parts._flush) then return {} end
        local eligible_cards = {}

        for i, card in ipairs(hand) do
            if FELIJO.get_card_tier(card) == 4 then
                eligible_cards[#eligible_cards + 1] = card
            end
        end
        
        if #eligible_cards >= 5 then return{eligible_cards} else return {} end
    end,
}
SMODS.PokerHand {
    key = "tier4_flushfive",
    chips = 160,
    mult = 19,
    l_chips = 70,
    l_mult = 7,
    visible = false,
    example = {
        { 'C_7',    true, enhancement = "m_felijo_mult_t4" },
        { 'C_7',    true, enhancement = "m_felijo_steel_t4" },
        { 'C_7',    true, enhancement = "m_felijo_bonus_t4" },
        { 'C_7',    true, enhancement = "m_felijo_lucky_t4" },
        { 'C_7',    true, enhancement = "m_felijo_mult_t4" },
    },

    evaluate = function(parts, hand)
        if not next(parts._5) or not next(parts._flush) then return {} end
        local eligible_cards = {}

        for i, card in ipairs(hand) do
            if FELIJO.get_card_tier(card) == 4 then
                eligible_cards[#eligible_cards + 1] = card
            end
        end
        
        if #eligible_cards >= 5 then return{eligible_cards} else return {} end
    end,
}