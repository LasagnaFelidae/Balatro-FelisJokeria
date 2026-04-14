return {
    descriptions = {
		Joker = {
		-- ROBLOX
			j_felijo_rbx_pizza = {
                name = "Pepperoni Pizza",
                text = {
                    "{C:chips}+#1#{} Chips,",
                    "{C:chips}-#2#{} Chips for",
                    "every hand played",
                },
            },
			j_felijo_rbx_burrito = {
                name = "RobloTim's Chavez Burrito",
                text = {
                    "{C:mult}+#1#{} Mult,",
                    "{C:mult}-#2#{} Mult for",
                    "every hand played",
                },
            },
			j_felijo_rbx_turkey = {
                name = "Turkey Leg",
                text = {
                    "{X:mult,C:white}X#1#{} Mult,",
                    "reduces by {X:mult,C:white}-#2#{}",
                    "every round",
                },
            },
			j_felijo_rbx_cheezburger = {
                name = "Cheezburger",
                text = {
                    "{X:chips,C:white}X#1#{} Chips,",
                    "reduces by {X:chips,C:white}-#2#{}",
                    "every round",
                },
            },
			j_felijo_rbx_sandwich = {
                name = "Space Sandwich",
                text = {
                    "{C:chips}+#1#{} Chips for each",
					"empty {C:attention}Joker{} slot,",
                    "reduces by {C:chips}-#2#{}",
                    "every round",
					"{C:inactive}(Currently {C:chips}+#3#{C:inactive})",
					"{C:inactive,s:0.8}(Space Sandwich included)",
                },
            },
			j_felijo_rbx_epic = {
                name = "Epic Sauce",
                text = {
                    "Retrigger {C:attention}#1#{} time(s)",
					"each {C:attention}scored card{},",
                    "increases by {C:attention}+#2#{}",
                    "every round",
					"{s:0.8,C:inactive}(Consumed when the score is on fire)",
                },
            },
			j_felijo_rbx_bloxy = {
                name = "Bloxy Cola",
				text = {
                    "{C:mult}+#1#{} discards,",
                    "reduces by {C:mult}-#2#{}",
                    "every round",
                },
                
            },
			j_felijo_rbx_pumpkinpi = {
                name = "Pumpkin Pi",
				text = {
                    "{C:attention}+#1#{} hand size,",
                    "reduces by {C:attention}-#2#{}",
                    "every #4# rounds",
					"{C:inactive}(Currently {C:attention}#3#{C:inactive}/#4#)",
                },
                
            },
			j_felijo_rbx_vendingmachine = {
                name = "Vending Machine",
                text = {
					{
                    "When entering a blind,",
                    "get a random {C:red}ROBLOX{}",
					"{C:attention}Food Joker",
                    "{C:inactive}(Must have room){}",
					"{C:inactive,s:0.8}(Goes out of order in {C:attention,s:0.8}#1#{C:inactive,s:0.8} rounds)",
					},
                },
                
            },
			j_felijo_rbx_brew = {
                name = "Witches\' Brew",
                text = {
					{
                    "{C:enhanced}+#1#{} selection limit,",
                    "reduces by {C:planet,E:felijo_pink}-#2#{}",
					"every round",
					},
					{
					"Changing {C:enhanced}selection limit{}",
					"also affects {C:blue}play{}",
					"and {C:red}discard{} hand limit"
					},
                },
            },
			j_felijo_rbx_copy = {
                name = "Copy Tool",
                text = {
                    "When entering a blind,",
                    "copy a random {C:attention}Joker.",
                    "{C:inactive}(Must have room){}",
                },
            },
			j_felijo_rbx_delete = {
                name = "Delete Tool",
                text = {
                    "Delete a random amount of jokers then",
					"gain {X:red,C:white}x#2#{} Mult",
					"per deleted Joker",
                    "at the end of a round.",
                    "{C:inactive}(Currently {X:red,C:white}x#1#{C:inactive})",
					"{C:inactive,s:0.8}(Slight chance of deleting everything)",
                },
            },
			j_felijo_rbx_drag = {
                name = "Drag Tool",
                text = {
                    "When dragged {C:attention}around{},",
					"gain {C:wchips}Chips",
                    "Maximum chips increase every ante",
                    "{C:inactive}(Currently {C:blue}+#1#{C:inactive}/#2#)",
                },
            },
		},
	},
}