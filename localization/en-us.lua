return {
    descriptions = {
		Back={
            b_felijo_ttm_deck = {
                name = 'Totem Deck',
                text = 
                { 
                    'Start with {C:felijo_ttm}Totems{} enabled and',
					'{C:felijo_ins,T:v_felijo_totemmerchant}Totem Merchant{} redeemed.',
					"{C:inactive}(Only one totem can be active at a time)"
                },
            },
		},
		Sleeve = {
            sleeve_felijo_ttm_deck = {
                name = "Totem Sleeve",
                text = 
				{ 
                    'Start with {C:felijo_ttm}Totems{} enabled and',
					'{C:felijo_ins,T:v_felijo_totemmerchant}Totem Merchant{} redeemed',
					"{C:inactive}(Only one totem can be active at a time)"
                },
            },
            sleeve_felijo_ttm_deck_alt = {
                name = "Totem Sleeve",
                text = { 
                    "Start with",
                    "{C:white,X:felijo_ttm}+1{} Totem Area Size and",
					'{C:felijo_ins,T:v_felijo_totemtycoon}Totem Tycoon{} redeemed',
             	},
            },
			sleeve_felijo_ttm_deck_crv = {
                name = "Totem Sleeve",
                text = { 
                    "Start with {C:felijo_ttm}Totems{} enabled,",
                    "a {C:felijo_ttm,T:c_felijo_ttm_hd_crv_printer}Totem Head of the Printer{}",
					'and {C:felijo_ins,T:v_felijo_totemmerchant}Totem Merchant{} redeemed',
             	},
            },
		},
		
		Enhanced = {
			----------
			m_felijo_bld_pin = {
                name = "The Pin",
                text = {
                    {
						"{X:purple,C:white}Purple{}",
						"If {C:attention}scored hand{} is 4 blinds",
						"or more, {X:purple,C:white}X#1#{} Score"
					},
					{
						"Otherwise, {C:purple}+#2#{} Score",
						"and {C:red}Explodes"
					},
                },
            },
			-------------------
			---BLINDSIDE END---
			-------------------
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
                    "{X:mult,C:white}X#1#{} Mult",
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
			

		},
		Edition = {
            e_felijo_subspace = {
                name = "Subspaced",
                text = {
                    "{X:blind,C:white}-#1#%{} Blind Size when Held",
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
		
        Joker = {
			j_felijo_joker = {
                name = "Feli's Placeholderia",
                text = {
                    "{C:red}+#1#{} Mult",
                },
            },
			j_felijo_lgd_jokerpp_a = {
                name = {
					"{C:gold,s:0.5}Ascended",
					"{C:gold}Joker++",
				},
                text = {
					{
                    "{C:red}+#1#{} Mult",
					},
					{
					"Increase Mult by {C:red}#2#{}",
					"if the {C:attention}scored hand{} isn't",
					"the most played {C:attention}poker hand"
					},
                },
            },
			j_felijo_rocket = {
                name = "Space Shuttle",
                text = {
                    "{C:red}+#1#{} Mult?",
                    "{C:inactive}(Blast off in: #3#)"
                },
            },
			j_felijo_rocket_a = {
                name = "Space Shuttle",
                text = {
					{
                    "{C:red}+#1#{} Mult",
					},
					{
					"Increase Mult by {C:red}#2#{}",
					"per {C:attention}hand{} that isn't",
					"the most played {C:attention}poker hand",
					"otherwise, the {C:attention}Joker{}",
					"{C:red}explodes{}",
					},
                },
            },
			
			
		-- LETTERJOKERS
		-- LETTERJOKERS
		-- LETTERJOKERS
			

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
						"gain {C:attention}+#8#{} CT, {X:legendary,C:white}+#9#{} charge multiplier",
						"and go into {C:legendary}cooldown{} for {C:attention}#6#{} hands.",
					},
					{
						"Status: {B:3,C:white}#7#{} | CT: {C:inactive}#3#{}/#4# | CD:{C:inactive}#5#{}/#6#",
						"{s:0.7,C:inactive}When harpoons, air strikes and nukes fail. | v. 1.0.4.0",
					},
                }
            },
			
			
			
			
			
			-- INSCRYPTION
			
			
			

			
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
				"{C:inactive,s:0.5}+#24# per \'Oops! All 6s\'{}",
				"Bonus Volatility Mod: {C:blue}+#23#",
				"{C:inactive,s:0.5}+#25# per Round{}"
				},

			  }
			},
        },
		Other = {
			felijo_explode	= {
				name = "Explode",
				text= {
					"Card is removed",
					"permanently from deck",
				}
			},
			felijo_delete	= {
				name = "Delete",
				text= {
					"Card is removed",
					"permanently from deck",
				}
			},
			felijo_stock_legend	= {
				name = "Legend",
				text={
					"{X:dark_edition,C:white}STOCK_(CHANGE%){}",
					"{C:gold}$UNIT{}, {X:diamonds,C:white}$MODE{} {s:0.7}(x1, x5, x10 or all){}",
					"{X:inactive,C:white}OWNED_STOCK{} {X:gold,C:white}$TOTAL_VALUE{}"
				}
			},
			felijo_leshy_crossmod	= {
				name = "Revo's Vault Ability",
				text= {
						"{C:felijo_trb}Deathcards{} made using",
						"{C:felijo_ins}Jimbo's Photograph{}",
						"are included",
						"-",
						"Redeeming",
						"{C:felijo_ins}Jimbo's Photograph{}",
						"in this run grants",
						"an additional {X:mult,C:white}X2{} Mult",
				}
			},
			felijo_bld_explode	= {
				name = "Explode",
				text= {
					"Blind is removed",
					"permanently from deck",
				}
			},
			
			p_felijo_tribe = {
                name = "Tribe Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2#{C:feljio_trb} Tribe{} cards to",
                    "be used immediately",
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
				text = {
					"When destroyed, clones itself",
					"and creates a tail",
					"{C:inactive}(Effect triggers once){}",
				},
			},

			-- Visual
			felijo_stk_stitched = {
				name = "Stitched Card",
				text = {
				"The card has been brutally stitched",
				"together by {C:clubs,E:1}The Mycologists{}."
				},
			},

			-- Roblox
			felijo_stk_subspace = {
				name = "Subspaced Card",
				text = {
				"The card has been tinted",
				"{C:clubs,E:felijo_pink}pink{} by {C:clubs,E:felijo_pink}Subspace Tripmine{}.",
				"{C:chips}+100{} chips when held."
				},
			},
			felijo_copied = {
				name = "Copied Card",
				text = {
				"Disappears at the end of the round."
				},
			},
			-- Other Stickers
			felijo_stk_blunder = {
				name = "Blunder",
				text = {
				"{X:blind,C:white}X#1#{} Blind Req.",
				"{C:mult}#2#{} Mult",
				},
			},
			felijo_stk_goobert = {
				name = "Painted",
				text = {
				"{X:felijo_goobert,C:white}X#1#{} to all card values.",
				"{s:0.8,C:inactive}(Value is a random number",
				"{s:0.8,C:inactive}between 0.9 and 2.5)"
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
		
		felijo_tribe = {
			c_felijo_trb_feline = {
				name = "Feline",
				text = {
					"Get {C:attention}1{} random",
					"{C:felijo_trb}Feline{} card"
				},
			},
			c_felijo_trb_canine = {
				name = "Canine",
				text = {
					"Get {C:attention}1{} random",
					"{C:felijo_trb}Canine{} card"
				},
			},
			c_felijo_trb_hooved = {
				name = "Hooved",
				text = {
					"Get {C:attention}1{} random",
					"{C:felijo_trb}Hooved{} card"
				},
			},
			c_felijo_trb_human = {
				name = "Human",
				text = {
					"Get {C:attention}1{} random",
					"{C:felijo_trb}Human{} card"
				},
			},
			c_felijo_trb_reptile = {
				name = "Reptile",
				text = {
					"Get {C:attention}1{} random",
					"{C:felijo_trb}Reptile{} card"
				},
			},
			c_felijo_trb_avian = {
				name = "Avian",
				text = {
					"Get {C:attention}1{} random",
					"{C:felijo_trb}Avian{} card"
				},
			},
			c_felijo_trb_insect = {
				name = "Insect",
				text = {
					"Get {C:attention}1{} random",
					"{C:felijo_trb}Insect{} card"
				},
			},
			c_felijo_trb_vermin = {
				name = "Vermin",
				text = {
					"Get {C:attention}1{} random",
					"{C:felijo_trb}Vermin{} card"
				},
			},
			c_felijo_trb_object = {
				name = "Object",
				text = {
					"Get {C:attention}1{} random",
					"{C:felijo_trb}Object{} card"
				},
			},
			c_felijo_trb_other = {
				name = "Other",
				text = {
					"Get {C:attention}1{} random",
					"{C:felijo_trb}Other{} card"
				},
			},
			c_felijo_trb_crv_banana = {
				name = "Banana",
				text = {
					"Get {C:attention}1{} random",
					"{C:felijo_trb}Banana{} card"
				},
			},
			c_felijo_trb_crv_printer = {
				name = "Printer",
				text = {
					"Get {C:attention}1{} random",
					"{C:felijo_trb}Printer{} card"
				},
			},
		},

		felijo_tier2_planet = {
            c_felijo_tier2_pluto = {
                name = "Pluto [II]",
                text = {
                    "({V:1}lvl.#1#{}/{V:2}#2#{}) Level up",
                    "{C:attention}#3#",
                    "{C:mult}+#4#{}/{C:mult}#6#{} Mult and",
                    "{C:chips}+#5#{}/{C:chips}#7#{} Chips",
                },
            },
            c_felijo_tier2_mercury = {
                name = "Mercury [II]",
                text = {
                    "({V:1}lvl.#1#{}/{V:2}#2#{}) Level up",
                    "{C:attention}#3#",
                    "{C:mult}+#4#{}/{C:mult}#6#{} Mult and",
                    "{C:chips}+#5#{}/{C:chips}#7#{} Chips",
                },
            },
			c_felijo_tier2_uranus = {
                name = "Uranus [II]",
                text = {
                    "({V:1}lvl.#1#{}/{V:2}#2#{}) Level up",
                    "{C:attention}#3#",
                    "{C:mult}+#4#{}/{C:mult}#6#{} Mult and",
                    "{C:chips}+#5#{}/{C:chips}#7#{} Chips",
                },
            },
			c_felijo_tier2_venus = {
                name = "Venus [II]",
                text = {
                    "({V:1}lvl.#1#{}/{V:2}#2#{}) Level up",
                    "{C:attention}#3#",
                    "{C:mult}+#4#{}/{C:mult}#6#{} Mult and",
                    "{C:chips}+#5#{}/{C:chips}#7#{} Chips",
                },
            },
			c_felijo_tier2_saturn = {
                name = "Saturn [II]",
                text = {
                    "({V:1}lvl.#1#{}/{V:2}#2#{}) Level up",
                    "{C:attention}#3#",
                    "{C:mult}+#4#{}/{C:mult}#6#{} Mult and",
                    "{C:chips}+#5#{}/{C:chips}#7#{} Chips",
                },
            },
			c_felijo_tier2_jupiter = {
                name = "Jupiter [II]",
                text = {
                    "({V:1}lvl.#1#{}/{V:2}#2#{}) Level up",
                    "{C:attention}#3#",
                    "{C:mult}+#4#{}/{C:mult}#6#{} Mult and",
                    "{C:chips}+#5#{}/{C:chips}#7#{} Chips",
                },
            },
			c_felijo_tier2_earth = {
                name = "Earth [II]",
                text = {
                    "({V:1}lvl.#1#{}/{V:2}#2#{}) Level up",
                    "{C:attention}#3#",
                    "{C:mult}+#4#{}/{C:mult}#6#{} Mult and",
                    "{C:chips}+#5#{}/{C:chips}#7#{} Chips",
                },
            },
			c_felijo_tier2_mars = {
                name = "Mars [II]",
                text = {
                    "({V:1}lvl.#1#{}/{V:2}#2#{}) Level up",
                    "{C:attention}#3#",
                    "{C:mult}+#4#{}/{C:mult}#6#{} Mult and",
                    "{C:chips}+#5#{}/{C:chips}#7#{} Chips",
                },
            },
			c_felijo_tier2_neptune = {
                name = "Neptune [II]",
                text = {
                    "({V:1}lvl.#1#{}/{V:2}#2#{}) Level up",
                    "{C:attention}#3#",
                    "{C:mult}+#4#{}/{C:mult}#6#{} Mult and",
                    "{C:chips}+#5#{}/{C:chips}#7#{} Chips",
                },
            },
			c_felijo_tier2_planetx = {
                name = "Planet X [II]",
                text = {
                    "({V:1}lvl.#1#{}/{V:2}#2#{}) Level up",
                    "{C:attention}#3#",
                    "{C:mult}+#4#{}/{C:mult}#6#{} Mult and",
                    "{C:chips}+#5#{}/{C:chips}#7#{} Chips",
                },
            },
			c_felijo_tier2_eris = {
                name = "Eris [II]",
                text = {
                    "({V:1}lvl.#1#{}/{V:2}#2#{}) Level up",
                    "{C:attention}#3#",
                    "{C:mult}+#4#{}/{C:mult}#6#{} Mult and",
                    "{C:chips}+#5#{}/{C:chips}#7#{} Chips",
                },
            },
			c_felijo_tier2_ceres = {
                name = "Ceres [II]",
                text = {
                    "({V:1}lvl.#1#{}/{V:2}#2#{}) Level up",
                    "{C:attention}#3#",
                    "{C:mult}+#4#{}/{C:mult}#6#{} Mult and",
                    "{C:chips}+#5#{}/{C:chips}#7#{} Chips",
                },
            },
        },
		felijo_tier3_planet = {
			c_felijo_tier3_pluto = {
                name = "Pluto [III]",
                text = {
                    "({V:1}lvl.#1#{}/{V:2}#2#{}) Level up",
                    "{C:attention}#3#",
                    "{C:mult}+#4#{}/{C:mult}#6#{} Mult and",
                    "{C:chips}+#5#{}/{C:chips}#7#{} Chips",
                },
            },
            c_felijo_tier3_mercury = {
                name = "Mercury [III]",
                text = {
                    "({V:1}lvl.#1#{}/{V:2}#2#{}) Level up",
                    "{C:attention}#3#",
                    "{C:mult}+#4#{}/{C:mult}#6#{} Mult and",
                    "{C:chips}+#5#{}/{C:chips}#7#{} Chips",
                },
            },
			c_felijo_tier3_uranus = {
                name = "Uranus [III]",
                text = {
                    "({V:1}lvl.#1#{}/{V:2}#2#{}) Level up",
                    "{C:attention}#3#",
                    "{C:mult}+#4#{}/{C:mult}#6#{} Mult and",
                    "{C:chips}+#5#{}/{C:chips}#7#{} Chips",
                },
            },
			c_felijo_tier3_venus = {
                name = "Venus [III]",
                text = {
                    "({V:1}lvl.#1#{}/{V:2}#2#{}) Level up",
                    "{C:attention}#3#",
                    "{C:mult}+#4#{}/{C:mult}#6#{} Mult and",
                    "{C:chips}+#5#{}/{C:chips}#7#{} Chips",
                },
            },
			c_felijo_tier3_saturn = {
                name = "Saturn [III]",
                text = {
                    "({V:1}lvl.#1#{}/{V:2}#2#{}) Level up",
                    "{C:attention}#3#",
                    "{C:mult}+#4#{}/{C:mult}#6#{} Mult and",
                    "{C:chips}+#5#{}/{C:chips}#7#{} Chips",
                },
            },
			c_felijo_tier3_jupiter = {
                name = "Jupiter [III]",
                text = {
                    "({V:1}lvl.#1#{}/{V:2}#2#{}) Level up",
                    "{C:attention}#3#",
                    "{C:mult}+#4#{}/{C:mult}#6#{} Mult and",
                    "{C:chips}+#5#{}/{C:chips}#7#{} Chips",
                },
            },
			c_felijo_tier3_earth = {
                name = "Earth [III]",
                text = {
                    "({V:1}lvl.#1#{}/{V:2}#2#{}) Level up",
                    "{C:attention}#3#",
                    "{C:mult}+#4#{}/{C:mult}#6#{} Mult and",
                    "{C:chips}+#5#{}/{C:chips}#7#{} Chips",
                },
            },
			c_felijo_tier3_mars = {
                name = "Mars [III]",
                text = {
                    "({V:1}lvl.#1#{}/{V:2}#2#{}) Level up",
                    "{C:attention}#3#",
                    "{C:mult}+#4#{}/{C:mult}#6#{} Mult and",
                    "{C:chips}+#5#{}/{C:chips}#7#{} Chips",
                },
            },
			c_felijo_tier3_neptune = {
                name = "Neptune [III]",
                text = {
                    "({V:1}lvl.#1#{}/{V:2}#2#{}) Level up",
                    "{C:attention}#3#",
                    "{C:mult}+#4#{}/{C:mult}#6#{} Mult and",
                    "{C:chips}+#5#{}/{C:chips}#7#{} Chips",
                },
            },
			c_felijo_tier3_planetx = {
                name = "Planet X [III]",
                text = {
                    "({V:1}lvl.#1#{}/{V:2}#2#{}) Level up",
                    "{C:attention}#3#",
                    "{C:mult}+#4#{}/{C:mult}#6#{} Mult and",
                    "{C:chips}+#5#{}/{C:chips}#7#{} Chips",
                },
            },
			c_felijo_tier3_eris = {
                name = "Eris [III]",
                text = {
                    "({V:1}lvl.#1#{}/{V:2}#2#{}) Level up",
                    "{C:attention}#3#",
                    "{C:mult}+#4#{}/{C:mult}#6#{} Mult and",
                    "{C:chips}+#5#{}/{C:chips}#7#{} Chips",
                },
            },
			c_felijo_tier3_ceres = {
                name = "Ceres [III]",
                text = {
                    "({V:1}lvl.#1#{}/{V:2}#2#{}) Level up",
                    "{C:attention}#3#",
                    "{C:mult}+#4#{}/{C:mult}#6#{} Mult and",
                    "{C:chips}+#5#{}/{C:chips}#7#{} Chips",
                },
            },
        },
		felijo_tier4_planet = {
            c_felijo_tier4_pluto = {
                name = "Pluto [IV]",
                text = {
                    "({V:1}lvl.#1#{}/{V:2}#2#{}) Level up",
                    "{C:attention}#3#",
                    "{C:mult}+#4#{}/{C:mult}#6#{} Mult and",
                    "{C:chips}+#5#{}/{C:chips}#7#{} Chips",
                },
            },
            c_felijo_tier4_mercury = {
                name = "Mercury [IV]",
                text = {
                    "({V:1}lvl.#1#{}/{V:2}#2#{}) Level up",
                    "{C:attention}#3#",
                    "{C:mult}+#4#{}/{C:mult}#6#{} Mult and",
                    "{C:chips}+#5#{}/{C:chips}#7#{} Chips",
                },
            },
			c_felijo_tier4_uranus = {
                name = "Uranus [IV]",
                text = {
                    "({V:1}lvl.#1#{}/{V:2}#2#{}) Level up",
                    "{C:attention}#3#",
                    "{C:mult}+#4#{}/{C:mult}#6#{} Mult and",
                    "{C:chips}+#5#{}/{C:chips}#7#{} Chips",
                },
            },
			c_felijo_tier4_venus = {
                name = "Venus [IV]",
                text = {
                    "({V:1}lvl.#1#{}/{V:2}#2#{}) Level up",
                    "{C:attention}#3#",
                    "{C:mult}+#4#{}/{C:mult}#6#{} Mult and",
                    "{C:chips}+#5#{}/{C:chips}#7#{} Chips",
                },
            },
			c_felijo_tier4_saturn = {
                name = "Saturn [IV]",
                text = {
                    "({V:1}lvl.#1#{}/{V:2}#2#{}) Level up",
                    "{C:attention}#3#",
                    "{C:mult}+#4#{}/{C:mult}#6#{} Mult and",
                    "{C:chips}+#5#{}/{C:chips}#7#{} Chips",
                },
            },
			c_felijo_tier4_jupiter = {
                name = "Jupiter [IV]",
                text = {
                    "({V:1}lvl.#1#{}/{V:2}#2#{}) Level up",
                    "{C:attention}#3#",
                    "{C:mult}+#4#{}/{C:mult}#6#{} Mult and",
                    "{C:chips}+#5#{}/{C:chips}#7#{} Chips",
                },
            },
			c_felijo_tier4_earth = {
                name = "Earth [IV]",
                text = {
                    "({V:1}lvl.#1#{}/{V:2}#2#{}) Level up",
                    "{C:attention}#3#",
                    "{C:mult}+#4#{}/{C:mult}#6#{} Mult and",
                    "{C:chips}+#5#{}/{C:chips}#7#{} Chips",
                },
            },
			c_felijo_tier4_mars = {
                name = "Mars [IV]",
                text = {
                    "({V:1}lvl.#1#{}/{V:2}#2#{}) Level up",
                    "{C:attention}#3#",
                    "{C:mult}+#4#{}/{C:mult}#6#{} Mult and",
                    "{C:chips}+#5#{}/{C:chips}#7#{} Chips",
                },
            },
			c_felijo_tier4_neptune = {
                name = "Neptune [IV]",
                text = {
                    "({V:1}lvl.#1#{}/{V:2}#2#{}) Level up",
                    "{C:attention}#3#",
                    "{C:mult}+#4#{}/{C:mult}#6#{} Mult and",
                    "{C:chips}+#5#{}/{C:chips}#7#{} Chips",
                },
            },
			c_felijo_tier4_planetx = {
                name = "Planet X [IV]",
                text = {
                    "({V:1}lvl.#1#{}/{V:2}#2#{}) Level up",
                    "{C:attention}#3#",
                    "{C:mult}+#4#{}/{C:mult}#6#{} Mult and",
                    "{C:chips}+#5#{}/{C:chips}#7#{} Chips",
                },
            },
			c_felijo_tier4_eris = {
                name = "Eris [IV]",
                text = {
                    "({V:1}lvl.#1#{}/{V:2}#2#{}) Level up",
                    "{C:attention}#3#",
                    "{C:mult}+#4#{}/{C:mult}#6#{} Mult and",
                    "{C:chips}+#5#{}/{C:chips}#7#{} Chips",
                },
            },
			c_felijo_tier4_ceres = {
                name = "Ceres [IV]",
                text = {
                    "({V:1}lvl.#1#{}/{V:2}#2#{}) Level up",
                    "{C:attention}#3#",
                    "{C:mult}+#4#{}/{C:mult}#6#{} Mult and",
                    "{C:chips}+#5#{}/{C:chips}#7#{} Chips",
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
			c_felijo_stock_1 = "Portfolio",
			c_felijo_stock_2 = "Insider Trading",
			c_felijo_medusa_1 = "Medusa II",
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
			----------------
			---MOD BADGES---
			----------------
			---
			--If i were you, i wouldn't try to copy this way of handling crossmod badges.

			k_felijo_revo = "Revo's Vault",
			k_felijo_toga = "TOGA's Stuff",
			k_felijo_bs = "Blindside",
			k_felijo_synthb = "SynthB",
			----------------
			--J.CATEGORIES--
			----------------
			k_felijo_ins = "Inscryption",
			k_felijo_rbx = "ROBLOX",
			----------------
			----------------
			k_felijo_loic1 = "Charging...",
			k_felijo_loic2 = "Ready!",
			k_felijo_loic3 = "Beamed!",
			k_felijo_loic4 = "Cooling down...",
			k_felijo_loic5 = "Cooled down!",
			----------------
			--CONSUMEABLES--
			----------------
			b_felijo_totem_parts_cards = "Totem Parts",
			b_felijo_tribe_cards = "Tribe Cards",
			k_felijo_tribe = "Tribe Card",
			k_felijo_totem_parts = "Totem Part",
			
			b_felijo_tier2_tarot_cards = "Tarot Cards [II]",
			b_felijo_tier3_tarot_cards = "Tarot Cards [III]",
			b_felijo_tier4_tarot_cards = "Tarot Cards [IV]",
			b_felijo_tier2_planet_cards = "Planet Cards [II]",
			b_felijo_tier3_planet_cards = "Planet Cards [III]",
			b_felijo_tier4_planet_cards = "Planet Cards [IV]",
			k_felijo_tier2_tarot = "Tier 2 Tarot",
			k_felijo_tier3_tarot = "Tier 3 Tarot",
			k_felijo_tier4_tarot = "Tier 4 Tarot",
			k_felijo_tier2_planet = "Tier 2 Planet",
			k_felijo_tier3_planet = "Tier 3 Planet",
			k_felijo_tier4_planet = "Tier 4 Planet",
			---
			k_felijo_combine_button = "COMBINE",
			k_felijo_separate_button = "SEPARATE",
			k_felijo_switch_button = "SWITCH",
			k_felijo_tribe_pack = "Tribe Pack",
			
			k_felijo_ttm_box = "Totem Box",
			felijo_toggle_to_totems = "Show Totems",
			felijo_toggle_to_jokers = "Show Jokers",
			--------------
			---PKR HANDS--
			--------------

			k_felijo_pair_t2_below = "Pair / Pair [II]",
			k_felijo_pair_t3_below = "Pair / Pair [II - III]",
			k_felijo_pair_t4_below = "Pair / Pair [II - IV]",

			k_felijo_3oak_t2_below = "Three of a Kind / Three of a Kind [II]",
			k_felijo_3oak_t3_below = "Three of a Kind / Three of a Kind [II - III]",
			k_felijo_3oak_t4_below = "Three of a Kind / Three of a Kind [II - IV]",

			k_felijo_house_t2_below = "Full House / Full House [II]",
			k_felijo_house_t3_below = "Full House / Full House [II - III]",
			k_felijo_house_t4_below = "Full House / Full House [II - IV]",

			k_felijo_4oak_t2_below = "Four of a Kind / Four of a Kind [II]",
			k_felijo_4oak_t3_below = "Four of a Kind / Four of a Kind [II - III]",
			k_felijo_4oak_t4_below = "Four of a Kind / Four of a Kind [II - IV]",

			k_felijo_flush_t2_below = "Flush / Flush [II]",
			k_felijo_flush_t3_below = "Flush / Flush [II - III]",
			k_felijo_flush_t4_below = "Flush / Flush [II - IV]",

			k_felijo_straight_t2_below = "Straight / Straight [II]",
			k_felijo_straight_t3_below = "Straight / Straight [II - III]",
			k_felijo_straight_t4_below = "Straight / Straight [II - IV]",

			k_felijo_two_pair_t2_below = "Two Pair / Two Pair [II]",
			k_felijo_two_pair_t3_below = "Two Pair / Two Pair [II - III]",
			k_felijo_two_pair_t4_below = "Two Pair / Two Pair [II - IV]",

			k_felijo_straight_flush_t2_below = "Straight Flush / Straight Flush [II]",
			k_felijo_straight_flush_t3_below = "Straight Flush / Straight Flush [II - III]",
			k_felijo_straight_flush_t4_below = "Straight Flush / Straight Flush [II - IV]",

			k_felijo_highcard_t2_below = "High Card / High Card [II]",
			k_felijo_highcard_t3_below = "High Card / High Card [II - III]",
			k_felijo_highcard_t4_below = "High Card / High Card [II - IV]",

			k_felijo_5oak_t2_below = "Five of a Kind / Five of a Kind [II]",
			k_felijo_5oak_t3_below = "Five of a Kind / Five of a Kind [II - III]",
			k_felijo_5oak_t4_below = "Five of a Kind / Five of a Kind [II - IV]",

			k_felijo_flushhouse_t2_below = "Flush House / Flush House [II]",
			k_felijo_flushhouse_t3_below = "Flush House / Flush House [II - III]",
			k_felijo_flushhouse_t4_below = "Flush House / Flush House [II - IV]",

			k_felijo_flushfive_t2_below = "Flush Five / Flush Five [II]",
			k_felijo_flushfive_t3_below = "Flush Five / Flush Five [II - III]",
			k_felijo_flushfive_t4_below = "Flush Five / Flush Five [II - IV]",

			
		},
		labels = {
			------------
			---SIGILS---
			------------
			felijo_sgl_bifurcated = "Bifurcated Strike",
			felijo_sgl_trifurcated = "Trifurcated Strike",
			felijo_sgl_brittle = "Brittle",
			felijo_sgl_tail = "Loose Tail",
			------------
			---TTMSIG---
			------------
			felijo_ttm_sgl_undying = "Undying",
			felijo_ttm_sgl_bifurcated = "Bifurcated Strike",
			felijo_ttm_sgl_swap = "Swapper",
			felijo_ttm_sgl_midas = "Midas Touch",
			felijo_ttm_sgl_cardbearer = "Card Bearer",
			felijo_ttm_sgl_giftbearer = "Gift Bearer",
			felijo_ttm_sgl_stinky = "Stinky",
			felijo_ttm_sgl_repulsive = "Repulsive",
			felijo_ttm_sgl_omnistrike = "Omni Strike",
			felijo_ttm_sgl_leader = "Leader",
			-------------
			---STICKER---
			-------------
			felijo_stk_stitched = "Stitched Card",
			felijo_subspace = "Subspaced",
			felijo_stk_blunder = "Blunder",
			felijo_stk_goobert = "Painted",
			-------------
			-------------
			felijo_plt_gold = "Gold Pelt",
			felijo_plt_wlf = "Wolf Pelt",
			felijo_plt_bny = "Bunny Pelt",
			felijo_plt_olddata = "OLD_DATA",
			felijo_trn_goldn = "Gold Nugget",
			felijo_enh_sup = "Superior",
			felijo_totem_parts = "Totem Part",
			felijo_tier2_tarot = "Tier 2 Tarot",
			felijo_tier3_tarot = "Tier 3 Tarot",
			felijo_tier4_tarot = "Tier 4 Tarot",
			felijo_tier2_planet = "Tier 2 Planet",
			felijo_tier3_planet = "Tier 3 Planet",
			felijo_tier4_planet = "Tier 4 Planet",
			
		},
		poker_hand_descriptions = {
			["felijo_tier2_highcard"] = {
                "If the played hand is not any of the above",
                "hands, only the highest ranked card with",
				"a Tier 2 enhancement scores",
            },
            ["felijo_tier2_5oak"] = {
                "5 cards with the same rank",
				"and having Tier 2 enhancements",
            },
            ["felijo_tier2_flush"] = {
                "5 cards that share the same suit",
				"and having Tier 2 enhancements",
            },
            ["felijo_tier2_flushfive"] = {
                "5 cards with the same rank and suit",
				"and having Tier 2 enhancements",
            },
            ["felijo_tier2_flushhouse"] = {
                "A Three of a Kind and a Pair with",
                "all cards sharing the same suit",
				"and having Tier 2 enhancements",
            },
            ["felijo_tier2_4oak"] = {
                "4 cards with the same rank. They may",
                "be played with 1 other unscored card",
				"and having Tier 2 enhancements",
            },
            ["felijo_tier2_house"] = {
                "A Three of a Kind and a Pair",
                "having Tier 2 enhancements",
            },
            ["felijo_tier2_pair"] = {
                "2 cards that share the same rank. They may",
                "be played with up to 3 other unscored cards",
				"and having Tier 2 enhancements",
            },
            ["felijo_tier2_royal"] = {
                "5 cards in a row (consecutive ranks) with",
                "all cards sharing the same suit",
				"and having Tier 2 enhancements",
            },
            ["felijo_tier2_straight"] = {
                "5 cards in a row (consecutive ranks)",
				"with Tier 2 enhancements",
            },
            ["felijo_tier2_straight_flush"] = {
                "5 cards in a row (consecutive ranks) with",
                "all cards sharing the same suit",
				"and having Tier 2 enhancements",
            },
            ["felijo_tier2_3oak"] = {
                "3 cards with the same rank. They may be",
                "played with up to 2 other unscored cards",
				"and having Tier 2 enhancements",
            },
            ["felijo_tier2_two_pair"] = {
                "2 pairs of cards with different ranks, may",
                "be played with 1 other unscored card",
				"and having Tier 2 enhancements",
            },
			["felijo_tier3_highcard"] = {
                "If the played hand is not any of the above",
                "hands, only the highest ranked card with",
				"a Tier 3 enhancement scores",
            },
			["felijo_tier3_5oak"] = {
                "5 cards with the same rank",
				"and having Tier 3 enhancements",
            },
            ["felijo_tier3_flush"] = {
                "5 cards that share the same suit",
				"and having Tier 3 enhancements",
            },
            ["felijo_tier3_flushfive"] = {
                "5 cards with the same rank and suit",
				"and having Tier 3 enhancements",
            },
            ["felijo_tier3_flushhouse"] = {
                "A Three of a Kind and a Pair with",
                "all cards sharing the same suit",
				"and having Tier 3 enhancements",
            },
            ["felijo_tier3_4oak"] = {
                "4 cards with the same rank. They may",
                "be played with 1 other unscored card",
				"and having Tier 3 enhancements",
            },
            ["felijo_tier3_house"] = {
                "A Three of a Kind and a Pair",
                "having Tier 3 enhancements",
            },
            ["felijo_tier3_pair"] = {
                "2 cards that share the same rank. They may",
                "be played with up to 3 other unscored cards",
				"and having Tier 3 enhancements",
            },
            ["felijo_tier3_royal"] = {
                "5 cards in a row (consecutive ranks) with",
                "all cards sharing the same suit",
				"and having Tier 3 enhancements",
            },
            ["felijo_tier3_straight"] = {
                "5 cards in a row (consecutive ranks)",
				"with Tier 3 enhancements",
            },
            ["felijo_tier3_straight_flush"] = {
                "5 cards in a row (consecutive ranks) with",
                "all cards sharing the same suit",
				"and having Tier 3 enhancements",
            },
            ["felijo_tier3_3oak"] = {
                "3 cards with the same rank. They may be",
                "played with up to 2 other unscored cards",
				"and having Tier 3 enhancements",
            },
            ["felijo_tier3_two_pair"] = {
                "2 pairs of cards with different ranks, may",
                "be played with 1 other unscored card",
				"and having Tier 3 enhancements",
            },

			["felijo_tier4_highcard"] = {
                "If the played hand is not any of the above",
                "hands, only the highest ranked card with",
				"a Tier 4 enhancement scores",
            },

			["felijo_tier4_5oak"] = {
                "5 cards with the same rank",
				"and having Tier 4 enhancements",
            },
            ["felijo_tier4_flush"] = {
                "5 cards that share the same suit",
				"and having Tier 4 enhancements",
            },
            ["felijo_tier4_flushfive"] = {
                "5 cards with the same rank and suit",
				"and having Tier 4 enhancements",
            },
            ["felijo_tier4_flushhouse"] = {
                "A Three of a Kind and a Pair with",
                "all cards sharing the same suit",
				"and having Tier 4 enhancements",
            },
            ["felijo_tier4_4oak"] = {
                "4 cards with the same rank. They may",
                "be played with 1 other unscored card",
				"and having Tier 4 enhancements",
            },
            ["felijo_tier4_house"] = {
                "A Three of a Kind and a Pair",
                "having Tier 4 enhancements",
            },
            ["felijo_tier4_pair"] = {
                "2 cards that share the same rank. They may",
                "be played with up to 3 other unscored cards",
				"and having Tier 4 enhancements",
            },
            ["felijo_tier4_royal"] = {
                "5 cards in a row (consecutive ranks) with",
                "all cards sharing the same suit",
				"and having Tier 4 enhancements",
            },
            ["felijo_tier4_straight"] = {
                "5 cards in a row (consecutive ranks)",
				"with Tier 4 enhancements",
            },
            ["felijo_tier4_straight_flush"] = {
                "5 cards in a row (consecutive ranks) with",
                "all cards sharing the same suit",
				"and having Tier 4 enhancements",
            },
            ["felijo_tier4_3oak"] = {
                "3 cards with the same rank. They may be",
                "played with up to 2 other unscored cards",
				"and having Tier 4 enhancements",
            },
            ["felijo_tier4_two_pair"] = {
                "2 pairs of cards with different ranks, may",
                "be played with 1 other unscored card",
				"and having Tier 4 enhancements",
            },
        },
        poker_hands = {
			["felijo_tier2_highcard"] = "High Card [II]",
            ["felijo_tier2_5oak"] = "Five of a Kind [II]",
            ["felijo_tier2_flush"] = "Flush [II]",
            ["felijo_tier2_flushfive"] = "Flush Five [II]",
            ["felijo_tier2_flushhouse"] = "Flush House [II]",
            ["felijo_tier2_4oak"] = "Four of a Kind [II]",
            ["felijo_tier2_house"] = "Full House [II]",
            ["felijo_tier2_pair"] = "Pair [II]",
            ["felijo_tier2_royal"] = "Royal Flush [II]",
            ["felijo_tier2_straight"] = "Straight [II]",
            ["felijo_tier2_straight_flush"] = "Straight Flush [II]",
            ["felijo_tier2_3oak"] = "Three of a Kind [II]",
            ["felijo_tier2_two_pair"] = "Two Pair [II]",

			["felijo_tier3_highcard"] = "High Card [III]",
			["felijo_tier3_5oak"] = "Five of a Kind [III]",
            ["felijo_tier3_flush"] = "Flush [III]",
            ["felijo_tier3_flushfive"] = "Flush Five [III]",
            ["felijo_tier3_flushhouse"] = "Flush House [III]",
            ["felijo_tier3_4oak"] = "Four of a Kind [III]",
            ["felijo_tier3_house"] = "Full House [III]",
            ["felijo_tier3_pair"] = "Pair [III]",
            ["felijo_tier3_royal"] = "Royal Flush [III]",
            ["felijo_tier3_straight"] = "Straight [III]",
            ["felijo_tier3_straight_flush"] = "Straight Flush [III]",
            ["felijo_tier3_3oak"] = "Three of a Kind [III]",
            ["felijo_tier3_two_pair"] = "Two Pair [III]",

			["felijo_tier4_highcard"] = "High Card [IV]",
			["felijo_tier4_5oak"] = "Five of a Kind [IV]",
            ["felijo_tier4_flush"] = "Flush [IV]",
            ["felijo_tier4_flushfive"] = "Flush Five [IV]",
            ["felijo_tier4_flushhouse"] = "Flush House [IV]",
            ["felijo_tier4_4oak"] = "Four of a Kind [IV]",
            ["felijo_tier4_house"] = "Full House [IV]",
            ["felijo_tier4_pair"] = "Pair [IV]",
            ["felijo_tier4_royal"] = "Royal Flush [IV]",
            ["felijo_tier4_straight"] = "Straight [IV]",
            ["felijo_tier4_straight_flush"] = "Straight Flush [IV]",
            ["felijo_tier4_3oak"] = "Three of a Kind [IV]",
            ["felijo_tier4_two_pair"] = "Two Pair [IV]",
        },
    },
}