-- https://stackoverflow.com/questions/2353211/hsl-to-rgb-color-conversion + Aikoyori (Aikoshen), rainbow function.
function FELIJO.hsl2rgb(h,s,l,al) 
    local a=s*math.min(l,1-l);
    local f = function(n, k) k = math.fmod((n+h/30),12); return l - a*math.max(math.min(k-3,9-k,1),-1) end
    return {f(0),f(8),f(4),al};
end

if SMODS.DynaTextEffect then
	SMODS.DynaTextEffect {
			key = "pink",
			func = function (dynatext, index, letter)
				letter.colour = HEX 'F400F0'
			end
		}
end


loc_colour()
G.ARGS.LOC_COLOURS.felijo_pink = HEX('F400F0')
G.ARGS.LOC_COLOURS.felijo_rit = HEX('4B5A47')
G.ARGS.LOC_COLOURS.felijo_ins = HEX('7f1232')
G.ARGS.LOC_COLOURS.felijo_trb = HEX('D58F27')
G.ARGS.LOC_COLOURS.felijo_sgl = HEX('00DB8A')
G.ARGS.LOC_COLOURS.felijo_ttm = HEX('7E5C2F')
G.ARGS.LOC_COLOURS.felijo_ins_gld = HEX('F8A84F')
G.ARGS.LOC_COLOURS.felijo_goobert = HEX('218812')
G.ARGS.LOC_COLOURS.felijo_garf_bg = HEX('FFAE52')
G.ARGS.LOC_COLOURS.felijo_tiered = HEX('8E3600')
G.ARGS.LOC_COLOURS.felijo_inactive = HEX("B7B7B7")

SMODS.Gradient({
    key = "t2_mp",
    colours = {
        HEX("97626B"),
        HEX("ED9AA8"),
    },
    cycle = 2,
})
SMODS.Gradient({
    key = "rit_mp",
    colours ={
        HEX('8FAA86'),
        HEX('BACAB4'),

    },
    cycle = 2,
})

SMODS.Gradient({
    key = "chipsmult",
    colours = {
        G.C.CHIPS,
        G.C.MULT,
    },
    cycle = 2,
})




SMODS.Gradient({
    key = "t3_mp",
    colours = {
        HEX("4D5A7E"),
        HEX("8096D2"),
    },
    cycle = 2,
})



SMODS.Gradient({
    key = "t4_mp",
    colours = {
        HEX("A8926D"),
		HEX("F0CF99"),
    },
    cycle = 2,
})