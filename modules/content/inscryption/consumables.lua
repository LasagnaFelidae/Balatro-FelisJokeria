FELIJO.Consumable = SMODS.Consumable:extend{
    in_pool = function (self, args)
       return false
    end,
	set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_ins'), HEX('7f1232'), HEX('f2a655'), 1 )
	end,
}

SMODS.ConsumableType {
    key = 'felijo_ritual',
    default = 'c_felijo_ins_campfire',
    primary_colour = HEX('B9DDAE'),
    secondary_colour = HEX('8FAA86'),
    collection_rows = { 5, 6 },
    shop_rate = 0.4
}

local upgradablelist = {
	"m_bonus",
	"m_felijo_bonus_t2",
	"m_felijo_bonus_t3",
	"m_mult",
	"m_felijo_mult_t2",
	"m_felijo_mult_t3",
	"m_lucky",
	"m_felijo_lucky_t2",
	"m_felijo_lucky_t3",
	"m_glass",
	"m_felijo_glass_t2",
	"m_felijo_glass_t3",
	"m_steel",
	"m_felijo_steel_t2",
	"m_felijo_steel_t3",
	"m_stone",
	"m_felijo_stone_t2",
	"m_felijo_stone_t3",
	"m_gold",
	"m_felijo_gold_t2",
	"m_felijo_gold_t3",
	"m_crv_superiore",
	"m_felijo_enh_sup",
	"m_felijo_enh_sup_t2",
	"m_felijo_enh_sup_t3",
}

FELIJO.campfire_table = {
    ["m_bonus"]               = { next = "m_felijo_bonus_t2",   break_chance = 0.10 },
    ["m_felijo_bonus_t2"]     = { next = "m_felijo_bonus_t3",   break_chance = 0.30 },
    ["m_felijo_bonus_t3"]     = { next = "m_felijo_bonus_t4",   break_chance = 0.60 }, 

    ["m_mult"]                = { next = "m_felijo_mult_t2",    break_chance = 0.10 },
    ["m_felijo_mult_t2"]      = { next = "m_felijo_mult_t3",    break_chance = 0.30 },
    ["m_felijo_mult_t3"]      = { next = "m_felijo_mult_t4",    break_chance = 0.60 },

    ["m_lucky"]               = { next = "m_felijo_lucky_t2",   break_chance = 0.10 },
    ["m_felijo_lucky_t2"]     = { next = "m_felijo_lucky_t3",   break_chance = 0.30 },
    ["m_felijo_lucky_t3"]     = { next = "m_felijo_lucky_t4",   break_chance = 0.60 },

    ["m_glass"]               = { next = "m_felijo_glass_t2",   break_chance = 0.10 },
    ["m_felijo_glass_t2"]     = { next = "m_felijo_glass_t3",   break_chance = 0.30 },
    ["m_felijo_glass_t3"]     = { next = "m_felijo_glass_t4",   break_chance = 0.60 },

    ["m_steel"]               = { next = "m_felijo_steel_t2",   break_chance = 0.10 },
    ["m_felijo_steel_t2"]     = { next = "m_felijo_steel_t3",   break_chance = 0.30 },
    ["m_felijo_steel_t3"]     = { next = "m_felijo_steel_t4",   break_chance = 0.60 },

    ["m_stone"]               = { next = "m_felijo_stone_t2",   break_chance = 0.10 },
    ["m_felijo_stone_t2"]     = { next = "m_felijo_stone_t3",   break_chance = 0.30 },
    ["m_felijo_stone_t3"]     = { next = "m_felijo_stone_t4",   break_chance = 0.60 },

    ["m_gold"]                = { next = "m_felijo_gold_t2",    break_chance = 0.10 },
    ["m_felijo_gold_t2"]      = { next = "m_felijo_gold_t3",    break_chance = 0.30 },
    ["m_felijo_gold_t3"]      = { next = "m_felijo_gold_t4",    break_chance = 0.60 },
	
	["m_crv_superiore"]       = { next = "m_felijo_enh_sup_t2",    break_chance = 0.10 },
	["m_felijo_enh_sup"]      = { next = "m_felijo_enh_sup_t2",    break_chance = 0.10 },
    ["m_felijo_enh_sup_t2"]   = { next = "m_felijo_enh_sup_t3",    break_chance = 0.30 },
    ["m_felijo_enh_sup_t3"]   = { next = "m_felijo_enh_sup_t4",    break_chance = 0.60 },
}

FELIJO.is_upgradable = function(card)
	if not card or not card.ability or not card.ability.name then
        return false
    end
	for i = 1, #upgradablelist do
		if SMODS.has_enhancement(card, upgradablelist[i]) then return true
	end
	return false
	end
end


FELIJO.Consumable {

    key = 'ins_campfire',
    set = 'felijo_ritual',
	atlas= 'inscryptionCons',
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