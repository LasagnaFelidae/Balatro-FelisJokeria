FELIJO.Consumable = SMODS.Consumable:extend{
    in_pool = function (self, args)
       return true
    end,
	set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_ins'), HEX('7f1232'), HEX('f2a655'), 1 )
	end,
}

SMODS.ConsumableType {
    key = 'felijo_ritual',
    default = 'c_felijo_ins_campfire',
    primary_colour = HEX('ffffff'),
    secondary_colour = HEX('8FAA86'),
    collection_rows = { 5, 6 },
    shop_rate = 0.5,
    discovered = false,
	unlocked = true,
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
    key = 'felijo_ritual',
    atlas = "consUndis",
    pos = {x=3, y=0}
}

FELIJO.is_upgradable = function(card)
	if not card or not card.ability or not card.ability.name then
        return false
    end
	for i = 1, #FELIJO.upgradablelist do
		if SMODS.has_enhancement(card, FELIJO.upgradablelist[i]) then return true
	end
	return false
	end
end


FELIJO.Consumable { -- 0 Campfire
    key = 'rit_campfire',
    set = 'felijo_ritual',
	atlas= 'insRitual',
    pos = { x = 0, y = 0 },
    config = { max_highlighted = 1},
    loc_vars = function(self, info_queue, card)
		local v = {card.ability.max_highlighted or 1}
		local next_name = nil
		local break_pct = nil

		if G.hand and #G.hand.highlighted == 1 then
			local current_key = G.hand.highlighted[1].config.center.key
			
			if current_key and FELIJO.campfire_table[current_key] then
				local info = FELIJO.campfire_table[current_key]
				if info.next then
					info_queue[#info_queue + 1] = G.P_CENTERS[info.next]
					
					next_name = localize { type = 'name_text', set = 'Enhanced', key = info.next }
					
					break_pct = math.floor(info.break_chance * 100 + 0.5)
				end
			end
		end
		local display = next_name or localize('k_none')
		local colour = (next_name == nil) and G.C.UI.TEXT_INACTIVE or HEX('757CDC')
		local main_end = {
            {
                n = G.UIT.C,
                config = { align = "bm", padding = 0.02 },
                nodes = {
                    {
                        n = G.UIT.C,
                        config = { align = "m", colour = colour, r = 0.05, padding = 0.05 },
                        nodes = {
                            { n = G.UIT.T, config = { text = ' ' .. display .. ' ', colour = G.C.UI.TEXT_LIGHT, scale = 0.3, shadow = true } },
                        }
                    }
                }
            }
        }
		
		if next_name and break_pct then
			return {vars = { v[1], display, break_pct}, main_end = main_end  }
		else
			return { vars = { v[1], "???", "??" }, main_end = main_end  }
		end
	end,

    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        for i = 1, #G.hand.highlighted do
            local percent = 1.15 - (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.highlighted[i]:flip()
                    play_sound('card1', percent)
                    G.hand.highlighted[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        delay(0.2)
		for i = 1, #G.hand.highlighted do
			local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
			G.E_MANAGER:add_event(Event({
				trigger = 'after', 
				delay = 0.35,
				func = function()
					local current_tier = G.hand.highlighted[i].config.center.key or ""
					local upgrade = FELIJO.campfire_table[current_tier]
						
					if upgrade then
						if pseudorandom('campfire') < (upgrade.break_chance) then
							SMODS.destroy_cards(G.hand.highlighted[i])
						else
							play_sound('tarot2', percent, 0.6)
							G.hand.highlighted[i]:set_ability(upgrade.next, nil, true)
							G.hand.highlighted[i]:juice_up(0.4, 0.4)
						end
					end
					return true
				end
			}))
        end
		delay(0.2)
        for i = 1, #G.hand.highlighted do
            local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.highlighted[i]:flip()
                    play_sound('tarot2', percent, 0.6)
                    G.hand.highlighted[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                G.hand:unhighlight_all()
                return true
            end
        }))
        delay(0.5)
    end,
    can_use = function(self, card)
        if not (G.hand and #G.hand.highlighted > 0 and #G.hand.highlighted <= card.ability.max_highlighted) then
			return false
		end

		for i = 1, #G.hand.highlighted do
			if FELIJO.campfire_table[G.hand.highlighted[i].config.center.key] then
				return true
			end
		end
		
		return false
    end
}

FELIJO.Consumable { -- 2 The Trader
    key = 'rit_trader',
    set = 'felijo_ritual',
	atlas= 'insRitual',
    pos = { x = 2, y = 0 },
    config = { max_highlighted = 2, extra = { odds = 5}},
    loc_vars = function(self, info_queue, card)
		local numerator, denumerator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'felijo_rit_trader')
		return { vars = { card.ability.max_highlighted, numerator, denumerator } }
	end,

    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        for i = 1, #G.hand.highlighted do
            local percent = 1.15 - (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.highlighted[i]:flip()
                    play_sound('card1', percent)
                    G.hand.highlighted[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        delay(0.2)
		for i = 1, #G.hand.highlighted do
			local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
			G.E_MANAGER:add_event(Event({
				trigger = 'after', 
				delay = 0.35,
				func = function()
					local _c = G.hand.highlighted[i].config.center.key or ""
					for _, _pelt in ipairs(FELIJO.trapperTable) do
						if _pelt.key == _c then
							local pelt = _pelt
							SMODS.destroy_cards(G.hand.highlighted[i])
							if SMODS.pseudorandom_probability(card, 'felijo_rit_trader', 1, card.ability.extra.odds) then
								ease_dollars(_pelt.price*2)
							else
								ease_dollars(_pelt.price)
							end
						end					
					end
					return true
				end
			}))
        end
		delay(0.2)
        for i = 1, #G.hand.highlighted do
            local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.highlighted[i]:flip()
                    play_sound('tarot2', percent, 0.6)
                    G.hand.highlighted[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                G.hand:unhighlight_all()
                return true
            end
        }))
        delay(0.5)
    end,
    can_use = function(self, card)
        if not (G.hand and #G.hand.highlighted > 0 and #G.hand.highlighted <= card.ability.max_highlighted) then
			return false
		end

		for i = 1, #G.hand.highlighted do
			if SMODS.has_enhancement(G.hand.highlighted[i], "m_felijo_plt_bny") 
			or SMODS.has_enhancement(G.hand.highlighted[i], "m_felijo_plt_wlf") 
			or SMODS.has_enhancement(G.hand.highlighted[i], "m_felijo_plt_gold") 
			or SMODS.has_enhancement(G.hand.highlighted[i], "m_felijo_plt_olddata")
			or SMODS.has_enhancement(G.hand.highlighted[i], "m_felijo_trn_goldn") then
				return true
			end
		end
		
		return false
    end
}

FELIJO.Consumable { -- 3 The Prospector
    key = 'rit_prospector',
    set = 'felijo_ritual',
	atlas= 'insRitual',
    pos = { x = 3, y = 0 },
    config = { max_highlighted = 2 },
    loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS["m_gold"]
		info_queue[#info_queue + 1] = G.P_CENTERS["m_felijo_gold_t2"]
		info_queue[#info_queue + 1] = G.P_CENTERS["m_felijo_gold_t3"]
		info_queue[#info_queue + 1] = G.P_CENTERS["m_felijo_gold_t4"]
		info_queue[#info_queue + 1] = G.P_CENTERS["m_felijo_trn_goldn"]
		return { vars = { card.ability.max_highlighted } }
	end,
	use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        for i = 1, #G.hand.highlighted do
            local percent = 1.15 - (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.highlighted[i]:flip()
                    play_sound('card1', percent)
                    G.hand.highlighted[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        delay(0.2)
		for i = 1, #G.hand.highlighted do
			local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
			G.E_MANAGER:add_event(Event({
				trigger = 'after', 
				delay = 0.15,
				func = function()
					local upgrade = pseudorandom('prospect', 1, 3)
					if upgrade == 3 then
						play_sound('tarot2', percent, 0.6)
						G.hand.highlighted[i]:set_ability("m_felijo_trn_goldn", nil, true)
						G.hand.highlighted[i]:juice_up(0.4, 0.4)
					else
						play_sound('tarot2', percent, 0.6)
                        gold_c = FELIJO.quick_pool_pick(FELIJO.prospectorTable)
						G.hand.highlighted[i]:set_ability(gold_c, nil, true)
						G.hand.highlighted[i]:juice_up(0.4, 0.4)
					end
					return true
				end
			}))
        end
		delay(0.3)
        for i = 1, #G.hand.highlighted do
            local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.highlighted[i]:flip()
                    play_sound('tarot2', percent, 0.6)
                    G.hand.highlighted[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                G.hand:unhighlight_all()
                return true
            end
        }))
        delay(0.5)
    end,
    can_use = function(self, card)
        if not (G.hand and #G.hand.highlighted > 0 and #G.hand.highlighted <= card.ability.max_highlighted) then
			return false
		end

		for i = 1, #G.hand.highlighted do
			return true
		end
		
		return false
    end
}

FELIJO.Consumable { -- 4 The Tribes
    key = 'rit_tribes',
    set = 'felijo_ritual',
	atlas= 'insRitual',
    pos = { x = 4, y = 0 },
    config = {},
    loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_TAGS["tag_felijo_tag_tribal"]
	end,

    use = function(self, card, area, copier)
		add_tag(Tag("tag_felijo_tag_tribal", false, 'Small')) 
    end,
    can_use = function(self, card)
		return G.jokers and #G.jokers.cards < G.jokers.config.card_limit
	end,
}

FELIJO.Consumable { -- 7 The Trapper
    key = 'rit_trapper',
    set = 'felijo_ritual',
	atlas= 'insRitual',
    pos = { x = 7, y = 0 },
    config = { max_highlighted = 3 },
    loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS["m_felijo_plt_bny"]
		info_queue[#info_queue + 1] = G.P_CENTERS["m_felijo_plt_wlf"]
		info_queue[#info_queue + 1] = G.P_CENTERS["m_felijo_plt_gold"]
		return { vars = { card.ability.max_highlighted } }
	end,
	use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        for i = 1, #G.hand.highlighted do
            local percent = 1.15 - (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'immediate',
                delay = 0.15,
                func = function()
                    G.hand.highlighted[i]:flip()
					pelt_c = FELIJO.quick_pool_pick(FELIJO.trapperTable)
					G.hand.highlighted[i]:set_ability(pelt_c, nil, true)
                    play_sound('card1', percent)
                    G.hand.highlighted[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        delay(0.2)
		for i = 1, #G.hand.highlighted do
			local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
			G.E_MANAGER:add_event(Event({
				trigger = 'after', 
				delay = 0.15,
				func = function()
					play_sound('tarot2', percent, 0.6)
					G.hand.highlighted[i]:juice_up(0.4, 0.4)
					return true
				end
			}))
        end
		delay(0.4)
        for i = 1, #G.hand.highlighted do
            local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.35,
                func = function()
                    G.hand.highlighted[i]:flip()
                    play_sound('tarot2', percent, 0.6)
                    G.hand.highlighted[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                G.hand:unhighlight_all()
                return true
            end
        }))
        delay(0.5)
    end,
    can_use = function(self, card)
        if not (G.hand and #G.hand.highlighted > 0 and #G.hand.highlighted <= card.ability.max_highlighted) then
			return false
		end

		for i = 1, #G.hand.highlighted do
			return true
		end
		
		return false
    end
}

FELIJO.Consumable { -- 8 Lost & Found
    key = 'rit_lostandfound',
    set = 'felijo_ritual',
	atlas= 'insRitual',
    pos = { x = 8, y = 0 },
    config = {},
    loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_TAGS["tag_felijo_tag_totem_box"]
	end,
	can_use = function(self, card)
		return G.felijo_totems
	end,
    use = function(self, card, area, copier)
		add_tag(Tag("tag_felijo_tag_totem_box", false, 'Small')) 
    end,
    in_pool = function(self,args)
        return G.GAME.felijo_totems_enabled or false
    end,
}