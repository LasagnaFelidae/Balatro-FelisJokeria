return {
    descriptions = {
        Joker={
			j_felijo_tby_dbl = {
                name = "Double Letter Tile",
                text = { 
                    "{C:green}#3# in #4#{} chance to retrigger",
                     "a scored card {X:attention,C:white}+#1#{} times",
                    "when scored",
                    "{s:0.7,C:inactive}(Caps at #2# sets of retriggers){}"
                }
            },
			j_felijo_tby_tpl = {
                name = "Triple Letter Tile",
                text = { 
                    "{C:green}#3# in #4#{} chance to retrigger",
                    "a scored card {X:attention,C:white}+#1#{} times",
                    "when scored",
                    "{s:0.7,C:inactive}(Caps at #2# sets of retriggers){}"
                }
            },
			j_felijo_tby_qdl = {
                name = "Quad Letter Tile",
                text = { 
                    "{C:green}#3# in #4#{} chance to retrigger",
                     "a scored card {X:attention,C:white}+#1#{} times",
                    "when scored",
                    "{s:0.7,C:inactive}(Caps at #2# sets of retriggers){}"
                }
            },
			j_felijo_tby_dbw = {
                name = "Double Word Tile",
                text = { 
                    "{C:green}#3# in #4#{} chance to",
                    "Gain {X:chips,C:white}x#1#{} Chips and {X:mult,C:white}x#2#{} Mult",
                    "{s:0.7,C:inactive}(Word needs to be 4 letters or longer){}"
                }
            },
			j_felijo_tby_tpw = {
                name = "Triple Word Tile",
                text = { 
                    "{C:green}#3# in #4#{} chance to",
                    "Gain {X:chips,C:white}x#1#{} Chips and {X:mult,C:white}x#2#{} Mult",
                    "{s:0.7,C:inactive}(Word needs to be 6 letters or longer){}"
                }
            },
			j_felijo_tby_qdw = {
                name = "Quad Word Tile",
                text = { 
                    "{C:green}#3# in #4#{} chance to",
                    "Gain {X:chips,C:white}x#1#{} Chips and {X:mult,C:white}x#2#{} Mult",
                    "{s:0.7,C:inactive}(Word needs to be 8 letters or longer){}"
                }
            },
			j_felijo_tby_cleanslate = {
                name = "Clean Slate",
                text = { 
                    "Gain {C:chips}+#1#{} Chips and {C:money}$#2#{}",
                    "if {C:attention}all{} cards in {C:attention}hand{} are {C:attention}played{}"
                }
            },
			j_felijo_feli_leg = {
                name = "{C:money,E:1,S:2}Feli{}",
                text = { 
                    "Gain {C:chips}+#1#{} Chips per letter multiplied",
					"by the number of times",
					"{C:attention}poker hand{} has been played",
					"{C:green}#2# in #3#{} chance to level up {C:attention}poker hand{}",
                    "if {C:attention}word{} is related to {C:attention}Garfield{}",
					"{s:0.7,C:inactive}(The second self-insert of all time! ;)){}"
                }
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
		},
    },
}