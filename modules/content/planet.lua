FELIJO.T2Planet = SMODS.Consumable:extend{

    set = "felijo_tier2_planet",
    atlas = 'felijo_t2Planets',
    hidden = true,
    discovered = false,
	unlocked = true,
	soul_set = "Planet",
	soul_rate = 0.5,
    in_pool = function (self, args)
       for index, playing_card in ipairs(G.playing_cards) do
            if FELIJO.get_card_tier(playing_card) == 2 then
                return true
            end
        end
        return false
    end,

}
FELIJO.T3Planet = SMODS.Consumable:extend{
    set = "felijo_tier3_planet",
    atlas = 'felijo_t3Planets',
    hidden = true,
    discovered = false,
	unlocked = true,
	soul_set = "Planet",
	soul_rate = 0.05,
    in_pool = function (self, args)
        for index, playing_card in ipairs(G.playing_cards) do
            if FELIJO.get_card_tier(playing_card) == 3 then
                return true
            end
        end
        return false
    end,

}
FELIJO.T4Planet = SMODS.Consumable:extend{
    set = "felijo_tier4_planet",
    atlas = 'felijo_t4Planets',
    hidden = true,
    discovered = false,
	unlocked = true,
	soul_set = "Planet",
	soul_rate = 0.002,
    in_pool = function (self, args)
       for index, playing_card in ipairs(G.playing_cards) do
            if FELIJO.get_card_tier(playing_card) == 4 then
                return true
            end
        end
        return false
    end,
}

SMODS.ConsumableType {
    key = 'felijo_tier2_planet',
    default = 'c_felijo_tier2_mercury',
    primary_colour = G.C.SET.Planet,
    secondary_colour = HEX('5E362F'),
    collection_rows = { 6, 6 },
    shop_rate = 0.4,
    loc_txt = {
        undiscovered = {
			name = "Not Discovered",
			text = {
				"Purchase or use",
                "this card in an",
                "unseeded run to",
                "learn what it does"
			},
		},
    },
}

SMODS.ConsumableType {
    key = 'felijo_tier3_planet',
    default = 'c_felijo_tier3_mercury',
    primary_colour = G.C.SET.Planet,
    secondary_colour = HEX('394254'),
    collection_rows = { 6, 6 },
    shop_rate = 0.2,
    loc_txt = {
        undiscovered = {
			name = "Not Discovered",
			text = {
				"Purchase or use",
                "this card in an",
                "unseeded run to",
                "learn what it does"
			},
		},
    },
}

SMODS.ConsumableType {
    key = 'felijo_tier4_planet',
    default = 'c_felijo_tier4_mercury',
    primary_colour = G.C.SET.Planet,
    secondary_colour = HEX('5C5131'),
    collection_rows = { 6, 6 },
    shop_rate = 0.01,
    loc_txt = {
        undiscovered = {
			name = "Not Discovered",
			text = {
				"Purchase or use",
                "this card in an",
                "unseeded run to",
                "learn what it does"
			},
		},
    },
}

SMODS.UndiscoveredSprite{
    key = 'felijo_tier2_planet',
    atlas = 't2Planets',
    pos = {x=8, y=1}
}

SMODS.UndiscoveredSprite{
    key = 'felijo_tier3_planet',
    atlas = "t3Planets",
    pos = {x=8, y=1}
}

SMODS.UndiscoveredSprite{
    key = 'felijo_tier4_planet',
    atlas = "t4Planets",
    pos = {x=8, y=1}
}



FELIJO.T2Planet {
    key = "felijo_tier2_mercury",
    cost = 3,
    pos = { x = 1, y = 0 },
    config = {
		l_chips = 30,
		l_mult = 2,
		l_mult_f = 5,
        hand_type = {"felijo_tier2_pair", "Pair" },
	},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands["Pair"].level, G.GAME.hands["felijo_tier2_pair"].level,
                localize('k_felijo_pair_t2_below'),
                G.GAME.hands["Pair"].l_mult,
                G.GAME.hands["Pair"].l_chips,
                G.GAME.hands["felijo_tier2_pair"].l_mult,
                G.GAME.hands["felijo_tier2_pair"].l_chips,
                colours = { (G.GAME.hands["Pair"].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands["Pair"].level)])
                ,(G.GAME.hands["felijo_tier2_pair"].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands["felijo_tier2_pair"].level)]) }
            }
        }
    end,
    use = function(self, card, area, copier)
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
            { handname = localize('k_felijo_pair_t2_below'), chips = '...', mult = '...', level = '' })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = true
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { mult = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { chips = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = nil
                return true
            end
        }))
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '+1' })
        delay(1.3)
        SMODS.upgrade_poker_hands({hands = {"Pair"}, per_level = {chips = G.GAME.hands["Pair"].l_chips, mult = G.GAME.hands["Pair"].l_mult}, instant = true, from = card})
		SMODS.upgrade_poker_hands({hands = {"felijo_tier2_pair"}, per_level = {chips = G.GAME.hands["felijo_tier2_pair"].l_chips, mult = G.GAME.hands["felijo_tier2_pair"].l_mult}, instant = true, from = card})
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 },{ mult = 0, chips = 0, handname = '', level = '' })
    end,
    can_use = function(self, card)
        return true
    end,
}

FELIJO.T3Planet {
    key = "felijo_tier3_mercury",
    cost = 3,
    pos = { x = 1, y = 0 },
    config = {
		l_chips = 30,
		l_mult = 2,
		l_mult_f = 5,
        hand_type = {"felijo_tier3_pair", "Pair" },
	},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands["Pair"].level, G.GAME.hands["felijo_tier3_pair"].level,
                localize('k_felijo_pair_t3_below'),
                G.GAME.hands["Pair"].l_mult,
                G.GAME.hands["Pair"].l_chips,
                G.GAME.hands["felijo_tier3_pair"].l_mult,
                G.GAME.hands["felijo_tier3_pair"].l_chips,
                colours = { (G.GAME.hands["Pair"].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands["Pair"].level)])
                ,(G.GAME.hands["felijo_tier3_pair"].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands["felijo_tier3_pair"].level)]) }
            }
        }
    end,
    use = function(self, card, area, copier)
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
            { handname = localize('k_felijo_pair_t3_below'), chips = '...', mult = '...', level = '' })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = true
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { mult = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { chips = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = nil
                return true
            end
        }))
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '+1' })
        delay(1.3)
        SMODS.upgrade_poker_hands({hands = {"Pair"}, per_level = {chips = G.GAME.hands["Pair"].l_chips, mult = G.GAME.hands["Pair"].l_mult}, instant = true, from = card})
        SMODS.upgrade_poker_hands({hands = {"felijo_tier2_pair"}, per_level = {chips = G.GAME.hands["felijo_tier2_pair"].l_chips, mult = G.GAME.hands["felijo_tier2_pair"].l_mult}, instant = true, from = card})
		SMODS.upgrade_poker_hands({hands = {"felijo_tier3_pair"}, per_level = {chips = G.GAME.hands["felijo_tier3_pair"].l_chips, mult = G.GAME.hands["felijo_tier3_pair"].l_mult}, instant = true, from = card})
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 },{ mult = 0, chips = 0, handname = '', level = '' })
    end,
    can_use = function(self, card)
        return true
    end,
}

FELIJO.T4Planet {
    key = "felijo_tier4_mercury",
    cost = 3,
    pos = { x = 1, y = 0 },
    config = {
		l_chips = 30,
		l_mult = 2,
		l_mult_f = 5,
        hand_type = {"felijo_tier4_pair", "Pair" },
	},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands["Pair"].level, G.GAME.hands["felijo_tier4_pair"].level,
                localize('k_felijo_pair_t4_below'),
                G.GAME.hands["Pair"].l_mult,
                G.GAME.hands["Pair"].l_chips,
                G.GAME.hands["felijo_tier4_pair"].l_mult,
                G.GAME.hands["felijo_tier4_pair"].l_chips,
                colours = { (G.GAME.hands["Pair"].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands["Pair"].level)])
                ,(G.GAME.hands["felijo_tier4_pair"].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands["felijo_tier4_pair"].level)]) }
            }
        }
    end,
    use = function(self, card, area, copier)
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
            { handname = localize('k_felijo_pair_t4_below'), chips = '...', mult = '...', level = '' })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = true
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { mult = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { chips = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = nil
                return true
            end
        }))
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '+1' })
        delay(1.3)
        SMODS.upgrade_poker_hands({hands = {"Pair"}, per_level = {chips = G.GAME.hands["Pair"].l_chips, mult = G.GAME.hands["Pair"].l_mult}, instant = true, from = card})
		SMODS.upgrade_poker_hands({hands = {"felijo_tier2_pair"}, per_level = {chips = G.GAME.hands["felijo_tier2_pair"].l_chips, mult = G.GAME.hands["felijo_tier2_pair"].l_mult}, instant = true, from = card})
		SMODS.upgrade_poker_hands({hands = {"felijo_tier3_pair"}, per_level = {chips = G.GAME.hands["felijo_tier3_pair"].l_chips, mult = G.GAME.hands["felijo_tier3_pair"].l_mult}, instant = true, from = card})
        SMODS.upgrade_poker_hands({hands = {"felijo_tier4_pair"}, per_level = {chips = G.GAME.hands["felijo_tier4_pair"].l_chips, mult = G.GAME.hands["felijo_tier4_pair"].l_mult}, instant = true, from = card})
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 },{ mult = 0, chips = 0, handname = '', level = '' })
    end,
    can_use = function(self, card)
        return true
    end,
}
 
FELIJO.T2Planet {
    key = "felijo_tier2_venus",
    cost = 3,
    pos = { x = 3, y = 0 },
    config = {
		l_chips = 30,
		l_mult = 2,
		l_mult_f = 5,
        hand_type = {"felijo_tier2_3oak", "Three of a Kind" },
	},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands["Three of a Kind"].level, G.GAME.hands["felijo_tier2_3oak"].level,
                localize('k_felijo_3oak_t2_below'),
                G.GAME.hands["Three of a Kind"].l_mult,
                G.GAME.hands["Three of a Kind"].l_chips,
                G.GAME.hands["felijo_tier2_3oak"].l_mult,
                G.GAME.hands["felijo_tier2_3oak"].l_chips,
                colours = { (G.GAME.hands["Three of a Kind"].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands["Three of a Kind"].level)])
                ,(G.GAME.hands["felijo_tier2_3oak"].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands["felijo_tier2_3oak"].level)]) }
            }
        }
    end,
    use = function(self, card, area, copier)
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
            { handname = localize('k_felijo_3oak_t2_below'), chips = '...', mult = '...', level = '' })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = true
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { mult = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { chips = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = nil
                return true
            end
        }))
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '+1' })
        delay(1.3)
        SMODS.upgrade_poker_hands({hands = {"Three of a Kind"}, per_level = {chips = G.GAME.hands["Three of a Kind"].l_chips, mult = G.GAME.hands["Three of a Kind"].l_mult}, instant = true, from = card})
		SMODS.upgrade_poker_hands({hands = {"felijo_tier2_3oak"}, per_level = {chips = G.GAME.hands["felijo_tier2_3oak"].l_chips, mult = G.GAME.hands["felijo_tier2_3oak"].l_mult}, instant = true, from = card})
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 },{ mult = 0, chips = 0, handname = '', level = '' })
    end,
    can_use = function(self, card)
        return true
    end,
}

FELIJO.T3Planet {
    key = "felijo_tier3_venus",
    cost = 3,
    pos = { x = 3, y = 0 },
    config = {
		l_chips = 30,
		l_mult = 2,
		l_mult_f = 5,
        hand_type = {"felijo_tier3_3oak", "Three of a Kind" },
	},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands["Three of a Kind"].level, G.GAME.hands["felijo_tier3_3oak"].level,
                localize('k_felijo_3oak_t3_below'),
                G.GAME.hands["Three of a Kind"].l_mult,
                G.GAME.hands["Three of a Kind"].l_chips,
                G.GAME.hands["felijo_tier3_3oak"].l_mult,
                G.GAME.hands["felijo_tier3_3oak"].l_chips,
                colours = { (G.GAME.hands["Three of a Kind"].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands["Three of a Kind"].level)])
                ,(G.GAME.hands["felijo_tier3_3oak"].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands["felijo_tier3_3oak"].level)]) }
            }
        }
    end,
    use = function(self, card, area, copier)
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
            { handname = localize('k_felijo_3oak_t3_below'), chips = '...', mult = '...', level = '' })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = true
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { mult = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { chips = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = nil
                return true
            end
        }))
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '+1' })
        delay(1.3)
        SMODS.upgrade_poker_hands({hands = {"Three of a Kind"}, per_level = {chips = G.GAME.hands["Three of a Kind"].l_chips, mult = G.GAME.hands["Three of a Kind"].l_mult}, instant = true, from = card})
		SMODS.upgrade_poker_hands({hands = {"felijo_tier2_3oak"}, per_level = {chips = G.GAME.hands["felijo_tier2_3oak"].l_chips, mult = G.GAME.hands["felijo_tier2_3oak"].l_mult}, instant = true, from = card})
        SMODS.upgrade_poker_hands({hands = {"felijo_tier3_3oak"}, per_level = {chips = G.GAME.hands["felijo_tier3_3oak"].l_chips, mult = G.GAME.hands["felijo_tier3_3oak"].l_mult}, instant = true, from = card})
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 },{ mult = 0, chips = 0, handname = '', level = '' })
    end,
    can_use = function(self, card)
        return true
    end,
}

FELIJO.T4Planet {
    key = "felijo_tier4_venus",
    cost = 3,
    pos = { x = 3, y = 0 },
    config = {
		l_chips = 30,
		l_mult = 2,
		l_mult_f = 5,
        hand_type = {"felijo_tier4_3oak", "Three of a Kind" },
	},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands["Three of a Kind"].level, G.GAME.hands["felijo_tier4_3oak"].level,
                localize('k_felijo_3oak_t4_below'),
                G.GAME.hands["Three of a Kind"].l_mult,
                G.GAME.hands["Three of a Kind"].l_chips,
                G.GAME.hands["felijo_tier4_3oak"].l_mult,
                G.GAME.hands["felijo_tier4_3oak"].l_chips,
                colours = { (G.GAME.hands["Three of a Kind"].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands["Three of a Kind"].level)])
                ,(G.GAME.hands["felijo_tier4_3oak"].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands["felijo_tier4_3oak"].level)]) }
            }
        }
    end,
    use = function(self, card, area, copier)
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
            { handname = localize('k_felijo_3oak_t4_below'), chips = '...', mult = '...', level = '' })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = true
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { mult = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { chips = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = nil
                return true
            end
        }))
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '+1' })
        delay(1.3)
        SMODS.upgrade_poker_hands({hands = {"Three of a Kind"}, per_level = {chips = G.GAME.hands["Three of a Kind"].l_chips, mult = G.GAME.hands["Three of a Kind"].l_mult}, instant = true, from = card})
		SMODS.upgrade_poker_hands({hands = {"felijo_tier2_3oak"}, per_level = {chips = G.GAME.hands["felijo_tier2_3oak"].l_chips, mult = G.GAME.hands["felijo_tier2_3oak"].l_mult}, instant = true, from = card})
        SMODS.upgrade_poker_hands({hands = {"felijo_tier3_3oak"}, per_level = {chips = G.GAME.hands["felijo_tier3_3oak"].l_chips, mult = G.GAME.hands["felijo_tier3_3oak"].l_mult}, instant = true, from = card})
        SMODS.upgrade_poker_hands({hands = {"felijo_tier4_3oak"}, per_level = {chips = G.GAME.hands["felijo_tier4_3oak"].l_chips, mult = G.GAME.hands["felijo_tier4_3oak"].l_mult}, instant = true, from = card})
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 },{ mult = 0, chips = 0, handname = '', level = '' })
    end,
    can_use = function(self, card)
        return true
    end,
}

FELIJO.T2Planet {
    key = "felijo_tier2_earth",
    cost = 3,
    pos = { x = 6, y = 0 },
    config = {
		l_chips = 30,
		l_mult = 2,
		l_mult_f = 5,
        hand_type = {"felijo_tier2_house", "Full House" },
	},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands["Full House"].level, G.GAME.hands["felijo_tier2_house"].level,
                localize('k_felijo_house_t2_below'),
                G.GAME.hands["Full House"].l_mult,
                G.GAME.hands["Full House"].l_chips,
                G.GAME.hands["felijo_tier2_house"].l_mult,
                G.GAME.hands["felijo_tier2_house"].l_chips,
                colours = { (G.GAME.hands["Full House"].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands["Full House"].level)])
                ,(G.GAME.hands["felijo_tier2_house"].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands["felijo_tier2_house"].level)]) }
            }
        }
    end,
    use = function(self, card, area, copier)
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
            { handname = localize('k_felijo_house_t2_below'), chips = '...', mult = '...', level = '' })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = true
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { mult = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { chips = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = nil
                return true
            end
        }))
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '+1' })
        delay(1.3)
        SMODS.upgrade_poker_hands({hands = {"Full House"}, per_level = {chips = G.GAME.hands["Full House"].l_chips, mult = G.GAME.hands["Full House"].l_mult}, instant = true, from = card})
		SMODS.upgrade_poker_hands({hands = {"felijo_tier2_house"}, per_level = {chips = G.GAME.hands["felijo_tier2_house"].l_chips, mult = G.GAME.hands["felijo_tier2_house"].l_mult}, instant = true, from = card})
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 },{ mult = 0, chips = 0, handname = '', level = '' })
    end,
    can_use = function(self, card)
        return true
    end,
}

FELIJO.T3Planet {
    key = "felijo_tier3_earth",
    cost = 3,
    pos = { x = 6, y = 0 },
    config = {
		l_chips = 30,
		l_mult = 2,
		l_mult_f = 5,
        hand_type = {"felijo_tier3_house", "Full House" },
	},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands["Full House"].level, G.GAME.hands["felijo_tier3_house"].level,
                localize('k_felijo_house_t3_below'),
                G.GAME.hands["Full House"].l_mult,
                G.GAME.hands["Full House"].l_chips,
                G.GAME.hands["felijo_tier3_house"].l_mult,
                G.GAME.hands["felijo_tier3_house"].l_chips,
                colours = { (G.GAME.hands["Full House"].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands["Full House"].level)])
                ,(G.GAME.hands["felijo_tier3_house"].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands["felijo_tier3_house"].level)]) }
            }
        }
    end,
    use = function(self, card, area, copier)
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
            { handname = localize('k_felijo_house_t3_below'), chips = '...', mult = '...', level = '' })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = true
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { mult = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { chips = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = nil
                return true
            end
        }))
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '+1' })
        delay(1.3)
        SMODS.upgrade_poker_hands({hands = {"Full House"}, per_level = {chips = G.GAME.hands["Full House"].l_chips, mult = G.GAME.hands["Full House"].l_mult}, instant = true, from = card})
		SMODS.upgrade_poker_hands({hands = {"felijo_tier2_house"}, per_level = {chips = G.GAME.hands["felijo_tier2_house"].l_chips, mult = G.GAME.hands["felijo_tier2_house"].l_mult}, instant = true, from = card})
        SMODS.upgrade_poker_hands({hands = {"felijo_tier3_house"}, per_level = {chips = G.GAME.hands["felijo_tier3_house"].l_chips, mult = G.GAME.hands["felijo_tier3_house"].l_mult}, instant = true, from = card})
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 },{ mult = 0, chips = 0, handname = '', level = '' })
    end,
    can_use = function(self, card)
        return true
    end,
}

FELIJO.T4Planet {
    key = "felijo_tier4_earth",
    cost = 3,
    pos = { x = 6, y = 0 },
    config = {
		l_chips = 30,
		l_mult = 2,
		l_mult_f = 5,
        hand_type = {"felijo_tier4_house", "Full House" },
	},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands["Full House"].level, G.GAME.hands["felijo_tier4_house"].level,
                localize('k_felijo_house_t4_below'),
                G.GAME.hands["Full House"].l_mult,
                G.GAME.hands["Full House"].l_chips,
                G.GAME.hands["felijo_tier4_house"].l_mult,
                G.GAME.hands["felijo_tier4_house"].l_chips,
                colours = { (G.GAME.hands["Full House"].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands["Full House"].level)])
                ,(G.GAME.hands["felijo_tier4_house"].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands["felijo_tier4_house"].level)]) }
            }
        }
    end,
    use = function(self, card, area, copier)
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
            { handname = localize('k_felijo_house_t4_below'), chips = '...', mult = '...', level = '' })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = true
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { mult = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { chips = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = nil
                return true
            end
        }))
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '+1' })
        delay(1.3)
        SMODS.upgrade_poker_hands({hands = {"Full House"}, per_level = {chips = G.GAME.hands["Full House"].l_chips, mult = G.GAME.hands["Full House"].l_mult}, instant = true, from = card})
		SMODS.upgrade_poker_hands({hands = {"felijo_tier2_house"}, per_level = {chips = G.GAME.hands["felijo_tier2_house"].l_chips, mult = G.GAME.hands["felijo_tier2_house"].l_mult}, instant = true, from = card})
        SMODS.upgrade_poker_hands({hands = {"felijo_tier3_house"}, per_level = {chips = G.GAME.hands["felijo_tier3_house"].l_chips, mult = G.GAME.hands["felijo_tier3_house"].l_mult}, instant = true, from = card})
        SMODS.upgrade_poker_hands({hands = {"felijo_tier4_house"}, per_level = {chips = G.GAME.hands["felijo_tier4_house"].l_chips, mult = G.GAME.hands["felijo_tier4_house"].l_mult}, instant = true, from = card})
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 },{ mult = 0, chips = 0, handname = '', level = '' })
    end,
    can_use = function(self, card)
        return true
    end,
}

FELIJO.T2Planet {
    key = "felijo_tier2_mars",
    cost = 3,
    pos = { x = 7, y = 0 },
    config = {
		l_chips = 30,
		l_mult = 2,
		l_mult_f = 5,
        hand_type = {"felijo_tier2_4oak", "Four of a Kind" },
	},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands["Four of a Kind"].level, G.GAME.hands["felijo_tier2_4oak"].level,
                localize('k_felijo_4oak_t2_below'),
                G.GAME.hands["Four of a Kind"].l_mult,
                G.GAME.hands["Four of a Kind"].l_chips,
                G.GAME.hands["felijo_tier2_4oak"].l_mult,
                G.GAME.hands["felijo_tier2_4oak"].l_chips,
                colours = { (G.GAME.hands["Four of a Kind"].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands["Four of a Kind"].level)])
                ,(G.GAME.hands["felijo_tier2_4oak"].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands["felijo_tier2_4oak"].level)]) }
            }
        }
    end,
    use = function(self, card, area, copier)
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
            { handname = localize('k_felijo_4oak_t2_below'), chips = '...', mult = '...', level = '' })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = true
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { mult = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { chips = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = nil
                return true
            end
        }))
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '+1' })
        delay(1.3)
        SMODS.upgrade_poker_hands({hands = {"Four of a Kind"}, per_level = {chips = G.GAME.hands["Four of a Kind"].l_chips, mult = G.GAME.hands["Four of a Kind"].l_mult}, instant = true, from = card})
		SMODS.upgrade_poker_hands({hands = {"felijo_tier2_4oak"}, per_level = {chips = G.GAME.hands["felijo_tier2_4oak"].l_chips, mult = G.GAME.hands["felijo_tier2_4oak"].l_mult}, instant = true, from = card})
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 },{ mult = 0, chips = 0, handname = '', level = '' })
    end,
    can_use = function(self, card)
        return true
    end,
}

FELIJO.T3Planet {
    key = "felijo_tier3_mars",
    cost = 3,
    pos = { x = 7, y = 0 },
    config = {
		l_chips = 30,
		l_mult = 2,
		l_mult_f = 5,
        hand_type = {"felijo_tier3_4oak", "Four of a Kind" },
	},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands["Four of a Kind"].level, G.GAME.hands["felijo_tier3_4oak"].level,
                localize('k_felijo_4oak_t3_below'),
                G.GAME.hands["Four of a Kind"].l_mult,
                G.GAME.hands["Four of a Kind"].l_chips,
                G.GAME.hands["felijo_tier3_4oak"].l_mult,
                G.GAME.hands["felijo_tier3_4oak"].l_chips,
                colours = { (G.GAME.hands["Four of a Kind"].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands["Four of a Kind"].level)])
                ,(G.GAME.hands["felijo_tier3_4oak"].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands["felijo_tier3_4oak"].level)]) }
            }
        }
    end,
    use = function(self, card, area, copier)
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
            { handname = localize('k_felijo_4oak_t3_below'), chips = '...', mult = '...', level = '' })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = true
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { mult = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { chips = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = nil
                return true
            end
        }))
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '+1' })
        delay(1.3)
        SMODS.upgrade_poker_hands({hands = {"Four of a Kind"}, per_level = {chips = G.GAME.hands["Four of a Kind"].l_chips, mult = G.GAME.hands["Four of a Kind"].l_mult}, instant = true, from = card})
		SMODS.upgrade_poker_hands({hands = {"felijo_tier2_4oak"}, per_level = {chips = G.GAME.hands["felijo_tier2_4oak"].l_chips, mult = G.GAME.hands["felijo_tier2_4oak"].l_mult}, instant = true, from = card})
        SMODS.upgrade_poker_hands({hands = {"felijo_tier3_4oak"}, per_level = {chips = G.GAME.hands["felijo_tier3_4oak"].l_chips, mult = G.GAME.hands["felijo_tier3_4oak"].l_mult}, instant = true, from = card})
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 },{ mult = 0, chips = 0, handname = '', level = '' })
    end,
    can_use = function(self, card)
        return true
    end,
}

FELIJO.T4Planet {
    key = "felijo_tier4_mars",
    cost = 3,
    pos = { x = 7, y = 0 },
    config = {
		l_chips = 30,
		l_mult = 2,
		l_mult_f = 5,
        hand_type = {"felijo_tier4_4oak", "Four of a Kind" },
	},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands["Four of a Kind"].level, G.GAME.hands["felijo_tier4_4oak"].level,
                localize('k_felijo_4oak_t4_below'),
                G.GAME.hands["Four of a Kind"].l_mult,
                G.GAME.hands["Four of a Kind"].l_chips,
                G.GAME.hands["felijo_tier4_4oak"].l_mult,
                G.GAME.hands["felijo_tier4_4oak"].l_chips,
                colours = { (G.GAME.hands["Four of a Kind"].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands["Four of a Kind"].level)])
                ,(G.GAME.hands["felijo_tier4_4oak"].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands["felijo_tier4_4oak"].level)]) }
            }
        }
    end,
    use = function(self, card, area, copier)
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
            { handname = localize('k_felijo_4oak_t4_below'), chips = '...', mult = '...', level = '' })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = true
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { mult = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { chips = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = nil
                return true
            end
        }))
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '+1' })
        delay(1.3)
        SMODS.upgrade_poker_hands({hands = {"Four of a Kind"}, per_level = {chips = G.GAME.hands["Four of a Kind"].l_chips, mult = G.GAME.hands["Four of a Kind"].l_mult}, instant = true, from = card})
		SMODS.upgrade_poker_hands({hands = {"felijo_tier2_4oak"}, per_level = {chips = G.GAME.hands["felijo_tier2_4oak"].l_chips, mult = G.GAME.hands["felijo_tier2_4oak"].l_mult}, instant = true, from = card})
        SMODS.upgrade_poker_hands({hands = {"felijo_tier3_4oak"}, per_level = {chips = G.GAME.hands["felijo_tier3_4oak"].l_chips, mult = G.GAME.hands["felijo_tier3_4oak"].l_mult}, instant = true, from = card})
        SMODS.upgrade_poker_hands({hands = {"felijo_tier4_4oak"}, per_level = {chips = G.GAME.hands["felijo_tier4_4oak"].l_chips, mult = G.GAME.hands["felijo_tier4_4oak"].l_mult}, instant = true, from = card})
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 },{ mult = 0, chips = 0, handname = '', level = '' })
    end,
    can_use = function(self, card)
        return true
    end,
}

FELIJO.T2Planet {
    key = "felijo_tier2_jupiter",
    cost = 3,
    pos = { x = 5, y = 0 },
    config = {
		l_chips = 30,
		l_mult = 2,
		l_mult_f = 5,
        hand_type = {"felijo_tier2_flush", "Flush" },
	},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands["Flush"].level, G.GAME.hands["felijo_tier2_flush"].level,
                localize('k_felijo_flush_t2_below'),
                G.GAME.hands["Flush"].l_mult,
                G.GAME.hands["Flush"].l_chips,
                G.GAME.hands["felijo_tier2_flush"].l_mult,
                G.GAME.hands["felijo_tier2_flush"].l_chips,
                colours = { (G.GAME.hands["Flush"].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands["Flush"].level)])
                ,(G.GAME.hands["felijo_tier2_flush"].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands["felijo_tier2_flush"].level)]) }
            }
        }
    end,
    use = function(self, card, area, copier)
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
            { handname = localize('k_felijo_flush_t2_below'), chips = '...', mult = '...', level = '' })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = true
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { mult = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { chips = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = nil
                return true
            end
        }))
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '+1' })
        delay(1.3)
        SMODS.upgrade_poker_hands({hands = {"Flush"}, per_level = {chips = G.GAME.hands["Flush"].l_chips, mult = G.GAME.hands["Flush"].l_mult}, instant = true, from = card})
		SMODS.upgrade_poker_hands({hands = {"felijo_tier2_flush"}, per_level = {chips = G.GAME.hands["felijo_tier2_flush"].l_chips, mult = G.GAME.hands["felijo_tier2_flush"].l_mult}, instant = true, from = card})
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 },{ mult = 0, chips = 0, handname = '', level = '' })
    end,
    can_use = function(self, card)
        return true
    end,
}

FELIJO.T3Planet {
    key = "felijo_tier3_jupiter",
    cost = 3,
    pos = { x = 5, y = 0 },
    config = {
		l_chips = 30,
		l_mult = 2,
		l_mult_f = 5,
        hand_type = {"felijo_tier3_flush", "Flush" },
	},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands["Flush"].level, G.GAME.hands["felijo_tier3_flush"].level,
                localize('k_felijo_flush_t3_below'),
                G.GAME.hands["Flush"].l_mult,
                G.GAME.hands["Flush"].l_chips,
                G.GAME.hands["felijo_tier3_flush"].l_mult,
                G.GAME.hands["felijo_tier3_flush"].l_chips,
                colours = { (G.GAME.hands["Flush"].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands["Flush"].level)])
                ,(G.GAME.hands["felijo_tier3_flush"].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands["felijo_tier3_flush"].level)]) }
            }
        }
    end,
    use = function(self, card, area, copier)
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
            { handname = localize('k_felijo_flush_t3_below'), chips = '...', mult = '...', level = '' })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = true
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { mult = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { chips = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = nil
                return true
            end
        }))
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '+1' })
        delay(1.3)
        SMODS.upgrade_poker_hands({hands = {"Flush"}, per_level = {chips = G.GAME.hands["Flush"].l_chips, mult = G.GAME.hands["Flush"].l_mult}, instant = true, from = card})
		SMODS.upgrade_poker_hands({hands = {"felijo_tier2_flush"}, per_level = {chips = G.GAME.hands["felijo_tier2_flush"].l_chips, mult = G.GAME.hands["felijo_tier2_flush"].l_mult}, instant = true, from = card})
        SMODS.upgrade_poker_hands({hands = {"felijo_tier3_flush"}, per_level = {chips = G.GAME.hands["felijo_tier3_flush"].l_chips, mult = G.GAME.hands["felijo_tier3_flush"].l_mult}, instant = true, from = card})
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 },{ mult = 0, chips = 0, handname = '', level = '' })
    end,
    can_use = function(self, card)
        return true
    end,
}

FELIJO.T4Planet {
    key = "felijo_tier4_jupiter",
    cost = 3,
    pos = { x = 5, y = 0 },
    config = {
		l_chips = 30,
		l_mult = 2,
		l_mult_f = 5,
        hand_type = {"felijo_tier4_flush", "Flush" },
	},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands["Flush"].level, G.GAME.hands["felijo_tier4_flush"].level,
                localize('k_felijo_flush_t4_below'),
                G.GAME.hands["Flush"].l_mult,
                G.GAME.hands["Flush"].l_chips,
                G.GAME.hands["felijo_tier4_flush"].l_mult,
                G.GAME.hands["felijo_tier4_flush"].l_chips,
                colours = { (G.GAME.hands["Flush"].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands["Flush"].level)])
                ,(G.GAME.hands["felijo_tier4_flush"].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands["felijo_tier4_flush"].level)]) }
            }
        }
    end,
    use = function(self, card, area, copier)
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
            { handname = localize('k_felijo_flush_t4_below'), chips = '...', mult = '...', level = '' })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = true
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { mult = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { chips = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = nil
                return true
            end
        }))
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '+1' })
        delay(1.3)
        SMODS.upgrade_poker_hands({hands = {"Flush"}, per_level = {chips = G.GAME.hands["Flush"].l_chips, mult = G.GAME.hands["Flush"].l_mult}, instant = true, from = card})
		SMODS.upgrade_poker_hands({hands = {"felijo_tier2_flush"}, per_level = {chips = G.GAME.hands["felijo_tier2_flush"].l_chips, mult = G.GAME.hands["felijo_tier2_flush"].l_mult}, instant = true, from = card})
        SMODS.upgrade_poker_hands({hands = {"felijo_tier3_flush"}, per_level = {chips = G.GAME.hands["felijo_tier3_flush"].l_chips, mult = G.GAME.hands["felijo_tier3_flush"].l_mult}, instant = true, from = card})
        SMODS.upgrade_poker_hands({hands = {"felijo_tier4_flush"}, per_level = {chips = G.GAME.hands["felijo_tier4_flush"].l_chips, mult = G.GAME.hands["felijo_tier4_flush"].l_mult}, instant = true, from = card})
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 },{ mult = 0, chips = 0, handname = '', level = '' })
    end,
    can_use = function(self, card)
        return true
    end,
}

FELIJO.T2Planet {
    key = "felijo_tier2_saturn",
    cost = 3,
    pos = { x = 4, y = 0 },
    config = {
		l_chips = 30,
		l_mult = 2,
		l_mult_f = 5,
        hand_type = {"felijo_tier2_straight", "Straight" },
	},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands["Straight"].level, G.GAME.hands["felijo_tier2_straight"].level,
                localize('k_felijo_straight_t2_below'),
                G.GAME.hands["Straight"].l_mult,
                G.GAME.hands["Straight"].l_chips,
                G.GAME.hands["felijo_tier2_straight"].l_mult,
                G.GAME.hands["felijo_tier2_straight"].l_chips,
                colours = { (G.GAME.hands["Straight"].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands["Straight"].level)])
                ,(G.GAME.hands["felijo_tier2_straight"].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands["felijo_tier2_straight"].level)]) }
            }
        }
    end,
    use = function(self, card, area, copier)
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
            { handname = localize('k_felijo_straight_t2_below'), chips = '...', mult = '...', level = '' })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = true
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { mult = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { chips = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = nil
                return true
            end
        }))
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '+1' })
        delay(1.3)
        SMODS.upgrade_poker_hands({hands = {"Straight"}, per_level = {chips = G.GAME.hands["Straight"].l_chips, mult = G.GAME.hands["Straight"].l_mult}, instant = true, from = card})
		SMODS.upgrade_poker_hands({hands = {"felijo_tier2_straight"}, per_level = {chips = G.GAME.hands["felijo_tier2_straight"].l_chips, mult = G.GAME.hands["felijo_tier2_straight"].l_mult}, instant = true, from = card})
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 },{ mult = 0, chips = 0, handname = '', level = '' })
    end,
    can_use = function(self, card)
        return true
    end,
}

FELIJO.T3Planet {
    key = "felijo_tier3_saturn",
    cost = 3,
    pos = { x = 4, y = 0 },
    config = {
		l_chips = 30,
		l_mult = 2,
		l_mult_f = 5,
        hand_type = {"felijo_tier3_straight", "Straight" },
	},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands["Straight"].level, G.GAME.hands["felijo_tier3_straight"].level,
                localize('k_felijo_straight_t3_below'),
                G.GAME.hands["Straight"].l_mult,
                G.GAME.hands["Straight"].l_chips,
                G.GAME.hands["felijo_tier3_straight"].l_mult,
                G.GAME.hands["felijo_tier3_straight"].l_chips,
                colours = { (G.GAME.hands["Straight"].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands["Straight"].level)])
                ,(G.GAME.hands["felijo_tier3_straight"].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands["felijo_tier3_straight"].level)]) }
            }
        }
    end,
    use = function(self, card, area, copier)
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
            { handname = localize('k_felijo_straight_t3_below'), chips = '...', mult = '...', level = '' })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = true
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { mult = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { chips = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = nil
                return true
            end
        }))
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '+1' })
        delay(1.3)
        SMODS.upgrade_poker_hands({hands = {"Straight"}, per_level = {chips = G.GAME.hands["Straight"].l_chips, mult = G.GAME.hands["Straight"].l_mult}, instant = true, from = card})
		SMODS.upgrade_poker_hands({hands = {"felijo_tier2_straight"}, per_level = {chips = G.GAME.hands["felijo_tier2_straight"].l_chips, mult = G.GAME.hands["felijo_tier2_straight"].l_mult}, instant = true, from = card})
        SMODS.upgrade_poker_hands({hands = {"felijo_tier3_straight"}, per_level = {chips = G.GAME.hands["felijo_tier3_straight"].l_chips, mult = G.GAME.hands["felijo_tier3_straight"].l_mult}, instant = true, from = card})
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 },{ mult = 0, chips = 0, handname = '', level = '' })
    end,
    can_use = function(self, card)
        return true
    end,
}

FELIJO.T4Planet {
    key = "felijo_tier4_saturn",
    cost = 3,
    pos = { x = 4, y = 0 },
    config = {
		l_chips = 30,
		l_mult = 2,
		l_mult_f = 5,
        hand_type = {"felijo_tier4_straight", "Straight" },
	},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands["Straight"].level, G.GAME.hands["felijo_tier4_straight"].level,
                localize('k_felijo_straight_t4_below'),
                G.GAME.hands["Straight"].l_mult,
                G.GAME.hands["Straight"].l_chips,
                G.GAME.hands["felijo_tier4_straight"].l_mult,
                G.GAME.hands["felijo_tier4_straight"].l_chips,
                colours = { (G.GAME.hands["Straight"].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands["Straight"].level)])
                ,(G.GAME.hands["felijo_tier4_straight"].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands["felijo_tier4_straight"].level)]) }
            }
        }
    end,
    use = function(self, card, area, copier)
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
            { handname = localize('k_felijo_straight_t4_below'), chips = '...', mult = '...', level = '' })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = true
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { mult = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { chips = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = nil
                return true
            end
        }))
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '+1' })
        delay(1.3)
        SMODS.upgrade_poker_hands({hands = {"Straight"}, per_level = {chips = G.GAME.hands["Straight"].l_chips, mult = G.GAME.hands["Straight"].l_mult}, instant = true, from = card})
		SMODS.upgrade_poker_hands({hands = {"felijo_tier2_straight"}, per_level = {chips = G.GAME.hands["felijo_tier2_straight"].l_chips, mult = G.GAME.hands["felijo_tier2_straight"].l_mult}, instant = true, from = card})
        SMODS.upgrade_poker_hands({hands = {"felijo_tier3_straight"}, per_level = {chips = G.GAME.hands["felijo_tier3_straight"].l_chips, mult = G.GAME.hands["felijo_tier3_straight"].l_mult}, instant = true, from = card})
        SMODS.upgrade_poker_hands({hands = {"felijo_tier4_straight"}, per_level = {chips = G.GAME.hands["felijo_tier4_straight"].l_chips, mult = G.GAME.hands["felijo_tier4_straight"].l_mult}, instant = true, from = card})
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 },{ mult = 0, chips = 0, handname = '', level = '' })
    end,
    can_use = function(self, card)
        return true
    end,
}

FELIJO.T2Planet {
    key = "felijo_tier2_uranus",
    cost = 3,
    pos = { x = 2, y = 0 },
    config = {
		l_chips = 30,
		l_mult = 2,
		l_mult_f = 5,
        hand_type = {"felijo_tier2_two_pair", "Two Pair" },
	},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands["Two Pair"].level, G.GAME.hands["felijo_tier2_two_pair"].level,
                localize('k_felijo_two_pair_t2_below'),
                G.GAME.hands["Two Pair"].l_mult,
                G.GAME.hands["Two Pair"].l_chips,
                G.GAME.hands["felijo_tier2_two_pair"].l_mult,
                G.GAME.hands["felijo_tier2_two_pair"].l_chips,
                colours = { (G.GAME.hands["Two Pair"].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands["Two Pair"].level)])
                ,(G.GAME.hands["felijo_tier2_two_pair"].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands["felijo_tier2_two_pair"].level)]) }
            }
        }
    end,
    use = function(self, card, area, copier)
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
            { handname = localize('k_felijo_two_pair_t2_below'), chips = '...', mult = '...', level = '' })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = true
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { mult = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { chips = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = nil
                return true
            end
        }))
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '+1' })
        delay(1.3)
        SMODS.upgrade_poker_hands({hands = {"Two Pair"}, per_level = {chips = G.GAME.hands["Two Pair"].l_chips, mult = G.GAME.hands["Two Pair"].l_mult}, instant = true, from = card})
		SMODS.upgrade_poker_hands({hands = {"felijo_tier2_two_pair"}, per_level = {chips = G.GAME.hands["felijo_tier2_two_pair"].l_chips, mult = G.GAME.hands["felijo_tier2_two_pair"].l_mult}, instant = true, from = card})
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 },{ mult = 0, chips = 0, handname = '', level = '' })
    end,
    can_use = function(self, card)
        return true
    end,
}

FELIJO.T3Planet {
    key = "felijo_tier3_uranus",
    cost = 3,
    pos = { x = 2, y = 0 },
    config = {
		l_chips = 30,
		l_mult = 2,
		l_mult_f = 5,
        hand_type = {"felijo_tier3_two_pair", "Two Pair" },
	},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands["Two Pair"].level, G.GAME.hands["felijo_tier3_two_pair"].level,
                localize('k_felijo_twopair_t3_below'),
                G.GAME.hands["Two Pair"].l_mult,
                G.GAME.hands["Two Pair"].l_chips,
                G.GAME.hands["felijo_tier3_two_pair"].l_mult,
                G.GAME.hands["felijo_tier3_two_pair"].l_chips,
                colours = { (G.GAME.hands["Two Pair"].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands["Two Pair"].level)])
                ,(G.GAME.hands["felijo_tier3_two_pair"].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands["felijo_tier3_two_pair"].level)]) }
            }
        }
    end,
    use = function(self, card, area, copier)
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
            { handname = localize('k_felijo_two_pair_t3_below'), chips = '...', mult = '...', level = '' })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = true
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { mult = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { chips = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = nil
                return true
            end
        }))
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '+1' })
        delay(1.3)
        SMODS.upgrade_poker_hands({hands = {"Two Pair"}, per_level = {chips = G.GAME.hands["Two Pair"].l_chips, mult = G.GAME.hands["Two Pair"].l_mult}, instant = true, from = card})
		SMODS.upgrade_poker_hands({hands = {"felijo_tier2_two_pair"}, per_level = {chips = G.GAME.hands["felijo_tier2_two_pair"].l_chips, mult = G.GAME.hands["felijo_tier2_two_pair"].l_mult}, instant = true, from = card})
        SMODS.upgrade_poker_hands({hands = {"felijo_tier3_two_pair"}, per_level = {chips = G.GAME.hands["felijo_tier3_two_pair"].l_chips, mult = G.GAME.hands["felijo_tier3_two_pair"].l_mult}, instant = true, from = card})
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 },{ mult = 0, chips = 0, handname = '', level = '' })
    end,
    can_use = function(self, card)
        return true
    end,
}

FELIJO.T4Planet {
    key = "felijo_tier4_uranus",
    cost = 3,
    pos = { x = 2, y = 0 },
    config = {
		l_chips = 30,
		l_mult = 2,
		l_mult_f = 5,
        hand_type = {"felijo_tier4_two_pair", "Two Pair" },
	},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands["Two Pair"].level, G.GAME.hands["felijo_tier4_two_pair"].level,
                localize('k_felijo_two_pair_t4_below'),
                G.GAME.hands["Two Pair"].l_mult,
                G.GAME.hands["Two Pair"].l_chips,
                G.GAME.hands["felijo_tier4_two_pair"].l_mult,
                G.GAME.hands["felijo_tier4_two_pair"].l_chips,
                colours = { (G.GAME.hands["Two Pair"].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands["Two Pair"].level)])
                ,(G.GAME.hands["felijo_tier4_two_pair"].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands["felijo_tier4_two_pair"].level)]) }
            }
        }
    end,
    use = function(self, card, area, copier)
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
            { handname = localize('k_felijo_two_pair_t4_below'), chips = '...', mult = '...', level = '' })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = true
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { mult = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { chips = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = nil
                return true
            end
        }))
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '+1' })
        delay(1.3)
        SMODS.upgrade_poker_hands({hands = {"Two Pair"}, per_level = {chips = G.GAME.hands["Two Pair"].l_chips, mult = G.GAME.hands["Two Pair"].l_mult}, instant = true, from = card})
		SMODS.upgrade_poker_hands({hands = {"felijo_tier2_two_pair"}, per_level = {chips = G.GAME.hands["felijo_tier2_two_pair"].l_chips, mult = G.GAME.hands["felijo_tier2_two_pair"].l_mult}, instant = true, from = card})
        SMODS.upgrade_poker_hands({hands = {"felijo_tier3_two_pair"}, per_level = {chips = G.GAME.hands["felijo_tier3_two_pair"].l_chips, mult = G.GAME.hands["felijo_tier3_two_pair"].l_mult}, instant = true, from = card})
        SMODS.upgrade_poker_hands({hands = {"felijo_tier4_two_pair"}, per_level = {chips = G.GAME.hands["felijo_tier4_two_pair"].l_chips, mult = G.GAME.hands["felijo_tier4_two_pair"].l_mult}, instant = true, from = card})
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 },{ mult = 0, chips = 0, handname = '', level = '' })
    end,
    can_use = function(self, card)
        return true
    end,
}

FELIJO.T2Planet {
    key = "felijo_tier2_neptune",
    cost = 3,
    pos = { x = 8, y = 0 },
    config = {
		l_chips = 30,
		l_mult = 2,
		l_mult_f = 5,
        hand_type = {"felijo_tier2_straight_flush", "Straight Flush" },
	},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands["Straight Flush"].level, G.GAME.hands["felijo_tier2_straight_flush"].level,
                localize('k_felijo_straight_flush_t2_below'),
                G.GAME.hands["Straight Flush"].l_mult,
                G.GAME.hands["Straight Flush"].l_chips,
                G.GAME.hands["felijo_tier2_straight_flush"].l_mult,
                G.GAME.hands["felijo_tier2_straight_flush"].l_chips,
                colours = { (G.GAME.hands["Straight Flush"].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands["Straight Flush"].level)])
                ,(G.GAME.hands["felijo_tier2_straight_flush"].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands["felijo_tier2_straight_flush"].level)]) }
            }
        }
    end,
    use = function(self, card, area, copier)
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
            { handname = localize('k_felijo_flush_t2_below'), chips = '...', mult = '...', level = '' })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = true
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { mult = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { chips = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = nil
                return true
            end
        }))
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '+1' })
        delay(1.3)
        SMODS.upgrade_poker_hands({hands = {"Straight Flush"}, per_level = {chips = G.GAME.hands["Straight Flush"].l_chips, mult = G.GAME.hands["Straight Flush"].l_mult}, instant = true, from = card})
		SMODS.upgrade_poker_hands({hands = {"felijo_tier2_straight_flush"}, per_level = {chips = G.GAME.hands["felijo_tier2_straight_flush"].l_chips, mult = G.GAME.hands["felijo_tier2_straight_flush"].l_mult}, instant = true, from = card})
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 },{ mult = 0, chips = 0, handname = '', level = '' })
    end,
    can_use = function(self, card)
        return true
    end,
}

FELIJO.T3Planet {
    key = "felijo_tier3_neptune",
    cost = 3,
    pos = { x = 8, y = 0 },
    config = {
		l_chips = 30,
		l_mult = 2,
		l_mult_f = 5,
        hand_type = {"felijo_tier3_straight_flush", "Straight Flush" },
	},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands["Straight Flush"].level, G.GAME.hands["felijo_tier3_straight_flush"].level,
                localize('k_felijo_straight_flush_t3_below'),
                G.GAME.hands["Straight Flush"].l_mult,
                G.GAME.hands["Straight Flush"].l_chips,
                G.GAME.hands["felijo_tier3_straight_flush"].l_mult,
                G.GAME.hands["felijo_tier3_straight_flush"].l_chips,
                colours = { (G.GAME.hands["Straight Flush"].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands["Straight Flush"].level)])
                ,(G.GAME.hands["felijo_tier3_straight_flush"].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands["felijo_tier3_straight_flush"].level)]) }
            }
        }
    end,
    use = function(self, card, area, copier)
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
            { handname = localize('k_felijo_flush_t3_below'), chips = '...', mult = '...', level = '' })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = true
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { mult = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { chips = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = nil
                return true
            end
        }))
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '+1' })
        delay(1.3)
        SMODS.upgrade_poker_hands({hands = {"Straight Flush"}, per_level = {chips = G.GAME.hands["Straight Flush"].l_chips, mult = G.GAME.hands["Straight Flush"].l_mult}, instant = true, from = card})
		SMODS.upgrade_poker_hands({hands = {"felijo_tier2_straight_flush"}, per_level = {chips = G.GAME.hands["felijo_tier2_straight_flush"].l_chips, mult = G.GAME.hands["felijo_tier2_straight_flush"].l_mult}, instant = true, from = card})
        SMODS.upgrade_poker_hands({hands = {"felijo_tier3_straight_flush"}, per_level = {chips = G.GAME.hands["felijo_tier3_straight_flush"].l_chips, mult = G.GAME.hands["felijo_tier3_straight_flush"].l_mult}, instant = true, from = card})
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 },{ mult = 0, chips = 0, handname = '', level = '' })
    end,
    can_use = function(self, card)
        return true
    end,
}

FELIJO.T4Planet {
    key = "felijo_tier4_neptune",
    cost = 3,
    pos = { x = 8, y = 0 },
    config = {
		l_chips = 30,
		l_mult = 2,
		l_mult_f = 5,
        hand_type = {"felijo_tier4_straight_flush", "Straight Flush" },
	},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands["Straight Flush"].level, G.GAME.hands["felijo_tier4_straight_flush"].level,
                localize('k_felijo_straight_flush_t4_below'),
                G.GAME.hands["Straight Flush"].l_mult,
                G.GAME.hands["Straight Flush"].l_chips,
                G.GAME.hands["felijo_tier4_straight_flush"].l_mult,
                G.GAME.hands["felijo_tier4_straight_flush"].l_chips,
                colours = { (G.GAME.hands["Straight Flush"].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands["Straight Flush"].level)])
                ,(G.GAME.hands["felijo_tier4_straight_flush"].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands["felijo_tier4_straight_flush"].level)]) }
            }
        }
    end,
    use = function(self, card, area, copier)
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
            { handname = localize('k_felijo_straight_flush_t4_below'), chips = '...', mult = '...', level = '' })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = true
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { mult = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { chips = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = nil
                return true
            end
        }))
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '+1' })
        delay(1.3)
        SMODS.upgrade_poker_hands({hands = {"Straight Flush"}, per_level = {chips = G.GAME.hands["Straight Flush"].l_chips, mult = G.GAME.hands["Straight Flush"].l_mult}, instant = true, from = card})
		SMODS.upgrade_poker_hands({hands = {"felijo_tier2_straight_flush"}, per_level = {chips = G.GAME.hands["felijo_tier2_straight_flush"].l_chips, mult = G.GAME.hands["felijo_tier2_straight_flush"].l_mult}, instant = true, from = card})
        SMODS.upgrade_poker_hands({hands = {"felijo_tier3_straight_flush"}, per_level = {chips = G.GAME.hands["felijo_tier3_straight_flush"].l_chips, mult = G.GAME.hands["felijo_tier3_straight_flush"].l_mult}, instant = true, from = card})
        SMODS.upgrade_poker_hands({hands = {"felijo_tier4_straight_flush"}, per_level = {chips = G.GAME.hands["felijo_tier4_straight_flush"].l_chips, mult = G.GAME.hands["felijo_tier4_straight_flush"].l_mult}, instant = true, from = card})
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 },{ mult = 0, chips = 0, handname = '', level = '' })
    end,
    can_use = function(self, card)
        return true
    end,
}


FELIJO.T2Planet {
    key = "felijo_tier2_pluto",
    cost = 3,
    pos = { x = 0, y = 0 },
    config = {
		l_chips = 30,
		l_mult = 2,
		l_mult_f = 5,
        hand_type = {"felijo_tier2_highcard", "High Card" },
	},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands["High Card"].level, G.GAME.hands["felijo_tier2_highcard"].level,
                localize('k_felijo_highcard_t2_below'),
                G.GAME.hands["High Card"].l_mult,
                G.GAME.hands["High Card"].l_chips,
                G.GAME.hands["felijo_tier2_highcard"].l_mult,
                G.GAME.hands["felijo_tier2_highcard"].l_chips,
                colours = { (G.GAME.hands["High Card"].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands["High Card"].level)])
                ,(G.GAME.hands["felijo_tier2_highcard"].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands["felijo_tier2_highcard"].level)]) }
            }
        }
    end,
    use = function(self, card, area, copier)
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
            { handname = localize('k_felijo_highcard_t2_below'), chips = '...', mult = '...', level = '' })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = true
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { mult = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { chips = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = nil
                return true
            end
        }))
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '+1' })
        delay(1.3)
        SMODS.upgrade_poker_hands({hands = {"High Card"}, per_level = {chips = G.GAME.hands["High Card"].l_chips, mult = G.GAME.hands["High Card"].l_mult}, instant = true, from = card})
		SMODS.upgrade_poker_hands({hands = {"felijo_tier2_highcard"}, per_level = {chips = G.GAME.hands["felijo_tier2_highcard"].l_chips, mult = G.GAME.hands["felijo_tier2_highcard"].l_mult}, instant = true, from = card})
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 },{ mult = 0, chips = 0, handname = '', level = '' })
    end,
    can_use = function(self, card)
        return true
    end,
}

FELIJO.T3Planet {
    key = "felijo_tier3_pluto",
    cost = 3,
    pos = { x = 0, y = 0 },
    config = {
		l_chips = 30,
		l_mult = 2,
		l_mult_f = 5,
        hand_type = {"felijo_tier3_highcard", "High Card" },
	},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands["High Card"].level, G.GAME.hands["felijo_tier3_highcard"].level,
                localize('k_felijo_highcard_t3_below'),
                G.GAME.hands["High Card"].l_mult,
                G.GAME.hands["High Card"].l_chips,
                G.GAME.hands["felijo_tier3_highcard"].l_mult,
                G.GAME.hands["felijo_tier3_highcard"].l_chips,
                colours = { (G.GAME.hands["High Card"].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands["High Card"].level)])
                ,(G.GAME.hands["felijo_tier3_highcard"].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands["felijo_tier3_highcard"].level)]) }
            }
        }
    end,
    use = function(self, card, area, copier)
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
            { handname = localize('k_felijo_highcard_t3_below'), chips = '...', mult = '...', level = '' })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = true
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { mult = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { chips = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = nil
                return true
            end
        }))
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '+1' })
        delay(1.3)
        SMODS.upgrade_poker_hands({hands = {"High Card"}, per_level = {chips = G.GAME.hands["High Card"].l_chips, mult = G.GAME.hands["High Card"].l_mult}, instant = true, from = card})
		SMODS.upgrade_poker_hands({hands = {"felijo_tier2_highcard"}, per_level = {chips = G.GAME.hands["felijo_tier2_highcard"].l_chips, mult = G.GAME.hands["felijo_tier2_highcard"].l_mult}, instant = true, from = card})
        SMODS.upgrade_poker_hands({hands = {"felijo_tier3_highcard"}, per_level = {chips = G.GAME.hands["felijo_tier3_highcard"].l_chips, mult = G.GAME.hands["felijo_tier3_highcard"].l_mult}, instant = true, from = card})
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 },{ mult = 0, chips = 0, handname = '', level = '' })
    end,
    can_use = function(self, card)
        return true
    end,
}

FELIJO.T4Planet {
    key = "felijo_tier4_pluto",
    cost = 3,
    pos = { x = 0, y = 0 },
    config = {
		l_chips = 30,
		l_mult = 2,
		l_mult_f = 5,
        hand_type = {"felijo_tier4_highcard", "High Card" },
	},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands["High Card"].level, G.GAME.hands["felijo_tier4_highcard"].level,
                localize('k_felijo_highcard_t4_below'),
                G.GAME.hands["High Card"].l_mult,
                G.GAME.hands["High Card"].l_chips,
                G.GAME.hands["felijo_tier4_highcard"].l_mult,
                G.GAME.hands["felijo_tier4_highcard"].l_chips,
                colours = { (G.GAME.hands["High Card"].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands["High Card"].level)])
                ,(G.GAME.hands["felijo_tier4_highcard"].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands["felijo_tier4_highcard"].level)]) }
            }
        }
    end,
    use = function(self, card, area, copier)
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
            { handname = localize('k_felijo_highcard_t4_below'), chips = '...', mult = '...', level = '' })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = true
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { mult = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { chips = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = nil
                return true
            end
        }))
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '+1' })
        delay(1.3)
        SMODS.upgrade_poker_hands({hands = {"High Card"}, per_level = {chips = G.GAME.hands["High Card"].l_chips, mult = G.GAME.hands["High Card"].l_mult}, instant = true, from = card})
		SMODS.upgrade_poker_hands({hands = {"felijo_tier2_highcard"}, per_level = {chips = G.GAME.hands["felijo_tier2_highcard"].l_chips, mult = G.GAME.hands["felijo_tier2_highcard"].l_mult}, instant = true, from = card})
        SMODS.upgrade_poker_hands({hands = {"felijo_tier3_highcard"}, per_level = {chips = G.GAME.hands["felijo_tier3_highcard"].l_chips, mult = G.GAME.hands["felijo_tier3_highcard"].l_mult}, instant = true, from = card})
        SMODS.upgrade_poker_hands({hands = {"felijo_tier4_highcard"}, per_level = {chips = G.GAME.hands["felijo_tier4_highcard"].l_chips, mult = G.GAME.hands["felijo_tier4_highcard"].l_mult}, instant = true, from = card})
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 },{ mult = 0, chips = 0, handname = '', level = '' })
    end,
    can_use = function(self, card)
        return true
    end,
}

FELIJO.T2Planet {
    key = "felijo_tier2_planetx",
    cost = 3,
    pos = { x = 9, y = 0 },
    config = {
		l_chips = 30,
		l_mult = 2,
		l_mult_f = 5,
        hand_type = {"felijo_tier2_5oak", "Five of a Kind" },
	},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands["Five of a Kind"].level, G.GAME.hands["felijo_tier2_5oak"].level,
                localize('k_felijo_5oak_t2_below'),
                G.GAME.hands["Five of a Kind"].l_mult,
                G.GAME.hands["Five of a Kind"].l_chips,
                G.GAME.hands["felijo_tier2_5oak"].l_mult,
                G.GAME.hands["felijo_tier2_5oak"].l_chips,
                colours = { (G.GAME.hands["Five of a Kind"].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands["Five of a Kind"].level)])
                ,(G.GAME.hands["felijo_tier2_5oak"].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands["felijo_tier2_5oak"].level)]) }
            }
        }
    end,
    use = function(self, card, area, copier)
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
            { handname = localize('k_felijo_5oak_t2_below'), chips = '...', mult = '...', level = '' })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = true
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { mult = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { chips = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = nil
                return true
            end
        }))
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '+1' })
        delay(1.3)
        SMODS.upgrade_poker_hands({hands = {"Five of a Kind"}, per_level = {chips = G.GAME.hands["Five of a Kind"].l_chips, mult = G.GAME.hands["Five of a Kind"].l_mult}, instant = true, from = card})
		SMODS.upgrade_poker_hands({hands = {"felijo_tier2_5oak"}, per_level = {chips = G.GAME.hands["felijo_tier2_5oak"].l_chips, mult = G.GAME.hands["felijo_tier2_5oak"].l_mult}, instant = true, from = card})
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 },{ mult = 0, chips = 0, handname = '', level = '' })
    end,
    can_use = function(self, card)
        return true
    end,
}

FELIJO.T3Planet {
    key = "felijo_tier3_planetx",
    cost = 3,
    pos = { x = 9, y = 0 },
    config = {
		l_chips = 30,
		l_mult = 2,
		l_mult_f = 5,
        hand_type = {"felijo_tier3_5oak", "Five of a Kind" },
	},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands["Five of a Kind"].level, G.GAME.hands["felijo_tier3_5oak"].level,
                localize('k_felijo_5oak_t3_below'),
                G.GAME.hands["Five of a Kind"].l_mult,
                G.GAME.hands["Five of a Kind"].l_chips,
                G.GAME.hands["felijo_tier3_5oak"].l_mult,
                G.GAME.hands["felijo_tier3_5oak"].l_chips,
                colours = { (G.GAME.hands["Five of a Kind"].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands["Five of a Kind"].level)])
                ,(G.GAME.hands["felijo_tier3_5oak"].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands["felijo_tier3_5oak"].level)]) }
            }
        }
    end,
    use = function(self, card, area, copier)
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
            { handname = localize('k_felijo_5oak_t3_below'), chips = '...', mult = '...', level = '' })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = true
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { mult = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { chips = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = nil
                return true
            end
        }))
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '+1' })
        delay(1.3)
        SMODS.upgrade_poker_hands({hands = {"Five of a Kind"}, per_level = {chips = G.GAME.hands["Five of a Kind"].l_chips, mult = G.GAME.hands["Five of a Kind"].l_mult}, instant = true, from = card})
		SMODS.upgrade_poker_hands({hands = {"felijo_tier2_5oak"}, per_level = {chips = G.GAME.hands["felijo_tier2_5oak"].l_chips, mult = G.GAME.hands["felijo_tier2_5oak"].l_mult}, instant = true, from = card})
        SMODS.upgrade_poker_hands({hands = {"felijo_tier3_5oak"}, per_level = {chips = G.GAME.hands["felijo_tier3_5oak"].l_chips, mult = G.GAME.hands["felijo_tier3_5oak"].l_mult}, instant = true, from = card})
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 },{ mult = 0, chips = 0, handname = '', level = '' })
    end,
    can_use = function(self, card)
        return true
    end,
}

FELIJO.T4Planet {
    key = "felijo_tier4_planetx",
    cost = 3,
    pos = { x = 9, y = 0 },
    config = {
		l_chips = 30,
		l_mult = 2,
		l_mult_f = 5,
        hand_type = {"felijo_tier4_5oak", "Five of a Kind" },
	},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands["Five of a Kind"].level, G.GAME.hands["felijo_tier4_5oak"].level,
                localize('k_felijo_5oak_t4_below'),
                G.GAME.hands["Five of a Kind"].l_mult,
                G.GAME.hands["Five of a Kind"].l_chips,
                G.GAME.hands["felijo_tier4_5oak"].l_mult,
                G.GAME.hands["felijo_tier4_5oak"].l_chips,
                colours = { (G.GAME.hands["Five of a Kind"].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands["Five of a Kind"].level)])
                ,(G.GAME.hands["felijo_tier4_5oak"].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands["felijo_tier4_5oak"].level)]) }
            }
        }
    end,
    use = function(self, card, area, copier)
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
            { handname = localize('k_felijo_5oak_t4_below'), chips = '...', mult = '...', level = '' })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = true
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { mult = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { chips = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = nil
                return true
            end
        }))
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '+1' })
        delay(1.3)
        SMODS.upgrade_poker_hands({hands = {"Five of a Kind"}, per_level = {chips = G.GAME.hands["Five of a Kind"].l_chips, mult = G.GAME.hands["Five of a Kind"].l_mult}, instant = true, from = card})
		SMODS.upgrade_poker_hands({hands = {"felijo_tier2_5oak"}, per_level = {chips = G.GAME.hands["felijo_tier2_5oak"].l_chips, mult = G.GAME.hands["felijo_tier2_5oak"].l_mult}, instant = true, from = card})
        SMODS.upgrade_poker_hands({hands = {"felijo_tier3_5oak"}, per_level = {chips = G.GAME.hands["felijo_tier3_5oak"].l_chips, mult = G.GAME.hands["felijo_tier3_5oak"].l_mult}, instant = true, from = card})
        SMODS.upgrade_poker_hands({hands = {"felijo_tier4_5oak"}, per_level = {chips = G.GAME.hands["felijo_tier4_5oak"].l_chips, mult = G.GAME.hands["felijo_tier4_5oak"].l_mult}, instant = true, from = card})
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 },{ mult = 0, chips = 0, handname = '', level = '' })
    end,
    can_use = function(self, card)
        return true
    end,
}

FELIJO.T2Planet {
    key = "felijo_tier2_ceres",
    cost = 3,
    pos = { x = 1, y = 1 },
    config = {
		l_chips = 30,
		l_mult = 2,
		l_mult_f = 5,
        hand_type = {"felijo_tier2_flushhouse", "Flush House" },
	},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands["Flush House"].level, G.GAME.hands["felijo_tier2_flushhouse"].level,
                localize('k_felijo_flushhouse_t2_below'),
                G.GAME.hands["Flush House"].l_mult,
                G.GAME.hands["Flush House"].l_chips,
                G.GAME.hands["felijo_tier2_flushhouse"].l_mult,
                G.GAME.hands["felijo_tier2_flushhouse"].l_chips,
                colours = { (G.GAME.hands["Flush House"].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands["Flush House"].level)])
                ,(G.GAME.hands["felijo_tier2_flushhouse"].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands["felijo_tier2_flushhouse"].level)]) }
            }
        }
    end,
    use = function(self, card, area, copier)
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
            { handname = localize('k_felijo_flushhouse_t2_below'), chips = '...', mult = '...', level = '' })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = true
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { mult = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { chips = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = nil
                return true
            end
        }))
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '+1' })
        delay(1.3)
        SMODS.upgrade_poker_hands({hands = {"Flush House"}, per_level = {chips = G.GAME.hands["Flush House"].l_chips, mult = G.GAME.hands["Flush House"].l_mult}, instant = true, from = card})
		SMODS.upgrade_poker_hands({hands = {"felijo_tier2_flushhouse"}, per_level = {chips = G.GAME.hands["felijo_tier2_flushhouse"].l_chips, mult = G.GAME.hands["felijo_tier2_flushhouse"].l_mult}, instant = true, from = card})
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 },{ mult = 0, chips = 0, handname = '', level = '' })
    end,
    can_use = function(self, card)
        return true
    end,
}

FELIJO.T3Planet {
    key = "felijo_tier3_ceres",
    cost = 3,
    pos = { x = 1, y = 1 },
    config = {
		l_chips = 30,
		l_mult = 2,
		l_mult_f = 5,
        hand_type = {"felijo_tier3_flushhouse", "Flush House" },
	},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands["Flush House"].level, G.GAME.hands["felijo_tier3_flushhouse"].level,
                localize('k_felijo_flushhouse_t3_below'),
                G.GAME.hands["Flush House"].l_mult,
                G.GAME.hands["Flush House"].l_chips,
                G.GAME.hands["felijo_tier3_flushhouse"].l_mult,
                G.GAME.hands["felijo_tier3_flushhouse"].l_chips,
                colours = { (G.GAME.hands["Flush House"].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands["Flush House"].level)])
                ,(G.GAME.hands["felijo_tier3_flushhouse"].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands["felijo_tier3_flushhouse"].level)]) }
            }
        }
    end,
    use = function(self, card, area, copier)
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
            { handname = localize('k_felijo_flushhouse_t3_below'), chips = '...', mult = '...', level = '' })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = true
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { mult = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { chips = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = nil
                return true
            end
        }))
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '+1' })
        delay(1.3)
        SMODS.upgrade_poker_hands({hands = {"Flush House"}, per_level = {chips = G.GAME.hands["Flush House"].l_chips, mult = G.GAME.hands["Flush House"].l_mult}, instant = true, from = card})
		SMODS.upgrade_poker_hands({hands = {"felijo_tier2_flushhouse"}, per_level = {chips = G.GAME.hands["felijo_tier2_flushhouse"].l_chips, mult = G.GAME.hands["felijo_tier2_flushhouse"].l_mult}, instant = true, from = card})
        SMODS.upgrade_poker_hands({hands = {"felijo_tier3_flushhouse"}, per_level = {chips = G.GAME.hands["felijo_tier3_flushhouse"].l_chips, mult = G.GAME.hands["felijo_tier3_flushhouse"].l_mult}, instant = true, from = card})
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 },{ mult = 0, chips = 0, handname = '', level = '' })
    end,
    can_use = function(self, card)
        return true
    end,
}

FELIJO.T4Planet {
    key = "felijo_tier4_ceres",
    cost = 3,
    pos = { x = 1, y = 1 },
    config = {
		l_chips = 30,
		l_mult = 2,
		l_mult_f = 5,
        hand_type = {"felijo_tier4_flushhouse", "Flush House" },
	},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands["Flush House"].level, G.GAME.hands["felijo_tier4_flushhouse"].level,
                localize('k_felijo_flushhouse_t4_below'),
                G.GAME.hands["Flush House"].l_mult,
                G.GAME.hands["Flush House"].l_chips,
                G.GAME.hands["felijo_tier4_flushhouse"].l_mult,
                G.GAME.hands["felijo_tier4_flushhouse"].l_chips,
                colours = { (G.GAME.hands["Flush House"].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands["Flush House"].level)])
                ,(G.GAME.hands["felijo_tier4_flushhouse"].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands["felijo_tier4_flushhouse"].level)]) }
            }
        }
    end,
    use = function(self, card, area, copier)
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
            { handname = localize('k_felijo_flushhouse_t4_below'), chips = '...', mult = '...', level = '' })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = true
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { mult = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { chips = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = nil
                return true
            end
        }))
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '+1' })
        delay(1.3)
        SMODS.upgrade_poker_hands({hands = {"Flush House"}, per_level = {chips = G.GAME.hands["Flush House"].l_chips, mult = G.GAME.hands["Flush House"].l_mult}, instant = true, from = card})
		SMODS.upgrade_poker_hands({hands = {"felijo_tier2_flushhouse"}, per_level = {chips = G.GAME.hands["felijo_tier2_flushhouse"].l_chips, mult = G.GAME.hands["felijo_tier2_flushhouse"].l_mult}, instant = true, from = card})
        SMODS.upgrade_poker_hands({hands = {"felijo_tier3_flushhouse"}, per_level = {chips = G.GAME.hands["felijo_tier3_flushhouse"].l_chips, mult = G.GAME.hands["felijo_tier3_flushhouse"].l_mult}, instant = true, from = card})
        SMODS.upgrade_poker_hands({hands = {"felijo_tier4_flushhouse"}, per_level = {chips = G.GAME.hands["felijo_tier4_flushhouse"].l_chips, mult = G.GAME.hands["felijo_tier4_flushhouse"].l_mult}, instant = true, from = card})
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 },{ mult = 0, chips = 0, handname = '', level = '' })
    end,
    can_use = function(self, card)
        return true
    end,
}


FELIJO.T2Planet {
    key = "felijo_tier2_eris",
    cost = 3,
    pos = { x = 0, y = 1 },
    config = {
		l_chips = 30,
		l_mult = 2,
		l_mult_f = 5,
        hand_type = {"felijo_tier2_flushfive", "Flush Five" },
	},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands["Flush Five"].level, G.GAME.hands["felijo_tier2_flushfive"].level,
                localize('k_felijo_flushfive_t2_below'),
                G.GAME.hands["Flush Five"].l_mult,
                G.GAME.hands["Flush Five"].l_chips,
                G.GAME.hands["felijo_tier2_flushfive"].l_mult,
                G.GAME.hands["felijo_tier2_flushfive"].l_chips,
                colours = { (G.GAME.hands["Flush Five"].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands["Flush Five"].level)])
                ,(G.GAME.hands["felijo_tier2_flushfive"].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands["felijo_tier2_flushfive"].level)]) }
            }
        }
    end,
    use = function(self, card, area, copier)
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
            { handname = localize('k_felijo_flushfive_t2_below'), chips = '...', mult = '...', level = '' })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = true
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { mult = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { chips = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = nil
                return true
            end
        }))
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '+1' })
        delay(1.3)
        SMODS.upgrade_poker_hands({hands = {"Flush Five"}, per_level = {chips = G.GAME.hands["Flush Five"].l_chips, mult = G.GAME.hands["Flush Five"].l_mult}, instant = true, from = card})
		SMODS.upgrade_poker_hands({hands = {"felijo_tier2_flushfive"}, per_level = {chips = G.GAME.hands["felijo_tier2_flushfive"].l_chips, mult = G.GAME.hands["felijo_tier2_flushfive"].l_mult}, instant = true, from = card})
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 },{ mult = 0, chips = 0, handname = '', level = '' })
    end,
    can_use = function(self, card)
        return true
    end,
}

FELIJO.T3Planet {
    key = "felijo_tier3_eris",
    cost = 3,
    pos = { x = 0, y = 1 },
    config = {
		l_chips = 30,
		l_mult = 2,
		l_mult_f = 5,
        hand_type = {"felijo_tier3_flushfive", "Flush Five" },
	},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands["Flush Five"].level, G.GAME.hands["felijo_tier3_flushfive"].level,
                localize('k_felijo_flushfive_t3_below'),
                G.GAME.hands["Flush Five"].l_mult,
                G.GAME.hands["Flush Five"].l_chips,
                G.GAME.hands["felijo_tier3_flushfive"].l_mult,
                G.GAME.hands["felijo_tier3_flushfive"].l_chips,
                colours = { (G.GAME.hands["Flush Five"].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands["Flush Five"].level)])
                ,(G.GAME.hands["felijo_tier3_flushfive"].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands["felijo_tier3_flushfive"].level)]) }
            }
        }
    end,
    use = function(self, card, area, copier)
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
            { handname = localize('k_felijo_flushfive_t3_below'), chips = '...', mult = '...', level = '' })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = true
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { mult = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { chips = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = nil
                return true
            end
        }))
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '+1' })
        delay(1.3)
        SMODS.upgrade_poker_hands({hands = {"Flush Five"}, per_level = {chips = G.GAME.hands["Flush Five"].l_chips, mult = G.GAME.hands["Flush Five"].l_mult}, instant = true, from = card})
		SMODS.upgrade_poker_hands({hands = {"felijo_tier2_flushfive"}, per_level = {chips = G.GAME.hands["felijo_tier2_flushfive"].l_chips, mult = G.GAME.hands["felijo_tier2_flushfive"].l_mult}, instant = true, from = card})
        SMODS.upgrade_poker_hands({hands = {"felijo_tier3_flushfive"}, per_level = {chips = G.GAME.hands["felijo_tier3_flushfive"].l_chips, mult = G.GAME.hands["felijo_tier3_flushfive"].l_mult}, instant = true, from = card})
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 },{ mult = 0, chips = 0, handname = '', level = '' })
    end,
    can_use = function(self, card)
        return true
    end,
}

FELIJO.T4Planet {
    key = "felijo_tier4_eris",
    cost = 3,
    pos = { x = 0, y = 1 },
    config = {
		l_chips = 30,
		l_mult = 2,
		l_mult_f = 5,
        hand_type = {"felijo_tier4_flushfive", "Flush Five" },
	},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands["Flush Five"].level, G.GAME.hands["felijo_tier4_flushfive"].level,
                localize('k_felijo_flushfive_t4_below'),
                G.GAME.hands["Flush Five"].l_mult,
                G.GAME.hands["Flush Five"].l_chips,
                G.GAME.hands["felijo_tier4_flushfive"].l_mult,
                G.GAME.hands["felijo_tier4_flushfive"].l_chips,
                colours = { (G.GAME.hands["Flush Five"].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands["Flush Five"].level)])
                ,(G.GAME.hands["felijo_tier4_flushfive"].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands["felijo_tier4_flushfive"].level)]) }
            }
        }
    end,
    use = function(self, card, area, copier)
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
            { handname = localize('k_felijo_flushfive_t4_below'), chips = '...', mult = '...', level = '' })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = true
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { mult = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { chips = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = nil
                return true
            end
        }))
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '+1' })
        delay(1.3)
        SMODS.upgrade_poker_hands({hands = {"Flush Five"}, per_level = {chips = G.GAME.hands["Flush Five"].l_chips, mult = G.GAME.hands["Flush Five"].l_mult}, instant = true, from = card})
		SMODS.upgrade_poker_hands({hands = {"felijo_tier2_flushfive"}, per_level = {chips = G.GAME.hands["felijo_tier2_flushfive"].l_chips, mult = G.GAME.hands["felijo_tier2_flushfive"].l_mult}, instant = true, from = card})
        SMODS.upgrade_poker_hands({hands = {"felijo_tier3_flushfive"}, per_level = {chips = G.GAME.hands["felijo_tier3_flushfive"].l_chips, mult = G.GAME.hands["felijo_tier3_flushfive"].l_mult}, instant = true, from = card})
        SMODS.upgrade_poker_hands({hands = {"felijo_tier4_flushfive"}, per_level = {chips = G.GAME.hands["felijo_tier4_flushfive"].l_chips, mult = G.GAME.hands["felijo_tier4_flushfive"].l_mult}, instant = true, from = card})
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 },{ mult = 0, chips = 0, handname = '', level = '' })
    end,
    can_use = function(self, card)
        return true
    end,
}