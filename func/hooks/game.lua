local XmainMenuHook = Game.main_menu
function Game:main_menu(ctx)
    local r = XmainMenuHook(self,ctx)
    if self.title_top then
		FELIJO.pool_merge({"Roblox", "Food"},"AND", true, FELIJO.POOLS.Roblox_Food)
    end
end

local gameInitHook = Game.init_game_object
function Game:init_game_object()
    local ret = gameInitHook(self)
    ret.felijo_totems_enabled = false

    return ret
end

local startRunHook = Game.start_run
function Game:start_run(args)
	local ret = startRunHook(self, args)
    if G.GAME.modifiers.felijo_totems_enabled then
        G.GAME.felijo_totems_enabled = G.GAME.modifiers.felijo_totems_enabled
    end
	FELIJO.highlighted_head = nil
	FELIJO.active_totem = nil
    return ret
end


local applyBackHook = Back.apply_to_run
function Back:apply_to_run()

    local c = applyBackHook(self)
    if self.effect.config.felijo_totems_enabled then
        G.GAME.modifiers.felijo_totems_enabled = self.effect.config.felijo_totems_enabled
    end

    return c
end