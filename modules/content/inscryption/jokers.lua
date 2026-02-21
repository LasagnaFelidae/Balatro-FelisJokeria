local PRONOUNS = { "neutral", "masculine", "feminine", "masculine", "neutral", 
  "feminine", "feminine", "masculine", "neutral", "neutral", 
  "masculine", "feminine", "neutral", "masculine", "feminine", 
  "neutral", "masculine", "feminine", "neutral", "masculine", "feminine" }


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

SMODS.Joker { -- Uncommon Aiko
    atlas = 'inscryptionJokers',
    pos = { x = 1, y = 0},
    pools = {
		["FelisJokeria"]=true,
		["Inscryption"] = true, 
		["Beast"] = true,
		["Human"] = true, 
		["Deathcard"] = true 
	},
    key = "felijo_ins_aiko",
	pronouns = "any_all",
    rarity = 2,
    cost = 8,
	config = { extra = { xchips = 1, chips = 17, mult = 6} },
	set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_ins'), HEX('7f1232'), HEX('f2a655'), 1 )
	end,
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.xchips, card.ability.extra.chips ,card.ability.extra.mult, colours = { HEX('F0C590'), HEX('351A09')  } }}
    end,
    calculate = function(self, card, context)
		if context.setting_blind and not context.blueprint then
			local my_pos = nil
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] == card then
					my_pos = i
					break
				end
			end
			if my_pos and G.jokers.cards[my_pos - 1] and not SMODS.is_eternal(G.jokers.cards[my_pos - 1], card) and not G.jokers.cards[my_pos - 1].getting_sliced then
				local sliced_card = G.jokers.cards[my_pos - 1]
				sliced_card.getting_sliced = true
				G.GAME.joker_buffer = G.GAME.joker_buffer - 1
				G.E_MANAGER:add_event(Event({
				func = function()
					G.GAME.joker_buffer = 0					
					card.ability.extra.xchips = card.ability.extra.xchips + ( 0.1 * sliced_card.sell_cost )
					card:juice_up(0.8, 0.8)
					sliced_card:start_dissolve({ HEX("d8a768") }, nil, 1.6)
					play_sound('slice1', 0.96 + math.random() * 0.08)
					return true
				end
				}))
				return {
					message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.xchips + 0.1 * sliced_card.sell_cost } },
					colour = G.C.BLUE,
					no_juice = true
				}
			end
		end
		if context.joker_main then
			return {
				xchips = card.ability.extra.xchips,
				chips = card.ability.extra.chips,
				mult = card.ability.extra.mult
			}
		end
	end
}

SMODS.Joker { -- Rare Evgast
    atlas = 'inscryptionJokers',
    pos = { x = 7, y = 0 },
    pools = {
		["FelisJokeria"]=true,
		["Inscryption"] = true,
		["Beast"] = true,
		["Human"] = true, 
		["Deathcard"] = true 
	},
    key = "felijo_ins_evgast",
    rarity = 3,
    cost = 8,
	config = { extra = { debuff = 0.01 , chips = 1, mult = 1} },
	set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_ins'), HEX('7f1232'), HEX('f2a655'), 1 )
	end,
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.debuff, card.ability.extra.chips, card.ability.extra.mult, colours = { HEX('F0C590'), HEX('351A09') } } }
    end,
    calculate = function(self, card, context)
		local aces = 0
		if context.individual and context.cardarea == G.play then
			if context.other_card:get_id() == 14 then
				aces = aces + 1
				SMODS.juice_up_blind()
				G.GAME.blind.chips = math.floor(G.GAME.blind.chips * ( 1 - (card.ability.extra.debuff * aces) ))
				G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)	
				play_sound('timpani', 0.96 + math.random() * 0.08)
			end
		end
		if context.joker_main then
			return {
				chips = card.ability.extra.chips,
				mult = card.ability.extra.mult
			}
		end
	end,
    blueprint_compat = true,
}

if CardPronouns then  -- Uncommon LilyFelli
	SMODS.Joker {
		atlas = 'inscryptionJokers',
		pos = { x = 4, y = 0},
		pools = {
			["FelisJokeria"]=true, 
			["Inscryption"] = true, 
			["Beast"] = true,
			["Feline"] = true, 
			["Deathcard"] = true 
		},
		key = "felijo_ins_lilyfelli",
		pronouns = "she_her",
		rarity = 2,
		cost = 7,
		config = { extra = {chips = 9, mult = 19, repetitions = 1, pronoun = "neutral"} },
		set_badges = function(self, card, badges)
			badges[#badges+1] = create_badge(localize('k_felijo_ins'), HEX('7f1232'), HEX('f2a655'), 1 )
		end,
		loc_vars = function(self, info_queue, card)		
				if card.ability.extra.pronoun == "masculine" then
					return {
						vars = { 
							card.ability.extra.chips, 
							card.ability.extra.mult, 
							card.ability.extra.repetitions,
							card.ability.extra.pronoun,
							colours = { HEX('F0C590'), HEX('351A09'), HEX("61B5FA"),} 
						} 
					}
				elseif card.ability.extra.pronoun == "feminine" then
					return {
						vars = { 
							card.ability.extra.chips, 
							card.ability.extra.mult, 
							card.ability.extra.repetitions,
							card.ability.extra.pronoun,
							colours = { HEX('F0C590'), HEX('351A09'), HEX("FF90FF"),} 
						} 
					}
				else
					return {
						vars = { 
							card.ability.extra.chips, 
							card.ability.extra.mult, 
							card.ability.extra.repetitions,
							card.ability.extra.pronoun,
							colours = { HEX('F0C590'), HEX('351A09'), HEX("5F5F5F"),} 
						} 
					}
				end
		end,
		calculate = function(self, card, context)
			if context.setting_blind then
				local current = card.ability.extra.pronoun or "neutral"
				local next_index = 1
				for i, p in ipairs(PRONOUNS) do
					if p == current then
						next_index = i % #PRONOUNS + 1
						break
					end
				end
				card.ability.extra.pronoun = PRONOUNS[next_index]

			end

			if context.cardarea == G.play
			and context.repetition
			and context.other_card then
				if CardPronouns and type(CardPronouns.has) == "function" and CardPronouns.has(card.ability.extra.pronoun, context.other_card) then
					return {
						repetitions = card.ability.extra.repetitions,
					}
				end
			end
			if context.joker_main then
				return {
					chips = card.ability.extra.chips,
					mult = card.ability.extra.mult
				}
			end
		end,
		blueprint_compat = true,
	}
end

SMODS.Joker { -- Uncommon Luna
    atlas = 'inscryptionJokers',
    pos = { x = 2, y = 0 },
    pools = {
		["FelisJokeria"]=true, 
		["Inscryption"] = true, 
		["Beast"] = true,
		["Object"] = true, 
		["Deathcard"] = true, 
	},
    key = "felijo_ins_luna",
	pronouns = "she_her",
    rarity = 2,
    cost = 8,
	config = { extra = { creates = 1 , chips = 5, mult = 10} },
	set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_ins'), HEX('7f1232'), HEX('f2a655'), 1 )
	end,
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.debuff, card.ability.extra.chips, card.ability.extra.mult, colours = { HEX('F0C590'), HEX('351A09') } } }
    end,
    calculate = function(self, card, context)
		 if context.setting_blind and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
            local jokers_to_create = math.min(card.ability.extra.creates,
                G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer))
            G.GAME.joker_buffer = G.GAME.joker_buffer + jokers_to_create
            G.E_MANAGER:add_event(Event({
                func = function()
                    for _ = 1, jokers_to_create do
                        SMODS.add_card {
                            set = 'Joker',
                            rarity = 'Common',
							no_edition = false,
                        }
                        G.GAME.joker_buffer = 0
                    end
                    return true
                end
            }))
            return {
                message = localize('k_plus_joker'),
                colour = G.C.BLUE
            }
        end
		if context.joker_main then
			return {
				chips = card.ability.extra.chips,
				mult = card.ability.extra.mult
			}
		end
    end,
    blueprint_compat = true,
}

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
		local level = 0
		if G.STEAM and G.STEAM.user then
			level = G.STEAM.user.getPlayerSteamLevel()
		end
		local totalxp = 5 * level * level + 50 * level				
		card.ability.steam.badges = totalxp / 100
	end,
    calculate = function(self, card, context)
        if context.joker_main then
			self:badgeCalc(card)
            local chips = 1 + (card.ability.extra.xchips * card.ability.steam.badges)
			
            return {
                xchips = xchips,
            }
        end
    end,
	load = function(self, card, card_table, other_card)
		self:badgeCalc(card)
    end,
	set_ability = function(self,card,initial,delay_sprites)
		self:badgeCalc(card)
    end,
	
}

SMODS.Joker{  -- uncommon nxkoo
    atlas = 'inscryptionJokers',
    pos = { x = 5, y = 0 },
    pools = {
		["FelisJokeria"]= true, 
		["Inscryption"] = true, 
		["Beast"] = true,
		["Human"] = true, 
		["Deathcard"] = true 
	},
    key = "felijo_ins_nxkoo",
	pronouns = "she_they",
    rarity = 2,
    cost = 8,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    config = { extra = {chips = 6, mult = 7,} },
	set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_ins'), HEX('7f1232'), HEX('f2a655'), 1 )
	end,
    loc_vars = function(self, info_queue, card)
		return { vars = {card.ability.extra.chips, card.ability.extra.mult, G.jokers and math.max(1, #G.jokers.cards + (#SMODS.find_card("j_lusty_joker", true)*0.5)) or 1, colours = { HEX('F0C590'), HEX('351A09')} } }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                xmult = math.max(1, #G.jokers.cards + (#SMODS.find_card("j_lusty_joker", true)*0.5))
            }
        end
    end
}

SMODS.Joker{  -- Uncommon Toga
    atlas = 'inscryptionJokers',
    pos = { x = 6, y = 0 },
    pools = {
		["FelisJokeria"]=true,
		["Inscryption"] = true,
		["Beast"] = true,		
		["Human"] = true, 
		["Deathcard"] = true 
	},
    key = "felijo_ins_toga",
	pronouns = "he_him",
    rarity = 2,
    cost = 6,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    config = { extra = {chips = 20, mult = 2.6}, stage = { i = 0, max_i = 2} },
	set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_ins'), HEX('7f1232'), HEX('f2a655'), 1 )
	end,
    loc_vars = function(self, info_queue, card)
		return { vars = {card.ability.extra.chips, card.ability.extra.mult, card.ability.stage.i, card.ability.stage.max_i, colours = { HEX('F0C590'), HEX('351A09')} } }
    end,
    calculate = function(self, card, context)
		if context.press_play then
			card.ability.stage.i = card.ability.stage.i + 1 
		end
		if context.joker_main then
			if card.ability.stage.i >= card.ability.stage.max_i then
				card.ability.stage.max_i = card.ability.stage.max_i + 1
				card.ability.stage.i = 0
				local consumable = pseudorandom("felijo_ins_toga"..G.GAME.round..G.GAME.pseudorandom.seed, 0, 9)
				local negative = pseudorandom("felijo_ins_toga2"..G.GAME.round..G.GAME.pseudorandom.seed,0,6)
				if negative == 6 then
					if consumable >= 0 and consumable < 5 then -- There is probably a better way to do this
						SMODS.add_card{ set = "Tarot", edition = "e_negative" }
					elseif consumable >= 5 and consumable < 8 then
						SMODS.add_card{ set = "Planet", edition = "e_negative" }
					elseif consumable >= 8 and consumable <= 9 then
						SMODS.add_card{ set = "Spectral", edition = "e_negative" }
					end
				elseif #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
					G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
					if consumable >= 0 and consumable < 5 then 
						SMODS.add_card{ set = "Tarot", no_edition = true }
					elseif consumable >= 5 and consumable < 8 then
						SMODS.add_card{ set = "Planet", no_edition = true }
					elseif consumable >= 8 and consumable <= 9 then
						SMODS.add_card{ set = "Spectral", no_edition = true }
					end
					G.GAME.consumeable_buffer = 0
				else
				card.ability.stage.max_i = card.ability.stage.max_i - 1
				return {
					message = localize('k_felijo_nope_succ'),
					colour = G.C.FILTER,
					chips = card.ability.extra.chips,
					mult = card.ability.extra.mult
				}
				end
			end
			return {
				chips = card.ability.extra.chips,
				mult = card.ability.extra.mult
			}
		end
	end
}


SMODS.Joker { -- Rare Evgast
    atlas = 'inscryptionJokers',
    pos = { x = 7, y = 0 },
    pools = {
		["FelisJokeria"]=true,
		["Inscryption"] = true, 
		["Beast"] = true,
		["Human"] = true, 
		["Deathcard"] = true 
	},
    key = "felijo_ins_evgast",
	pronouns = "they_them",
    rarity = 3,
    cost = 8,
	config = { extra = { debuff = 0.01 , chips = 1, mult = 1} },
	set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_ins'), HEX('7f1232'), HEX('f2a655'), 1 )
	end,
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.debuff, card.ability.extra.chips, card.ability.extra.mult, colours = { HEX('F0C590'), HEX('351A09') } } }
    end,
    calculate = function(self, card, context)
		local aces = 0
		if context.individual and context.cardarea == G.play then
			if context.other_card:get_id() == 14 then
				aces = aces + 1
				SMODS.juice_up_blind()
				G.GAME.blind.chips = math.floor(G.GAME.blind.chips * ( 1 - (card.ability.extra.debuff * aces) ))
				G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)	
				play_sound('timpani', 0.96 + math.random() * 0.08)
			end
		end
		if context.joker_main then
			return {
				chips = card.ability.extra.chips,
				mult = card.ability.extra.mult
			}
		end
	end,
    blueprint_compat = true,
}

SMODS.Joker { -- Rare Ouro
    atlas = 'inscryptionJokers',
    pos = { x = 9, y = 0 },
    pools = {
		["FelisJokeria"]=true,
		["Inscryption"] = true, 
		["Beast"] = true,
		["Reptile"] = true, 
	},
    key = "felijo_ins_ouro",
    rarity = 3,
    cost = 4,
	pronouns = "he_him",
	config = { extra = { xchips = 1, xmult = 1, gain = 0.2}, sell = {curr = 0, limit = 2} },
	set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_ins'), HEX('7f1232'), HEX('f2a655'), 1 )
	end,
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.xchips, card.ability.extra.xmult, card.ability.extra.gain, card.ability.sell.curr, card.ability.sell.limit, colours = { HEX('F0C590'), HEX('351A09') } } } 
    end,
    calculate = function(self, card, context)
		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            card.ability.sell.curr = card.ability.sell.curr + 1
            if card.ability.sell.curr == card.ability.sell.limit then
                local eval = function(card) return not card.REMOVED end
                juice_card_until(card, eval, true)
            end
            return {
                message = (card.ability.sell.curr < card.ability.sell.limit) and
                    (card.ability.sell.curr .. '/' .. card.ability.sell.limit) or
                    localize('k_active_ex'),
                colour = G.C.FILTER
            }
        end
	
        if (context.selling_self and (card.ability.sell.curr >= card.ability.sell.limit))  -- sacrifice by sale
		or (context.joker_type_destroyed and context.card == card) then -- sacrifice by dagger
			local ouroboros = SMODS.add_card { 
				key = "j_felijo_ins_ouro", 
				key_append = "felijo_ouro", 
				edition = card.edition,
				no_editon = true,
				stickers = nil,
			}
				
			ouroboros.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.gain
			ouroboros.ability.extra.xchips = card.ability.extra.xmult + card.ability.extra.gain
			ouroboros.states.visible = false
			
			G.E_MANAGER:add_event(Event({
				delay = 0.4,
				trigger = 'after',
				func = function()
					ouroboros:start_materialize()
					return true
				end
			}))

			return ouroboros
		end
		
		if context.joker_main then
			return {
				xmult = card.ability.extra.xmult,
				xchips = card.ability.extra.xchips
			}
        end
	end,
    blueprint_compat = true,
}


SMODS.Joker{  --rare Mycologists, The
    atlas = 'inscryptionJokers',
    pos = { x = 3, y = 0 },
    pools = {
	["FelisJokeria"]=true,
	["Beast"] = true,	
	["Inscryption"] = true, 
	["Human"] = true 
	},
    key = "felijo_ins_myco",
	pronouns = "they_them",
    rarity = 3,
    cost = 8,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    config = { extra = {} },
	set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_ins'), HEX('7f1232'), HEX('f2a655'), 1 )
	end,
    loc_vars = function(self, info_queue, card)
		return { vars = {colours = { HEX('F0C590'), HEX('351A09'), HEX('998377'),HEX('7E9978')} } }
    end,
    calculate = function(self, card, context)
        if context.final_scoring_step and context.cardarea == G.jokers  then
            if context.scoring_name == "Pair" and #context.scoring_hand == 2 and not (G.GAME.hands[context.scoring_name] and G.GAME.hands[context.scoring_name].played_this_round > 1) then
				local c1 = context.scoring_hand[1]
				local c2 = context.scoring_hand[2]
				local suit = pseudorandom(pseudoseed('merge_suit')) < 0.5 and c1.base.suit or c2.base.suit
				local rank = c1:get_id()
				
				local function number_to_pip(n)
                    if n == 14 or n == 1 then return "A"
                    elseif n == 13 then return "K"
                    elseif n == 12 then return "Q"
                    elseif n == 11 then return "J"
                    else return tostring(math.floor(n))
                    end
                end
				
				local function rank_to_chips(n)
                    if n == 14 or n == 1 then return 11
                    elseif n <= 13 and n >= 11 then return 10
                    else return tostring(math.floor(n))
                    end
                end
				
				local new_front_key = suit:sub(1,1) .. '_' .. number_to_pip(rank)
				local new_front = G.P_CARDS[new_front_key]

				local enhancements = {}
                if c1.config.center then table.insert(enhancements, c1.config.center) end
                if c2.config.center then table.insert(enhancements, c2.config.center) end
                if #enhancements == 0 then enhancements = {G.P_CENTERS.c_base} end
                local new_center = pseudorandom_element(enhancements, pseudoseed('merge_enhancement')) or nil

                local seals = {}
                if c1.seal then table.insert(seals, c1.seal) end
                if c2.seal then table.insert(seals, c2.seal) end
                local new_seal = #seals > 0 and pseudorandom_element(seals, pseudoseed('merge_seal')) or nil

                local editions = {}
                if c1.edition then table.insert(editions, c1.edition) end
                if c2.edition then table.insert(editions, c2.edition) end
                local new_edition = #editions > 0 and pseudorandom_element(editions, pseudoseed('merge_edition')) or nil
				
				local merged_card = create_playing_card({
                    front = new_front,
                    center = new_center,
                }, G.play, true, false, nil, true)
                
                merged_card.ability.perma_bonus = rank_to_chips(rank)
                merged_card.ability.felijo_stk_stitched = true
                if new_seal then
                    merged_card:set_seal(new_seal, true)
                end

                if new_edition then
                    merged_card:set_edition(new_edition, true)
                end
				
				SMODS.destroy_cards(c1)
				SMODS.destroy_cards(c2)
				G.E_MANAGER:add_event(Event({
				delay = 1,
                    func = function()
                        merged_card:start_materialize()
                        G.deck:emplace(merged_card)
                        return true
                    end
                }))

                return {
                    message = "Merged!"
                }
            end
        end
    end
}

