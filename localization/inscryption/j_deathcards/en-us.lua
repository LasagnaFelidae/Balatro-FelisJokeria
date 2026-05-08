return {
    descriptions = {
		Joker = {
			j_felijo_ins_aiko = {
				name = "{B:1,V:2,f:felijo_Feli5x8}Aiko",
				text = {
					{
					"{C:chips}+#2#{} Chips, {C:mult}+#3#{} Mult",
					},
					{
					"When {C:attention}Blind{} is selected,",
					"destroys the Joker to its left",
					"and permanently add {C:attention}#4#{}% of its",
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
			j_felijo_ins_evgast = {
				name = "{B:1,V:2,f:felijo_Feli5x8}Evgast",
				text = {
					"{C:chips}+#2#{} Chips, {C:mult}+#3#{} Mult",
					"Each played {C:attention}Ace{} reduces",
					"current {C:blind}Blind Req.{} by {X:blind,C:white}#1#%{}",
					"{s:0.7,C:inactive}(When the Aces are flying... I think...)"
				},
			},
			j_felijo_ins_luna = {
				name = "{B:1,V:2,f:felijo_Feli5x8}Luna",
				text = {
					"{C:chips}+#2#{} Chips, {C:mult}+#3#{} Mult",
					"On {C:attention}Blind{} selected",
					"spawn a random {C:common}common {C:attention}Joker{}.",
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
			j_felijo_ins_lilyfelli = {
				name = "{B:1,V:2,f:felijo_Feli5x8}Lily{}",
				text = {
					{
					"{C:chips}+#1#{} Chips, {C:mult}+#2#{} Mult",
					},
					{
					"Retriggers {C:attention}#3#{} times each played card",
					"that matches the current {C:attention}pronoun{},",
					"pronouns change every round",
					},
					{
					"{C:inactive}[Currently{} {B:3,C:white}#4#{}{C:inactive}]{}"
					}
				},
			},
			j_felijo_ins_lilyfelli_nop = {
				name = "{B:1,V:2,f:felijo_Feli5x8}Lily{}",
				text = {
					{
					"{C:chips}+#1#{} Chips, {C:mult}+#2#{} Mult",
					},
					{
					"Fixed individual {C:green}1 in 3{} chance to ",
					"retrigger {C:attention}#3#{} times each played card",
					},
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
					"Add an {C:enhanced}unenhanced{} copy",
					"of a playing card to the deck",
					},
					{
					"Once {C:attention}#4#{} cards have been copied,",
					"become {C:tarot}Superior{}",
					"{C:inactive,s:0.8}(Currently {C:attention,s:0.8}#3#{C:inactive,s:0.8}/#4#){}{}{}"
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
					"Add a randomly tiered",
					"{C:tarot}Superior{} playing card",
					"to the deck.",
					}
				},
			},

			j_felijo_ins_soulware = {
				name = {
				"{B:1,V:2,f:felijo_Feli5x8}Soulware{}",
				"{s:0.5}(The Man){}",
				},
				text = {
					{
					"{C:chips}+#1#{} Chips, {C:mult}+#2#{} Mult",
					},
					{
					"{X:blind,C:white}-#3#{} to all {X:blind,C:white}XBlind{}",
					"{C:blind}-#4#{} to all {C:blind}+Blind{}",
					}
				},
			},
			j_felijo_ins_leshy = {
				name = {
				"{B:1,V:2,f:felijo_Feli5x8}Leshy{}",
				},
				text = {
					{
					"{C:chips}+#3#{} Chips, {X:mult,C:white}X#4#{} Mult",
					},
					{
					"Gives an additional",
					"{C:chips}+#1#{} Chips and {X:mult,C:white}X#2#{} Mult",
					"for every other",
					"{C:felijo_trb}Beast{} Joker owned.",
					}
				},
			},
		},
	},
}