return {
    descriptions = {
        Blind = {
            
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
            
            j_felijo_bliss = {
                name = "Bliss",
                text = { 
                    "Gains {C:chips}+#1#{} Chips",
                    "if {C:attention}#2#{} or more suits",
                    "have been scored.",
                    "{C:inactive}(Currently {}{C:chips}+#3#{}{C:inactive} Chips.)"
                }
            },
            j_felijo_idiot = {
                name = "Trojan.JS.YouAreAnIdiot",
                text = { 
                    {
                        "{C:mult}+#1#{} Mult",
                    },
                    {
                        "{C:green}#2# in #3#{} chance to",
                        "become {C:dark_edition}Eternal{}",
                        "when added to deck",
                    },
                    {
                        "{C:green}#2# in #4#{} chance to",
                        "copy itself and taunt you",
                        "on {C:attention}any action{}",
                    }
                    
                }
            },
            j_felijo_idiot_alt = {
                name = "Trojan.JS.YouAreAnIdiot",
                text = { 
                    {
                        "{C:mult}+#1#{} Mult",
                    },
                    {
                        "{C:green}#2# in #4#{} chance to",
                        "copy itself and taunt you",
                        "on {C:attention}any action{}",
                        "{C:inactive,s:0.8}you are fucked."
                    }
                    
                }
            },
            
        }
    }
}