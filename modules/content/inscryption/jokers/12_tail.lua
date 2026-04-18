
SMODS.Joker { -- Common, loose tail
    atlas = 'insTail',
    pos = { x = 0, y = 0 },
    pools = {
	["FelisJokeria"]= true,
	["Inscryption"] = true,
	["Beast"] 		= true,
	["Tail"] 		= true,
	},
    key = "felijo_ins_tail",
	pronouns = "any_all",
    rarity = 1,
    cost = 2,
	unlocked = true,
	discovered = false,
	config = {extra = {mult = 2}},
	attributes = {"mult",},
	in_pool = function(self, args)
		return false
	end,
	set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_ins'), HEX('7f1232'), HEX('f2a655'), 1 )
	end,
	set_sprites = function(self, card, front)
		if card and card.children and card.children.center and card.ability then
			local tail_x = 0
			local tailtable = {
				{key = "Avian",		x=3,  	akey = "_avi"},
				{key = "Canine",	x=1, 	akey = "_fur"},
				{key = "Feline",	x=1,	akey = "_fur"},
				{key = "Hooved",	x=6,	akey = "_hoo"},
				{key = "Insect",	x=5,	akey = "_ins"},
				{key = "Reptile",	x=0,	akey = nil},
				{key = "Vermin",	x=1,	akey = "_fur"},
				{key = "Object",	x=7,	akey = "_obj"},
				{key = "Other", 	x=0,	akey = nil},
				{key = "Human", 	x=2,	akey = "_hum"},
				{key = "Tentacle", 	x=4,	akey = "_ten"}
			}
			for _, _tribe in ipairs(tailtable) do
				if _tribe.akey == card.ability.key_app then
					tail_x = _tribe.x
					break
				end
			end
			if card and card.children and card.children.center then
				card.children.center:set_sprite_pos({x = tail_x, y = 0})
			end
		end
	end,

    loc_vars = function(self, info_queue, card)
		newkey = self.key
		if card.ability.key_app then
			newkey = self.key .. card.ability.key_app
		end
		return { key = newkey, vars = {card.ability.extra.mult, colours = { HEX('F0C590'), HEX('351A09') } } }
    end,
    calculate = function(self, card, context)
		if context.joker_main then
			return {
			mult = card.ability.extra.mult
			}
		end
    end,
    blueprint_compat = true,
}

