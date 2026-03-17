FELIJO.POOLS = {}

SMODS.ObjectType({
	key = "Food",
	default = "j_joker",
	cards = {},
	inject = function(self)
		SMODS.ObjectType.inject(self)
		self:inject_card(G.P_CENTERS.j_gros_michel)
		self:inject_card(G.P_CENTERS.j_egg)
		self:inject_card(G.P_CENTERS.j_ice_cream)
		self:inject_card(G.P_CENTERS.j_cavendish)
		self:inject_card(G.P_CENTERS.j_turtle_bean)
		self:inject_card(G.P_CENTERS.j_diet_cola)
		self:inject_card(G.P_CENTERS.j_popcorn)
		self:inject_card(G.P_CENTERS.j_ramen)
		self:inject_card(G.P_CENTERS.j_selzer)
	end,
})
SMODS.ObjectType({
	key = "FelisJokeria",
	default = "j_joker",
	cards = {},
	inject = function(self)
		SMODS.ObjectType.inject(self)
	end,
})

SMODS.ObjectType({
	key = "Roblox",
	default = "j_joker",
	cards = {},
	inject = function(self)
		SMODS.ObjectType.inject(self)
	end,
})
SMODS.ObjectType({
	key = "Building Tool",
	default = "j_joker",
	cards = {},
	inject = function(self)
		SMODS.ObjectType.inject(self)
		
	end,
})




FELIJO.POOLS.Roblox_Food = SMODS.ObjectType({
	key = "Roblox_Food",
	default = "j_joker",
	cards = roblox_food,
	inject = function(self)
		SMODS.ObjectType.inject(self)
	end,
})


SMODS.ObjectType({
	key = "Inscryption",
	default = "j_joker",
	cards = {},
	inject = function(self)
		SMODS.ObjectType.inject(self)
	end,
})

SMODS.ObjectType({
	key = "Beast",
	default = "j_joker",
	cards = {},
	inject = function(self)
		SMODS.ObjectType.inject(self)
	end,
})

SMODS.ObjectType({
	key = "Deathcard",
	default = "j_joker",
	cards = {},
	inject = function(self)
		SMODS.ObjectType.inject(self)
		self:inject_card(G.P_CENTERS.j_mr_bones)
	end,
})

SMODS.ObjectType({
	key = "Avian",
	default = "j_joker",
	cards = {},
	inject = function(self)
		SMODS.ObjectType.inject(self)
	end,
})

SMODS.ObjectType({
	key = "Canine",
	default = "j_joker",
	cards = {},
	inject = function(self)
		SMODS.ObjectType.inject(self)
	end,
})

FELIJO.POOLS.Feline = SMODS.ObjectType({
	key = "Feline",
	default = "j_joker",
	cards = {},
	inject = function(self)
		SMODS.ObjectType.inject(self)
		self:inject_card(G.P_CENTERS.j_lucky_cat)
	end,
})
FELIJO.POOLS.Kitty = SMODS.ObjectType({
	key = "Kitty",
	default = "j_joker",
	cards = {},
	inject = function(self)
		SMODS.ObjectType.inject(self)
	end,
})

FELIJO.POOLS.Cat = SMODS.ObjectType({
	key = "Cat",
	default = "j_joker",
	cards = {},
	inject = function(self)
		SMODS.ObjectType.inject(self)
	end,
})





SMODS.ObjectType({
	key = "Hooved",
	default = "j_joker",
	cards = {},
	inject = function(self)
		SMODS.ObjectType.inject(self)
		self:inject_card(G.P_CENTERS.j_bull)
	end,
})
SMODS.ObjectType({
	key = "Insect",
	default = "j_joker",
	cards = {},
	inject = function(self)
		SMODS.ObjectType.inject(self)
	end,
})
SMODS.ObjectType({
	key = "Reptile",
	default = "j_joker",
	cards = {},
	inject = function(self)
		SMODS.ObjectType.inject(self)
	end,
})
SMODS.ObjectType({
	key = "Vermin",
	default = "j_joker",
	cards = {},
	inject = function(self)
		SMODS.ObjectType.inject(self)
	end,
})
SMODS.ObjectType({
	key = "Object",
	default = "j_joker",
	cards = {},
	inject = function(self)
		SMODS.ObjectType.inject(self)
		self:inject_card(G.P_CENTERS.j_bootstraps)
		self:inject_card(G.P_CENTERS.j_drivers_license)
		self:inject_card(G.P_CENTERS.j_brainstorm)
		self:inject_card(G.P_CENTERS.j_satellite)
		self:inject_card(G.P_CENTERS.j_hit_the_road)
		self:inject_card(G.P_CENTERS.j_duo)
		self:inject_card(G.P_CENTERS.j_trio)
		self:inject_card(G.P_CENTERS.j_family)
		self:inject_card(G.P_CENTERS.j_order)
		self:inject_card(G.P_CENTERS.j_tribe)
		self:inject_card(G.P_CENTERS.j_oops)
		self:inject_card(G.P_CENTERS.j_idol)
		self:inject_card(G.P_CENTERS.j_flower_pot)
		self:inject_card(G.P_CENTERS.j_blueprint)
		self:inject_card(G.P_CENTERS.j_wee)
		self:inject_card(G.P_CENTERS.j_hanging_chad)
		self:inject_card(G.P_CENTERS.j_rough_gem)
		self:inject_card(G.P_CENTERS.j_bloodstone)
		self:inject_card(G.P_CENTERS.j_arrowhead)
		self:inject_card(G.P_CENTERS.j_onyx_agate)
		self:inject_card(G.P_CENTERS.j_glass)
		self:inject_card(G.P_CENTERS.j_certificate)
		self:inject_card(G.P_CENTERS.j_smiley)
		self:inject_card(G.P_CENTERS.j_campfire)
		self:inject_card(G.P_CENTERS.j_ticket)
		self:inject_card(G.P_CENTERS.j_mr_bones)
		self:inject_card(G.P_CENTERS.j_diet_cola)
		self:inject_card(G.P_CENTERS.j_trading)
		self:inject_card(G.P_CENTERS.j_flash)
		self:inject_card(G.P_CENTERS.j_popcorn)
		self:inject_card(G.P_CENTERS.j_trousers)
		self:inject_card(G.P_CENTERS.j_ancient)
		self:inject_card(G.P_CENTERS.j_ramen)
		self:inject_card(G.P_CENTERS.j_walkie_talkie)
		self:inject_card(G.P_CENTERS.j_selzer)
		self:inject_card(G.P_CENTERS.j_stone)
		self:inject_card(G.P_CENTERS.j_golden)
		self:inject_card(G.P_CENTERS.j_lucky_cat)
		self:inject_card(G.P_CENTERS.j_baseball)
		self:inject_card(G.P_CENTERS.j_hallucination)
		self:inject_card(G.P_CENTERS.j_reserved_parking)
		self:inject_card(G.P_CENTERS.j_mail)
		self:inject_card(G.P_CENTERS.j_photograph)
		self:inject_card(G.P_CENTERS.j_gift)
		self:inject_card(G.P_CENTERS.j_turtle_bean)
		self:inject_card(G.P_CENTERS.j_cloud_9)
		self:inject_card(G.P_CENTERS.j_rocket)
		self:inject_card(G.P_CENTERS.j_obelisk)
		self:inject_card(G.P_CENTERS.j_midas_mask)
		self:inject_card(G.P_CENTERS.j_hologram)
		self:inject_card(G.P_CENTERS.j_riff_raff)
		self:inject_card(G.P_CENTERS.j_square)
		self:inject_card(G.P_CENTERS.j_red_card)
		self:inject_card(G.P_CENTERS.j_todo_list)
		self:inject_card(G.P_CENTERS.j_cavendish)
		self:inject_card(G.P_CENTERS.j_ice_cream)
		self:inject_card(G.P_CENTERS.j_dna)
		self:inject_card(G.P_CENTERS.j_blackboard)
		self:inject_card(G.P_CENTERS.j_egg)
		self:inject_card(G.P_CENTERS.j_ride_the_bus)
		self:inject_card(G.P_CENTERS.j_business)
		self:inject_card(G.P_CENTERS.j_gros_michel)
		self:inject_card(G.P_CENTERS.j_pareidolia)
		self:inject_card(G.P_CENTERS.j_abstract)
		self:inject_card(G.P_CENTERS.j_delayed_grat)
		self:inject_card(G.P_CENTERS.j_steel_joker)
		self:inject_card(G.P_CENTERS.j_loyalty_card)
		self:inject_card(G.P_CENTERS.j_8_ball)
		self:inject_card(G.P_CENTERS.j_marble)
		self:inject_card(G.P_CENTERS.j_credit_card)
		self:inject_card(G.P_CENTERS.j_ceremonial)
		self:inject_card(G.P_CENTERS.j_banner)
		self:inject_card(G.P_CENTERS.j_stencil)
	end,
})
SMODS.ObjectType({
	key = "Tail",
	default = "j_joker",
	cards = {},
	inject = function(self)
		SMODS.ObjectType.inject(self)
	end,
})
SMODS.ObjectType({
	key = "Other",
	default = "j_joker",
	cards = {},
	inject = function(self)
		SMODS.ObjectType.inject(self)
		self:inject_card(G.P_CENTERS.j_four_fingers)
		self:inject_card(G.P_CENTERS.j_dusk)
		self:inject_card(G.P_CENTERS.j_raised_fist)
		self:inject_card(G.P_CENTERS.j_fibonacci)
		self:inject_card(G.P_CENTERS.j_scary_face)
		self:inject_card(G.P_CENTERS.j_abstract)
		self:inject_card(G.P_CENTERS.j_pareidolia)
		self:inject_card(G.P_CENTERS.j_supernova)
		self:inject_card(G.P_CENTERS.j_splash)
		self:inject_card(G.P_CENTERS.j_superposition)
		self:inject_card(G.P_CENTERS.j_seance)
		self:inject_card(G.P_CENTERS.j_shortcut)
		self:inject_card(G.P_CENTERS.j_hallucination)
		self:inject_card(G.P_CENTERS.j_castle)
		self:inject_card(G.P_CENTERS.j_mr_bones)
		self:inject_card(G.P_CENTERS.j_sock_and_buskin)
		self:inject_card(G.P_CENTERS.j_seeing_double)
		self:inject_card(G.P_CENTERS.j_duo)
		self:inject_card(G.P_CENTERS.j_trio)
		self:inject_card(G.P_CENTERS.j_family)
		self:inject_card(G.P_CENTERS.j_order)
		self:inject_card(G.P_CENTERS.j_tribe)
	end,
})
SMODS.ObjectType({
	key = "Human",
	default = "j_joker",
	cards = {},
	inject = function(self)
		SMODS.ObjectType.inject(self)
		self:inject_card(G.P_CENTERS.j_joker)
		self:inject_card(G.P_CENTERS.j_greedy_joker)
		self:inject_card(G.P_CENTERS.j_lusty_joker)
		self:inject_card(G.P_CENTERS.j_wrathful_joker)
		self:inject_card(G.P_CENTERS.j_gluttenous_joker)
		self:inject_card(G.P_CENTERS.j_zany)
		self:inject_card(G.P_CENTERS.j_mad)
		self:inject_card(G.P_CENTERS.j_crazy)
		self:inject_card(G.P_CENTERS.j_droll)
		self:inject_card(G.P_CENTERS.j_sly)
		self:inject_card(G.P_CENTERS.j_wily)
		self:inject_card(G.P_CENTERS.j_clever)
		self:inject_card(G.P_CENTERS.j_devious)
		self:inject_card(G.P_CENTERS.j_crafty)
		self:inject_card(G.P_CENTERS.j_half)
		self:inject_card(G.P_CENTERS.j_chaos)
		self:inject_card(G.P_CENTERS.j_scholar)
		self:inject_card(G.P_CENTERS.j_space)
		self:inject_card(G.P_CENTERS.j_mime)
		self:inject_card(G.P_CENTERS.j_even_steven)
		self:inject_card(G.P_CENTERS.j_odd_todd)
		self:inject_card(G.P_CENTERS.j_hack)
		self:inject_card(G.P_CENTERS.j_hiker)
		self:inject_card(G.P_CENTERS.j_faceless)
		self:inject_card(G.P_CENTERS.j_green_joker)
		self:inject_card(G.P_CENTERS.j_blue_joker)
		self:inject_card(G.P_CENTERS.j_sixth_sense)
		self:inject_card(G.P_CENTERS.j_runner)
		self:inject_card(G.P_CENTERS.j_burglar)
		self:inject_card(G.P_CENTERS.j_caino)
		self:inject_card(G.P_CENTERS.j_triboulet)
		self:inject_card(G.P_CENTERS.j_yorick)
		self:inject_card(G.P_CENTERS.j_chicot)
		self:inject_card(G.P_CENTERS.j_perkeo)
		self:inject_card(G.P_CENTERS.j_cartomancer)
    	self:inject_card(G.P_CENTERS.j_astronomer)
    	self:inject_card(G.P_CENTERS.j_burnt)
		self:inject_card(G.P_CENTERS.j_shoot_the_moon)
		self:inject_card(G.P_CENTERS.j_stuntman)
    	self:inject_card(G.P_CENTERS.j_invisible)
		self:inject_card(G.P_CENTERS.j_matador)
		self:inject_card(G.P_CENTERS.j_blueprint)
    	self:inject_card(G.P_CENTERS.j_wee)
    	self:inject_card(G.P_CENTERS.j_merry_andy)
		self:inject_card(G.P_CENTERS.j_glass)
    	self:inject_card(G.P_CENTERS.j_ring_master)
		self:inject_card(G.P_CENTERS.j_smeared)
    	self:inject_card(G.P_CENTERS.j_throwback)
		self:inject_card(G.P_CENTERS.j_swashbuckler)
    	self:inject_card(G.P_CENTERS.j_troubadour)
		self:inject_card(G.P_CENTERS.j_mr_bones)
    	self:inject_card(G.P_CENTERS.j_acrobat)
		self:inject_card(G.P_CENTERS.j_hallucination)
    	self:inject_card(G.P_CENTERS.j_fortune_teller)
    	self:inject_card(G.P_CENTERS.j_juggler)
    	self:inject_card(G.P_CENTERS.j_drunkard)
    	self:inject_card(G.P_CENTERS.j_stone)
		self:inject_card(G.P_CENTERS.j_luchador)
		self:inject_card(G.P_CENTERS.j_hologram)
		self:inject_card(G.P_CENTERS.j_vagabond)
    	self:inject_card(G.P_CENTERS.j_baron)
		self:inject_card(G.P_CENTERS.j_vampire)
		self:inject_card(G.P_CENTERS.j_madness)
    	self:inject_card(G.P_CENTERS.j_square)
		self:inject_card(G.P_CENTERS.j_card_sharp)
		self:inject_card(G.P_CENTERS.j_hiker)
    	self:inject_card(G.P_CENTERS.j_faceless)
    	self:inject_card(G.P_CENTERS.j_green_joker)
		self:inject_card(G.P_CENTERS.j_blue_joker)
    	self:inject_card(G.P_CENTERS.j_sixth_sense)
		self:inject_card(G.P_CENTERS.j_runner)
	end,
})

	