
SMODS.Joker {  --Bell Tentacle
    atlas = 'inscryptionJokers',
    pos = { x = 8, y = 1 },
    pools = {
		["FelisJokeria"]= true,  
		["Inscryption"]=true,
		["Beast"] = true,		
		["Other"] = true,  
		["Tentacle"] = true,  
	},
    key = "felijo_ins_tentacle_bell",
	unlocked = true,
	discovered = true,
    rarity = 3,
    cost = 8,
	blueprint_compat = true,
    config = { extra = {xchips = 1, mult = 1, }},
	set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_ins'), HEX('7f1232'), HEX('f2a655'), 1 )
	end,
    loc_vars = function(self, info_queue, center)
		local jokercount = 0
		if G.jokers then
			for _, i in G.jokers.cards do
				if G.jokers.cards[i] == card then
					jokercount = 1
				end
			end
			jokercount = #G.jokers/jokercount
		end
		
        return {vars = { center.ability.extra.xchips, center.ability.extra.mult,  1 + (center.ability.extra.xchips * jokercount), colours = { HEX('F0C590'), HEX('351A09')} }}
    end,
	
    calculate = function(self, card, context)
        if context.joker_main then		
            for _, i in G.jokers do
				if G.jokers.cards[i] == card then
					return {
						xchips = 1 + (card.ability.extra.xchips * ((#G.jokers.cards/i) or 0)),
						mult = card.ability.extra.mult
					}
				end
			end
        end
    end,
}

SMODS.Joker {  --Hand Tentacle
    atlas = 'inscryptionJokers',
    pos = { x = 9, y = 1 },
    pools = {
		["FelisJokeria"]= true,  
		["Inscryption"]=true,
		["Beast"] = true,		
		["Other"] = true,  
		["Tentacle"] = true,  
	},
    key = "felijo_ins_tentacle_hand",
	unlocked = true,
	discovered = true,
    rarity = 3,
    cost = 8,
	blueprint_compat = true,
    config = { extra = {xchips = 0.5, mult = 1, }},
	set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_ins'), HEX('7f1232'), HEX('f2a655'), 1 )
	end,
    loc_vars = function(self, info_queue, center)
		local hand = G.hand and #G.hand or 0
        return {vars = { center.ability.extra.xchips, center.ability.extra.mult,  1 + (center.ability.extra.xchips * hand), colours = { HEX('F0C590'), HEX('351A09')} }}
    end,
	
    calculate = function(self, card, context)
        if context.joker_main then		
            return {
                xchips = 1 + (card.ability.extra.xchips * (#G.hand or 0)),
				mult = card.ability.extra.mult
            }
        end
    end,
}
SMODS.Joker {  --Consumable Tentacle
    atlas = 'inscryptionJokers',
    pos = { x = 7, y = 1 },
    pools = {
		["FelisJokeria"]= true,  
		["Inscryption"]=true,
		["Beast"] = true,		
		["Other"] = true,  
		["Tentacle"] = true,  
	},
    key = "felijo_ins_tentacle_cons",
	unlocked = true,
	discovered = true,
    rarity = 3,
    cost = 7,
	blueprint_compat = true,
    config = { extra = {xchips = 1, mult = 1, }},
	set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_ins'), HEX('7f1232'), HEX('f2a655'), 1 )
	end,
    loc_vars = function(self, info_queue, center)
		local consumeables = G.consumeables and #G.consumeables or 0
        return {vars = { center.ability.extra.xchips, center.ability.extra.mult, 1 + (center.ability.extra.xchips * consumeables), colours = { HEX('F0C590'), HEX('351A09')} }}
    end,
	
    calculate = function(self, card, context)
        if context.joker_main then		
            return {
                xchips = 1 + (card.ability.extra.xchips * (#G.consumeables or 0)),
				mult = card.ability.extra.mult
            }
        end
    end,
}

SMODS.Joker { --Edition Tentacle
    atlas = 'inscryptionJokers',
    pos = { x = 10, y = 1 },
    pools = {
		["FelisJokeria"]= true,  
		["Inscryption"]=true,
		["Beast"] = true,		
		["Other"] = true,  
		["Tentacle"] = true,  
	},
    key = "felijo_ins_tentacle_edi",
	unlocked = true,
	discovered = true,
    rarity = 3,
    cost = 9,
	blueprint_compat = true,
    config = { extra = {xchips = 0.5, mult = 1, }},
	set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_ins'), HEX('7f1232'), HEX('f2a655'), 1 )
	end,
    loc_vars = function(self, info_queue, center)
		local edcount = 0
		if G.playing_cards then
			for _, i in G.playing_cards do
				if G.playing_cards[i].edition then
					edcount = edcount + 1
				end
			end
		end
        return {vars = { center.ability.extra.xchips, center.ability.extra.mult,  1 + (center.ability.extra.xchips * edcount), colours = { HEX('F0C590'), HEX('351A09')} }}
    end,
	
    calculate = function(self, card, context)
        if context.joker_main then		
           local edcount = 0
			for _, i in G.playing_cards do
				if G.playing_cards[i].edition then
					edcount = edcount + 1
				end
			end
			return {
				xchips = 1 + (card.ability.extra.xchips * ((edcount) or 0)),
				mult = card.ability.extra.mult
			}
        end
    end,
}

SMODS.Joker {  --Enhancement Tentacle
    atlas = 'inscryptionJokers',
    pos = { x = 6, y = 1 },
    pools = {
		["FelisJokeria"]= true,  
		["Inscryption"]=true,
		["Beast"] = true,		
		["Other"] = true,  
		["Tentacle"] = true,  
	},
    key = "felijo_ins_tentacle_enh",
	unlocked = true,
	discovered = true,
    rarity = 3,
    cost = 8,
	blueprint_compat = true,
    config = { extra = {xchips = 0.2, mult = 1, }},
	set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_ins'), HEX('7f1232'), HEX('f2a655'), 1 )
	end,
    loc_vars = function(self, info_queue, center)
		local enhcount = 0
		if G.playing_cards then
			for _, i in G.playing_cards do
				if next(SMODS.get_enhancements(G.playing_cards[i])) then
					enhcount = enhcount + 1
				end
			end
		end
		
        return {vars = { center.ability.extra.xchips, center.ability.extra.mult,  1 + (center.ability.extra.xchips * enhcount), colours = { HEX('F0C590'), HEX('351A09')} }}
    end,
	
    calculate = function(self, card, context)
        if context.joker_main then		
           local enhcount = 0
			for _, i in G.playing_cards do
				if next(SMODS.get_enhancements(G.playing_cards[i])) then
					enhcount = enhcount + 1
				end
			end
			return {
				xchips = 1 + (card.ability.extra.xchips * ((enhcount) or 0)),
				mult = card.ability.extra.mult
			}
        end
    end,
}