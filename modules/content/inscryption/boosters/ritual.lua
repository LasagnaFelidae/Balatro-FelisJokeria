SMODS.Booster {
    key = "ritual_normal_1",
    weight = 0.7,
    kind = 'felijo_ritual_p', -- You can also use Spectral if you want it to belong to the vanilla kind
	atlas = "insRitualBoost",
    cost = 4,
    pos = { x = 0, y = 0 },
    config = { extra = 3, choose = 1 },
    group_key = "k_felijo_ritual_pack", -- Delete this if you're using `group_name` in `loc_txt`
    draw_hand = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra },
            key = self.key:sub(1, -3), -- This uses the description key of the booster without the number at the end. Remove this if your booster doesn't have artwork variants like vanilla
        }
    end,
    ease_background_colour = function(self)
        ease_background_colour_blind(G.STATES.PLANET_PACK)
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.1,
            initialize = true,
            lifespan = 3,
            speed = 0.2,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.TAROT, lighten(G.C.GREEN, 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
    create_card = function(self, card, i)
        return {
            set = "felijo_ritual",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = false,
            key_append =
            "felijo_ritual_p"
        }
    end,
}
SMODS.Booster {
    key = "ritual_normal_2",
    weight = 0.7,
    kind = 'felijo_ritual_p', -- You can also use Spectral if you want it to belong to the vanilla kind
	atlas = "insRitualBoost",
    cost = 4,
    pos = { x = 1, y = 0 },
    config = { extra = 3, choose = 1 },
    group_key = "k_felijo_ritual_pack", -- Delete this if you're using `group_name` in `loc_txt`
    draw_hand = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra },
            key = self.key:sub(1, -3), -- This uses the description key of the booster without the number at the end. Remove this if your booster doesn't have artwork variants like vanilla
        }
    end,
    ease_background_colour = function(self)
        ease_background_colour_blind(G.STATES.PLANET_PACK)
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.1,
            initialize = true,
            lifespan = 3,
            speed = 0.2,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.TAROT, lighten(G.C.GREEN, 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
    create_card = function(self, card, i)
        return {
            set = "felijo_ritual",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = false,
            key_append =
            "felijo_ritual_p"
        }
    end,
}
SMODS.Booster {
    key = "ritual_jumbo_1",
    weight = 0.35,
    kind = 'felijo_ritual_p', -- You can also use Spectral if you want it to belong to the vanilla kind
	atlas = "insRitualBoost",
    cost = 6,
    pos = { x = 2, y = 0 },
    config = { extra = 4, choose = 1 },
    group_key = "k_felijo_ritual_pack", -- Delete this if you're using `group_name` in `loc_txt`
    draw_hand = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra },
            key = self.key:sub(1, -3), -- This uses the description key of the booster without the number at the end. Remove this if your booster doesn't have artwork variants like vanilla
        }
    end,
    ease_background_colour = function(self)
        ease_background_colour_blind(G.STATES.PLANET_PACK)
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.1,
            initialize = true,
            lifespan = 3,
            speed = 0.2,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.TAROT, lighten(G.C.GREEN, 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
    create_card = function(self, card, i)
        return {
            set = "felijo_ritual",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = false,
            key_append =
            "felijo_ritual_p"
        }
    end,
}
SMODS.Booster {
    key = "ritual_jumbo_2",
    weight = 0.35,
    kind = 'felijo_ritual_p', -- You can also use Spectral if you want it to belong to the vanilla kind
	atlas = "insRitualBoost",
    cost = 6,
    pos = { x = 3, y = 0 },
    config = { extra = 4, choose = 1 },
    group_key = "k_felijo_ritual_pack", -- Delete this if you're using `group_name` in `loc_txt`
    draw_hand = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra },
            key = self.key:sub(1, -3), -- This uses the description key of the booster without the number at the end. Remove this if your booster doesn't have artwork variants like vanilla
        }
    end,
    ease_background_colour = function(self)
        ease_background_colour_blind(G.STATES.PLANET_PACK)
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.1,
            initialize = true,
            lifespan = 3,
            speed = 0.2,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.TAROT, lighten(G.C.GREEN, 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
    create_card = function(self, card, i)
        return {
            set = "felijo_ritual",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append =
            "felijo_ritual_p"
        }
    end,
}
SMODS.Booster {
    key = "ritual_mega_1",
    weight = 0.1,
    kind = 'felijo_ritual_p', -- You can also use Spectral if you want it to belong to the vanilla kind
	atlas = "insRitualBoost",
    cost = 8,
    pos = { x = 0, y = 1 },
    config = { extra = 5, choose = 2 },
    group_key = "k_felijo_ritual_pack", -- Delete this if you're using `group_name` in `loc_txt`
    draw_hand = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra },
            key = self.key:sub(1, -3), -- This uses the description key of the booster without the number at the end. Remove this if your booster doesn't have artwork variants like vanilla
        }
    end,
    ease_background_colour = function(self)
        ease_background_colour_blind(G.STATES.PLANET_PACK)
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.1,
            initialize = true,
            lifespan = 3,
            speed = 0.2,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.TAROT, lighten(G.C.GREEN, 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
    create_card = function(self, card, i)
        return {
            set = "felijo_ritual",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append =
            "felijo_ritual_p"
        }
    end,
}
SMODS.Booster {
    key = "ritual_mega_2",
    weight = 0.1,
    kind = 'felijo_ritual_p', -- You can also use Spectral if you want it to belong to the vanilla kind
    cost = 8,
	atlas = "insRitualBoost",
    pos = { x = 1, y = 1 },
    config = { extra = 5, choose = 2 },
    group_key = "k_felijo_ritual_pack", -- Delete this if you're using `group_name` in `loc_txt`
    draw_hand = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra },
            key = self.key:sub(1, -3), -- This uses the description key of the booster without the number at the end. Remove this if your booster doesn't have artwork variants like vanilla
        }
    end,
    ease_background_colour = function(self)
        ease_background_colour_blind(G.STATES.PLANET_PACK)
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.1,
            initialize = true,
            lifespan = 3,
            speed = 0.2,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.TAROT, lighten(G.C.GREEN, 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
    create_card = function(self, card, i)
        return {
            set = "felijo_ritual",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append =
            "felijo_ritual_p"
        }
    end,
}