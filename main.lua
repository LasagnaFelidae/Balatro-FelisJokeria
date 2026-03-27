FELIJO = SMODS.current_mod
FELIJO.optional_features = {post_trigger = true,}
G.GAME = {}
-----------------------------
--┏━╸╻ ╻┏┓╻┏━╸╺┳╸╻┏━┓┏┓╻┏━┓--
--┣╸ ┃ ┃┃┗┫┃   ┃ ┃┃ ┃┃┗┫┗━┓--
--╹  ┗━┛╹ ╹┗━╸ ╹ ╹┗━┛╹ ╹┗━┛--
-----------------------------
local utils = SMODS.NFS.getDirectoryItems(SMODS.current_mod.path .. "func/utils")
for _, file in ipairs(utils) do
    assert(SMODS.load_file("func/utils/" .. file))()
end

local hooks = SMODS.NFS.getDirectoryItems(SMODS.current_mod.path .. "func/hooks")
for _, file in ipairs(hooks) do
    assert(SMODS.load_file("func/hooks/" .. file))()
end

local ui = SMODS.NFS.getDirectoryItems(SMODS.current_mod.path .. "func/ui")
for _, file in ipairs(ui) do
    assert(SMODS.load_file("func/ui/" .. file))()
end



assert(SMODS.load_file("./func/pools.lua"))()


----------------------------
-----┏━┓┏━┓┏━┓┏━╸╺┳╸┏━┓-----
-----┣━┫┗━┓┗━┓┣╸  ┃ ┗━┓-----
-----╹ ╹┗━┛┗━┛┗━╸ ╹ ┗━┛-----
----------------------------
assert(SMODS.load_file("./modules/atlasses.lua"))()
assert(SMODS.load_file("./modules/content/inscryption/atlasses.lua"))()
assert(SMODS.load_file("./modules/sounds.lua"))()
assert(SMODS.load_file("./modules/fonts.lua"))()

----------------------------
--┏━╸┏━┓┏━┓┏━┓┏━┓┏┳┓┏━┓╺┳┓--
--┃  ┣┳┛┃ ┃┗━┓┗━┓┃┃┃┃ ┃ ┃┃--
--┗━╸╹┗╸┗━┛┗━┛┗━┛╹ ╹┗━┛╺┻┛--
----------------------------
assert(SMODS.load_file("./modules/content/crossmod/togastuff.lua"))()
assert(SMODS.load_file("./modules/content/crossmod/revo.lua"))()
assert(SMODS.load_file("./modules/content/crossmod/aikoshen.lua"))()
if FELIJO.is_mod_loaded("Blindside") then
    assert(SMODS.load_file("./modules/content/crossmod/blindside.lua"))()
end
--[[
 ▛▀▘▛▀▘▌  ▜▝▌ ▞▀▖
 ▙▄ ▙▄ ▌  ▐   ▝▚▖
 ▌  ▙▄▖▙▄▖▐▖  ▚▄▌
 ▐▄▄▄ ▄█▀▄ ▄ •▄ ▄▄▄ .▄▄▄      ▄▄▄· 
  ·██▐█▌.▐▌█▌▄▌ ▀▄.▀·▀▄ █·██ ▐█ ▀█ 
 ▄ ██▐█  █ ▐▀▀▄·▐▀▀ ▄▐▀▀▄ ▐█·▄█▀▀█ 
▐▌▐█▌▐█▌.▐▌▐█.█▌▐█▄▄▌▐█•█▌▐█▌▐█  ▐▌
 ▀▀▀• ▀▀▀▀ ·▀  ▀ ▀▀▀ .▀  ▀▀▀▀ ▀  ▀ 
]]
G.superior_enhancement = "m_felijo_enh_sup"

if FELIJO.is_mod_loaded("RevosVault") and SMODS.Mods["RevosVault"].config and SMODS.Mods["RevosVault"].config.superior_enabled == true then
	G.superior_enhancement = "m_crv_superiore"
else
	G.superior_enhancement = "m_felijo_enh_sup"
end


SMODS.current_mod.reset_game_globals = function(run_start)
	if run_start then
		G.GAME.tarot_modifier = 0
	end
end

assert(SMODS.load_file("./modules/content/challenges.lua"))()
assert(SMODS.load_file("./modules/content/enhancements.lua"))()
assert(SMODS.load_file("./modules/content/legendaries.lua"))()
assert(SMODS.load_file("./modules/content/jokers.lua"))()
assert(SMODS.load_file("./modules/content/stickers.lua"))()
assert(SMODS.load_file("./modules/content/tarots.lua"))()

--[[
▄▄▄▄  ▄▄▄▄▄ ▄▄▄▄  ▄▄    ▄▄▄▄▄ ▄▄ ▄▄ 
██▄█▄ ██▀██ ██▄██ ██    ██▀██ ▀█▄█▀ 
██ ██ █████ ██▄█▀ ██▄▄▄ █████ ██ ██ 
]]
----------------------
-- ┏┓┏━┓╻┏ ┏━╸┏━┓┏━┓--
--  ┃┃ ┃┣┻┓┣╸ ┣┳┛┗━┓--
--┗━┛┗━┛╹ ╹┗━╸╹┗╸┗━┛--
----------------------
assert(SMODS.load_file("./modules/content/roblox/jokers.lua"))()
assert(SMODS.load_file("./modules/content/roblox/stickers.lua"))()






--[[
                                       █▄               
 ▀▀ ▄                 ▄               ▄██▄▀▀       ▄    
 ██ ████▄ ▄██▀█ ▄███▀ ████▄██ ██ ████▄ ██ ██ ▄███▄ ████▄
 ██ ██ ██ ▀███▄ ██    ██   ██▄██ ██ ██ ██ ██ ██ ██ ██ ██
▄██▄██ ▀██▄▄██▀▄▀███▄▄█▀  ▄▄▀██▀▄████▀▄██▄██▄▀███▀▄██ ▀█
                             ██  ██                     
                           ▀▀▀   ▀                      
]]
----------------------
-- ┏┓┏━┓╻┏ ┏━╸┏━┓┏━┓--
--  ┃┃ ┃┣┻┓┣╸ ┣┳┛┗━┓--
--┗━┛┗━┛╹ ╹┗━╸╹┗╸┗━┛--
----------------------
assert(SMODS.load_file("./modules/content/inscryption/jokers/1_avian.lua"))()
assert(SMODS.load_file("./modules/content/inscryption/jokers/2_canine.lua"))()
assert(SMODS.load_file("./modules/content/inscryption/jokers/3_feline.lua"))()
assert(SMODS.load_file("./modules/content/inscryption/jokers/4_hooved.lua"))()
assert(SMODS.load_file("./modules/content/inscryption/jokers/5_insect.lua"))()
assert(SMODS.load_file("./modules/content/inscryption/jokers/6_reptile.lua"))()
assert(SMODS.load_file("./modules/content/inscryption/jokers/7_vermin.lua"))()
assert(SMODS.load_file("./modules/content/inscryption/jokers/8_objects.lua"))()
assert(SMODS.load_file("./modules/content/inscryption/jokers/9_others.lua"))()
assert(SMODS.load_file("./modules/content/inscryption/jokers/10_human.lua"))()
assert(SMODS.load_file("./modules/content/inscryption/jokers/11_deathcards.lua"))()
--assert(SMODS.load_file("./modules/content/inscryption/jokers/12_tail.lua"))()
----------------------
--╺┳╸┏━┓╺┳╸┏━╸┏┳┓┏━┓--
-- ┃ ┃ ┃ ┃ ┣╸ ┃┃┃┗━┓--
-- ╹ ┗━┛ ╹ ┗━╸╹ ╹┗━┛--
----------------------
assert(SMODS.load_file("./modules/content/inscryption/totems/sigils.lua"))()
assert(SMODS.load_file("./modules/content/inscryption/totems/totems.lua"))()
-----------------------
-----CONSUMEABLES------
-----------------------
assert(SMODS.load_file("./modules/content/inscryption/consumeables/ritual.lua"))()
assert(SMODS.load_file("./modules/content/inscryption/consumeables/tribe.lua"))()
assert(SMODS.load_file("./modules/content/inscryption/boosters/ritual.lua"))()
assert(SMODS.load_file("./modules/content/inscryption/boosters/tribe.lua"))()
-----------------------
-----Decks------
-----------------------
assert(SMODS.load_file("./modules/content/inscryption/decks/backs.lua"))()
assert(SMODS.load_file("./modules/content/inscryption/decks/sleeves.lua"))()

-----------------------
-----------------------
assert(SMODS.load_file("./modules/content/inscryption/sigils.lua"))()
assert(SMODS.load_file("./modules/content/inscryption/tags.lua"))()
assert(SMODS.load_file("./modules/content/inscryption/pelts.lua"))()
--assert(SMODS.load_file("./modules/content/inscryption/blinds.lua"))()
assert(SMODS.load_file("./modules/content/inscryption/vouchers.lua"))()









