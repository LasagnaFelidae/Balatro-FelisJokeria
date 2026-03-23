SMODS.Booster {
    key = "tribe_1",
    weight = 0.05,
    kind = 'felijo_tribe_p', -- You can also use Spectral if you want it to belong to the vanilla kind
    cost = 6,
	atlas = "insRitualBoost",
    pos = { x = 2, y = 1 },
    config = { extra = 3, choose = 1 },
    group_key = "k_felijo_tribe_pack", -- Delete this if you're using `group_name` in `loc_txt`
    draw_hand = false,
	in_pool = function(self,args)
		return false
	end,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra },
            key = self.key:sub(1, -3), -- This uses the description key of the booster without the number at the end. Remove this if your booster doesn't have artwork variants like vanilla
        }
    end,
    ease_background_colour = function(self)
        ease_background_colour_blind(G.STATES.SPECTRAL_PACK)
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
            colours = { G.C.WHITE, lighten(G.C.BLACK, 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
    create_card = function(self, card, i)
        return {
            set = "felijo_tribe",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append =
            "felijo_tribe_p"
        }
    end,
}

SMODS.Booster {
    key = "tribe_2",
    weight = 0.05,
    kind = 'felijo_tribe_p', -- You can also use Spectral if you want it to belong to the vanilla kind
    cost = 6,
	atlas = "insRitualBoost",
    pos = { x = 3, y = 1 },
    config = { extra = 3, choose = 1 },
    group_key = "k_felijo_tribe_pack", -- Delete this if you're using `group_name` in `loc_txt`
    draw_hand = false,
	in_pool = function(self,args)
		return false
	end,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra },
            key = self.key:sub(1, -3), -- This uses the description key of the booster without the number at the end. Remove this if your booster doesn't have artwork variants like vanilla
        }
    end,
    ease_background_colour = function(self)
        ease_background_colour_blind(G.STATES.SPECTRAL_PACK)
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
            colours = { G.C.WHITE, lighten(G.C.BLACK, 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
    create_card = function(self, card, i)
        return {
            set = "felijo_tribe",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append =
            "felijo_tribe_p"
        }
    end,
}

SMODS.Booster {
    key = "ttm_box_normal",
    weight = 0.5,
    kind = 'felijo_ttm_box', -- You can also use Spectral if you want it to belong to the vanilla kind
    cost = 8,
	atlas = "insRitualBoost",
    pos = { x = 0, y = 2 },
    config = { extra = 4, choose = 1 },
    group_key = "k_felijo_ttm_box", -- Delete this if you're using `group_name` in `loc_txt`
    draw_hand = false,
	select_card = 'consumeables',
	in_pool = function(self,args)
		return false
	end,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra },
        }
    end,
    ease_background_colour = function(self)
        ease_background_colour_blind(G.STATES.SPECTRAL_PACK)
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
            colours = { G.C.WHITE, lighten(G.C.BLACK, 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
    create_card = function(self, card, i)
        return {
            set = "felijo_totem_parts",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append =
            "felijo_ttm_box"
        }
    end,
}

SMODS.Booster {
    key = "ttm_box_jumbo",
    weight = 0.5,
    kind = 'felijo_ttm_box', -- You can also use Spectral if you want it to belong to the vanilla kind
    cost = 10,
	atlas = "insRitualBoost",
    pos = { x = 1, y = 2 },
    config = { extra = 6, choose = 2 },
    group_key = "k_felijo_ttm_box", -- Delete this if you're using `group_name` in `loc_txt`
    draw_hand = false,
	select_card = 'consumeables',
	in_pool = function(self,args)
		return false
	end,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra },
        }
    end,
    ease_background_colour = function(self)
        ease_background_colour_blind(G.STATES.SPECTRAL_PACK)
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
            colours = { G.C.WHITE, lighten(G.C.BLACK, 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
    create_card = function(self, card, i)
        return {
            set = "felijo_totem_parts",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append =
            "felijo_ttm_box"
        }
    end,
}