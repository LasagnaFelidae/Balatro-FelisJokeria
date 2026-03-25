local PRONOUNS = { "neutral", "masculine", "feminine"}





SMODS.Joker { -- Uncommon Aiko
	atlas = 'insDeathcard',
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
	unlocked = true,
	discovered = true,
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



SMODS.Joker {
	atlas = 'insDeathcard',
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
	unlocked = true,
	discovered = true,
	rarity = 2,
	cost = 7,
	config = { extra = {chips = 9, mult = 19, repetitions = 1, pronoun = "neutral"} },
	set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_ins'), HEX('7f1232'), HEX('f2a655'), 1 )
	end,
	loc_vars = function(self, info_queue, card)
		if CardPronouns then		
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
		else
			return {
				key = self.key .. "_nop", 
				vars = { 
					card.ability.extra.chips, 
					card.ability.extra.mult, 
					card.ability.extra.repetitions,
					1, 3,
					colours = { HEX('F0C590'), HEX('351A09'), HEX("5F5F5F"),} 
				} 
			}
		end
	end,
	calculate = function(self, card, context)
		if context.setting_blind then
			local current = card.ability.extra.pronoun or "neutral"
			card.ability.extra.pronoun = pseudorandom_element(PRONOUNS, "meowmeowmeowmeowmeowm30w")
		end
		
		if context.cardarea == G.play
		and context.repetition
		and context.other_card then
			if CardPronouns and type(CardPronouns.has) == "function" and CardPronouns.has(card.ability.extra.pronoun, context.other_card) then
				return {
					repetitions = card.ability.extra.repetitions,
				}
			elseif pseudorandom("meoooooowww", 1, 3) == 3 then
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


SMODS.Joker { -- Uncommon Luna
	atlas = 'insDeathcard',
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
	unlocked = true,
	discovered = true,
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


SMODS.Joker{  -- uncommon nxkoo
	atlas = 'insDeathcard',
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
	atlas = 'insDeathcard',
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
				local croll = pseudorandom("felijo_ins_toga"..G.GAME.round..G.GAME.pseudorandom.seed)
				local negative = pseudorandom("felijo_ins_toga2"..G.GAME.round..G.GAME.pseudorandom.seed,1,6)
				local cons = FELIJO.quick_pool_pick(FELIJO.consumeables_table, croll)
				if negative == 6 then
					SMODS.add_card{ set = cons, edition = "e_negative" }
				elseif #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
					G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
					SMODS.add_card{ set = cons, no_edition = true }
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
	atlas = 'insDeathcard',
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
	unlocked = true,
	discovered = true,
	rarity = 3,
	cost = 8,
	config = { extra = { debuff = 0.01 , chips = 1, mult = 1} },
	set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_ins'), HEX('7f1232'), HEX('f2a655'), 1 )
	end,
	loc_vars = function(self, info_queue, card)
		return { vars = { (card.ability.extra.debuff)*100, card.ability.extra.chips, card.ability.extra.mult, colours = { HEX('F0C590'), HEX('351A09') } } }
	end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			if context.other_card:get_id() == 14 then
				G.E_MANAGER:add_event(Event({
					func = function()
						G.GAME.blind.chips = math.floor(G.GAME.blind.chips * (1 - self.config.extra.debuff))
						G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
						return true
					end
				}))
				play_sound('gong', 0.96 + math.random() * 0.08)
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

SMODS.Joker { -- Rare Revo
	atlas = 'insDeathcard',
	pos = { x = 4, y = 2 },
	pools = {
		["FelisJokeria"]=true,
		["Inscryption"] = true, 
		["Beast"] = true,
		["Human"] = true, 
		["Deathcard"] = true 
		
	},
	key = "felijo_ins_revo",
	pronouns = "he_him",
	unlocked = true,
	discovered = true,
	rarity = 3,
	cost = 8,
	config = { extra = { chips = 7, mult = 20, count = 0, max_c = 10, odds = 3 }, tg = {superior = false} },
	set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_ins'), HEX('7f1232'), HEX('f2a655'), 1 )
	end,

	loc_vars = function(self, info_queue, card)
		local numerator, denumerator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'felijo_ins_revo')
		if card.ability.tg and card.ability.tg.superior == true then
			return { 
				key = self.key .. "_s", 
				vars = { 
					card.ability.extra.chips, 
					card.ability.extra.mult, 
					numerator, denumerator, 
					colours = { 
						HEX('C2B9C7'), 
						HEX('260336') 
					} 
				} 
			}
		end
		return { 
			vars = {
				card.ability.extra.chips, 
				card.ability.extra.mult, 			
				numerator, denumerator, 
				card.ability.extra.count,
				card.ability.extra.max_c,
				colours = { 
					HEX('F0C590'), 
					HEX('351A09') 
				} 
			} 
		} 
	end,

	set_sprites = function(self, card, front)
		if card.ability and card.ability.tg and card.ability.tg.superior == true then
			card.children.center:set_sprite_pos({x = 5, y = 2})
		end
	end,

	calculate = function(self, card, context)
		---@diagnostic disable: need-check-nil
		local cloned = nil
		if context.joker_main then
			if SMODS.pseudorandom_probability(card, 'felijo_ins_revo', 1, card.ability.extra.odds) then
				local new_card = FELIJO.copy_card(G.playing_cards[pseudorandom(pseudoseed('felijo_ins_revo'), 1, #G.playing_cards or 1)], nil, G.deck)
				if card.ability.extra.count >= card.ability.extra.max_c then
					local tier = pseudorandom("felijo_ins_revo"..G.GAME.round..G.GAME.pseudorandom.seed)
					local roll = FELIJO.quick_pool_pick(FELIJO.superior_tiers, tier)
					new_card:set_ability(roll)
				else
					new_card:set_ability("c_base")
				end
				if card.ability.extra.count < card.ability.extra.max_c then
					card.ability.extra.count = card.ability.extra.count + 1
				end
				G.E_MANAGER:add_event(Event({
					delay = 0.1,
					func = function()
						new_card:start_materialize()
						new_card:add_to_deck()
						return true
					end
				}))
				cloned = localize('k_felijo_cloned')
			else
				cloned = nil
			end
			
			
			if card.ability.extra.count >= card.ability.extra.max_c and not card.ability.tg.superior == true then
				card.ability.tg.superior = true
				card:juice_up()
				card.children.center:set_sprite_pos({x = 5, y = 2})
				play_sound('felijo_revo_transform', 1)
			end
			return {
				mult = card.ability.extra.mult,
				chips = card.ability.extra.chips,
				message = (card.ability.extra.count < card.ability.extra.max_c) and
				(card.ability.extra.count .. '/' .. card.ability.extra.max_c) or
				cloned,
			}
		end
	end,

	blueprint_compat = true,
}