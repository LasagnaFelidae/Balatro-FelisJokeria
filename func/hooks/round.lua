
local end_round_old = end_round
function end_round()
	G.E_MANAGER:add_event(Event({
		trigger = 'after',
		delay = 0.2,
		func = function()
            if FELIJO.active_totem == nil then
				FELIJO.removeTotemSigils()
			end
			return true
		end
	}))
	return end_round_old()
end
