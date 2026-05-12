FELIJO.TOGAJoker = SMODS.Joker:extend{
    in_pool = function (self, args)
        return FELIJO.is_mod_loaded("TOGAPack") or false
    end
}

FELIJO.TOGAJoker {
    key = "felijo_bliss",
    atlas = 'togaJokers',
    pos = { x = 1, y = 0 },
    unlocked = true,
    pools = {["FelisJokeria"] = true, ["TOGA"] = true},
    blueprint_compat = false,
    rarity = 2,
    cost = 5,
	set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_toga'), HEX('fd9712'), HEX('ffffff'), 1 )
	end,
    config = { extra = { change = 25, suits = 4, chips = 25 } },
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.change, card.ability.extra.suits, card.ability.extra.chips} }
    end,
    calculate = function(self, card, context)
        if context.joker_main and #context.scoring_hand >= 1 then
            local suit_t = {}
			local suits = 0
			for _, _card in pairs(context.scoring_hand) do
				suit_t[not SMODS.has_no_suit(_card) and _card.base.suit] = true
			end
			for _ in pairs(suit_t) do suits = suits + 1 end
            if suits >= card.ability.extra.suits then
				SMODS.scale_card(card, {
					ref_table = card.ability.extra,
					ref_value = "chips",
					scalar_value = "change", 
				})
            end
            return
                {
                    chips = card.ability.extra.chips,
                }    
        end    
    end
}
FELIJO.TOGAJoker {
    key = "felijo_toga_loic",
    atlas = 'togaJokers',
    pos = { x = 0, y = 0 },
	pools = {["FelisJokeria"] = true, ["TOGA"] = true,},
    unlocked = true,
    blueprint_compat = true,
    rarity = 4,
    cost = 20,
	set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_toga'), HEX('fd9712'), HEX('ffffff'), 1 )
	end,
	config = {
		extra = { 
			mult = 0, m_mult = 2, m_i = 1
		},
		imm = {
			charge = 0, charge_m = 2, 
			cooldown = 0, cooldown_m = 1,
			status = "Charging",
			c_i = 0.5
		}, 
	},
    loc_vars = function(self, info_queue, card)
			if card.ability.imm.status == "Charging" then
					return {
						vars = {
							card.ability.extra.mult, card.ability.extra.m_mult, 
							card.ability.imm.charge, card.ability.imm.charge_m, 
							card.ability.imm.cooldown, card.ability.imm.cooldown_m,
							card.ability.imm.status, card.ability.imm.c_i, card.ability.extra.m_i,
							colours = { HEX('7AFFF6'), HEX('000000'), HEX("004E70"),
							} 
						}
					}
			elseif card.ability.imm.status == "Ready!" then
				return {
						vars = {
							card.ability.extra.mult, card.ability.extra.m_mult, 
							card.ability.imm.charge, card.ability.imm.charge_m, 
							card.ability.imm.cooldown, card.ability.imm.cooldown_m,
							card.ability.imm.status, card.ability.imm.c_i, card.ability.extra.m_i,
							colours = { HEX('7AFFF6'), HEX('000000'), HEX("00D11C"),
							} 
						}
					}
			else
				return {
						vars = {
							card.ability.extra.mult, card.ability.extra.m_mult, 
							card.ability.imm.charge, card.ability.imm.charge_m, 
							card.ability.imm.cooldown, card.ability.imm.cooldown_m,
							card.ability.imm.status, card.ability.imm.c_i, card.ability.extra.m_i,
							colours = { HEX('7AFFF6'), HEX('000000'), HEX("95A2A3"),
							} 
						}
					}
			end
    end,
    calculate = function(self, card, context)
		if context.joker_main then
			if card.ability.imm.cooldown == 0 then
				if card.ability.imm.charge < card.ability.imm.charge_m then
					card.ability.extra.mult = card.ability.extra.mult + (G.GAME.chips * card.ability.extra.m_mult)
					card.ability.imm.charge = card.ability.imm.charge + 1
					if card.ability.imm.charge >= card.ability.imm.charge_m then
						card.ability.imm.status = "Ready!"
						return {
							message = localize("k_felijo_loic2"), 
							sound = "felijo_loic_ready",
							pitch = 1
						}
					end
					return {
						message = localize("k_felijo_loic1"), 
						sound = "felijo_loic_charging",
						pitch = 1+(0.2 * card.ability.imm.charge)
						}
					
				elseif card.ability.imm.charge >= card.ability.imm.charge_m then
					beam = card.ability.extra.mult
					card.ability.extra.mult = 0
					
					card.ability.imm.status = "Cooling"
					card.ability.imm.cooldown = card.ability.imm.cooldown_m
					card.ability.imm.charge = 0
					card.ability.imm.charge_m = card.ability.imm.charge_m + card.ability.imm.c_i
					card.ability.extra.m_mult = card.ability.extra.m_mult + card.ability.extra.m_i
					return {
						mult = beam,
						message = localize("k_felijo_loic3"),
						sound = "felijo_loic_shot",
						pitch = 1,
						beam = card.ability.extra.mult,

					}
				end
			end
			if card.ability.imm.cooldown > 0 and card.ability.imm.cooldown <= card.ability.imm.cooldown_m then
				card.ability.imm.cooldown = card.ability.imm.cooldown - 1 
				if card.ability.imm.cooldown == 0 then
					card.ability.imm.status = "Charging"
					return{message = localize("k_felijo_loic5"),}
				end
				return{message = localize("k_felijo_loic4"),}
			end
		end
    end
}


SMODS.Blind{
	key = 'pin',
	atlas = 'togaBlinds',
	boss_colour = HEX('A58AD5'),
	pos = { x = 0, y = 0 },
	dollars = 6,
	mult = 8.888,
	unlocked = true,
	in_pool = function (self)
        return G.GAME.login or G.GAME.won or false
    end,
	collection_loc_vars = function(self)
		return { key = self.key.."_c" }
	end,
	boss = { min = 4},
	debuff_hand = function(self, cards, hand, handname, check)
		if cards and #cards >= 4 then
			for k, v in ipairs(cards or {}) do
				if v:get_id() < 10 then return false end
			end
		end
		return true
	end
}