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