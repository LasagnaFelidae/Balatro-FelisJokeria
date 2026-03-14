superior_enabled = false

if FELIJO.is_mod_loaded("RevosVault") and SMODS.Mods["RevosVault"].config then
	superior_enabled = SMODS.Mods["RevosVault"].config.superior_enabled or false
	else
	superior_enabled = false
end

SMODS.Enhancement {
	key = 'enh_sup',
	atlas = 'tieredEnhancements',
	pos = { x = 0, y = 7 },
	config = { extra = {xchips = 0.33}},
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
	
	no_collection = superior_enabled,
	
	in_pool = function(self)
		return false
	end,
	
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.xchips*100 } }
	end,

	calculate = function(self, card, context)
		if context.main_scoring and context.cardarea == G.play then
			return {
				xchips = math.max(1,(card.base.id * card.ability.extra.xchips))
			}
		end
	end,
}

SMODS.Enhancement {
	key = 'enh_sup_t2',
	atlas = 'tieredEnhancements',
	pos = { x = 1, y = 7 },
	config = { extra = {xchips = 0.45}},
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
		return { vars = { card.ability.extra.xchips*100 } }
	end,

	calculate = function(self, card, context)
		if context.main_scoring and context.cardarea == G.play then
			return {
				xchips = math.max(1,(card.base.id * card.ability.extra.xchips))
			}
		end
	end,
}

SMODS.Enhancement {
	key = 'enh_sup_t3',
	atlas = 'tieredEnhancements',
	pos = { x = 2, y = 7 },
	config = { extra = {xchips = 0.65}},
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
		return { vars = { card.ability.extra.xchips*100 } }
	end,

	calculate = function(self, card, context)
		if context.main_scoring and context.cardarea == G.play then
			return {
				xchips = math.max(1,(card.base.id * card.ability.extra.xchips))
			}
		end
	end,
}

SMODS.Enhancement {
	key = 'enh_sup_t4',
	atlas = 'tieredEnhancements',
	pos = { x = 3, y = 7 },
	config = { extra = {xchips = 0.85}},
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
		return { vars = { card.ability.extra.xchips*100 } }
	end,

	calculate = function(self, card, context)
		if context.main_scoring and context.cardarea == G.play then
			return {
				xchips = math.max(1,(card.base.id * card.ability.extra.xchips))
			}
		end
	end,
}