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
	{key = "m_gold",   				weight = 5},
	{key = "m_felijo_gold_t2",   	weight = 2},
	{key = "m_felijo_gold_t3",   	weight = 0.02},
	{key = "m_felijo_gold_t4",   	weight = 0.001}
}

FELIJO.trapperTable = {
	{key = "m_felijo_plt_bny",   		weight = 1,		price = 1},
	{key = "m_felijo_plt_wlf",   		weight = 0.2,	price = 2},
	{key = "m_felijo_plt_gold",   		weight = 0.01,	price = 3},
	{key = "m_felijo_plt_olddata",   	weight = 0.001, price = 5},
	{key = "m_felijo_trn_goldn",   		weight = 0, 	price = 3}
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
    {"Tarot", 1},
	{"felijo_tier2_tarot", 0.3},
	{"felijo_tier3_tarot", 0.1},
	{"felijo_tier4_tarot", 0.03},
    {"Planet", 1},
    {"Spectral", 0.2},
    {"felijo_ritual", 0.8},
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