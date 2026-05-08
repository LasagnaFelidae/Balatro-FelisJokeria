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
	config = { status = {die = false}},
	needs_enable_flag = true,
	discovered = true,
	unlocked = true,
	no_collection = true,
	loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,
	apply = function(self,card,val)
			card.ability[self.key] = val


			if card.ability.eternal then 
				card:remove_sticker('eternal') 
			end
			if card.ability.perishable then 
				card:remove_sticker('perishable') 
			end		
	end,

	calculate = function(self, card, context)
        if context.destroy_card and context.cardarea == G.play and context.destroy_card == card then 
			self.config.status.die = true
        end
		if context.post_trigger and context.other_card == card then
			self.config.status.die = true
        end
		if self.config.status.die then
			card.getting_sliced = true
			card.glass_trigger = true
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
	pos = { x=4 , y=0 },
	sets = {Default = true, Joker = false},
	config = { extra = { retriggers = 1} },
	discovered = true,
	unlocked = true,
	no_collection = true,
	loc_vars = function(self, info_queue, card)
        return { vars = { self.config.extra.retriggers } }
    end,
	apply = function(self, card, val)
		card.ability[self.key] = val
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
	pos = { x=5 , y=0 },
	sets = {Default = true, Joker = false},
	config = { extra = { retriggers = 2} },
	discovered = true,
	unlocked = true,
	no_collection = true,
	loc_vars = function(self, info_queue, card)
        return { vars = { self.config.extra.retriggers } }
    end,
	apply = function(self, card, val)
		card.ability[self.key] = val
    end,
	
	calculate = function(self, card, context)
        if context.repetition then
            return {
                repetitions = self.config.extra.retriggers,
            }
        end
    end
}

--Loose Tail
SMODS.Sticker{
	key = "sgl_tail",
	badge_colour = HEX '4BC292',
	atlas="sigils",
	rate = 0.01,
	needs_enable_flag = false,
	pos = { x=1 , y=0 },
	sets = {Default = false, Joker = true},
	config = { extra = {} },
	discovered = true,
	unlocked = true,
	no_collection = true,
	default_compat = true,
	compat_exceptions = {"j_felijo_ins_tail", "j_felijo_ins_skink"},
	loc_vars = function(self, info_queue, card)
        return { vars = { } }
    end,
	apply = function(self, card, val)
		card.ability[self.key] = val
    end,
	
	calculate = function(self, card, context)
        if ((not card.ability.felijo_copied == true and not card.ability.akyrs_self_destructs == true and not card.ability.eternal == true and not card.ability.felijo_tailed == true)
		and	((context.joker_type_destroyed and context.card == card ))) and not context.retrigger_joker then 
			
			FELIJO.createTail(card)

			
			return {no_retrigger = true}
		end
    end
}

--Stitches for Myco
SMODS.Sticker{
	key = "stk_stitched",
	badge_colour = HEX '4BC292',
	atlas = "stitches",
	needs_enable_flag = true,
	pos = { x=0 , y=0 },
	sets = {Default = true},
	no_collection = true, 
	config = { },
	loc_vars = function(self, info_queue, card)
        return { vars = { } }
    end,
	apply = function(self, card, val)
		card.ability[self.key] = val
    end,
	
	calculate = function(self, card, context)

    end,
	draw = function (self, card, layer)
        G.shared_stickers[self.key].role.draw_major = card
        G.shared_stickers[self.key]:draw_shader('dissolve', nil, nil, nil, card.children.center)
    end
}

SMODS.Sticker{
	key = "stk_goobert",
	badge_colour = HEX '218812',
	atlas = "insGoobert",
	needs_enable_flag = true,
	pos = { x=0 , y=0 },
	sets = {Joker = true},
	no_collection = true,
	config = { 
		extra = {
			mult = "0.9 - x2.5",
		}
	},
	loc_vars = function(self, info_queue, card)
		mult_v = card.ability.stk_goobert_mult or "0.9 - x2.5"
		return { vars = {mult_v} }
	end,
	apply = function(self, card, val)
		card.ability.stk_goobert_mult = (pseudorandom("stk_goobert", 90, 250)/100)
		card.ability[self.key] = val
		if card.ability.extra and type(card.ability.extra) == "table" then
			for _, v in pairs(card.ability.extra) do
				if type(v) == "number" and v ~= 0 then
					card.ability.extra[_] = card.ability.extra[_] * card.ability.stk_goobert_mult
				end
			end
		end
		if card.ability and type(card.ability) == "table" then
			for _, v in pairs(card.ability) do
				if type(v) == "number" and _ ~= "stk_goobert_mult" and v ~= 0 and v ~= 1 then
					card.ability[_] = card.ability[_] * card.ability.stk_goobert_mult
				end
			end
		end
	end,

	remove = function(self, card)
		if card.ability.extra and type(card.ability.extra) == "table" then
			for _, v in pairs(card.ability.extra) do
				if type(v) == "number" and _ ~= "stk_goobert_mult" and v ~= 0 and v ~= 1 then
					card.ability.extra[_] = card.ability.extra[_] / card.ability.stk_goobert_mult
				end
			end
		end
		if card.ability and type(card.ability) == "table" then
			for _, v in pairs(card.ability) do
				if type(v) == "number" and _ ~= "stk_goobert_mult" and v ~= 0 and v ~= 1 then
					card.ability[_] = card.ability[_] / card.ability.stk_goobert_mult
				end
			end
		end
		card.ability.stk_goobert_mult = nil
	end,

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
