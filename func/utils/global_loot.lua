--[[
Adds a new crossmod tribe to the tribe table so that it can use the totem sigil application.

Params:
  data (table): {key = "Tribe", weight = 1, totem_key = "ttm_hd_human",	tribe_card_key = "trb_human", totem_x=2,cost = 8,}

Returns:
  string: tribe table length
]]--
FELIJO.add_tribe = function(tribe)
	local data = {
		key = tribe.key,
		weight = tribe.weight or 1,
		totem_key = tribe.totem_key,
		tribe_card_key = tribe.tribe_card_key,
		totem_x = tribe.totem_x or 2,
		cost = tribe.cost or 6,
	}
	
	if not tribe.key or not tribe.totem_key or not tribe.tribe_card_key then
		error("add_tribe: Missing required fields (key, totem_key, tribe_card_key)")
	end

	table.insert(FELIJO.tribe_table, data)
	print("[FELI'S JOKERIA] Tribe "..tribe.key.." added successfully")
	return #FELIJO.tribe_table
end
--
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

FELIJO.prospectorTable = {
	{key = "m_gold",   				weight = 10},
	{key = "m_felijo_gold_t2",   	weight = 1},
	{key = "m_felijo_gold_t3",   	weight = 0.02},
	{key = "m_felijo_gold_t4",   	weight = 0.001}
}

FELIJO.trapperTable = {
	{key = "m_felijo_plt_bny",   		weight = 1.000,		modifier=0.000  ,price = 1},
	{key = "m_felijo_plt_wlf",   		weight = 0.200,	    modifier=0.050  ,price = 2},
	{key = "m_felijo_plt_gold",   		weight = 0.010,	    modifier=0.100  ,price = 3},
	{key = "m_felijo_plt_olddata",   	weight = 0.001,     modifier=0.050  ,price = 5},
	{key = "m_felijo_trn_goldn",   		weight = 0.000, 	modifier=0.000  ,price = 3}
}

FELIJO.enhancement_tiers = {
	{key = "m_bonus", tier = 1},
	{key = "m_felijo_bonus_t2", tier = 2},
	{key = "m_felijo_bonus_t3", tier = 3},
    {key = "m_felijo_bonus_t4", tier = 4},

    {key = "m_crv_tier1card", tier = 2},
    {key = "m_crv_tier2card", tier = 3},
    {key = "m_crv_tier3card", tier = 4},

	{key = "m_mult", tier = 1},
	{key = "m_felijo_mult_t2", tier = 2},
	{key = "m_felijo_mult_t3", tier = 3},
    {key = "m_felijo_mult_t4", tier = 4},
    
    {key = "m_crv_xmultcard", tier = 2},

	{key = "m_lucky", tier = 1},
	{key = "m_felijo_lucky_t2", tier = 2},
	{key = "m_felijo_lucky_t3", tier = 3},
    {key = "m_felijo_lucky_t4", tier = 4},

    {key = "m_crv_blessedcard", tier = 2},

	{key = "m_glass", tier = 1},
	{key = "m_felijo_glass_t2", tier = 2},
	{key = "m_felijo_glass_t3", tier = 3},
    {key = "m_felijo_glass_t4", tier = 4},

    {key = "m_crv_bulletproofcard", tier = 2},
    {key = "m_crv_mega", tier = 3},

	{key = "m_steel", tier = 1},
	{key = "m_felijo_steel_t2", tier = 2},
	{key = "m_felijo_steel_t3", tier = 3},
    {key = "m_felijo_steel_t4", tier = 4},

    {key = "m_crv_diamondcard", tier = 2},



	{key = "m_stone", tier = 1},
	{key = "m_felijo_stone_t2", tier = 2},
	{key = "m_felijo_stone_t3", tier = 3},
    {key = "m_felijo_stone_t4", tier = 4},


	{key = "m_gold", tier = 1},
	{key = "m_felijo_gold_t2", tier = 2},
	{key = "m_felijo_gold_t3", tier = 3},
    {key = "m_felijo_gold_t4", tier = 4},

    {key = "m_crv_rhodium", tier = 2},


	{key = "m_crv_superiore", tier = 1},
	{key = "m_felijo_enh_sup", tier = 1},
	{key = "m_felijo_enh_sup_t2", tier = 2},
	{key = "m_felijo_enh_sup_t3", tier = 3},
    {key = "m_felijo_enh_sup_t4", tier = 4},



}

FELIJO.upgradablelist = {
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

FELIJO.consumeables_table = {
    {key = "Tarot",                 weight = 1.00},
	{key = "felijo_tier2_tarot",    weight = 0.30},
	{key = "felijo_tier3_tarot",    weight = 0.10},
	{key = "felijo_tier4_tarot",    weight = 0.03},
    {key = "Planet",                weight = 1.00},
    {key = "Spectral",              weight = 0.20},
    {key = "felijo_ritual",         weight = 0.80},
}
FELIJO.JoyousTribes = {
    Insect  = { Insect = true },
    Reptile = { Dragon = true, Wyrm = true, Dinosaur = true, SeaSerpent = true, Reptile = true },
    Human   = { Warrior = true, Spellcaster = true, Zombie = true, BeastWarrior = true, Cyberse = true },
    Object  = { Machine = true, Cyberse = true },
    Other   = { CreatorGod = true, Fairy = true, Zombie = true, Beast = true, BeastWarrior = true, DivineBeast = true },
    Avian   = { WingedBeast = true, Fairy = true, Dragon = true },
}
FELIJO.PoolTribes = {
	Feline = { "Kitty", "Cat" , "kity", },
    Canine = { "Dog", "Puppy" , },
    Avian  = { "Birb", "Bird" , },
    Human  = { "Anime", "Vocaloid" , "VTuber" , },
    Other  = { "Meme", "Video Game" ,  "Minecraft" , },
    Object = { "Food", "Vocaloid" , },
    Insect = { "Bug" , },
    Hooved = { "Pony", "Horse" ,},
    All = { "Amalgam"},
    Reptile = {"Dragon"},
    Vermin = {"Squirrel"},
}

FELIJO.tribe_table = {
	{key = "Avian", 	weight = 1.0,	totem_key = "ttm_hd_avian",		tribe_card_key = "trb_avian",		totem_x=6,		cost = 4,	},
	{key = "Canine", 	weight = 1.0,	totem_key = "ttm_hd_canine",	tribe_card_key = "trb_canine",		totem_x=9,		cost = 4,	},
	{key = "Feline", 	weight = 1.0,	totem_key = "ttm_hd_feline",	tribe_card_key = "trb_feline",		totem_x=3,		cost = 4,	},
	{key = "Hooved", 	weight = 1.0,	totem_key = "ttm_hd_hooved",	tribe_card_key = "trb_hooved",		totem_x=5,		cost = 4,	},
	{key = "Insect", 	weight = 1.0,	totem_key = "ttm_hd_insect",	tribe_card_key = "trb_insect",		totem_x=1,		cost = 4,	},
	{key = "Reptile", 	weight = 1.0,	totem_key = "ttm_hd_reptile",	tribe_card_key = "trb_reptile",		totem_x=0,		cost = 4,	},
	{key = "Vermin", 	weight = 1.0,	totem_key = "ttm_hd_vermin",	tribe_card_key = "trb_vermin",		totem_x=8,		cost = 4,	},
	{key = "Object", 	weight = 0.8,	totem_key = "ttm_hd_object",	tribe_card_key = "trb_object",		totem_x=4,		cost = 6,	},
	{key = "Other", 	weight = 0.8,	totem_key = "ttm_hd_other",		tribe_card_key = "trb_other",		totem_x=7,		cost = 6,	},
	{key = "Human", 	weight = 0.6,	totem_key = "ttm_hd_human",		tribe_card_key = "trb_human",		totem_x=2,		cost = 8,	},
}

if FELIJO.is_mod_loaded("RevosVault") then
    FELIJO.add_tribe({
        key = "Printer", 
        weight = 1.0, 
        totem_key = "ttm_hd_crv_printer", 
        tribe_card_key = "trb_crv_printer", 
        totem_x=10, 
        cost=8
    })
    FELIJO.add_tribe({
        key = "Banana", 
        weight = 1.0, 
        totem_key = "ttm_hd_crv_banana", 
        tribe_card_key = "trb_crv_banana", 
        totem_x=11, 
        cost=7
    })
end

FELIJO.totem_sigil_table = {
    {key = "felijo_ttm_sgl_bifurcated",   weight = 1.0,		totem_key="ttm_bifurcated",		totem_x=0,		cost = 6,	},
    {key = "felijo_ttm_sgl_undying",      weight = 0.6,		totem_key="ttm_undying",		totem_x=3,		cost = 8,	},
    {key = "felijo_ttm_sgl_swap",         weight = 1.0,		totem_key="ttm_swap",			totem_x=2,		cost = 4,	},
    {key = "felijo_ttm_sgl_midas",        weight = 1.0,		totem_key="ttm_midas",			totem_x=1,		cost = 5,	},
    {key = "felijo_ttm_sgl_cardbearer",   weight = 1.0,		totem_key="ttm_cardbearer",		totem_x=8,		cost = 4,	},
    {key = "felijo_ttm_sgl_giftbearer",   weight = 1.0,		totem_key="ttm_giftbearer",		totem_x=4,		cost = 4,	},
    {key = "felijo_ttm_sgl_leader",       weight = 1.0,		totem_key="ttm_leader",			totem_x=9,		cost = 4,	}, 
    {key = "felijo_ttm_sgl_omnistrike",   weight = 0.8,		totem_key="ttm_omnistrike",		totem_x=5,		cost = 6,	},   
    {key = "felijo_ttm_sgl_repulsive",    weight = 0.8,		totem_key="ttm_repulsive",		totem_x=6,		cost = 6,	},
    {key = "felijo_ttm_sgl_stinky",       weight = 1.0,		totem_key="ttm_stinky",			totem_x=7,		cost = 4,	},
}

FELIJO.superior_enhancement = "m_felijo_enh_sup"

if FELIJO.is_mod_loaded("RevosVault") and SMODS.Mods["RevosVault"].config and SMODS.Mods["RevosVault"].config.superior_enabled == true then
	FELIJO.superior_enhancement = "m_crv_superiore"
else
	FELIJO.superior_enhancement = "m_felijo_enh_sup"
end

FELIJO.superior_tiers = {
    {"m_felijo_enh_sup_t4", 1},
    {"m_felijo_enh_sup_t3", 2},
    {"m_felijo_enh_sup_t2", 4},
    {FELIJO.superior_enhancement, 13},
}