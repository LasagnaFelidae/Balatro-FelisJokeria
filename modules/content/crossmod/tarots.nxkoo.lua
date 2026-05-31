FELIJO.T2 = SMODS.Consumable:extend{
    in_pool = function (self, args)
       return true
    end,
    hidden = true,
	soul_set = "Tarot",
	soul_rate = 0.003,
    can_repeat_soul = true,
    discovered = false,
	unlocked = true,
}
FELIJO.T3 = SMODS.Consumable:extend{
    in_pool = function (self, args)
       return true
    end,
    hidden = true,
    discovered = false,
	unlocked = true,
	soul_set = "Tarot",
	soul_rate = 0.0005,
    can_repeat_soul = true,
}
FELIJO.T4 = SMODS.Consumable:extend{
    in_pool = function (self, args)
       return true
    end,
    hidden = true,
    discovered = false,
	unlocked = true,
	soul_set = "Tarot",
	soul_rate = 0.00002,
    can_repeat_soul = true,
}

----------------------------------------

SMODS.ConsumableType {
    key = 'felijo_tier2_tarot_mp',
    default = 'c_felijo_tier2_magician_mp',
    primary_colour = G.C.SET.Tarot,
    secondary_colour = SMODS.Gradients.felijo_t2_mp,
    collection_rows = { 6, 6 },
    shop_rate = 0.3,
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
    key = 'felijo_tier2_tarot_mp',
    atlas = "t2Tarots_mp",
    pos = {x=9, y=2},
}

SMODS.ConsumableType {
    key = 'felijo_tier3_tarot_mp',
    default = 'c_felijo_tier3_magician_mp',
    primary_colour = G.C.SET.Tarot,
    secondary_colour = SMODS.Gradients.felijo_t3_mp,
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
SMODS.UndiscoveredSprite{
    key = 'felijo_tier3_tarot_mp',
    atlas = "t3Tarots_mp",
    pos = {x=9, y=2},
}

SMODS.ConsumableType {
    key = 'felijo_tier4_tarot_mp',
    default = 'c_felijo_tier4_magician_mp',
    primary_colour = G.C.SET.Tarot,
    secondary_colour = SMODS.Gradients.felijo_t4_mp,
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
    key = 'felijo_tier4_tarot_mp',
    atlas = "t4Tarots_mp",
    pos = {x=9, y=2},
}

--------------

SMODS.Consumable {
    key = 'ascended_mp',
    set = 'mistarot',
	atlas = 'lover_tarots',
    discovered = false,
	unlocked = true,
    pos = { x = 0, y = 0 },
    config = { max_highlighted = 2, mod_conv = "m_felijo_enh_sup_mp" },
	set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_bd'), HEX('01c1e6'), HEX('ffffff'), 1 )
		badges[#badges+1] = create_badge(localize('k_felijo_revo'), HEX('7E7AFF'), HEX('40093A'), 1 )
	end,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    misprint_original = "c_felijo_ascended"
}

--[[
FELIJO.T2 {
    key = 'fool',
    set = 'vremade_tarot_mp',
    pos = { x = 0, y = 0 },
    config = { max_clones = 2,},
    set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_bd'), HEX('01c1e6'), HEX('ffffff'), 1 )
	end,
    loc_vars = function(self, info_queue, card)
        local fool_c = G.GAME.last_tarot_planet and G.P_CENTERS[G.GAME.last_tarot_planet] or nil
        local last_tarot_planet = fool_c and localize { type = 'name_text', key = fool_c.key, set = fool_c.set } or
            localize('k_none')
        local colour = (not fool_c or fool_c.name == 'The Fool' or fool_c.name == 'The Fool [II]' or fool_c.name == 'The Fool [III]' or fool_c.name == 'The Fool [IV]') and G.C.RED or G.C.GREEN

        if not (not fool_c or fool_c.name == 'The Fool' or fool_c.name == 'The Fool [II]' or fool_c.name == 'The Fool [III]' or fool_c.name == 'The Fool [IV]') then
            info_queue[#info_queue + 1] = fool_c
        end

        local main_end = {
            {
                n = G.UIT.C,
                config = { align = "bm", padding = 0.02 },
                nodes = {
                    {
                        n = G.UIT.C,
                        config = { align = "m", colour = colour, r = 0.05, padding = 0.05 },
                        nodes = {
                            { n = G.UIT.T, config = { text = ' ' .. last_tarot_planet .. ' ', colour = G.C.UI.TEXT_LIGHT, scale = 0.3, shadow = true } },
                        }
                    }
                }
            }
        }

        return { vars = { last_tarot_planet, card.ability.max_clones }, main_end = main_end }
    end,
    use = function(self, card, area, copier)
        for i=0, card.ability.max_clones do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    if G.consumeables.config.card_limit > #G.consumeables.cards then
                        play_sound('timpani')
                        SMODS.add_card({ key = G.GAME.last_tarot_planet })
                        card:juice_up(0.3, 0.5)
                    end
                    return true
                end
            }))
            delay(0.6)
        end
    end,
    can_use = function(self, card)
        return (#G.consumeables.cards < G.consumeables.config.card_limit or card.area == G.consumeables) and
            G.GAME.last_tarot_planet and
            G.GAME.last_tarot_planet ~= 'c_fool'
    end
}
]]--
FELIJO.T2 {
    key = 't2_magician_mp',
    set = 'felijo_tier2_tarot_mp',
	atlas = 't2Tarots_mp',

    pos = { x = 1, y = 0 },
    config = { max_highlighted = 2, mod_conv = 'm_felijo_lucky_t2_mp' },
    set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_bd'), HEX('01c1e6'), HEX('ffffff'), 1 )
	end,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    misprint_original = "c_felijo_t2_magician"
}

FELIJO.T2 {
    key = 't2_empress_mp',
    set = 'felijo_tier2_tarot_mp',
	atlas = 't2Tarots_mp',

    pos = { x = 3, y = 0 },
    config = { max_highlighted = 2, mod_conv = 'm_felijo_mult_t2_mp' },
    set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_bd'), HEX('01c1e6'), HEX('ffffff'), 1 )
	end,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    misprint_original = "c_felijo_t2_empress"

}

FELIJO.T2 {
    key = 't2_heirophant_mp',
    set = 'felijo_tier2_tarot_mp',
	atlas = 't2Tarots_mp',

    pos = { x = 5, y = 0 },
    config = { max_highlighted = 2, mod_conv = 'm_felijo_bonus_t2_mp' },
    set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_bd'), HEX('01c1e6'), HEX('ffffff'), 1 )
	end,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    misprint_original = "c_felijo_t2_heirophant"
}
FELIJO.T2 {
    key = 't2_lovers_mp',
    set = 'felijo_tier2_tarot_mp',
	atlas = 't2Tarots_mp',

    pos = { x = 6, y = 0 },
    config = { max_highlighted = 1, mod_conv = 'm_felijo_wild_t2_mp' },
    set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_bd'), HEX('01c1e6'), HEX('ffffff'), 1 )
	end,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    misprint_original = "c_felijo_t2_lovers"
}

FELIJO.T2 {
    key = 't2_chariot_mp',
    set = 'felijo_tier2_tarot_mp',
	atlas = 't2Tarots_mp',

    pos = { x = 7, y = 0 },
    config = { max_highlighted = 1, mod_conv = 'm_felijo_steel_t2_mp' },
    set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_bd'), HEX('01c1e6'), HEX('ffffff'), 1 )
	end,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    misprint_original = "c_felijo_t2_chariot"
}
FELIJO.T2 {
    key = 't2_justice_mp',
    set = 'felijo_tier2_tarot_mp',
	atlas = 't2Tarots_mp',

    pos = { x = 8, y = 0 },
    config = { max_highlighted = 2, mod_conv = 'm_felijo_glass_t2_mp' },
    set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_bd'), HEX('01c1e6'), HEX('ffffff'), 1 )
	end,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    misprint_original = "c_felijo_t2_justice"
}
FELIJO.T2 {
    key = 't2_devil_mp',
    set = 'felijo_tier2_tarot_mp',
	atlas = 't2Tarots_mp',

    pos = { x = 5, y = 1 },
    config = { max_highlighted = 1, mod_conv = 'm_felijo_gold_t2_mp' },
    set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_bd'), HEX('01c1e6'), HEX('ffffff'), 1 )
	end,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    misprint_original = "c_felijo_t2_devil"
}

FELIJO.T2 {
    key = 't2_tower_mp',
    set = 'felijo_tier2_tarot_mp',
	atlas = 't2Tarots_mp',

    pos = { x = 6, y = 1 },
    config = { max_highlighted = 1, mod_conv = 'm_felijo_stone_t2_mp' },
    set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_bd'), HEX('01c1e6'), HEX('ffffff'), 1 )
	end,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    misprint_original = "c_felijo_t2_tower"
}

FELIJO.T2 {
    key = 't2_ascended_mp',
    set = 'felijo_tier2_tarot_mp',
	atlas = 't2Tarots_mp',

    pos = { x = 2, y = 2 },
    config = { max_highlighted = 2, mod_conv = 'm_felijo_enh_sup_t2_mp' },
	set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_bd'), HEX('01c1e6'), HEX('ffffff'), 1 )
		badges[#badges+1] = create_badge(localize('k_felijo_revo'), HEX('7E7AFF'), HEX('40093A'), 1 )
	end,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    misprint_original = "c_felijo_t2_ascended"
}
----

FELIJO.T3 {
    key = 't3_magician_mp',
    set = 'felijo_tier3_tarot_mp',
	atlas = 't3Tarots_mp',

    pos = { x = 1, y = 0 },
    config = { max_highlighted = 2, mod_conv = 'm_felijo_lucky_t3_mp' },
    set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_bd'), HEX('01c1e6'), HEX('ffffff'), 1 )
	end,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    misprint_original = "c_felijo_t3_magician"
}

FELIJO.T3 {
    key = 't3_empress_mp',
    set = 'felijo_tier3_tarot_mp',
	atlas = 't3Tarots_mp',

    pos = { x = 3, y = 0 },
    config = { max_highlighted = 2, mod_conv = 'm_felijo_mult_t3_mp' },
    set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_bd'), HEX('01c1e6'), HEX('ffffff'), 1 )
	end,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    misprint_original = "c_felijo_t3_empress"

}

FELIJO.T3 {
    key = 't3_heirophant_mp',
    set = 'felijo_tier3_tarot_mp',
	atlas = 't3Tarots_mp',

    pos = { x = 5, y = 0 },
    config = { max_highlighted = 2, mod_conv = 'm_felijo_bonus_t3_mp' },
    set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_bd'), HEX('01c1e6'), HEX('ffffff'), 1 )
	end,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    misprint_original = "c_felijo_t3_heirophant"
}
FELIJO.T3 {
    key = 't3_lovers_mp',
    set = 'felijo_tier3_tarot_mp',
	atlas = 't3Tarots_mp',

    pos = { x = 6, y = 0 },
    config = { max_highlighted = 1, mod_conv = 'm_felijo_wild_t3_mp' },
    set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_bd'), HEX('01c1e6'), HEX('ffffff'), 1 )
	end,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    misprint_original = "c_felijo_t3_lovers"
}
FELIJO.T3 {
    key = 't3_chariot_mp',
    set = 'felijo_tier3_tarot_mp',
	atlas = 't3Tarots_mp',

    pos = { x = 7, y = 0 },
    config = { max_highlighted = 1, mod_conv = 'm_felijo_steel_t3_mp' },
    set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_bd'), HEX('01c1e6'), HEX('ffffff'), 1 )
	end,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    misprint_original = "c_felijo_t3_chariot"
}
FELIJO.T3 {
    key = 't3_justice_mp',
    set = 'felijo_tier3_tarot_mp',
	atlas = 't3Tarots_mp',

    pos = { x = 8, y = 0 },
    config = { max_highlighted = 2, mod_conv = 'm_felijo_glass_t3_mp' },
    set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_bd'), HEX('01c1e6'), HEX('ffffff'), 1 )
	end,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    misprint_original = "c_felijo_t3_justice"
}
FELIJO.T3 {
    key = 't3_devil_mp',
    set = 'felijo_tier3_tarot_mp',
	atlas = 't3Tarots_mp',

    pos = { x = 5, y = 1 },
    config = { max_highlighted = 1, mod_conv = 'm_felijo_gold_t3_mp' },
    set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_bd'), HEX('01c1e6'), HEX('ffffff'), 1 )
	end,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    misprint_original = "c_felijo_t3_devil"
}
FELIJO.T3 {
    key = 't3_tower_mp',
    set = 'felijo_tier3_tarot_mp',
	atlas = 't3Tarots_mp',

    pos = { x = 6, y = 1 },
    config = { max_highlighted = 1, mod_conv = 'm_felijo_stone_t3_mp' },
    set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_bd'), HEX('01c1e6'), HEX('ffffff'), 1 )
	end,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    misprint_original = "c_felijo_t3_tower"
}

FELIJO.T3 {
    key = 't3_ascended_mp',
    set = 'felijo_tier3_tarot_mp',
	atlas = 't3Tarots_mp',

    pos = { x = 2, y = 2 },
    config = { max_highlighted = 2, mod_conv = 'm_felijo_enh_sup_t3_mp' },
	set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_bd'), HEX('01c1e6'), HEX('ffffff'), 1 )
		badges[#badges+1] = create_badge(localize('k_felijo_revo'), HEX('7E7AFF'), HEX('40093A'), 1 )
	end,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    misprint_original = "c_felijo_t3_ascended"
}
---


FELIJO.T4 {
    key = 't4_magician_mp',
    set = 'felijo_tier4_tarot_mp',
	atlas = 't4Tarots_mp',

    pos = { x = 1, y = 0 },
    config = { max_highlighted = 2, mod_conv = 'm_felijo_lucky_t4_mp' },
    set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_bd'), HEX('01c1e6'), HEX('ffffff'), 1 )
	end,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    misprint_original = "c_felijo_t4_magician"
}

FELIJO.T4 {
    key = 't4_empress_mp',
    set = 'felijo_tier4_tarot_mp',
	atlas = 't4Tarots_mp',

    pos = { x = 3, y = 0 },
    config = { max_highlighted = 2, mod_conv = 'm_felijo_mult_t4_mp' },
    set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_bd'), HEX('01c1e6'), HEX('ffffff'), 1 )
	end,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    misprint_original = "c_felijo_t4_empress"

}

FELIJO.T4 {
    key = 't4_heirophant_mp',
    set = 'felijo_tier4_tarot_mp',
	atlas = 't4Tarots_mp',

    pos = { x = 5, y = 0 },
    config = { max_highlighted = 2, mod_conv = 'm_felijo_bonus_t4_mp' },
    set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_bd'), HEX('01c1e6'), HEX('ffffff'), 1 )
	end,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    misprint_original = "c_felijo_t4_heirophant"
}
FELIJO.T4 {
    key = 't4_lovers_mp',
    set = 'felijo_tier4_tarot_mp',
	atlas = 't4Tarots_mp',

    pos = { x = 6, y = 0 },
    config = { max_highlighted = 1, mod_conv = 'm_felijo_wild_t4_mp' },
    set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_bd'), HEX('01c1e6'), HEX('ffffff'), 1 )
	end,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    misprint_original = "c_felijo_t4_lovers"
}
FELIJO.T4 {
    key = 't4_chariot_mp',
    set = 'felijo_tier4_tarot_mp',
	atlas = 't4Tarots_mp',

    pos = { x = 7, y = 0 },
    config = { max_highlighted = 1, mod_conv = 'm_felijo_steel_t4_mp' },
    set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_bd'), HEX('01c1e6'), HEX('ffffff'), 1 )
	end,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    misprint_original = "c_felijo_t4_chariot"
}
FELIJO.T4 {
    key = 't4_justice_mp',
    set = 'felijo_tier4_tarot_mp',
	atlas = 't4Tarots_mp',

    pos = { x = 8, y = 0 },
    config = { max_highlighted = 2, mod_conv = 'm_felijo_glass_t4_mp' },
    set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_bd'), HEX('01c1e6'), HEX('ffffff'), 1 )
	end,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    misprint_original = "c_felijo_t4_justice"
}
FELIJO.T4 {
    key = 't4_devil_mp',
    set = 'felijo_tier4_tarot_mp',
	atlas = 't4Tarots_mp',

    pos = { x = 5, y = 1 },
    config = { max_highlighted = 1, mod_conv = 'm_felijo_gold_t4_mp' },
    set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_bd'), HEX('01c1e6'), HEX('ffffff'), 1 )
	end,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    misprint_original = "c_felijo_t4_devil"
}

FELIJO.T4 {
    key = 't4_tower_mp',
    set = 'felijo_tier4_tarot_mp',
	atlas = 't4Tarots_mp',

    pos = { x = 6, y = 1 },
    config = { max_highlighted = 1, mod_conv = 'm_felijo_stone_t4_mp' },
    set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_bd'), HEX('01c1e6'), HEX('ffffff'), 1 )
	end,
    
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    misprint_original = "c_felijo_t4_tower"
}

FELIJO.T4 {
    key = 't4_ascended_mp',
    set = 'felijo_tier4_tarot_mp',
	atlas = 't4Tarots_mp',

    pos = { x = 2, y = 2 },
    config = { max_highlighted = 2, mod_conv = 'm_felijo_enh_sup_t4_mp' },
	set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_bd'), HEX('01c1e6'), HEX('ffffff'), 1 )
		badges[#badges+1] = create_badge(localize('k_felijo_revo'), HEX('7E7AFF'), HEX('40093A'), 1 )
	end,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    misprint_original = "c_felijo_t4_ascended"
}