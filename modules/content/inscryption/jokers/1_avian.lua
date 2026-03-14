SMODS.Joker { -- Uncommon, Magpie
    atlas = 'inscryptionJokers',
    pos = { x = 8, y = 0 },
    pools = {
		["FelisJokeria"]= true, 
		["Steam"] = true, 
		["Inscryption"]=true,
		["Beast"] = true,		
		["Avian"] = true,  
	},
    key = "felijo_ins_magpie",
	unlocked = true,
	discovered = true,
    rarity = 2,
    cost = 6,
	blueprint_compat = true,
    config = { extra = {chips = 1, mult = 1, xchips = 0.02}, steam = { badges = 1 } },
	set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_ins'), HEX('7f1232'), HEX('f2a655'), 1 )
	end,
    loc_vars = function(self, info_queue, center)
        return {vars = { center.ability.extra.chips, center.ability.extra.mult, center.ability.extra.xchips, (1 + center.ability.extra.xchips * center.ability.steam.badges), colours = { HEX('F0C590'), HEX('351A09')} }}
    end,
	badgeCalc = function (self,card)
		local level = 5
		level = math.max((G.STEAM.user.getPlayerSteamLevel() or 5), 5)
		local totalxp = 5 * level * level + 50 * level				
		card.ability.steam.badges = totalxp / 100
	end,
	
	set_ability = function(self, card, initial, delay_sprites)
		if card.ability and card.ability.extra and card.ability.steam then
			self:badgeCalc(card)
		end
	end,
    calculate = function(self, card, context)
        if context.joker_main then
			self:badgeCalc(card)
            local chips = 1 + (card.ability.extra.xchips * card.ability.steam.badges)
			
            return {
                xchips = chips,
            }
        end
    end,
	load = function(self, card, card_table, other_card)
		self:badgeCalc(card)
    end,
	
}