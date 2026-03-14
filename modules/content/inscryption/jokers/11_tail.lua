SMODS.Joker { -- Common, loose tail
    atlas = 'inscryptionJokers',
    pos = { x = 0, y = 1 },
    pools = {
	["FelisJokeria"]=true,
	["Inscryption"] = true,
	["Tail"] = true,
	},
    key = "felijo_ins_tail",
	pronouns = "any_all",
	unlocked = true,
	discovered = true,
    rarity = 1,
    cost = 2,
	config = {extra = {mult = 2}},
	set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_ins'), HEX('7f1232'), HEX('f2a655'), 1 )
	end,
    loc_vars = function(self, info_queue, card)
		return { vars = {card.ability.extra.mult, colours = { HEX('F0C590'), HEX('351A09') } } }
    end,
    calculate = function(self, card, context)
		if context.joker_main then
			return {
			mult = card.ability.extra.mult
			}
		end
    end,
    blueprint_compat = true,
}