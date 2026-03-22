local XmainMenuHook = Game.main_menu
function Game:main_menu(ctx)
    local r = XmainMenuHook(self,ctx)
    if self.title_top then
		FELIJO.pool_merge({"Roblox", "Food"},"AND", true, FELIJO.POOLS.Roblox_Food)
    end
end

local startRunHook = Game.start_run
function Game:start_run(args)
	local ret = startRunHook(self, args)
	FELIJO.highlighted_head = nil
	FELIJO.active_totem = nil
    return ret
end