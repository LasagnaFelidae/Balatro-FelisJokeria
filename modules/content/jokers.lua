
--[[
SMODS.Joker {
    key = "joker",
    pos = { x = 0, y = 0 },
    rarity = 1,
	atlas = "placeholder",
	pools = {
		["All"] = true,
    },
    blueprint_compat = true,
    cost = 2,
    discovered = true,
    config = { extra = { mult = 4 }, },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}
]]

SMODS.Joker {
	atlas = 'felijo_a_spaceshuttle',
	pos = { x = 0, y = 0},
	soul_pos = {
		x = 0, y = 1,
	},
	pools = {["FelisJokeria"] = true,},
	key = "felijo_rocket",
	rarity = 1,
	cost = 8,
    pronouns = "it_its",
	unlocked = true,
	discovered = false,	
	blueprint_compat = true,
	perishable_compat = false,
	eternal_compat = false,
    attributes = {"scaling", "mult", "space"},
	config = {
		extra = { mult = 5, mult_mod = 5, count = 0, max_c = 5, ascended = false, set = true},
	},
	set_sprites = function(self, card, front)
        if card.ability and card.ability.extra and card.ability.extra.ascended then
			card.children.center:set_sprite_pos({x=0, y=2})
			card.children.floating_sprite:set_sprite_pos({ x = 0, y = 3})
		end
    end,	
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = {key = 'felijo_bld_explode', set = 'Other'}
		local key = self.key
		if card.ability.extra.ascended == true then
			key = self.key .. "_a"
		end
		return { vars = {card.ability.extra.mult, card.ability.extra.mult_mod, math.min(5,((card.ability.extra.max_c + 1 ) - card.ability.extra.count)), }, key = key }
	end,
	calculate = function(self, card, context)
		if context.before then
			local mph = FELIJO.get_most_played_hand()
			if card.ability.extra.ascended == true then
				local reset = true
				local play_more_than = (G.GAME.hands[context.scoring_name].played or 0)
				for handname, values in pairs(G.GAME.hands) do
					if handname ~= context.scoring_name and values.played >= play_more_than and SMODS.is_poker_hand_visible(handname) then
						reset = false
						break
					end
				end
				if reset then
					FELIJO.explodeCard(card, "explosion")
					return {
						message = localize('k_reset'),
						colour = G.C.RED,
						no_juice = false
					}
				else
					-- See note about SMODS Scaling Manipulation on the wiki
					card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod
					return {
						message = localize('k_upgrade_ex'),
						colour = G.C.GOLD,
						no_juice = false
					}
				end
			end
			if context.scoring_hand ~= mph and card.ability.extra.count < card.ability.extra.max_c then
				card.ability.extra.count = card.ability.extra.count + 1
                play_sound('felijo_space_shuttle_cd_'..((card.ability.extra.max_c - card.ability.extra.count) + 1), 1)
                card.ability.extra.set = false
			elseif card.ability.extra.ascended == false and card.ability.extra.count >= card.ability.extra.max_c then
				play_sound('felijo_space_shuttle_blastoff', 1)
				card.ability.extra.ascended = true
				card.children.center:set_sprite_pos({x=0, y=2})
				card.children.floating_sprite:set_sprite_pos({ x = 0, y = 3})
				card.ability.extra.mult = 10
                return {
					message = "Blast Off!",
					colour = G.C.GOLD,
					no_juice = false
				}
			end
		end
		if context.joker_main then
			return {
				mult = card.ability.extra.mult
			}
		end
	end,
}