return {
    descriptions = {
		Enhanced = {
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
                    "Gain {C:chips}+#1#{} Chips and {C:money}$#2#{}",
                    "if {C:attention}all{} cards in {C:attention}hand{} are {C:attention}scored{}"
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
					"{C:chips}+#1#{} Chips, {X:mult,C:white}+#2#{} Mult",
					},
					{
                    "After playing {C:attention}#4#{} hands,",
					"get a random {C:attention}consumable{}:",
					"{C:green}5 in 10{} chance to get a {C:tarot}Tarot{} card",
					"{C:green}3 in 10{} chance to get a {C:planet}Planet{} card",
					"{C:green}2 in 10{} chance to get a {C:tarot}Spectral{} card",
					"{C:green}1 in 6{} chance to be {C:dark_edition}Negative{}",
					"{C:inactive,s:0.6}All chances are fixed",
					"{C:inactive,s:0.6}(Must have room)",
					},
					{
                    "{C:inactive,s:0.8}(Currently #3#/#4# hands played)",
					"{C:inactive,s:0.7}(Requirement increases by 1 for each consumable given.)"
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
                    "When {C:red}sacrificed{}, create a copy that",
                    "gains {X:edition, C:white}+#3#{} {C:chips}xChips{} and {C:mult}xMult{} ",
					},
					{
					"After {C:attention}#5#{} rounds, selling",
					"counts as a {C:red}sacrifice{}.",
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
				"have scored.",
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
				"together by {C:clubs, E:1}The Mycologists{}."
				},
			},
		},
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
			k_felijo_pelt = "Pelt Card",
			k_felijo_olddata = "OLD_DATA",
			k_felijo_terrain = "Terrain Card",
			k_felijo_toga = "TOGA's Stuff",
			k_felijo_ins = "Inscryption",
			k_felijo_loic1 = "Charging...",
			k_felijo_loic2 = "Ready!",
			k_felijo_loic3 = "Beamed!",
			k_felijo_loic4 = "Cooling down...",
			k_felijo_loic5 = "Cooled down!",
			
			
		},
		labels = {
			felijo_sgl_bifurcated = "Bifurcated Strike",
			felijo_sgl_trifurcated = "Trifurcated Strike",
			felijo_sgl_brittle = "Brittle",
			felijo_sgl_tail = "Loose Tail",
			felijo_stk_stitched = "Stitched Card",
			felijo_plt_gold = "Gold Pelt",
			felijo_plt_wlf = "Wolf Pelt",
			felijo_plt_bny = "Bunny Pelt",
			felijo_plt_olddata = "OLD_DATA",
			felijo_trn_goldn = "Gold Nugget",
		},
    },
}