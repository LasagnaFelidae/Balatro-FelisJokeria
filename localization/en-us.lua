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
                    "{C:felijo_ttm,T:c_felijo_ttm_hd_crv_printer}Totem Head of the Printer{}",
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
			j_felijo_lgd_jokerpp = {
                name = "Joker++",
                text = {
                    "{C:red}+#1#{} Mult?",
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
				"{X:gold,C:white}X#1#{} Blind Req.",
				"{C:mult}#2#{} Mult",
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
			k_felijo_revo = "Revo's Vault",
			k_felijo_toga = "TOGA's Stuff",
			k_felijo_bs = "Blindside",
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
			k_felijo_tier2_tarot = "Tier 2 Tarot",
			k_felijo_tier3_tarot = "Tier 3 Tarot",
			k_felijo_tier4_tarot = "Tier 4 Tarot",
			---
			k_felijo_combine_button = "COMBINE",
			k_felijo_separate_button = "SEPARATE",
			k_felijo_switch_button = "SWITCH",
			k_felijo_tribe_pack = "Tribe Pack",
			
			k_felijo_ttm_box = "Totem Box",
			felijo_toggle_to_totems = "Show Totems",
			felijo_toggle_to_jokers = "Show Jokers",
			
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
		},
    },
}