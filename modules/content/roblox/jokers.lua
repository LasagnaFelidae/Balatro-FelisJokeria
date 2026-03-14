-- FOOD JOKERS
--
--

-- Pizza (Common)
SMODS.Joker {
    atlas = 'rbxJokers',
    pos = { x = 5, y = 0 },
    pools = {
		["FelisJokeria"] = true, 
		["Roblox"] = true, 
		["Food"] = true, 
		["Roblox_Food"] = true, 
	},
    key = "felijo_rbx_pizza",
    rarity = 1,
    cost = 5,
	unlocked = true,
	discovered = true,
	blueprint_compat = false,
	
	config = { extra = { chips = 150, chips_mod = 10} },
	
	set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_rbx'), HEX('00008b'), HEX('ffffff'), 1 )
	end,
	
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.chips, card.ability.extra.chips_mod} }
	end,
	
	add_to_deck = function(self, card, from_debuff)
		play_sound('felijo_rbx_pizza_add', 1)	
	end,
	
    calculate = function(self, card, context)
		if context.after and not context.blueprint then
            if card.ability.extra.chips - card.ability.extra.chips_mod <= 0 then
                SMODS.destroy_cards(card, nil, nil, true)
            else
                card.ability.extra.chips = card.ability.extra.chips - card.ability.extra.chips_mod
                return {
                    message = localize { type = 'variable', key = 'a_chips_minus', vars = { card.ability.extra.chips_mod } },
					sound = "felijo_rbx_pizza_eat",
					pitch = 1,
                    colour = G.C.CHIPS
                }
            end
        end
        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end
	end,
}

-- RobloTim's Chavez Burrito (Common)
SMODS.Joker {
    atlas = 'rbxJokers',
    pos = { x = 2, y = 0 },
    pools = {
		["FelisJokeria"] = true, 
		["Roblox"] = true, 
		["Food"] = true, 
		["Roblox_Food"] = true, 
	},
    key = "felijo_rbx_burrito",
	blueprint_compat = false,
    rarity = 1,
    cost = 6,
	unlocked = true,
	discovered = true,
	config = { extra = { mult = 18, mult_mod = 3} },
	
	set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_rbx'), HEX('00008b'), HEX('ffffff'), 1 )
	end,
	
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult, card.ability.extra.mult_mod} }
	end,
	
	add_to_deck = function(self, card, from_debuff)
		play_sound('felijo_rbx_burrito_add', 1)	
	end,
	
    calculate = function(self, card, context)
		if context.after and not context.blueprint then
            if card.ability.extra.mult - card.ability.extra.mult_mod <= 0 then
                SMODS.destroy_cards(card, nil, nil, true)
            else
                card.ability.extra.mult = card.ability.extra.mult - card.ability.extra.mult_mod
                return {
                    message = localize { type = 'variable', key = 'a_mult_minus', vars = { card.ability.extra.mult_mod } },
					sound = "felijo_rbx_burrito_eat",
					pitch = 1,
                    colour = G.C.MULT
                }
            end
        end
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
	end,
    
}

-- Turkey Leg (Uncommon)
SMODS.Joker {
    atlas = 'rbxJokers',
    pos = { x = 8, y = 0 },
    pools = {
		["FelisJokeria"] = true, 
		["Roblox"] = true, 
		["Food"] = true, 
		["Roblox_Food"] = true, 
	},
    key = "felijo_rbx_turkey",
	blueprint_compat = false,
    rarity = 2,
    cost = 7,
	unlocked = true,
	discovered = true,	
	config = { extra = { xmult = 2.5, xmult_mod = 0.25} },
	
	set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_rbx'), HEX('00008b'), HEX('ffffff'), 1 )
	end,
	
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.xmult, card.ability.extra.xmult_mod} }
	end,
	
	add_to_deck = function(self, card, from_debuff)
		play_sound('felijo_rbx_turkey_add', 1)	
	end,
	
    calculate = function(self, card, context)
		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            if card.ability.extra.xmult - card.ability.extra.xmult_mod <= 1 then
                SMODS.destroy_cards(card, nil, nil, true)
            else
                card.ability.extra.xmult = card.ability.extra.xmult - card.ability.extra.xmult_mod
                return {
                    message = localize { type = 'variable', key = 'a_mult_minus', vars = { card.ability.extra.xmult_mod } },
					sound = "felijo_rbx_turkey_eat",
					pitch = 1,
                    colour = G.C.MULT
                }
            end
        end
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult
            }
        end
	end,
    
}

-- Cheezburger (Uncommon)
SMODS.Joker {
    atlas = 'rbxJokers',
    pos = { x = 3, y = 0 },
    pools = {
		["FelisJokeria"] = true, 
		["Roblox"] = true, 
		["Food"] = true, 
		["Roblox_Food"] = true, 
	},
    key = "felijo_rbx_cheezburger",
	blueprint_compat = false,
    rarity = 2,
    cost = 8,
	unlocked = true,
	discovered = true,	
	config = { extra = { xchips = 3, xchips_mod = 0.5} },
	
	set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_rbx'), HEX('00008b'), HEX('ffffff'), 1 )
	end,
	
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.xchips, card.ability.extra.xchips_mod} }
	end,
	
	add_to_deck = function(self, card, from_debuff)
		play_sound('felijo_rbx_cheezburger_add', 1)	
	end,
	
    calculate = function(self, card, context)
		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            if card.ability.extra.xchips - card.ability.extra.xchips_mod <= 1 then
                SMODS.destroy_cards(card, nil, nil, true)
            else
                card.ability.extra.xchips = card.ability.extra.xchips - card.ability.extra.xchips_mod
                return {
                    message = localize { type = 'variable', key = 'a_chips_minus', vars = { card.ability.extra.xchips_mod } },
                    colour = G.C.CHIPS,
					sound = "felijo_rbx_cheezburger_eat",
					pitch = 1,
                }
            end
        end
        if context.joker_main then
            return {
                xchips = card.ability.extra.xchips
            }
        end
	end,
    
}

-- Space Sandwich (Uncommon)
SMODS.Joker {
    atlas = 'rbxJokers',
    pos = { x = 4, y = 0 },
    pools = {
		["FelisJokeria"] = true, 
		["Roblox"] = true, 
		["Food"] = true, 
		["Roblox_Food"] = true, 
	},
    key = "felijo_rbx_sandwich",
	blueprint_compat = false,
    rarity = 2,
    cost = 7,
	unlocked = true,
	discovered = true,	
	config = { extra = { chips = 70, chips_mod = 5} },
	
	set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_rbx'), HEX('00008b'), HEX('ffffff'), 1 )
	end,
	
    loc_vars = function(self, info_queue, card)
		return { 
			vars = { 
				card.ability.extra.chips, 
				card.ability.extra.chips_mod, 
				(G.jokers and math.max(1, (G.jokers.config.card_limit - #G.jokers.cards) + #SMODS.find_card("j_vremade_stencil", true)) or 1) * card.ability.extra.chips
			}
		}
	end,
	
	add_to_deck = function(self, card, from_debuff)
		play_sound('felijo_rbx_sandwich_add', 1)	
	end,
	
    calculate = function(self, card, context)
		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            if card.ability.extra.chips - card.ability.extra.chips_mod <= 0 then
                SMODS.destroy_cards(card, nil, nil, true)
            else
                card.ability.extra.chips = card.ability.extra.chips - card.ability.extra.chips_mod
                return {
                    message = localize { type = 'variable', key = 'a_chips_minus', vars = { card.ability.extra.chips_mod } },
                    colour = G.C.CHIPS,
					sound = "felijo_rbx_sandwich_eat",
					pitch = 1,
                }
            end
        end
        if context.joker_main then
            return {
                chips = card.ability.extra.chips * (math.max(1,
                    (G.jokers.config.card_limit - #G.jokers.cards) + #SMODS.find_card("j_felijo_rbx_sandwich", true)))
            }
        end
	end,
    
}

-- Pumpkin Pi (Uncommon)
SMODS.Joker {
    atlas = 'rbxJokers',
    pos = { x = 7, y = 0 },
    pools = {
		["FelisJokeria"] = true, 
		["Roblox"] = true, 
		["Food"] = true, 
		["Roblox_Food"] = true, 
	},
    key = "felijo_rbx_pumpkinpi",
	blueprint_compat = false,
    rarity = 2,
    cost = 7,
	unlocked = true,
	discovered = true,	
	config = { extra = { h_size = 3, h_mod = 1, c_rounds = 0, m_rounds = 4} },
	
	set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_rbx'), HEX('00008b'), HEX('ffffff'), 1 )
	end,
	
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.h_size, card.ability.extra.h_mod, card.ability.extra.c_rounds, card.ability.extra.m_rounds} }
	end,
	
	add_to_deck = function(self, card, from_debuff)
		play_sound('felijo_rbx_sandwich_add', 1)
		G.hand:change_size(card.ability.extra.h_size)
	end,
	
	remove_from_deck = function(self, card, from_debuff)
		G.hand:change_size(-card.ability.extra.h_size)
	end,
	
    calculate = function(self, card, context)
		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
			if card.ability.extra.c_rounds >= card.ability.extra.m_rounds then 
				if card.ability.extra.h_size - card.ability.extra.h_mod <= 0 then
					SMODS.destroy_cards(card, nil, nil, true)
					return {
						message = "Empty!",
						colour = G.C.FILTER,
						sound = "felijo_rbx_pizza_eat",
						pitch = 1,
					}     
				else
					card.ability.extra.h_size = card.ability.extra.h_size - card.ability.extra.h_mod
					G.hand:change_size(-card.ability.extra.h_mod)
					card.ability.extra.c_rounds = 0
					return {
						message = "-"..card.ability.extra.h_mod.." hand size",
						colour = G.C.RED,
						sound = "felijo_rbx_pizza_eat",
						pitch = 1,
					}
				end
			else
				card.ability.extra.c_rounds = card.ability.extra.c_rounds + 1
			end
		end  
	end,
    
}
    
-- Epic Sauce (Rare)
SMODS.Joker {
    atlas = 'rbxJokers',
    pos = { x = 6, y = 0 },
    pools = {
		["FelisJokeria"] = true, 
		["Roblox"] = true, 
		["Food"] = true, 
		["Roblox_Food"] = true, 
	},
    key = "felijo_rbx_epic",
	blueprint_compat = false,
    rarity = 3,
    cost = 8,
	unlocked = true,
	discovered = true,	
	config = { extra = { repetitions = 1, rep_mod = 1} },
	
	set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_rbx'), HEX('00008b'), HEX('ffffff'), 1 )
	end,
	
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.repetitions, card.ability.extra.rep_mod} }
	end,
	
	--[[add_to_deck = function(self, card, from_debuff)
		play_sound('felijo_rbx_sandwich_add', 1)	
	end,]]
	
    calculate = function(self, card, context)
		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
			card.ability.extra.repetitions = card.ability.extra.repetitions + card.ability.extra.rep_mod
                return {
                    message = "+"..card.ability.extra.rep_mod.." retrigger",
                    colour = G.C.UI.TEXT_INACTIVE,
					sound = "felijo_rbx_drink_use",
					pitch = 1,
                }
		end
		if context.after and context.main_eval and not context.blueprint then
            if SMODS.last_hand_oneshot then
                SMODS.destroy_cards(card, nil, nil, true)
				return {
                    message = "Empty!",
                    colour = G.C.FILTER,
					sound = "felijo_rbx_drink_expire",
					pitch = 1,
                }         
            end
        end
        if context.cardarea == G.play
			and context.repetition
			and context.other_card then
				return {
					repetitions = card.ability.extra.repetitions,
				}
		end
	end,
    
}

--Bloxy Cola (Rare)
SMODS.Joker {
    atlas = 'rbxJokers',
    pos = { x = 0, y = 0 },
    pools = {
		["FelisJokeria"] = true, 
		["Roblox"] = true, 
		["Food"] = true, 
		["Roblox_Food"] = true, 
	},
    key = "felijo_rbx_bloxy",
	blueprint_compat = false,
    rarity = 3,
    cost = 8,
	unlocked = true,
	discovered = true,	
	config = { extra = { d_size = 4, d_mod = 1} },
	
	set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_rbx'), HEX('00008b'), HEX('ffffff'), 1 )
	end,
	
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.d_size, card.ability.extra.d_mod} }
	end,
	

	add_to_deck = function(self, card, from_debuff)
		play_sound('felijo_rbx_drink_add', 1)
		ease_discard(card.ability.extra.d_size)
	end,
	
	remove_from_deck = function(self, card, from_debuff)
		ease_discard(-card.ability.extra.d_size)
		play_sound("felijo_rbx_drink_expire", 1)
	end,
	
    calculate = function(self, card, context)
		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
			if card.ability.extra.d_size - card.ability.extra.d_mod <= 0 then
				SMODS.destroy_cards(card, nil, nil, true)
				return {
                    message = "Empty!",
                    colour = G.C.FILTER,
					sound = "felijo_rbx_drink_expire",
					pitch = 1,
                }     
			else
				card.ability.extra.d_size = card.ability.extra.d_size - card.ability.extra.d_mod
                return {
                    message = "-"..card.ability.extra.d_mod.." discard",
                    colour = G.C.RED,
					sound = "felijo_rbx_drink_use",
					pitch = 1,
                }
			end
		end  
	end,
    
}

--Witches' Brew (Rare)
SMODS.Joker {
    atlas = 'rbxJokers',
    pos = { x = 1, y = 0 },
    pools = {
		["FelisJokeria"] = true, 
		["Roblox"] = true, 
		["Food"] = true, 
		["Roblox_Food"] = true, 
	},
    key = "felijo_rbx_brew",
	blueprint_compat = false,
    rarity = 3,
    cost = 8,
	unlocked = true,
	discovered = true,	
	config = { extra = { h_size = 4, h_mod = 1} },
	
	set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_rbx'), HEX('00008b'), HEX('ffffff'), 1 )
	end,
	
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.h_size, card.ability.extra.h_mod} }
	end,
	

	add_to_deck = function(self, card, from_debuff)
		G.hand.config.highlighted_limit = G.hand.config.highlighted_limit + card.ability.extra.h_size
		play_sound('felijo_rbx_drink_add', 1)		
		SMODS.change_play_limit(card.ability.extra.h_size)
		SMODS.change_discard_limit(card.ability.extra.h_size)
	end,
	
	remove_from_deck = function(self, card, from_debuff)
		G.hand.config.highlighted_limit = G.hand.config.highlighted_limit - card.ability.extra.h_size
		play_sound("felijo_rbx_drink_expire", 1)
		SMODS.change_play_limit(-card.ability.extra.h_size)
		SMODS.change_discard_limit(-card.ability.extra.h_size)
	end,
	
    calculate = function(self, card, context)
		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
			if card.ability.extra.h_size - card.ability.extra.h_mod <= 0 then
				SMODS.destroy_cards(card, nil, nil, true)
				return {
                    message = "Empty!",
                    colour = G.C.FILTER,
					sound = "felijo_rbx_drink_expire",
					pitch = 1,
                }     
			else
				G.hand.config.highlighted_limit = G.hand.config.highlighted_limit - card.ability.extra.h_mod
				card.ability.extra.h_size = card.ability.extra.h_size - card.ability.extra.h_mod
				SMODS.change_play_limit(-card.ability.extra.h_mod)
				SMODS.change_discard_limit(-card.ability.extra.h_mod)
                return {
                    message = "-"..card.ability.extra.h_mod.." hand size",
                    colour = G.C.BLUE,
					sound = "felijo_rbx_drink_use",
					pitch = 1,
                }
			end
		end  
	end,
    
}

--Vending Machine (Uncommon)
SMODS.Joker {
    atlas = 'rbxJokers',
    pos = { x = 9, y = 0 },
    pools = {
		["FelisJokeria"] = true, 
		["Roblox"] = true,
		["Food"] = true,  
	},
    key = "felijo_rbx_vendingmachine",
	blueprint_compat = false,
    rarity = 2,
    cost = 8,
	unlocked = true,
	discovered = true,	
	config = { extra = { h_size = 4, h_mod = 1} },
	
	set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_rbx'), HEX('00008b'), HEX('ffffff'), 1 )
	end,
	
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.h_size, card.ability.extra.h_mod} }
	end,
	

	add_to_deck = function(self, card, from_debuff)
		play_sound('felijo_rbx_vending_use', 1)		
	end,

	
    calculate = function(self, card, context)
		if context.setting_blind and not context.blueprint and #G.jokers.cards < G.jokers.config.card_limit then
			if card.ability.extra.h_size - card.ability.extra.h_mod < 0 then
				SMODS.destroy_cards(card, nil, nil, true)
				return {
                    message = "Empty!",
                    colour = G.C.FILTER,
					sound = "felijo_rbx_spawn_use",
					pitch = 1,
                }     
			else
				card.ability.extra.h_size = card.ability.extra.h_size - card.ability.extra.h_mod
				SMODS.add_card{set = "Roblox_Food",}
                return {
                    message = "Dispensed",
                    colour = G.C.MONEY,
					sound = "felijo_rbx_vending_use",
					pitch = 1,
                }
			end
		end  
	end,
    
}

-- Copy Tool(Common)
SMODS.Joker {
    atlas = 'rbxJokers',
    pos = { x = 0, y = 2 },
    pools = {
		["FelisJokeria"] = true, 
		["Roblox"] = true, 
		["Building Tools"] = true, 
	},
    key = "felijo_rbx_copy",
    rarity = 1,
    cost = 5,
	unlocked = true,
	discovered = true,
	blueprint_compat = false,
	
	config = { extra = { chips = 150, chips_mod = 10} },
	
	set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_rbx'), HEX('00008b'), HEX('ffffff'), 1 )
	end,
	
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.chips, card.ability.extra.chips_mod} }
	end,
	
	add_to_deck = function(self, card, from_debuff)
		play_sound('felijo_rbx_tool_add', 1)	
	end,
	
    calculate = function(self, card, context)
		if context.setting_blind and not context.blueprint then
			local jokers = {}
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] ~= card and G.jokers.cards[i].config.center.key ~= "j_felijo_rbx_copy" then
					jokers[#jokers + 1] = G.jokers.cards[i]
				end
			end
			if #jokers > 0 then
                if #G.jokers.cards < G.jokers.config.card_limit then
                    local chosen_joker = pseudorandom_element(jokers, 'j_felijo_rbx_copy')
                    local copied_joker = copy_card(chosen_joker, nil, nil, nil, chosen_joker.edition and chosen_joker.edition.negative)
					
					copied_joker.ability.felijo_copied = true
					
                    if copied_joker.ability.invis_rounds then copied_joker.ability.invis_rounds = 0 end
                    if type(copied_joker.ability.extra) == "table" and copied_joker.ability.extra.invis_rounds then copied_joker.ability.extra.invis_rounds = 0 end
                    play_sound('felijo_rbx_copy', 1)	
					copied_joker:add_to_deck()
                    G.jokers:emplace(copied_joker)
                    return { message = localize('k_duplicated_ex') }
                else
                    return { message = localize('k_no_room_ex') }
                end
            else
                return { message = localize('k_no_other_jokers') }
            end
		end
	end,
}

delete_pool = {
		{1,1.00},
		{2,0.50},
		{3,0.40},
		{4,0.30},
		{5,0.25},
		{6,0.1}
	}


-- Delete Tool (Common)
SMODS.Joker {
    atlas = 'rbxJokers',
    pos = { x = 1, y = 2 },
    pools = {
		["FelisJokeria"] = true, 
		["Roblox"] = true, 
		["Building Tools"] = true, 
	},
    key = "felijo_rbx_delete",
    rarity = 1,
    cost = 5,
	unlocked = true,
	discovered = true,
	blueprint_compat = false,
	
	config = { extra = { xmult = 1, xmult_mod = 0.25} },
	
	set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_rbx'), HEX('00008b'), HEX('ffffff'), 1 )
	end,
	
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.xmult, card.ability.extra.xmult_mod} }
	end,
	
	add_to_deck = function(self, card, from_debuff)
		play_sound('felijo_rbx_tool_add', 1)	
	end,
	
    calculate = function(self, card, context)
		if context.end_of_round and context.main_eval and not context.blueprint then
			local jokers = {}
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] ~= card and not G.jokers.cards[i].ability.eternal then
					jokers[#jokers + 1] = G.jokers.cards[i]
				end
			end
			local roll = pseudorandom("felijo_rbx_delete"..G.GAME.round..G.GAME.pseudorandom.seed)
			local j_delete = FELIJO.quick_pool_pick(delete_pool, roll)
			j_delete = (j_delete == 6) and #jokers or j_delete
			local count = 0
			if #jokers > 0 then
				for i = 1, j_delete do
					local _card = pseudorandom_element(jokers, pseudoseed("j_felijo_rbx_delete"))
					if _card then
						card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_mod
						FELIJO.deleteCard(_card)
						count = count + 1
					end
				end
			end
			return {
				message = "+"..card.ability.extra.xmult_mod*count.." xMult",
				colour = G.C.MULT,
				pitch = 1,
			}
		end
		
		if context.joker_main and not context.blueprint then
			return	{
			xmult = card.ability.extra.xmult
			}
		end
	end,
}
-- Drag Tool (Common)
SMODS.Joker {
    atlas = 'rbxJokers',
    pos = { x = 2, y = 2 },
    pools = {
		["FelisJokeria"] = true, 
		["Roblox"] = true, 
		["Building Tools"] = true, 
	},
    key = "felijo_rbx_drag",
    rarity = 1,
    cost = 5,
	unlocked = true,
	discovered = true,
	blueprint_compat = false,
	
	config = { extra = { c_drag = 0, m_drag = 100, drag_mod = 100, toggle = 0} },
	
	set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_rbx'), HEX('00008b'), HEX('ffffff'), 1 )
	end,
	
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.c_drag, card.ability.extra.m_drag} }
	end,
	
	add_to_deck = function(self, card, from_debuff)
		play_sound('felijo_rbx_tool_add', 1)	
	end,
	
    calculate = function(self, card, context)
		if context.dragging and context.drag_target == card and not context.blueprint and card.ability.extra.c_drag < card.ability.extra.m_drag then
			card.ability.extra.c_drag = card.ability.extra.c_drag + (math.abs(to_number(G.GAME.round_resets.ante)) or 1)
		elseif context.dragging and context.drag_target == card and card.ability.extra.c_drag >= card.ability.extra.m_drag then
			if card.ability.extra.toggle == 0 then
				play_sound('felijo_rbx_spawn_add', 1)	
				card.ability.extra.toggle = 1
				card.ability.extra.c_drag = card.ability.extra.m_drag
				return {
						message = "Maxed out!",
						colour = G.C.GREEN,
						pitch = 1,
				}
			end
		end
		
		if context.modify_ante and context.ante_end then
			card.ability.extra.m_drag = card.ability.extra.m_drag + card.ability.extra.drag_mod
			card.ability.extra.drag_mod = card.ability.extra.drag_mod * 2
			card.ability.extra.toggle = 0
		
		end
		
		if context.joker_main and not context.blueprint then
			return	{
				chips = math.floor(card.ability.extra.c_drag)
			}
		end
	end
}





