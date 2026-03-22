
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
		local pos = 1
		jokers = 0
		if G.jokers and G.jokers.cards then
			jokers = #G.jokers.cards
			for i, joker_card in ipairs(G.jokers.cards) do
				if joker_card == center then 
					pos = i
					break
				end
			end
		end

		return {
			vars = {
				center.ability.extra.xchips or 0, 
				center.ability.extra.mult or 0,   
				math.max(1, center.ability.extra.xchips*(jokers - (pos-1))),                           
			
			colours = { HEX('F0C590'), HEX('351A09') }
			},
		}
    end,
	
    calculate = function(self, card, context)
        if context.joker_main then		
            local pos = 1
			if G.jokers and G.jokers.cards then
				for i, joker in ipairs(G.jokers.cards) do
					if joker == card then
						pos = i
						break
					end
				end
			end
			return{
				xchips = math.max(1, card.ability.extra.xchips * (#G.jokers.cards - (pos-1))),
				mult = card.ability.extra.mult,

			}
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
    config = { extra = {xchips = 0.25, mult = 1, }},
	set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_ins'), HEX('7f1232'), HEX('f2a655'), 1 )
	end,
    loc_vars = function(self, info_queue, center)
		local hand = G.hand and #G.hand.cards or 0
        return {vars = { center.ability.extra.xchips, center.ability.extra.mult,  1 + (center.ability.extra.xchips * hand), colours = { HEX('F0C590'), HEX('351A09')} }}
    end,
	
    calculate = function(self, card, context)
        if context.joker_main then		
            return {
                xchips = 1 + (card.ability.extra.xchips * (#G.hand.cards or 0)),
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
		local consumeables = G.consumeables and #G.consumeables.cards or 0
        return {vars = { center.ability.extra.xchips, center.ability.extra.mult, 1 + (center.ability.extra.xchips * consumeables), colours = { HEX('F0C590'), HEX('351A09')} }}
    end,
	
    calculate = function(self, card, context)
        if context.joker_main then		
            return {
                xchips = 1 + (card.ability.extra.xchips * (#G.consumeables.cards or 0)),
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
			for i, _card in ipairs(G.playing_cards) do
				if _card.edition then
					edcount = edcount + 1
				end
			end
		end
        return {vars = { center.ability.extra.xchips, center.ability.extra.mult,  1 + (center.ability.extra.xchips * edcount), colours = { HEX('F0C590'), HEX('351A09')} }}
    end,
	
    calculate = function(self, card, context)
        if context.joker_main then		
           local edcount = 0
			for i, _card in ipairs(G.playing_cards) do
				if _card.edition then
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
			for i, _card in ipairs(G.playing_cards) do
				if next(SMODS.get_enhancements(_card)) then
					enhcount = enhcount + 1
				end
			end
		end
		
        return {vars = { center.ability.extra.xchips, center.ability.extra.mult,  1 + (center.ability.extra.xchips * enhcount), colours = { HEX('F0C590'), HEX('351A09')} }}
    end,
	
    calculate = function(self, card, context)
        if context.joker_main then		
           local enhcount = 0
			for i, _card in ipairs(G.playing_cards) do
				if next(SMODS.get_enhancements(_card)) then
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