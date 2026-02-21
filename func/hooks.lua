
-- for a Boss/Showdown Blind... Thank you TOGA!
sendInfoMessage("Hooking Blind:defeat...", "(Feli's Jokeria, courtesy of TOGAPack)")
local blindkillref = Blind.defeat
function Blind:defeat(silent)
	if FELIJO.is_mod_loaded("TOGAPack") and togabalatro.config.DoMoreLogging and togabalatro.config.DoEvenMoreLogging then sendDebugMessage("Blind:defeat hook.", "TOGAPack") end
	blindkillref(self, silent)
	-- check for blind
	if not G.GAME.login and self.name == 'bl_toga_login' then G.GAME.login = true end
	
end

local XmainMenuHook = Game.main_menu
function Game:main_menu(ctx)
    local r = XmainMenuHook(self,ctx)
    if self.title_top then
        local tg = self.title_top
        local card = Card(tg.T.x,tg.T.y,G.CARD_W,G.CARD_H,nil,G.P_CENTERS['j_felijo_lgd_feli'])
        card.bypass_discovery_center = true
        card.T.w = card.T.w * 1.4
        card.T.h = card.T.h * 1.4
        card:set_sprites(card.config.center)
        card.no_ui = true
        card.states.visible = false
        self.title_top:emplace(card)
        self.title_top:align_cards()
        G.E_MANAGER:add_event(
            Event{
                delay = 0.5,
                func = function ()
                    if ctx == "splash" then
                        card.states.visible = true
                        card:start_materialize({ G.C.WHITE, G.C.WHITE }, true, 0.5)
                    else
                        card.states.visible = true
                        card:start_materialize({ G.C.WHITE, G.C.WHITE }, nil, 0.2)
                    end
                    return true
                end
            }
        )
    end
end
