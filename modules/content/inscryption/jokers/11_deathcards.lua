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
	attributes = {"chips", "mult", "xchips", "scaling", "destroy_card", "sell_value"},
	unlocked = true,
	discovered = false,
	rarity = 2,
	cost = 8,
	config = { extra = { xchips = 1, chips = 17, mult = 6, increment = 0.1,} },
	set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_ins'), HEX('7f1232'), HEX('f2a655'), 1 )
	end,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.xchips, card.ability.extra.chips , card.ability.extra.mult, card.ability.extra.increment*100, colours = { HEX('F0C590'), HEX('351A09')  } }}
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
						card.ability.extra.xchips = card.ability.extra.xchips + ( card.ability.extra.increment * sliced_card.sell_cost )
						card:juice_up(0.8, 0.8)
						sliced_card:start_dissolve({ HEX("d8a768") }, nil, 1.6)
						play_sound('slice1', 0.96 + math.random() * 0.08)
						return true
					end
				}))
				return {
					message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.xchips + card.ability.extra.increment * sliced_card.sell_cost } },
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

SMODS.Joker { -- Uncommon Ghost
	atlas = 'insDeathcard',
	pos = { x = 4, y = 1 },
	pools = {
		["FelisJokeria"]=true,
		["Inscryption"] = true, 
		["Beast"] = true,
		["Other"] = true, 
		["Deathcard"] = true,
	},
	key = "felijo_ins_ghost",
	pronouns = "she_her",
	unlocked = true,

	attributes = {"consumable", "tarot", "chips", "mult", "xmult", "xblindsize"},
	rarity = 2,
	cost = 8,
	config = { extra = { mult = 1, chips = 12, xmult = 1.1, xblindsize = 0.9 } },
	set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_phanta'), HEX('4d1575'), HEX('ffffff'), 1 )
		badges[#badges+1] = create_badge(localize('k_felijo_ghostcards'), HEX('d66ea9'), HEX('ffffff'), 1 )
		badges[#badges+1] = create_badge(localize('k_felijo_ins'), HEX('7f1232'), HEX('f2a655'), 1 )
	end,
	loc_vars = function(self, info_queue, card)
		local _key = self.key
		if FELIJO.is_mod_loaded("GhostCards") and FELIJO.is_mod_loaded("malverk") then
			info_queue[#info_queue+1] = {key = 'felijo_ghostcards_crossmod', set = 'Other'}
			_key = self.key .. "_gc"
		end
		
		return { key = _key, vars = { card.ability.extra.chips, card.ability.extra.mult, card.ability.extra.xmult, card.ability.extra.xblindsize, colours = { HEX('F0C590'), HEX('351A09') } } }
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			if FELIJO.is_mod_loaded("GhostCards") and FELIJO.is_mod_loaded("malverk") then
				local haunt_count = 0
				for _, j in ipairs(G.jokers.cards) do
					if j ~= card and j.config.center.atlas and string.find(j.config.center.atlas, "alt_tex_ghostcards_") then
						haunt_count = haunt_count + 1
						SMODS.calculate_effect(
						{xblindsize = card.ability.extra.xblindsize, juice_card = j, message_card = j},
						card
					)
				end
			end
		end
		local t_count = 0
		for _, t in ipairs(G.consumeables.cards) do
			if t.ability.set == "Tarot" or t.ability.set == "phanta_Zodiac" then
				t_count = t_count + 1
				SMODS.calculate_effect(
				{xmult = card.ability.extra.xmult, juice_card = t, message_card = t},
				card
			)
		end
	end
	return {
		chips = card.ability.extra.chips,
		mult = card.ability.extra.mult,
	}
	end
	end,
	blueprint_compat = true,
}



SMODS.Joker { -- Uncommon Lily
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
	discovered = false,
	rarity = 2,
	cost = 7,
	attributes = {"chips", "mult", "retrigger"},
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
attributes = {"chips", "mult", "joker"},
pronouns = "she_her",
unlocked = true,
discovered = false,
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
SMODS.Joker { -- Uncommon MissingNum
	atlas = 'insDeathcard',
	pos = { x = 3, y = 1},
	pools = {
		["FelisJokeria"]=true, 
		["Inscryption"] = true, 
		["Beast"] = true,
		["Feline"] = true, 
		["Deathcard"] = true 
	},
	key = "felijo_ins_missingnum",
	pronouns = "she_her",
	unlocked = true,
	discovered = false,
	rarity = 2,
	cost = 7,
	attributes = {"chips","mult","xmult","chance","enhancements","ace"},
	config = { extra = {chips = 19,mult = 19, xblindsize = 0.9 ,} },
	set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_ins'), HEX('7f1232'), HEX('f2a655'), 1 )
	end,
	loc_vars = function(self, info_queue, card)
		local _key = self.key
		if FELIJO.is_mod_loaded("zeroError") then
			info_queue[#info_queue+1] = {key = 'felijo_zeroerror_crossmod', set = 'Other'}
			_key = self.key.."_alt"
		end

		return { key = _key,vars = { card.ability.extra.chips, card.ability.extra.mult, card.ability.extra.xblindsize, colours = { HEX('F0C590'), HEX('351A09') } } }
	end,
	calculate = function(self, card, context)
		if context.end_of_round and context.main_eval and context.beat_boss and not context.game_over then
			if FELIJO.is_mod_loaded("zeroError") and (#G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit) then
				SMODS.add_card({set="Elemental"})
				G.GAME.consumeable_buffer = 0
			end
		end
		if context.joker_main then
			
			local ret = {}
			ret.mult = card.ability.extra.mult
			ret.chips = card.ability.extra.chips
			local wilds = {
					{["m_wild"] = true},
					{["m_felijo_wild_t2"] = true},
					{["m_felijo_wild_t3"] = true},
					{["m_felijo_wild_t4"] = true},
					{["m_bd_misprintwild"] = true},
					{["m_felijo_wild_t2_mp"] = true},
					{["m_felijo_wild_t3_mp"] = true},
					{["m_felijo_wild_t4_mp"] = true},
			}
			for _, t in ipairs(G.play.cards) do
				if t:is_suit("Brights") or wilds[t.config.center.key] then
					SMODS.calculate_effect(
					{xblindsize = card.ability.extra.xblindsize, juice_card = t, message_card = t},
					card
				)
				end
			end
			return ret
		end
	end,
	blueprint_compat = false,
}


SMODS.Joker { -- Uncommon Notmario
	atlas = 'insDeathcard',
	pos = { x = 2, y = 1},
	pools = {
		["FelisJokeria"]=true, 
		["Inscryption"] = true, 
		["Beast"] = true,
		["Human"] = true, 
		["Object"] = true, 
		["Deathcard"] = true 
	},
	key = "felijo_ins_notmar",
	pronouns = "she_they",
	unlocked = true,
	discovered = false,
	rarity = 2,
	cost = 7,
	attributes = {"chips","mult","xmult","chance","enhancements","ace"},
	config = { extra = {chips = 3,mult = 3, xmult = 3, retriggers = 2,} },
	set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_ins'), HEX('7f1232'), HEX('f2a655'), 1 )
	end,
	loc_vars = function(self, info_queue, card)
		if FELIJO.is_mod_loaded("MoreFluff") then
			info_queue[#info_queue+1] = {key = 'felijo_morefluff_crossmod', set = 'Other'}
		end
		return { vars = { card.ability.extra.chips, card.ability.extra.mult, card.ability.extra.retriggers, card.ability.extra.xmult, colours = { HEX('F0C590'), HEX('351A09') } } }
	end,
	calculate = function(self, card, context)
		if context.repetition and context.cardarea == G.play and context.scoring_name == "Three of a Kind" then
			
			return {
				message = localize('k_again_ex'),
				repetitions = card.ability.extra.retriggers,
				card = card
			}

		end

		if context.joker_main then
			if FELIJO.is_mod_loaded("MoreFluff") and (#G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit) then
				SMODS.add_card({set="Colour"})
				G.GAME.consumeable_buffer = 0
			end
			local ret = {}
			ret.mult = card.ability.extra.mult
			ret.chips = card.ability.extra.chips
			ret.xmult = context.scoring_name == "Three of a Kind" and card.ability.extra.xmult or 1

			return ret
		end
	end,
	blueprint_compat = false,
}



SMODS.Joker { -- Uncommon Tatsu
atlas = 'insDeathcard',
pos = { x = 1, y = 1},
pools = {
	["FelisJokeria"]=true, 
	["Inscryption"] = true, 
	["Beast"] = true,
	["Human"] = true, 
	["Deathcard"] = true 
},
key = "felijo_ins_tatsu",
pronouns = "any_all",
unlocked = true,
discovered = false,
rarity = 2,
cost = 7,
attributes = {"mult","xmult","chance","enhancements","ace"},
config = { extra = {mult = 20, xmult = 3,} },
set_badges = function(self, card, badges)
	badges[#badges+1] = create_badge(localize('k_felijo_ins'), HEX('7f1232'), HEX('f2a655'), 1 )
end,
loc_vars = function(self, info_queue, card)
	info_queue[#info_queue+1] = {key = 'felijo_tiered', set = 'Other'}
	info_queue[#info_queue+1] = G.P_CENTERS.m_wild
	info_queue[#info_queue+1] = G.P_CENTERS.m_felijo_wild_t2
	info_queue[#info_queue+1] = G.P_CENTERS.m_felijo_wild_t3
	info_queue[#info_queue+1] = G.P_CENTERS.m_felijo_wild_t4
	return { vars = { card.ability.extra.mult, card.ability.extra.xmult, colours = { HEX('F0C590'), HEX('351A09') } } }
end,
calculate = function(self, card, context)
	if context.individual and context.cardarea == G.play and not context.blueprint then
		if context.other_card and context.other_card:is_suit("Spades") then
			local roll = pseudorandom(G.GAME.round_resets.ante.."garfieldsthanksgiving", 1, 3)
			if roll == 1 then
				SMODS.destroy_cards(context.other_card)
				return {
					xmult = card.ability.extra.xmult,
				}
			elseif roll == 2 then
				context.other_card:set_ability("c_base")
				SMODS.change_base(context.other_card,nil ,"Ace")
			else
				local wild = FELIJO.quick_pool_pick(
				{
					{"m_wild", 1},
					{"m_felijo_wild_t2",0.2},
					{"m_felijo_wild_t3",0.05},
					{"m_felijo_wild_t4",0.001}
				}
			)
			context.other_card:set_ability(wild)
		end
	end
end

if context.joker_main then
	return {
		mult = card.ability.extra.mult,
		
	}
end
end,
blueprint_compat = false,
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
attributes = {"chips", "mult", "tarot", "planet", "spectral", "generation"},
rarity = 2,
cost = 6,
blueprint_compat = false,
eternal_compat = true,
perishable_compat = true,
unlocked = true,
discovered = false,
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
			local negative = pseudorandom("felijo_ins_toga2"..G.GAME.round..G.GAME.pseudorandom.seed,1,6)
			if negative == 6 then
				SMODS.add_card{ set = "Consumeables", edition = "e_negative" }
			elseif #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
				G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
				SMODS.add_card{ set = "Consumeables", no_edition = true }
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
discovered = false,
attributes = {"chips", "mult", "xblindsize"},
rarity = 3,
cost = 8,
config = { extra = { debuff = 0.10 , chips = 1, mult = 1} },
set_badges = function(self, card, badges)
	badges[#badges+1] = create_badge(localize('k_felijo_ins'), HEX('7f1232'), HEX('f2a655'), 1 )
end,
loc_vars = function(self, info_queue, card)
	return { vars = { (card.ability.extra.debuff)*100, card.ability.extra.chips, card.ability.extra.mult, colours = { HEX('F0C590'), HEX('351A09') } } }
end,
calculate = function(self, card, context)
	if context.individual and context.cardarea == G.play then
		if context.other_card:get_id() == 14 then
			return{x_blindsize = (1 - card.ability.extra.debuff)}
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

SMODS.Joker { -- Rare Gabby
atlas = 'insDeathcard',
pos = { x = 5, y = 1 },
pools = {
	["FelisJokeria"]=true,
	["Inscryption"] = true, 
	["Beast"] = true,
	["Vermin"] = true, 
	["Object"] = true, 
	["Deathcard"] = true 
	
},
key = "felijo_ins_gabby",
pronouns = "she_her",
unlocked = true,
discovered = false,
attributes = {"chips", "mult", "xmult", "edition",},
rarity = 3,
cost = 8,
config = { extra = { chips = 5, mult = 5, xmult = 1.5}},
set_badges = function(self, card, badges)
	badges[#badges+1] = create_badge(localize('k_felijo_ins'), HEX('7f1232'), HEX('f2a655'), 1 )
end,

loc_vars = function(self, info_queue, card)
	if washmashine then
		info_queue[#info_queue+1] = {key = 'felijo_washmashine_crossmod', set = 'Other'}
	end
	return { vars = { card.ability.extra.chips, card.ability.extra.mult, card.ability.extra.xmult, colours = { HEX('F0C590'), HEX('351A09') } } }
end,



calculate = function(self, card, context)
	if context.joker_main then
		for _, j in ipairs(G.jokers.cards) do
			if j.edition and j.edition.key == "e_negative" then
				SMODS.calculate_effect(
				{xmult = card.ability.extra.xmult, juice_card = j, message_card = j},
				card
			)
			end
		end
	
		for _, t in ipairs(G.consumeables.cards) do
			if t.ability.set == "wsh_fla" then
				SMODS.calculate_effect(
				{xmult = card.ability.extra.xmult, juice_card = t, message_card = t},
				card
			)
			end
			if (t.edition and t.edition.key == "e_negative") then
				SMODS.calculate_effect(
				{xmult = card.ability.extra.xmult, juice_card = t, message_card = t},
				card
			)
			end
		end
		return {
			chips = card.ability.extra.chips,
			mult = card.ability.extra.mult,
		}
	end
end,

blueprint_compat = true,
}


SMODS.Joker{  -- Rare nxkoo
atlas = 'insDeathcard',
pos = { x = 5, y = 0 },
pools = {
	["FelisJokeria"]= true, 
	["Inscryption"] = true, 
	["Beast"] = true,
	["Human"] = true, 
	["Canine"] = true,
	["Deathcard"] = true 
},
key = "felijo_ins_nxkoo",
pronouns = "she_they",
attributes = {"chips", "mult", "joker_slot"},
rarity = 3,
cost = 8,
blueprint_compat = true,
eternal_compat = true,
perishable_compat = true,
unlocked = true,
discovered = false,
config = { extra = {chips = 6, mult = 7,} },
set_badges = function(self, card, badges)
	if BadDirector or FELIJO.is_mod_loaded("BadDirector") then
		badges[#badges+1] = create_badge(localize('k_felijo_bd'), HEX('01c1e6'), HEX('ffffff'), 1 )
	end
	badges[#badges+1] = create_badge(localize('k_felijo_ins'), HEX('7f1232'), HEX('f2a655'), 1 )
end,
loc_vars = function(self, info_queue, card)
	if BadDirector or FELIJO.is_mod_loaded("BadDirector") then
		info_queue[#info_queue+1] = {key = 'felijo_bd_nxkoo_crossmod', set = 'Other'}
	end
	return { vars = {card.ability.extra.chips, card.ability.extra.mult, G.jokers and math.max(1, #G.jokers.cards + (#SMODS.find_card("j_lusty_joker", true)*0.5)) or 1, colours = { HEX('F0C590'), HEX('351A09')} } }
end,
calculate = function(self, card, context)
	if context.joker_main then
		local ct = 0
		if BadDirector or FELIJO.is_mod_loaded("BadDirector") then
			for i, jokers in ipairs(G.jokers.cards) do
				if jokers.config.center.key == "j_misprint" then ct = ct + 1 end
				if jokers.edition and jokers.edition.key == "e_bd_misprinted" then ct = ct + 1 end
			end
		end
		return {
			xmult = math.max(1, #G.jokers.cards + (#SMODS.find_card("j_lusty_joker", true)*0.5)+ (ct*1))
		}
	end
end
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
discovered = false,
attributes = {"chips", "mult", "enhancements", "generation"},
rarity = 3,
cost = 8,
config = { extra = { chips = 7, mult = 20, count = 0, max_c = 10,}, tg = {superior = false} },
set_badges = function(self, card, badges)
	badges[#badges+1] = create_badge(localize('k_felijo_ins'), HEX('7f1232'), HEX('f2a655'), 1 )
end,

loc_vars = function(self, info_queue, card)
	if card.ability.tg and card.ability.tg.superior == true then
		return { 
			key = self.key .. "_s", 
			vars = { 
				card.ability.extra.chips, 
				card.ability.extra.mult, 
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
	local cloned = nil
	if context.joker_main then
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

SMODS.Joker { -- Rare Soul
atlas = 'insDeathcard',
pos = { x = 0, y = 1 },
pools = {
	["FelisJokeria"]=true,
	["Inscryption"] = true, 
	["Beast"] = true,
	["Human"] = true, 
	["Deathcard"] = true,
	["Object"] = true,
},
key = "felijo_ins_soulware",
pronouns = "he_him",
unlocked = true,

attributes = {"chips","mult","blindsize","xblindsize"},
rarity = 3,
cost = 8,
config = { extra = { debuff = 0.10 , chips = 4, mult = 2, mod = 0.10, mod_add = 100} },
set_badges = function(self, card, badges)
	badges[#badges+1] = create_badge(localize('k_felijo_ins'), HEX('7f1232'), HEX('f2a655'), 1 )
end,
loc_vars = function(self, info_queue, card)
	return { vars = { card.ability.extra.chips, card.ability.extra.mult, card.ability.extra.mod, card.ability.extra.mod_add, colours = { HEX('F0C590'), HEX('351A09') } } }
end,
calculate = function(self, card, context)
	if context.forcetrigger then
		return {
			chips = card.ability.extra.chips,
			mult = card.ability.extra.mult
		}
	end
	if context.MDJ_mod_key_and_amount then
		local key = context.MDJ_key
		local amount = context.MDJ_amount
		if not context.demicolon_racism then
			local operation = fallbackjournal.blindsizemodkeys[key]
			local op_number = fallbackjournal.keystonumbers[operation]
			if operation and op_number == 0 then
				amount = amount - card.ability.extra.mod
			end
			if operation and op_number == -1 then
				amount = amount - card.ability.extra.mod_add
			end
		end
		return {
			MDJ_amount = amount,
			MDJ_key = key
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

SMODS.Joker { -- Rare Leshy
atlas = 'insDeathcard',
pos = { x = 10, y = 0 },
pools = {
	["FelisJokeria"]=true,
	["Inscryption"] = true, 
	["Beast"] = true,
	["Human"] = true, 
	["Deathcard"] = true,
},
key = "felijo_ins_leshy",
pronouns = "he_him",
unlocked = true,

attributes = {"joker"},
rarity = 3,
cost = 8,
config = { extra = { xmult = 0.50, chips = 5 } },
set_badges = function(self, card, badges)
	badges[#badges+1] = create_badge(localize('k_felijo_ins'), HEX('7f1232'), HEX('f2a655'), 1 )
end,
loc_vars = function(self, info_queue, card)
	if FELIJO.is_mod_loaded("RevosVault") then
		info_queue[#info_queue+1] = {key = 'felijo_leshy_crossmod', set = 'Other'}
	end
	local l_count = 1
	local l_deathcard_redeem = G.GAME.crv_deathcard_allowed and 2 or 0
	if G.jokers then
		for _, j in ipairs(G.jokers.cards) do
			if j ~= card and j.config.center.pools and j.config.center.pools['Beast'] and j.config.center.pools['Inscryption'] then
				l_count = l_count + 1
			end
		end
	end
	return { vars = { card.ability.extra.chips, card.ability.extra.xmult, card.ability.extra.chips*l_count, math.max(1, (1+(card.ability.extra.xmult*l_count)+l_deathcard_redeem)),  colours = { HEX('F0C590'), HEX('351A09') } } }
end,
calculate = function(self, card, context)
	if context.joker_main then
		local count = 0
		local deathcard_redeem = G.GAME.crv_deathcard_allowed and 2 or 0
		for _, j in ipairs(G.jokers.cards) do
			if j ~= card and j.config.center.pools and j.config.center.pools['Beast'] and j.config.center.pools['Inscryption'] then
				count = count + 1
			end
		end
		return {
			chips = card.ability.extra.chips*count,
			xmult = math.max(1, (1+(card.ability.extra.xmult*count)+deathcard_redeem)),
		}
	end
end,
blueprint_compat = true,
}




