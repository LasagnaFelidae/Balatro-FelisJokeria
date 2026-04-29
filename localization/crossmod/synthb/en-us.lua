local descriptions ={
    descriptions = {
        Joker={
            j_felijo_synthb_yokatsu = {
				name = {"{f:5}抑圧錯乱ガール", "{s:0.7}Disordered Self-restraint Girl"},
				text = {
					"If {C:attention}first hand{} of round",
                    "has only {C:attention}#1#{} card, add between {C:attention}0{} and",
                    "{C:attention}3{} permanent copies to deck",
                    "and draw them to {C:attention}hand",
					"{C:inactive,s:0.8,f:5}ショータイム　刀持ち　ぶんぶん振り回し",
					"{C:inactive,s:0.8,f:5}首から上　刎ね飛ばしても",
                    "{C:inactive,s:0.8,f:5}明日になれば　みんな元通り ",
				}
			},
        },
        SongInfo = {
            synthb_yokatsu = {
                text = {
                    "{C:attention}Title:",
                    "{f:5}抑圧錯乱ガール",
                    "{C:inactive,s:0.8}Disordered Self-restraint Girl",
                    "{C:attention}Producer:",
                    "otetsu",
                    "{C:attention}Voice:",
                    "{f:5}グミ",
                    "{C:inactive,s:0.8}GUMI",
                },
            }

        },  
    }
}

for _, content in pairs(descriptions.descriptions.SongInfo) do
	content.name = "Song Info"
end

return descriptions