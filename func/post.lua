local XmainMenuHook = Game.main_menu
function Game:main_menu(ctx)
    local r = XmainMenuHook(self,ctx)
    if self.title_top then
    end
end

local startRunHook = Game.start_run
function Game:start_run(args)
	local ret = startRunHook(self, args)
	FELIJO.highlighted_head = nil
	FELIJO.active_totem = nil
    FELIJO.pool_merge({"Roblox", "Food"},"AND", true, FELIJO.POOLS.Roblox_Food)
	
	FELIJO.pool_merge({"Cat", "Kitty"},"NOT", true, FELIJO.POOLS.Kitty)  -- Make the Cat and Kitty pools the same
	FELIJO.pool_merge({"Feline", "Kitty"},"NOT", true, FELIJO.POOLS.Kitty) -- Make the Kitty and Feline pools the same
	FELIJO.pool_merge({"Kitty", "Feline"},"NOT", true, FELIJO.POOLS.Feline) -- sic
	
	FELIJO.pool_merge({"Feline", "Cat"},"NOT", true, FELIJO.POOLS.Cat) -- Now that the pools are the same, inject to the cat pool
    return ret
end