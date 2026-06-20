return {
    descriptions = {
		Joker = {
            j_felijo_akyrs_lexicographer = {
                name = {
                    "The Lexicographer",
                    "{C:felijo_inactive,s:0.5}Wryn Nguyen"
                },
                text = { 
                    {
                    "Enables the {C:purple}Pronoun Palace",
                    "word dictionary"
                    },
                    {
                    "Once per ante, when used,",
                    "adds {C:attention}#1# {C:red,E:2}#2#{}",
                    "{C:felijo_pink}Wildcards{}",
                    },
                    {
                    "{C:inactive}(Uses left: {V:1}#3#{C:inactive})"

                    },

                }
            },

            j_felijo_akyrs_fisher = {
                name = {
                    "The Fisher",
                    "{C:felijo_inactive,s:0.5}Leslie Stone"
                },
                text = { 
                    {
                    "Enables the {C:purple}Pronoun Palace",
                    "word dictionary"
                    },
                    {
                    "Up to {C:attention}#1#{} times per ante,",
                    "when used, {C:attention}fish",
                    "for a random tile",
                    },
                    {
                    "Tile can be {C:felijo_ttm}Wooden{},",
                    "{C:felijo_pink}Crit{} or {C:red}Bleed"
                    },
                    {
                    "{C:inactive}(Uses left: {V:1}#2#{C:inactive})"

                    },

                }
            },
			j_felijo_ltr_dbl = {
                name = "Double Letter Tile",
                text = { 
                    "{C:green}#3# in #4#{} chance to retrigger",
                     "a scored card {C:attention}+#1#{} times",
                    "{s:0.7,C:inactive}(Caps at #2# sets of retriggers){}"
                }
            },
			j_felijo_ltr_tpl = {
                name = "Triple Letter Tile",
                text = { 
                    "{C:green}#3# in #4#{} chance to retrigger",
                    "a scored card {C:attention}+#1#{} times",
                    "{s:0.7,C:inactive}(Caps at #2# sets of retriggers){}"
                }
            },
			j_felijo_ltr_qdl = {
                name = "Quad Letter Tile",
                text = { 
                    "{C:green}#3# in #4#{} chance to retrigger",
                     "a scored card {C:attention}+#1#{} times",
                    "{s:0.7,C:inactive}(Caps at #2# sets of retriggers){}"
                }
            },
			j_felijo_ltr_dbw = {
                name = "Double Word Tile",
                text = { 
                    "{C:green}#3# in #4#{} chance to",
                    "Gain {X:chips,C:white}X#1#{} Chips and {X:mult,C:white}X#2#{} Mult",
                    "{s:0.7,C:inactive}(Hand needs to be 4 cards or more){}"
                }
            },
			j_felijo_ltr_tpw = {
                name = "Triple Word Tile",
                text = { 
                    "{C:green}#3# in #4#{} chance to",
                    "Gain {X:chips,C:white}X#1#{} Chips and {X:mult,C:white}X#2#{} Mult",
                    "{s:0.7,C:inactive}(Hand needs to be 6 cards or more){}"
                }
            },
			j_felijo_ltr_qdw = {
                name = "Quad Word Tile",
                text = { 
                    "{C:green}#3# in #4#{} chance to",
                    "Gain {X:chips,C:white}X#1#{} Chips and {X:mult,C:white}X#2#{} Mult",
                    "{s:0.7,C:inactive}(Hand needs to be 8 cards or more){}"
                }
            },
			j_felijo_ltr_cleanslate = {
                name = "Clean Slate",
                text = { 
                    "{C:chips}+#1#{} Chips and {C:money}$#2#{}",
                    "if the {C:attention}entire hand{} is",
					"{C:attention}played{} and {C:attention}scored"
                }
            },
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
		},
        Other = {
			felijo_akyrs_wildcard	= {
				name = "Wildcard (Aikoyori's Shenanigans)",
				text= {
					"A {C:felijo_pink}Wildcard",
                    "is a {C:blue}letter{} that can be used",
                    "as {C:attention}any character"
				}
			},
        },
	},
}