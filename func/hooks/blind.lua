-- for a Boss/Showdown Blind... Thank you TOGA!
local blindkillref = Blind.defeat
function Blind:defeat(silent)
	blindkillref(self, silent)
	if not G.GAME.login and self.name == 'bl_toga_login' then G.GAME.login = true end
	
end






