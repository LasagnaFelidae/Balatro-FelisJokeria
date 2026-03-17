return {
    descriptions = {
		Enhanced = {
			m_felijo_scoretest_t2 = {
                name = "scoretest",
                text = {
                    "Score: {C:chips}#1#{} (+#2#)",
					"Held Score: {C:chips}#3#{} (+#4#)",
					"xScore: {C:chips}#5#{} (+#6#)",
					"Held xScore: {C:chips}#7#{} (+#8#)",
					"BScore: {C:chips}#9#{} (+#10#)",
					"Held BScore: {C:chips}#11#{} (+#12#)",
					"xBScore: {C:chips}#13#{} (+#14#)",
					"Held xBScore: {C:chips}#15#{} (+#16#)",
					
                },
            },
			m_felijo_bonus_t2 = {
                name = "Bonus Card [II]",
                text = {
                    "{C:chips}+#1#{} extra chips",
                },
            },
			m_felijo_bonus_t3 = {
                name = "Bonus Card [III]",
                text = {
                    "{C:chips}+#1#{} extra chips",
                },
            },
			m_felijo_bonus_t4 = {
                name = "Bonus Card [IV]",
                text = {
                    "{C:chips}+#1#{} extra chips",
                },
            },
            m_felijo_glass_t2 = {
                name = "Glass Card [II]",
                text = {
                    "{X:mult,C:white} X#1# {} Mult",
                    "{C:green}#2# in #3#{} chance to",
                    "destroy card",
                },
            },
			m_felijo_glass_t3 = {
                name = "Glass Card [III]",
                text = {
                    "{X:mult,C:white} X#1# {} Mult",
                    "{C:green}#2# in #3#{} chance to",
                    "destroy card",
                },
            },
			m_felijo_glass_t4 = {
                name = "Glass Card [IV]",
                text = {
                    "{X:mult,C:white} X#1# {} Mult",
                    "{C:green}#2# in #3#{} chance to",
                    "destroy card",
                },
            },
            m_felijo_gold_t2 = {
                name = "Gold Card [II]",
                text = {
					{
						"{C:money}$#1#{} if this",
						"card is held in hand",
						"at end of round",
					},
					{
						"Earn {C:money}$#2#{} when this",
						"card is played",
						"and scores",
					}
				}
            },
			m_felijo_gold_t3 = {
                name = "Gold Card [III]",
                text = {
					{
						"{C:money}$#1#{} if this",
						"card is held in hand",
						"at end of round",
					},
					{
						"Earn {C:money}$#2#{} when this",
						"card is played",
						"and scores",
					}
				}
            },
			m_felijo_gold_t4 = {
                name = "Gold Card [IV]",
                text = {
					{
						"{C:money}$#1#{} if this",
						"card is held in hand",
						"at end of round",
					},
					{
						"Earn {C:money}$#2#{} when this",
						"card is played",
						"and scores",
					}
				}
            },
            m_felijo_lucky_t2 = {
                name = "Lucky Card [II]",
                text = {
                    "{C:green}#1# in #4#{} chance",
                    "for {C:mult}+#3#{} Mult",
					"{C:green}#7# in #8#{} chance",
                    "for {C:chips}+#9#{} Chips",
                    "{C:green}#2# in #6#{} chance",
                    "to win {C:money}$#5#",
                },
            },
			m_felijo_lucky_t3 = {
                name = "Lucky Card [III]",
                text = {
                    "{C:green}#1# in #4#{} chance",
                    "for {C:mult}+#3#{} Mult",
					"{C:green}#7# in #8#{} chance",
                    "for {C:chips}+#9#{} Chips",
                    "{C:green}#2# in #6#{} chance",
                    "to win {C:money}$#5#",
                },
            },
			m_felijo_lucky_t4 = {
                name = "Lucky Card [IV]",
                text = {
                    "{C:green}#1# in #4#{} chance",
                    "for {C:mult}+#3#{} Mult",
					"{C:green}#7# in #8#{} chance",
                    "for {C:chips}+#9#{} Chips",
                    "{C:green}#2# in #6#{} chance",
                    "to win {C:money}$#5#",
                },
            },
            m_felijo_mult_t2 = {
                name = "Mult Card [II]",
                text = {
                    "{C:mult}+#1#{} Mult",
                },
            },
			m_felijo_mult_t3 = {
                name = "Mult Card [III]",
                text = {
                    "{C:mult}+#1#{} Mult",
                },
            },
			m_felijo_mult_t4 = {
                name = "Mult Card [IV]",
                text = {
                    "{C:mult}+#1#{} Mult",
                },
            },
            m_felijo_steel_t2 = {
                name = "Steel Card [II]",
                text = {
                    "{X:mult,C:white} X#1# {} Mult",
                    "while this card",
                    "stays in hand",
                },
            },
			m_felijo_steel_t3 = {
                name = "Steel Card [III]",
                text = {
                    "{X:mult,C:white} X#1# {} Mult,",
                    "while this card",
                    "stays in hand",
                },
            },
			m_felijo_steel_t4 = {
                name = "Steel Card [IV]",
                text = {
                    "{X:mult,C:white} X#1# {} Mult,",
                    "while this card",
                    "stays in hand",
                },
            },
            m_felijo_stone_t2 = {
                name = "Stone Card [II]",
                text = {
                    "{C:chips}+#1#{} Chips",
                    "no rank or suit",
                },
            },
			m_felijo_stone_t3 = {
                name = "Stone Card [III]",
                text = {
                    "{C:chips}+#1#{} Chips,",
					"{C:mult}+#2#{} Mult,",
                    "no rank or suit",
                },
            },
			m_felijo_stone_t4 = {
                name = "Stone Card [IV]",
                text = {
                    "{C:chips}+#1#{} Chips,",
					"{C:mult}+#2#{} Mult,",
                    "no rank or suit",
                },
            },
			m_felijo_enh_sup = {
				name = "Superior Card",
				text = {
					{
						"{X:chips,C:white}#1#%{} of {C:attention}card rank{} as xChips",
						"{C:inactive,s:0.8}(With a minimum of {X:chips,C:white,s:0.8}x1{C:inactive,s:0.8} xChips)"
					},
				},
			
			},
			m_felijo_enh_sup_t2 = {
                name = "Superior Card [II]",
                text = {
					{
						"{X:chips,C:white}#1#%{} of {C:attention}card rank{} as xChips",
						"{C:inactive,s:0.8}(With a minimum of {X:chips,C:white,s:0.8}x1{C:inactive,s:0.8} Chips)"
					},
				},
            },
			m_felijo_enh_sup_t3 = {
                name = "Superior Card [III]",
                text = {
					{
						"{X:chips,C:white}#1#%{} of {C:attention}card rank{} as xChips",
						"{C:inactive,s:0.8}(With a minimum of {X:chips,C:white,s:0.8}x1{C:inactive,s:0.8} Chips)"
					},
				},
            },
			m_felijo_enh_sup_t4 = {
                name = "Superior Card [IV]",
                text = {
					{
						"{X:chips,C:white}#1#%{} of {C:attention}card rank{} as xChips",
						"{C:inactive,s:0.8}(With a minimum of {X:chips,C:white,s:0.8}x1{C:inactive,s:0.8} Chips)"
					},
				},
            },
			m_felijo_plt_gold = {
				name = "{B:1,V:2}Gold Pelt",
				text = {
					{
						"Grants {C:money}$#1#{} on discard",
						"only if {C:legendary}traded.",
					},
					{
						"Always scores"
					},
					{
						"{s:0.8}Trading: {}{B:5,C:white,s:0.8}#2#",
						"{C:inactive,s:0.8}A very high-quality sought after pelt."
					}
				},
			
			},
			m_felijo_plt_wlf = {
				name = "{B:1,V:2}Wolf Pelt",
				text = {
					{
						"Grants {C:money}$#1#{} on discard",
						"only if {C:legendary}traded.",
					},
					{
						"Always scores"
					},
					{
						"{s:0.8}Trading: {}{B:5,C:white,s:0.8}#2#",
						"{C:inactive,s:0.8}A sufficient and reliable piece of pelt."
					}
				},
			
			},
			m_felijo_plt_bny = {
				name = "{B:1,V:2}Bunny Pelt",
				text = {
					{
						"Grants {C:money}$#1#{} on discard",
						"only if {C:legendary}traded.",
					},
					{
						"Always scores"
					},
					{
						"{s:0.8}Trading: {}{B:5,C:white,s:0.8}#2#",
						"{C:inactive,s:0.8}A very basic piece of pelt."
					}
				},
			
			},
			m_felijo_plt_olddata = {
				name = "{B:1,V:2}OLD_DATA",
				text = {
					{
						"Grants {C:money}$#1#{} on discard",
						"only if {C:legendary}traded.",
					},
					{
						"Always scores"
					},
					{
						"{s:0.8}Trading: {}{B:5,C:white,s:0.8}#2#",
						"{C:inactive,s:0.8}A very ¬¦¤¿ ????."
					}
				},
			
			},
			m_felijo_trn_goldn = {
				name = "{B:1,V:2}Gold Nugget",
				text = {
					{
						"Grants {C:money}$#1#{} on discard",
						"only if {C:legendary}traded.",
						"Always scores, grants {C:inactive}nil."
					},
					{
						"{s:0.8}Trading: {}{B:5,C:white,s:0.8}#2#",
						"{C:inactive,s:0.8}There's GOLD in these cards!"
					}
				},
			
			},
			m_felijo_enh_sup = {
				name = "Superior",
				text = {
					{
						"Grants {C:attention}card rank{} multiplied by ",
						"{X:chips,C:white}#1#{} xChips when played.",
						"{C:inactive,s:0.8}(With a minimum of {X:chips,C:white,s:0.8}1{C:inactive,s:0.8} xChips)"
					},
				},
			
			},

		},
		Blind = {
			bl_felijo_ins_trader = {
				name = "The Trader",
				text = {
					"One random joker",
					"disabled every hand.",
					"Extremely large blind"
				},
			
			},
			bl_felijo_pin = {
				name = "The Pin",
				text = {
					"Hand must contain 4 cards or more",
					"and no face cards or 10s."
				}
			},
			bl_felijo_pin_c = {
				name = "The Pin",
				text = {
					"Hand must contain 4 cards or more ",
					"and no face cards or 10s.",
					"{s:0.8}(Appears if The Login is cleared or if game is won.){}"
				}
			},
		
		
		},
		Voucher = {
			v_felijo_beartrap = {
				name = "Bear Trap",
				text = {
				"Unlocks the ability to have {C:money}Pelts{}."
				},
			
			
			},
			v_felijo_peltmarket = {
				name = "Pelt Market",
				text = {
				"Enables the {C:money}trading{} of {C:money}Pelts{}."
				},		
			},
		
		
		
		},
        Joker = {
		-- ROBLOX
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
                    "{C:chips}+#1#{} hand size,",
                    "reduces by {C:chips}-#2#{}",
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
			
			
		-- LETTERJOKERS
		-- LETTERJOKERS
		-- LETTERJOKERS
			j_felijo_ltr_dbl = {
                name = "Double Letter Tile",
                text = { 
                    "{C:green}#3# in #4#{} chance to retrigger",
                     "a scored card {C:attention}+#1#{} times",
                    "when scored",
                    "{s:0.7,C:inactive}(Caps at #2# sets of retriggers){}"
                }
            },
			j_felijo_ltr_tpl = {
                name = "Triple Letter Tile",
                text = { 
                    "{C:green}#3# in #4#{} chance to retrigger",
                    "a scored card {C:attention}+#1#{} times",
                    "when scored",
                    "{s:0.7,C:inactive}(Caps at #2# sets of retriggers){}"
                }
            },
			j_felijo_ltr_qdl = {
                name = "Quad Letter Tile",
                text = { 
                    "{C:green}#3# in #4#{} chance to retrigger",
                     "a scored card {C:attention}+#1#{} times",
                    "when scored",
                    "{s:0.7,C:inactive}(Caps at #2# sets of retriggers){}"
                }
            },
			j_felijo_ltr_dbw = {
                name = "Double Word Tile",
                text = { 
                    "{C:green}#3# in #4#{} chance to",
                    "Gain {X:chips,C:white}x#1#{} Chips and {X:mult,C:white}x#2#{} Mult",
                    "{s:0.7,C:inactive}(Hand needs to be 4 cards or more){}"
                }
            },
			j_felijo_ltr_tpw = {
                name = "Triple Word Tile",
                text = { 
                    "{C:green}#3# in #4#{} chance to",
                    "Gain {X:chips,C:white}x#1#{} Chips and {X:mult,C:white}x#2#{} Mult",
                    "{s:0.7,C:inactive}(Hand needs to be 6 cards or more){}"
                }
            },
			j_felijo_ltr_qdw = {
                name = "Quad Word Tile",
                text = { 
                    "{C:green}#3# in #4#{} chance to",
                    "Gain {X:chips,C:white}x#1#{} Chips and {X:mult,C:white}x#2#{} Mult",
                    "{s:0.7,C:inactive}(Hand needs to be 8 cards or more){}"
                }
            },
			j_felijo_ltr_cleanslate = {
                name = "Clean Slate",
                text = { 
                    "{C:chips}+#1#{} Chips and {C:money}$#2#{}",
                    "if the {C:attention}entire hand{} is {C:attention}played{} and {C:attention}scored"
                }
            },

			-- TOGAPack
			j_felijo_toga_loic = {
                name = "{B:1,V:2}Low-Orbit Ion Cannon",
                text = {
					{
						"While {C:legendary}charging{}, earn {X:legendary,C:white}X#2#{} of your",
						"{C:attention}current score{} as this Joker's {C:mult}Mult{}.",
					},
					{
						"Once {C:legendary}ready{}, blast {C:mult}#1#{} Mult, ",
						"gain {C:attention}+#8#{} CT, {X:attention,C:white}+#9#{} charge multiplier",
						"and go into {C:legendary}cooldown{} for {C:attention}#6#{} hands.",
					},
					{
						"Status: {B:3,C:white}#7#{} | CT: {C:inactive}#3#{}/#4# | CD:{C:inactive}#5#{}/#6#",
						"{s:0.7,C:inactive}When harpoons, air strikes and nukes fail. | v. 1.0.4.0",
					},
                }
            },
			
			
			
			
			
			-- INSCRYPTION
			j_felijo_ins_aiko = {
                name = "{B:1,V:2,f:felijo_Feli5x8}Aiko",
                text = {
					{
					"{C:chips}+#2#{} Chips, {C:mult}+#3#{} Mult",
					},
					{
                    "When {C:attention}Blind{} is selected,",
                    "destroys the Joker to its left",
                    "and permanently add {C:attention}1{}% of its",
                    "sell value to this card's {X:chips,C:white}XChips",
					},
					{
                    "{C:inactive}(Currently {X:chips,C:white}X#1#{C:inactive} Chips)"
					},
                },
            },
		
			j_felijo_ins_toga = {
                name = "{B:1,V:2,f:felijo_Feli5x8}T.O.G.A.",
                text = {
					{
					"{C:chips}+#1#{} Chips, {C:mult}+#2#{} Mult",
					},
					{
                    "After playing {C:attention}#4#{} hands,",
					"get a random {C:attention}consumable{}",
					"Fixed {C:green}1 in 6{} chance to it be {C:dark_edition}Negative",
					"{C:inactive,s:0.6}(Must have room)",
                    "{C:inactive,s:0.8}(Currently #3#/#4# hands played)",
					"{C:inactive,s:0.7}(Req. increases for each consumable given.)"
					},
                },
            },
			j_felijo_ins_ouro = {
                name = "{B:1,V:2,f:felijo_Feli5x8}Ouroboros",
                text = {
					{
					"{X:chips,C:white}X#1#{} Chips, {X:mult,C:white}X#2#{} Mult",
					},
					{
                    "When {C:red}destroyed{}, create a copy that",
                    "gains {X:edition, C:white}+#3#{} {C:chips}xChips{} and {C:mult}xMult{} ",
					},
					{
					"After {C:attention}#5#{} rounds, selling",
					"counts as {C:red}destroying{} the card",
                    "{C:inactive}(Currently {C:attention}#4#{C:inactive}/#5#)",
					}
                },
            },
			j_felijo_ins_tail = {
                name = "{B:1,V:2,f:felijo_Feli5x8}Loose Tail",
                text = {
					"{C:mult} +#1# Mult",
					"A dripping, useless bit of tail.",
					"{C:inactive}(Only obtainable through a sigil)"
                },
            },
			j_felijo_ins_evgast = {
                name = "{B:1,V:2,f:felijo_Feli5x8}Evgast",
                text = {
					"{C:chips}+#2#{} Chips, {C:mult}+#3#{} Mult",
                    "Each played {C:attention}Ace{} reduces",
                    "current {C:attention}Blind{} score",
					"requirement by {B:1,V:2}#1#%{}",
                    "{s:0.7,C:inactive}(When the Aces are flying... I think...)"
                },
            },
			j_felijo_ins_luna = {
                name = "{B:1,V:2,f:felijo_Feli5x8}Luna",
                text = {
					"{C:chips}+#2#{} Chips, {C:mult}+#3#{} Mult",
                    "On {C:attention}Blind{} selected",
                    "spawn a random {C:attention}Joker{}.",
					"{C:inactive}(Must have room.)",
                    "{s:0.7,C:inactive}(See you in the blindside.)"
                },
            },
			j_felijo_ins_myco = {
                name = "{B:1,V:2,f:felijo_Feli5x8}The Mycologists{}",
                text = {
					{
					"If the {C:attention}first{} hand scored is a {C:attention}Pair{},",
                    "{C:attention}stitch{} the two {C:attention}Cards{} together.",
					},
					{
					"Stitching two cards into one",
					"doubles the base {C:chips}Chips{}",
					"and grants either {C:attention}Cards\'{}",
					"{C:diamonds}Suit{}, {C:planet}Seal{}, {C:legendary}Edition{} and",
					"{C:enhanced}Enhancement{}.",
					},
					{
					"{s:0.8,V:3}[Y-You might want t-to look away]",
                    "{s:0.7,V:4}[Things might look ugly.]"
					},
                },
            },

			j_felijo_ins_magpie = {
                name = "{B:1,V:2,f:felijo_Feli5x8}Magpie{}",
                text = {
					{
					"{C:chips}+#1#{} Chips, {C:mult}+#2#{} Mult",
					},
					{
                    "Gain {X:chips,C:white} X#3# {} Chips",
                    "for each {C:spades}Steam{} badge",
					"earned to get your",
					"current {C:spades}Steam{} level",
                    "{C:inactive,s:0.8}(Currently {X:chips,C:white,s:0.8}X#4#{}{C:inactive,s:0.8}){}"
					}
                }
		    },
			j_felijo_ins_lilyfelli = {
                name = "{B:1,V:2,f:felijo_Feli5x8}Lily{}",
                text = {
					{
					"{C:chips}+#1#{} Chips, {C:mult}+#2#{} Mult",
					},
					{
					"Retriggers {C:attention}#3#{} times each played card that",
					"matches the current {C:attention}pronoun{},",
					"pronouns change every round.",
					},
					{
					"{C:inactive}[Currently{} {B:3,C:white} #4# {}{C:inactive}]{}"
					}
                },
            },
			j_felijo_ins_nxkoo = {
                name = "{B:1,V:2,f:felijo_Feli5x8}Nxkoo{}",
                text = {
					{
					"{C:chips}+#1#{} Chips, {C:mult}+#2#{} Mult",
					},
					{
					"{X:red,C:white}X1{} Mult for each owned Joker",
					"{C:inactive,}(Currently {X:red,C:white}X#3#{}{C:inactive}){}{}",
					"{C:inactive,s:0.8}Lusty Jokers grant an additional {X:red,C:white,s:0.8}X0.5{}",
					},
                },
            },
			
			j_felijo_ins_revo = {
                name = "{B:1,V:2,f:felijo_Feli5x8}Revo{}",
                text = {
					{
					"{C:chips}+#1#{} Chips, {C:mult}+#2#{} Mult",
					},
					{
					"{C:green}#3# in #4#{} chance to add a {C:enhanced}unenhanced{} copy",
					"of a playing card to the deck",
					},
					{
					"Once {C:attention}#6#{} cards have been copied, become {C:tarot}Superior{}",
					"{C:inactive,s:0.8}(Currently {C:attention,s:0.8}#5#{C:inactive,s:0.8}/#6#){}{}{}"
					},
                },
            },
			
			j_felijo_ins_revo_s = {
                name = {
				"{X:tarot,V:2,s:0.3}SUPERIOR{}",
				"{B:1,V:2,f:felijo_Feli5x8}Revo{}",
				},
                text = {
					{
					"{C:chips}+#1#{} Chips, {C:mult}+#2#{} Mult",
					},
					{
					"{C:green}#3# in #4#{} chance to add a",
					"tiered {C:tarot}Superior{} copy",
					"of a playing card to the deck,",
					},
					{
					"Superior Tier chance is fixed.",
					"{X:tarot,C:white}Tier 4{} : {C:green}5%{}",
					"{X:tarot,C:white}Tier 3{} : {C:green}10%{}",
					"{X:tarot,C:white}Tier 2{} : {C:green}20%{}",
					"{X:tarot,C:white}Tier 1{} : {C:green}65%{}",
					},
                },
            },
			-- LEGENDARIES
			
			j_felijo_lgd_feli = {
				name = "{C:money,E:1,S:2}Feli{}",
				text = {
					{
					"{C:chips}+#1#{} Chips per scored card multiplied",
					"by the number of times",
					"the {C:attention}poker hand{} has been played",
					},
					{
					"If letters are enabled,",
					"{C:green}#2# in #3#{} chance to level up {C:attention}poker hand{}",
					"if {C:attention}word{} is related to {C:attention}Garfield{}",
					"{s:0.7,C:inactive}(The second self-insert of all time! ;)){}"
					}
				},
			},
			
			-- OTHER

			
			
			j_felijo_bliss = {
			  name = "Bliss",
			  text = { 
				"Gains {C:chips}+#1#{} Chips",
				"if {C:attention}#2#{} or more suits",
				"have been scored.",
				"{C:inactive}(Currently {}{C:chips}+#3#{}{C:inactive} Chips.)"
			  }
			},
			
			j_felijo_stock_exchange = {
			  name = {
			  "{C:diamonds}CATS{} Stock Exchange",
			  "{C:diamonds,s:0.6}(Central Asset Trading Syndicate){}"
			  },
			  text = { 
				{
				"LocalThunk Games, Inc.",
				"{B:1,C:white}#1# (#18##30#%){} | PRICE: {C:gold}$#3#{}, {X:diamonds,C:white}$#26#{} | {X:inactive,C:white}x#2#{}{X:gold,C:white}$#4#{}",
				},
				{
				"JimboCorp Industries, Limited",
				"{B:2,C:white}#5# (#19##31#%){} | PRICE: {C:gold}$#7#{}, {X:diamonds,C:white}$#27#{} | {X:inactive,C:white}x#6#{}{X:gold,C:white}$#8#{}",
				},
				{
				"Spectral Innovations, LLC",
				"{B:3,C:white}#9# (#20##32#%){} | PRICE: {C:gold}$#11#{}, {X:diamonds,C:white}$#28#{} | {X:inactive,C:white}x#10#{}{X:gold,C:white}$#12#{}",
				},
				{
				"Joker's Delicatessen International",
				"{B:4,C:white}#13# (#21##33#%){} | PRICE: {C:gold}$#15#{}, {X:diamonds,C:white}$#29#{} | {X:inactive,C:white}x#14#{}{X:gold,C:white}$#16#{}",
				},
				{
				"Bonus Trend Modifier: {C:green}+#22#",
				"{C:inactive,s:0.8}+#24# per \'Oops! All 6s\'{}",
				"Bonus Volatility Mod: {C:blue}+#23#",
				"{C:inactive,s:0.8}+#25# per Round{}"
				},
				{
				"Legend",
				"{X:dark_edition,C:white}STOCK_(CHANGE%){}",
				"{C:gold}$UNIT{}, {X:diamonds,C:white}$MODE{} {s:0.7}(x1, x5, x10 or all){}",
				"{X:inactive,C:white}OWNED_STOCK{} {X:gold,C:white}$TOTAL_VALUE{}"
				}
			  }
			},
        },
		Other = {
			---- TOTEM SIGILS
			felijo_ttm_sgl_bifurcated = {
				name = "Bifurcated Strike",
				text = {
					"Retriggers joker once"
				},
			},
			felijo_ttm_sgl_undying = {
				name = "Undying",
				text = {
					"When destroyed,",
					"create a copy of itself"
				},
			},
			felijo_ttm_sgl_swap = {
				name = "Swapper",
				text = {
					"Swap around {C:chips}Chips{} and {C:mult}Mult{}"
				},
			},
			felijo_ttm_sgl_midas = {
				name = "Midas Touch",
				text = {
					"Earn {C:money}$#1#{} when scored"
				},
			},
			felijo_ttm_sgl_cardbearer = {
				name = "Card Bearer",
				text = {
					"Add a random {C:attention}playing card",
					"to your deck",
				},
			},
			felijo_ttm_sgl_giftbearer = {
				name = "Gift Bearer",
				text = {
					"When destroyed or sold,",
					"add a random {C:spectral}Consumable",
					"to your deck",
				},
			},
			felijo_ttm_sgl_leader = {
				name = "Leader",
				text = {
					"{C:mult}+#1#{} Mult for each",
					"neighboring joker",
					"(Currently {C:mult}+#2#{})"
				},
			},
			felijo_ttm_sgl_omnistrike = {
				name = "Omni Strike",
				text = {
					"Retrigger every played card"
				},
			},
			felijo_ttm_sgl_repulsive = {
				name = "Repulsive",
				text = {
					"When anything tries to disable",
					"this card, it does not"
				},
			},
			felijo_ttm_sgl_stinky = {
				name = "Stinky",
				text = {
					"{X:gold,C:white}-#1#%{} Blind Req.",
				},
			},
		
			---- SIGILS
			felijo_sgl_bifurcated = {
				name = "Bifurcated Strike",
				text = {"Retrigger card once"},
			},

			felijo_sgl_trifurcated = {
				name = "Trifurcated Strike",
				text = {"Retrigger card twice"},
			},

			felijo_sgl_brittle = {
				name = "Brittle",
				text = {"Breaks after being triggered or played"},
			},
			
			felijo_sgl_tail = {
				name = "Loose Tail",
				text = {"Prevents the joker from being destroyed"},
			},
			felijo_stk_stitched = {
				name = "Stitched Card",
				text = {
				"The card has been brutally stitched",
				"together by {C:clubs,E:1}The Mycologists{}."
				},
			},
			felijo_stk_subspace = {
				name = "Subspaced Card",
				text = {
				"The card has been tinted",
				"{C:clubs,E:felijo_pink}pink{} by {C:clubs,E:felijo_pink}Subspace Tripmine{}.",
				"{C:chips}+100{} chips when held."
				},
			},
			felijo_stk_copied = {
				name = "Copied Card",
				text = {
				"Disappears at the end of the round."
				},
			},
			
			felijo_perma_score = {
                text = {
                    "{C:diamonds}#1#{} Score",
                },
            },
            felijo_perma_h_score = {
                text = {
                    "{C:diamonds}#1#{} Score if held in hand",
                },
            },
            felijo_perma_xscore = {
                text = {
                    "{X:diamonds,C:white}X#1#{} Score",
                },
            },
            felijo_perma_h_xscore = {
                text = {
                    "{X:diamonds,C:white}X#1#{} Score if held in hand",
                },
            },
			felijo_perma_bscore = {
                text = {
                    "{C:gold}#1#{} Blind Req.",
                },
            },
            felijo_perma_h_bscore = {
                text = {
                    "{C:gold}#1#{} Blind Req. if held in hand",
                },
            },
            felijo_perma_xbscore = {
                text = {
                    "{X:gold,C:white}X#1#{} Blind Req.",
                },
            },
            felijo_perma_h_xbscore = {
                text = {
                    "{X:gold,C:white}X#1#{} Blind Req. if held in hand",
                },
            },
			felijo_perma_xbscore_perc = {
                text = {
                    "{X:gold,C:white}-#1#%{} Blind Req.",
                },
            },
            felijo_perma_h_xbscore_perc = {
                text = {
                    "{X:gold,C:white}-#1#%{} Blind Req. if held in hand",
                },
            },
			
		},
		Tarot = {
			c_felijo_ascended = {
                name = "The Ascended",
                text = {
                    "Enhances {C:attention}#1#{} selected",
                    "card into a",
                    "{C:attention}#2#",
                },
            },
		},
		felijo_tier2_tarot = {
			c_felijo_t2_ascended = {
                name = "The Ascended [II]",
                text = {
                    "Enhances {C:attention}#1#{} selected",
                    "card into a",
                    "{C:attention}#2#",
                },
            },
			c_felijo_t2_chariot = {
                name = "The Chariot [II]",
                text = {
                    "Enhances {C:attention}#1#{} selected",
                    "card into a",
                    "{C:attention}#2#",
                },
            },
			c_felijo_t2_devil = {
                name = "The Devil [II]",
                text = {
                    "Enhances {C:attention}#1#{} selected",
                    "card into a",
                    "{C:attention}#2#",
                },
            },
            c_felijo_t2_empress = {
                name = "The Empress [II]",
                text = {
                    "Enhances {C:attention}#1#",
                    "selected cards to",
                    "{C:attention}#2#s",
                },
            },
			c_felijo_t2_heirophant = {
                name = "The Hierophant [II]",
                text = {
                    "Enhances {C:attention}#1#",
                    "selected cards to",
                    "{C:attention}#2#s",
                },
            },
			c_felijo_t2_justice = {
                name = "Justice [II]",
                text = {
                    "Enhances {C:attention}#1#{} selected",
                    "card into a",
                    "{C:attention}#2#",
                },
            },
			c_felijo_t2_tower = {
                name = "The Tower [II]",
                text = {
                    "Enhances {C:attention}#1#{} selected",
                    "card into a",
                    "{C:attention}#2#",
                },
            },
			c_felijo_t2_magician = {
                name = "The Magician [II]",
                text = {
                    "Enhances {C:attention}#1#{}",
                    "selected cards to",
                    "{C:attention}#2#s",
                },
            },
		},
		felijo_tier3_tarot = {
			c_felijo_t3_ascended = {
                name = "The Ascended [III]",
                text = {
                    "Enhances {C:attention}#1#{} selected",
                    "card into a",
                    "{C:attention}#2#",
                },
            },
			c_felijo_t3_chariot = {
                name = "The Chariot [III]",
                text = {
                    "Enhances {C:attention}#1#{} selected",
                    "card into a",
                    "{C:attention}#2#",
                },
            },
			c_felijo_t3_devil = {
                name = "The Devil [III]",
                text = {
                    "Enhances {C:attention}#1#{} selected",
                    "card into a",
                    "{C:attention}#2#",
                },
            },
            c_felijo_t3_empress = {
                name = "The Empress [III]",
                text = {
                    "Enhances {C:attention}#1#",
                    "selected cards to",
                    "{C:attention}#2#s",
                },
            },
			c_felijo_t3_heirophant = {
                name = "The Hierophant [III]",
                text = {
                    "Enhances {C:attention}#1#",
                    "selected cards to",
                    "{C:attention}#2#s",
                },
            },
			c_felijo_t3_justice = {
                name = "Justice [III]",
                text = {
                    "Enhances {C:attention}#1#{} selected",
                    "card into a",
                    "{C:attention}#2#",
                },
            },
			c_felijo_t3_tower = {
                name = "The Tower [III]",
                text = {
                    "Enhances {C:attention}#1#{} selected",
                    "card into a",
                    "{C:attention}#2#",
                },
            },
			c_felijo_t3_magician = {
                name = "The Magician [III]",
                text = {
                    "Enhances {C:attention}#1#{}",
                    "selected cards to",
                    "{C:attention}#2#s",
                },
            },
		},
		felijo_tier4_tarot = {
			c_felijo_t4_ascended = {
                name = "The Ascended [IV]",
                text = {
                    "Enhances {C:attention}#1#{} selected",
                    "card into a",
                    "{C:attention}#2#",
                },
            },
			c_felijo_t4_chariot = {
                name = "The Chariot [IV]",
                text = {
                    "Enhances {C:attention}#1#{} selected",
                    "card into a",
                    "{C:attention}#2#",
                },
            },
			c_felijo_t4_devil = {
                name = "The Devil [IV]",
                text = {
                    "Enhances {C:attention}#1#{} selected",
                    "card into a",
                    "{C:attention}#2#",
                },
            },
            c_felijo_t4_empress = {
                name = "The Empress [IV]",
                text = {
                    "Enhances {C:attention}#1#",
                    "selected cards to",
                    "{C:attention}#2#s",
                },
            },
			c_felijo_t4_heirophant = {
                name = "The Hierophant [IV]",
                text = {
                    "Enhances {C:attention}#1#",
                    "selected cards to",
                    "{C:attention}#2#s",
                },
            },
			c_felijo_t4_justice = {
                name = "Justice [IV]",
                text = {
                    "Enhances {C:attention}#1#{} selected",
                    "card into a",
                    "{C:attention}#2#",
                },
            },
			c_felijo_t4_tower = {
                name = "The Tower [IV]",
                text = {
                    "Enhances {C:attention}#1#{} selected",
                    "card into a",
                    "{C:attention}#2#",
                },
            },
			c_felijo_t4_magician = {
                name = "The Magician [IV]",
                text = {
                    "Enhances {C:attention}#1#{}",
                    "selected cards to",
                    "{C:attention}#2#s",
                },
            },
		},
		felijo_ritual = {
			c_felijo_ins_campfire = {
				name = "Campfire",
				text = {
					"Upgrade {C:attention}#1#{} selected card\'s",
					"{C:enhanced}enhancement{} to the {C:attention}next tier{}",
					"Has a {C:red}#3#%{} chance to",
					"{C:red}destroy{} the card instead",
					"{C:inactive,s:0.8}(Chance scales with {C:enhanced,s:0.8}Enhancement {C:inactive,s:0.8}Tier)",
				},
			},
		},
		felijo_totem_parts = {
			c_felijo_ttm_hd_avian = {
				name = "Totem Head of the Avian",
				text = {
					"Combine with a {C:attention}Totem{}",
					"to apply its effects on",
					"{C:attention}Avian{} Jokers",
					"{C:inactive,s:0.6}(Includes \"Birb\" and \"Birb\" Jokers)"
				},
			},
			c_felijo_ttm_hd_canine = {
				name = "Totem Head of the Canine",
				text = {
					"Combine with a {C:attention}Totem{}",
					"to apply its effects",
					"{C:attention}Canine{} Jokers",
					"{C:inactive,s:0.6}(Includes \"Dog\" and \"Puppy\" Jokers)"
				},
			},
			c_felijo_ttm_hd_feline = {
				name = "Totem Head of the Feline",
				text = {
					"Combine with a {C:attention}Totem{}",
					"to apply its effects on",
					"{C:attention}Feline{} Jokers",
					"{C:inactive,s:0.6}(Includes \"Cat\" and \"Kitty\" Jokers)"
				},
			},
			c_felijo_ttm_hd_hooved = {
				name = "Totem Head of the Hooved",
				text = {
					"Combine with a {C:attention}Totem{}",
					"to apply its effects on",
					"{C:attention}Hooved{} Jokers",
				},
			},
			c_felijo_ttm_hd_insect = {
				name = "Totem Head of the Insect",
				text = {
					"Combine with a {C:attention}Totem{}",
					"to apply its effects on",
					"{C:attention}Insect{} Jokers",
				},
			},
			c_felijo_ttm_hd_reptile = {
				name = "Totem Head of the Reptile",
				text = {
					"Combine with a {C:attention}Totem{}",
					"to apply its effects on",
					"{C:attention}Reptile{} Jokers",
				},
			},
			c_felijo_ttm_hd_vermin = {
				name = "Totem Head of the Vermin",
				text = {
					"Combine with a {C:attention}Totem{}",
					"to apply its effects on",
					"{C:attention}Vermin{} Jokers",
				},
			},
			c_felijo_ttm_hd_object = {
				name = "Totem Head of the Object",
				text = {
					"Combine with a {C:attention}Totem{}",
					"to apply its effects on",
					"{C:attention}Object{} Jokers",
					"{C:inactive,s:0.6}(Includes \"Food\" Jokers)"
				},
			},
			c_felijo_ttm_hd_other = {
				name = "Totem Head of the Other",
				text = {
					"Combine with a {C:attention}Totem{}",
					"to apply its effects on",
					"{C:attention}Other{} Jokers",
					"{C:inactive,s:0.6}(Includes \"Meme\" Jokers)"
				},
			},
			c_felijo_ttm_hd_human = {
				name = "Totem Head of the Human",
				text = {
					"Combine with a {C:attention}Totem{}",
					"to apply its effects on",
					"{C:attention}Human{} Jokers",
					"{C:inactive,s:0.6}(Includes \"Humanoid\" Jokers)"
				},
			},
			c_felijo_ttm_bifurcated = {
				name = "Totem of the Bifurcated Strike",
				text = {
					"When active, apply",
					"{C:dark_edition,s:1.1}Bifurcated Strike{}",
					"to Jokers of the same",
					"{C:attention}Tribe{} as the Totem Head",
				},
			},
			c_felijo_ttm_undying = {
				name = "Totem of the Undying",
				text = {
					"When active, apply",
					"{C:dark_edition,s:1.1}Undying{}",
					"to Jokers of the same",
					"{C:attention}Tribe{} as the Totem Head",
				},
			},
			c_felijo_ttm_swap = {
				name = "Totem of the Swapper",
				text = {
					"When active, apply",
					"{C:dark_edition,s:1.1}Swapper{}",
					"to Jokers of the same",
					"{C:attention}Tribe{} as the Totem Head",
				},
			},
			c_felijo_ttm_midas = {
				name = "Totem of the Midas Touch",
				text = {
					"When active, apply",
					"{C:dark_edition,s:1.1}Midas Touch{}",
					"to Jokers of the same",
					"{C:attention}Tribe{} as the Totem Head",
				},
			},
			c_felijo_ttm_cardbearer = {
				name = "Totem of the Card Bearer",
				text = {
					"When active, apply",
					"{C:dark_edition,s:1.1}Card Bearer{}",
					"to Jokers of the same",
					"{C:attention}Tribe{} as the Totem Head",
				},
			},
			c_felijo_ttm_giftbearer = {
				name = "Totem of the Gift Bearer",
				text = {
					"When active, apply",
					"{C:dark_edition,s:1.1}Gift Bearer{}",
					"to Jokers of the same",
					"{C:attention}Tribe{} as the Totem Head",
				},
			},
			c_felijo_ttm_leader = {
				name = "Totem of the Leader",
				text = {
					"When active, apply",
					"{C:dark_edition,s:1.1}Leader{}",
					"to Jokers of the same",
					"{C:attention}Tribe{} as the Totem Head",
				},
			},
			c_felijo_ttm_omnistrike = {
				name = "Totem of the Omni Strike",
				text = {
					"When active, apply",
					"{C:dark_edition,s:1.1}Omni Strike{}",
					"to Jokers of the same",
					"{C:attention}Tribe{} as the Totem Head",
				},
			},
			c_felijo_ttm_repulsive = {
				name = "Totem of the Repulsive",
				text = {
					"When active, apply",
					"{C:dark_edition,s:1.1}Repulsive{}",
					"to Jokers of the same",
					"{C:attention}Tribe{} as the Totem Head",
				},
			},
			c_felijo_ttm_stinky = {
				name = "Totem of the Stinky",
				text = {
					"When active, apply",
					"{C:dark_edition,s:1.1}Stinky{}",
					"to Jokers of the same",
					"{C:attention}Tribe{} as the Totem Head",
				},
			},

		}
        --Partner = {
        --    pnr_felijo_aikoyori = {
        --        
        --        name = "smol Aiko",
        --        text = {
        --            "Retrigger {C:attention}every{} card {C:attention}#1#{} times",
        --        },
        --        unlock={
        --            "Used {C:attention}Aikoyori",
        --            "to win on {C:attention}Gold",
        --            "{C:attention}Stake{} difficulty",
        --        },
        --    }
        --},
    },
    misc = {
		challenge_names = {
			c_felijo_ins_mycologist_1 = "The Mycologists' Challenge",
			c_felijo_stock_1 = "Portfolio",
			c_felijo_stock_2 = "Insider Trading",
		},
        achievement_names={
            --ach_felijo_spell_aikoyori = "Unfortunately Aikoyori is not real",
        },
        achievement_descriptions={
            --ach_felijo_spell_aikoyori = "Spell Aikoyori",
        },
		dictionary={
			k_felijo_cash_succ = "LOADSAMONEY!!!",
			k_felijo_lvl_succ = "Level up!",
			k_felijo_nope_succ = "Nope!",
			k_felijo_lowered_succ = "Lowered!",
			k_felijo_cloned = "Cloned!",
			k_felijo_pelt = "Pelt Card",
			k_felijo_olddata = "OLD_DATA",
			k_felijo_terrain = "Terrain Card",
			k_felijo_revo = "Revo's Vault",
			k_felijo_toga = "TOGA's Stuff",
			k_felijo_ins = "Inscryption",
			k_felijo_rbx = "ROBLOX",
			k_felijo_loic1 = "Charging...",
			k_felijo_loic2 = "Ready!",
			k_felijo_loic3 = "Beamed!",
			k_felijo_loic4 = "Cooling down...",
			k_felijo_loic5 = "Cooled down!",
			b_felijo_ritual_cards = "Ritual Cards",
			b_felijo_totem_parts_cards = "Totem Parts",
			k_felijo_totem_parts = "Totem Part",
			k_felijo_ritual = "Ritual",
			b_felijo_tier2_tarot_cards = "Tarot Cards [II]",
			b_felijo_tier3_tarot_cards = "Tarot Cards [III]",
			b_felijo_tier4_tarot_cards = "Tarot Cards [IV]",
			k_felijo_tier2_tarot = "Tier 2 Tarot",
			k_felijo_tier3_tarot = "Tier 3 Tarot",
			k_felijo_tier4_tarot = "Tier 4 Tarot",
			k_felijo_score_mult_pre = "x",
            k_felijo_score_mult_append = " Score",
			k_felijo_bscore_mult_pre = "x",
            k_felijo_bscore_mult_append = " Blind Req.",
			k_felijo_combine_button = "COMBINE",
			k_felijo_separate_button = "SEPARATE",
			k_felijo_switch_button = "SWITCH",
		},
		v_dictionary={
            k_felijo_score_add="+#1# Score",
            k_felijo_score_x="X#1# Score",
            k_felijo_score_exp="^#1# Score",
            k_felijo_score_minus="-#1# Score",
			k_felijo_bscore_add="+#1# Blind Req.",
            k_felijo_bscore_x="X#1# Blind Req.",
			k_felijo_bscore_perc="-#1#% Blind Req.",
            k_felijo_bscore_exp="^#1# Blind Req.",
            k_felijo_bscore_minus="#1# Blind Req.",
        },
		labels = {
			felijo_sgl_bifurcated = "Bifurcated Strike",
			felijo_sgl_trifurcated = "Trifurcated Strike",
			felijo_sgl_brittle = "Brittle",
			felijo_sgl_tail = "Loose Tail",
			felijo_stk_stitched = "Stitched Card",
			felijo_stk_subspace = "Subspaced Card",
			felijo_plt_gold = "Gold Pelt",
			felijo_plt_wlf = "Wolf Pelt",
			felijo_plt_bny = "Bunny Pelt",
			felijo_plt_olddata = "OLD_DATA",
			felijo_trn_goldn = "Gold Nugget",
			felijo_enh_sup = "Superior",
			felijo_ritual = "Ritual",
			felijo_totem_parts = "Totem Part",
			felijo_tier2_tarot = "Tier 2 Tarot",
			felijo_tier3_tarot = "Tier 3 Tarot",
			felijo_tier4_tarot = "Tier 4 Tarot",
		},
    },
}