FELIJO.T2 = SMODS.Consumable:extend{
    in_pool = function (self, args)
       return true
    end,
	soul_set = "Tarot",
	soul_rate = 0.3,
}
FELIJO.T3 = SMODS.Consumable:extend{
    in_pool = function (self, args)
       return true
    end,
	soul_set = "Tarot",
	soul_rate = 0.3,
}
FELIJO.T4 = SMODS.Consumable:extend{
    in_pool = function (self, args)
       return true
    end,
	soul_set = "Tarot",
	soul_rate = 0.1,
}

----------------------------------------

SMODS.ConsumableType {
    key = 'felijo_tier2_tarot',
    default = 'c_felijo_tier2_magician',
    primary_colour = G.C.SET.Tarot,
    secondary_colour = HEX('ED9AA8'),
    collection_rows = { 6, 1 },
    shop_rate = 0.3
}

SMODS.ConsumableType {
    key = 'felijo_tier3_tarot',
    default = 'c_felijo_tier3_magician',
    primary_colour = G.C.SET.Tarot,
    secondary_colour = HEX('8096D2'),
    collection_rows = { 6, 1 },
    shop_rate = 0.2
}

SMODS.ConsumableType {
    key = 'felijo_tier4_tarot',
    default = 'c_felijo_tier4_magician',
    primary_colour = G.C.SET.Tarot,
    secondary_colour = HEX('F0CF99'),
    collection_rows = { 6, 1 },
    shop_rate = 0.1
}

--------------

SMODS.Consumable {
    key = 'ascended',
    set = 'Tarot',
	atlas = 'c_tarots',
	discovered = true,
	unlocked = true,
    pos = { x = 0, y = 0 },
    config = { max_highlighted = 2, mod_conv = G.superior_enhancement },
	set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_revo'), HEX('7E7AFF'), HEX('40093A'), 1 )
	end,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end
}

--------------

FELIJO.T2 {
    key = 't2_magician',
    set = 'felijo_tier2_tarot',
	atlas = 't2Tarots',
	discovered = true,
	unlocked = true,
    pos = { x = 1, y = 0 },
    config = { max_highlighted = 2, mod_conv = 'm_felijo_lucky_t2' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end
}

FELIJO.T2 {
    key = 't2_empress',
    set = 'felijo_tier2_tarot',
	atlas = 't2Tarots',
	discovered = true,
	unlocked = true,
    pos = { x = 3, y = 0 },
    config = { max_highlighted = 2, mod_conv = 'm_felijo_mult_t2' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,

}

FELIJO.T2 {
    key = 't2_heirophant',
    set = 'felijo_tier2_tarot',
	atlas = 't2Tarots',
	discovered = true,
	unlocked = true,
    pos = { x = 5, y = 0 },
    config = { max_highlighted = 2, mod_conv = 'm_felijo_bonus_t2' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
}
FELIJO.T2 {
    key = 't2_chariot',
    set = 'felijo_tier2_tarot',
	atlas = 't2Tarots',
	discovered = true,
	unlocked = true,
    pos = { x = 7, y = 0 },
    config = { max_highlighted = 1, mod_conv = 'm_felijo_steel_t2' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
}
FELIJO.T2 {
    key = 't2_justice',
    set = 'felijo_tier2_tarot',
	atlas = 't2Tarots',
	discovered = true,
	unlocked = true,
    pos = { x = 8, y = 0 },
    config = { max_highlighted = 2, mod_conv = 'm_felijo_glass_t2' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
}
FELIJO.T2 {
    key = 't2_devil',
    set = 'felijo_tier2_tarot',
	atlas = 't2Tarots',
	discovered = true,
	unlocked = true,
    pos = { x = 5, y = 1 },
    config = { max_highlighted = 1, mod_conv = 'm_felijo_gold_t2' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
}

FELIJO.T2 {
    key = 't2_ascended',
    set = 'felijo_tier2_tarot',
	atlas = 't2Tarots',
	discovered = true,
	unlocked = true,
    pos = { x = 2, y = 2 },
    config = { max_highlighted = 2, mod_conv = 'm_felijo_enh_sup_t2' },
	set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_revo'), HEX('7E7AFF'), HEX('40093A'), 1 )
	end,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end
}
----

FELIJO.T3 {
    key = 't3_magician',
    set = 'felijo_tier3_tarot',
	atlas = 't3Tarots',
	discovered = true,
	unlocked = true,
    pos = { x = 1, y = 0 },
    config = { max_highlighted = 2, mod_conv = 'm_felijo_lucky_t3' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end
}

FELIJO.T3 {
    key = 't3_empress',
    set = 'felijo_tier3_tarot',
	atlas = 't3Tarots',
	discovered = true,
	unlocked = true,
    pos = { x = 3, y = 0 },
    config = { max_highlighted = 2, mod_conv = 'm_felijo_mult_t3' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,

}

FELIJO.T3 {
    key = 't3_heirophant',
    set = 'felijo_tier3_tarot',
	atlas = 't3Tarots',
	discovered = true,
	unlocked = true,
    pos = { x = 5, y = 0 },
    config = { max_highlighted = 2, mod_conv = 'm_felijo_bonus_t3' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
}
FELIJO.T3 {
    key = 't3_chariot',
    set = 'felijo_tier3_tarot',
	atlas = 't3Tarots',
	discovered = true,
	unlocked = true,
    pos = { x = 7, y = 0 },
    config = { max_highlighted = 1, mod_conv = 'm_felijo_steel_t3' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
}
FELIJO.T3 {
    key = 't3_justice',
    set = 'felijo_tier3_tarot',
	atlas = 't3Tarots',
	discovered = true,
	unlocked = true,
    pos = { x = 8, y = 0 },
    config = { max_highlighted = 2, mod_conv = 'm_felijo_glass_t3' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
}
FELIJO.T3 {
    key = 't3_devil',
    set = 'felijo_tier3_tarot',
	atlas = 't3Tarots',
	discovered = true,
	unlocked = true,
    pos = { x = 5, y = 1 },
    config = { max_highlighted = 1, mod_conv = 'm_felijo_gold_t3' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
}

FELIJO.T3 {
    key = 't3_ascended',
    set = 'felijo_tier3_tarot',
	atlas = 't2Tarots',
	discovered = true,
	unlocked = true,
    pos = { x = 2, y = 2 },
    config = { max_highlighted = 2, mod_conv = 'm_felijo_enh_sup_t3' },
	set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_revo'), HEX('7E7AFF'), HEX('40093A'), 1 )
	end,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end
}
---


FELIJO.T4 {
    key = 't4_magician',
    set = 'felijo_tier4_tarot',
	atlas = 't4Tarots',
	discovered = true,
	unlocked = true,
    pos = { x = 1, y = 0 },
    config = { max_highlighted = 2, mod_conv = 'm_felijo_lucky_t4' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end
}

FELIJO.T4 {
    key = 't4_empress',
    set = 'felijo_tier4_tarot',
	atlas = 't4Tarots',
	discovered = true,
	unlocked = true,
    pos = { x = 3, y = 0 },
    config = { max_highlighted = 2, mod_conv = 'm_felijo_mult_t4' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,

}

FELIJO.T4 {
    key = 't4_heirophant',
    set = 'felijo_tier4_tarot',
	atlas = 't4Tarots',
	discovered = true,
	unlocked = true,
    pos = { x = 5, y = 0 },
    config = { max_highlighted = 2, mod_conv = 'm_felijo_bonus_t4' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
}
FELIJO.T4 {
    key = 't4_chariot',
    set = 'felijo_tier4_tarot',
	atlas = 't4Tarots',
	discovered = true,
	unlocked = true,
    pos = { x = 7, y = 0 },
    config = { max_highlighted = 1, mod_conv = 'm_felijo_steel_t4' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
}
FELIJO.T4 {
    key = 't4_justice',
    set = 'felijo_tier4_tarot',
	atlas = 't4Tarots',
	discovered = true,
	unlocked = true,
    pos = { x = 8, y = 0 },
    config = { max_highlighted = 2, mod_conv = 'm_felijo_glass_t4' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
}
FELIJO.T4 {
    key = 't4_devil',
    set = 'felijo_tier4_tarot',
	atlas = 't4Tarots',
	discovered = true,
	unlocked = true,
    pos = { x = 5, y = 1 },
    config = { max_highlighted = 1, mod_conv = 'm_felijo_gold_t4' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
}

FELIJO.T4 {
    key = 't4_ascended',
    set = 'felijo_tier4_tarot',
	atlas = 't4Tarots',
	discovered = true,
	unlocked = true,
    pos = { x = 2, y = 2 },
    config = { max_highlighted = 2, mod_conv = 'm_felijo_enh_sup_t4' },
	set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_revo'), HEX('7E7AFF'), HEX('40093A'), 1 )
	end,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end
}