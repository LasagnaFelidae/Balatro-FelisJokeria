return {
    descriptions = {
		Tag = {
			tag_felijo_tag_ritual = {
				name = "Ritual Tag",
				text = {
					"Gives a free",
					"{C:felijo_rit}Mega Ritual Pack",
				},
			},
		},
		Other = {
			---- Boosters
			p_felijo_ritual_jumbo = {
                name = "Jumbo Ritual Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2#{C:feljio_rit} Ritual{} cards to",
                    "be used immediately",
                },
            },
            p_felijo_ritual_mega = {
                name = "Mega Ritual Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2#{C:feljio_rit} Ritual{} cards to",
                    "be used immediately",
                },
            },
            p_felijo_ritual_normal = {
                name = "Ritual Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2#{C:feljio_trb} Ritual{} cards to",
                    "be used immediately",
                },
            },
		},
		felijo_ritual = {
			c_felijo_rit_campfire = {
				name = "Campfire",
				text = {
					"Upgrade {C:attention}#1#{} selected card\'s",
					"{C:enhanced}enhancement{} to the {C:attention}next tier{}",
					"Has a {C:red}#3#%{} chance to",
					"{C:red}destroy{} the card instead",
					"{C:inactive,s:0.8}(Chance scales with {C:enhanced,s:0.8}Enhancement {C:inactive,s:0.8}Tier)",
				},
			},
			c_felijo_rit_trader = {
				name = "The Trader",
				text = {
					"Trade up to {C:attention}#1#{} ",
					"{C:felijo_ins_gld}Pelt Cards{} for {C:money}cash",
					"{C:green}#2# in #3#{} chance to give",
					"double the {C:felijo_ins_gld}Pelt{} value"
				},
			},
			c_felijo_rit_prospector = {
				name = "The Prospector",
				text = {
					"Enhance up to {C:attention}#1#{} selected cards",
					"to a random tiered {C:gold}Gold Card",
					"Fixed {C:green}1 in 3{} chance to",
					"turn it into a {C:felijo_ins_gld}Gold Nugget",
				},
			},
			c_felijo_rit_tribes = {
				name = "The Tribes",
				text = {
					"Grants a free",
					"{C:felijo_trb}Tribal Tag",
					"{C:inactive}(Must have Joker room)"
				},
			},
			c_felijo_rit_goobert = {
				name = "Goobert",
				text = {
					"Paint over {C:attention}#1#{} selected joker.",
					"{s:0.8,C:inactive}\"I will paint! Just like The Master!\"",
				},
			},
			c_felijo_rit_trapper = {
				name = "The Trapper",
				text = {
					"Enhance up to {C:attention}#1#{} selected cards",
					"to a random {C:felijo_ins_gld}Pelt Card",
				},
			},
			c_felijo_rit_lostandfound = {
				name = "Lost and Found",
				text = {
					"Grants a free",
					"{C:felijo_trb}Totem Box Tag",
				},
			},
		},
	},
    misc = {
		dictionary={
			b_felijo_ritual_cards = "Ritual Cards",
			k_felijo_ritual_pack = "Ritual Pack",
			k_felijo_ritual = "Ritual",
		},
		labels = {
			felijo_ritual = "Ritual",
		},
	},
}