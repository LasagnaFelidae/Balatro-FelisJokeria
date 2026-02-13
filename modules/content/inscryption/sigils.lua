local all_sets = {}
for i,k in pairs(G.P_CENTER_POOLS) do
    all_sets[i] = true
end

--SIGIL FUNCTIONS
-- CONFLICTS
local sigil_groups = {
    postmortem = {"felijo_sgl_brittle", "felijo_sgl_steeltrap", "felijo_sgl_tail","felijo_sgl_manylives","felijo_sgl_unkillable"},
	cardmod = {"felijo_sgl_midas", "felijo_sgl_madeofstone"}
}

local sigilKeys = {
    "felijo_sgl_bifurcated",
    "felijo_sgl_trifurcated",
	"felijo_sgl_brittle", 
	"felijo_sgl_steeltrap", 
	"felijo_sgl_tail",
	"felijo_sgl_manylives",
	"felijo_sgl_unkillable",
	"felijo_sgl_midas", 
	"felijo_sgl_madeofstone",
	"felijo_sgl_repulsive",
	"felijo_sgl_leader",
	"felijo_sgl_stinky",
	"felijo_sgl_trinketbearer",
	"felijo_sgl_hoarder",
	"felijo_sgl_fledgling",
	"felijo_sgl_bloodlust",
	"felijo_sgl_rampager",
	"felijo_sgl_bellist",
	"felijo_sgl_amorphous",
	"felijo_sgl_doubledown",
	"felijo_sgl_giftbearer",
	"felijo_sgl_jokerbearer",
	"felijo_sgl_swapper",
	"felijo_sgl_omnistrike",
}

local MAX_SIGILS = 3

local function countSigils(card)
    local count = 0
    for _, key in ipairs(sigilKeys) do
        if card.ability[key] then
            count = count + 1
        end
    end
    return count
end

local function canApplySigil(card, sigilKey)
	if card.ability[sigilKey] then --check if sigil is there alrdy
        return false
    end
	
	if countSigils(card) >= MAX_SIGILS then --check if already 3 sigils
        return false
    end
	print(countSigils(card))
    for group_name, members in pairs(sigil_groups) do -- check for conflicting sigils
		local in_group = false
		for _, member in ipairs(members) do
			if member == sigilKey then in_group = true; break end
		end
		if in_group then
			for _, member in ipairs(members) do
				if member ~= sigilKey and card.ability[member] then
					return false
				end
			end
		end
	end
	--if sigilKey == "sgl_fledgling" then  
	

    return true
end

local function updatePos(card, self, base_x, base_y)
    if not card.self then
        return
    end

    shift_per_sigil = 4

    local count = countSigils(card)

    local new_x = base_x
    local new_y = base_y

    
    new_x = base_x + ((count - 1) * shift_per_sigil)

    card.self:set_sprite_pos({x = new_x, y = new_y})

    card:juice_up(0.08, 0.02)

end


--[[ sets:
-- POOLS
-- Default - Playing Cards
-- Joker - Jokers
-- all_sets - everything, thanks aikoyori

--RARITIES
--badge_colour = 	HEX '009DFF'	G.C.RARITY.Common
					HEX '4BC292'	G.C.RARITY.Uncommon 	
					HEX 'FE5F55'	G.C.RARITY.Rare
					HEX 'B26CBB'	G.C.RARITY.Legendary
	SMODS.Sticker {
		key = "perishable",
		badge_colour = HEX '4f5da1',
		pos = { x = 0, y = 2 },
		should_apply = function(self, card, center, area, bypass_roll)
			return 
		end,
		apply = function(self, card, val)
			card.ability[self.key] = val
			if card.ability[self.key] then card.ability.perish_tally = G.GAME.perishable_rounds end
		end,
		loc_vars = function(self, info_queue, card)
			return { vars = { } }
		end,
		calculate = function(self, card, context)
			if context.end_of_round and not context.repetition and not context.individual then
				card:calculate_perishable()
			end
		end
	}

]]

SMODS.Sticker{
	key = "sgl_brittle",
	badge_colour = HEX '009DFF',
	atlas="sigils",	
	pos = { x=0 , y=0 },
	sets = {Default = true, Joker = true},
	needs_enable_flag = false,
	apply = function(self,card,val)
		if canApplySigil(card, self.key) then
			card.ability[self.key] = val
			print("hhhh")
			print(card.children.center)
			updatePos(card, self, self.pos.x, self.pos.y)
			if card.ability.eternal then 
				card:remove_sticker('eternal') 
			end
			if card.ability.perishable then 
				card:remove_sticker('perishable') 
			end
		end
		
	end,

	calculate = function(self, card, context)
        if context.destroy_card and context.cardarea == G.play and context.destroy_card == card then 
			card.glass_trigger = true
            return { remove = true }
        end
		if context.post_trigger and context.other_card == card then
			card.getting_sliced = true
			SMODS.destroy_cards(card)
            return { remove = true }
        end
    end
}
--Bifurcated Strike
SMODS.Sticker{
	key = "sgl_bifurcated",
	badge_colour = HEX '009DFF',
	atlas="sigils",
	needs_enable_flag = false,
	pos = { x=4 , y=6 },
	sets = {Default = true, Joker = false},
	config = { extra = { retriggers = 1} },
	loc_vars = function(self, info_queue, card)
        return { vars = { self.config.extra.retriggers } }
    end,
	apply = function(self, card, val)
		if canApplySigil(card, self.key) then
			card.ability[self.key] = val
			updatePos(card, self, self.pos.x, self.pos.y)
		end
    end,
	calculate = function(self, card, context)
        if context.repetition then
            return {
                repetitions = self.config.extra.retriggers,
            }
        end
    end
}
--Trifurcated Strike
SMODS.Sticker{
	key = "sgl_trifurcated",
	badge_colour = HEX '4BC292',
	atlas="sigils",
	needs_enable_flag = false,
	pos = { x=5 , y=3 },
	sets = {Default = true, Joker = false},
	config = { extra = { retriggers = 2} },
	loc_vars = function(self, info_queue, card)
        return { vars = { self.config.extra.retriggers } }
    end,
	apply = function(self, card, val)
        if canApplySigil(card, self.key) then
			card.ability[self.key] = val
			updatePos(card, self, self.pos.x, self.pos.y)
		end
    end,
	
	calculate = function(self, card, context)
        if context.repetition then
            return {
                repetitions = self.config.extra.retriggers,
            }
        end
    end
}
--[[ Loose Tail
SMODS.Sticker{
    key = "sgl_tail",
    badge_colour = HEX '009DFF',
    pos = {x=1, y=0},
	atlas="sigils_p2",
	needs_enable_flag=false,
    sets = {Default = false, Joker = true},
	
    apply = function(self, card, val)
        card.ability[self.key] = val
        card.ability.tail_saved = false
    end,

    calculate = function(self, card, context)

    end
}
]]
