return {
    descriptions ={
        Joker = {
            j_felijo_ins_squirrel = {
                name = "{B:1,V:2,f:felijo_Feli5x8}Squirrel",
                text = {
					{
					"{C:mult}+#1#{} Mult",
					},
                },
            },
			j_felijo_ins_squirrelball = {
                name = "{B:1,V:2,f:felijo_Feli5x8}Squirrel Ball",
                text = {
					{
					"{C:mult}+#1#{} Mult",
					},
					{
                    "Moves the Joker around",
                    "and create a {C:attention}Squirrel{}",
                    "{C:green}#2# in #4#{} chance to destroy itself",
                    "and make between 0 and #3# more {C:attention}Squirrels{}.",
                    "{C:inactive,s:0.8}(Chance is based on the ratio of",
                    "{C:inactive,s:0.8}Squirrels to double the Joker card limit.)",

					},
                },
            },

            j_felijo_ins_packrat = {
                name = "{B:1,V:2,f:felijo_Feli5x8}Pack Rat",
                text = {
                    {
                        "{C:chips}+#1#{} Chips, {C:mult}+#2#{} Mult",
                    },
                    {
                        "Gives a {C:dark_edition}Negative {C:planet}Consumable{}",
                        "after beating an {C:attention}Ante{}",    
                    },
                    {
                        "When destroyed or sold,",
                        "earn a {C:attention}gift{}"
                    },
                },
            },
        },
    }
}
