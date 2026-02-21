FELIJO = SMODS.current_mod
FELIJO.optional_features = {post_trigger = true,}

assert(SMODS.load_file("./func/hooks.lua"))()
assert(SMODS.load_file("./func/util.lua"))()
assert(SMODS.load_file("./modules/atlasses.lua"))()
assert(SMODS.load_file("./modules/sounds.lua"))()
assert(SMODS.load_file("./modules/fonts.lua"))()
assert(SMODS.load_file("./modules/content/challenges.lua"))()
-- Inscryption Content

assert(SMODS.load_file("./modules/content/inscryption/jokers.lua"))()
assert(SMODS.load_file("./modules/content/inscryption/sigils.lua"))()
assert(SMODS.load_file("./modules/content/inscryption/pelts.lua"))()
--assert(SMODS.load_file("./modules/content/inscryption/blinds.lua"))()
assert(SMODS.load_file("./modules/content/inscryption/vouchers.lua"))()

-- TOGAStuff Content
assert(SMODS.load_file("./modules/content/crossmod/togastuff.lua"))()
-- AikoShen Letter Content
assert(SMODS.load_file("./modules/content/crossmod/aikoshen.lua"))()
assert(SMODS.load_file("./func/garf_dict.lua"))()
assert(SMODS.load_file("./modules/content/legendaries.lua"))()
assert(SMODS.load_file("./modules/content/jokers.lua"))()






