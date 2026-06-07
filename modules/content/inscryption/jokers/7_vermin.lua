FELIJO.Vermin = SMODS.Joker:extend{
    atlas = 'felijo_insVermin',
	pools = {
		["FelisJokeria"]=true,
		["Inscryption"] = true, 
		["Beast"] = true,
		["Vermin"] = true, 
	},
	unlocked = true,
	discovered = false,
	set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_ins'), HEX('7f1232'), HEX('f2a655'), 1 )
	end,
}


FELIJO.Vermin { -- common River Snapper
    pos = { x = 0, y = 0 },
    key = "felijo_ins_squirrel",
    rarity = 1,
    cost = 1,
	blueprint_compat = true,
	eternal_compat = true,
	pronouns = "he_him",
	attributes = {"mult",},
	config = { extra = { mult = 1,}},
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult, colours = { HEX('F0C590'), HEX('351A09') } } } 
    end,
    calculate = function(self, card, context)
		if context.joker_main then
			return {
				mult = card.ability.extra.mult,

			}
        end
	end,
}

FELIJO.Vermin { -- common Squirrel Ball
    pos = { x = 1, y = 0 },
    key = "felijo_ins_squirrelball",
    rarity = 1,
    cost = 3,
	blueprint_compat = true,
	eternal_compat = true,
	pronouns = "they_them",
	attributes = {"mult","position","generation"},
	config = { extra = { mult = 1, max = 3}, immutable = { index = 0, squirrels = 0, squirreled = false}},
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS["j_felijo_ins_squirrel"]
        if G.jokers and G.jokers.cards then
            card.ability.immutable.squirrels = 0
            for i, v in ipairs(G.jokers.cards) do
                if v.config.center.key == "j_felijo_ins_squirrel" then
                    card.ability.immutable.squirrels = card.ability.immutable.squirrels + 1
                end
            end
        end
		return { vars = { card.ability.extra.mult, card.ability.immutable.squirrels, math.floor(card.ability.extra.max), G.jokers and G.jokers.config.card_limit*2 or 0,  colours = { HEX('F0C590'), HEX('351A09') } } } 
    end,
    add_to_deck = function (self, card, from_debuff)
        if card.area and card.area.cards then
            local pos = FELIJO.getIndex(card.area.cards,card)
            card.ability.immutable.index = pos
        end
    end,
    calculate = function(self, card, context)
        if context.before then
            card.ability.immutable.squirrels = 0
            for i, v in ipairs(G.jokers.cards) do
                if v.config.center.key == "j_felijo_ins_squirrel" then
                    card.ability.immutable.squirrels = card.ability.immutable.squirrels + 1
                end
            end
            if card.area and card.area.cards and card.ability.immutable.squirreled == false then
                return {
                    func = function ()
                        local target = pseudorandom("target",1,#card.area.cards) 
                        local pos = FELIJO.getIndex(card.area.cards,card)
                        local it = 0
                        while target == pos do
                            target = pseudorandom("target"..it,1,#card.area.cards)
                            it = it + 1
                            if it > 3 then break end
                        end
                        card.area.cards[target],card.area.cards[pos or 1] = card.area.cards[pos],card.area.cards[target]
                        card.ability.immutable.index = pos
                        card.area:align_cards()
                        if SMODS.pseudorandom_probability(card, "squirrelballing", card.ability.immutable.squirrels, G.jokers.config.card_limit*2, nil, true) then
                            SMODS.destroy_cards(card)
                            roll = pseudorandom("squirrelball",0,math.floor(card.ability.extra.max))
                            for i = 0, roll do
                                SMODS.add_card({key = "j_felijo_ins_squirrel", area = G.jokers})
                            end
                        end
                        SMODS.add_card({key = "j_felijo_ins_squirrel", area = G.jokers})
                        card.ability.immutable.squirreled = true
                    end
                }
            end
        end
		if context.joker_main then
            card.ability.immutable.squirreled = false
			return {
				mult = card.ability.extra.mult,
			}
        end
	end,
}

FELIJO.Vermin { -- Rare Pack Rat
    pos = { x = 4, y = 0 },
    key = "felijo_ins_packrat",
    rarity = 3,
    cost = 8,
	blueprint_compat = false,
	eternal_compat = true,
	pronouns = "she_her",
	attributes = {"mult","chips","generation"},
	config = { extra = { mult = 2, chips = 2}},
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS["p_felijo_pack_rat"]
		return { vars = { card.ability.extra.chips, card.ability.extra.mult,  colours = { HEX('F0C590'), HEX('351A09') } } } 
    end,
    remove_from_deck = function(self,card, from_debuff)
        add_tag(Tag("tag_felijo_packrat_gift", false, 'Small')) 
    end,
    calculate = function(self, card, context)

        if context.modify_ante and context.ante_end then
            SMODS.add_card{ set = "Consumeables", edition = "e_negative" }
        end
		if context.joker_main then
			return {
				mult = card.ability.extra.mult,
			}
        end
	end,
}