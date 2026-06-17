local quest_table = {

    -- vry easy
    { key = 1,  line_1 = "Play a",         var_color = G.C.RED,        difficulty_pool = 1 }, -- rdm ez pkr hnd
    { key = 3,  line_1 = "Earn",           var_color = G.C.MONEY,      difficulty_pool = 1 }, -- earn 10
    { key = 4,  line_1 = "Buy any",            var_color = G.C.BLUE,       difficulty_pool = 1 }, -- 1 card buy
    { key = 5,  line_1 = "Use any",            var_color = G.C.SECONDARY_SET.Tarot, difficulty_pool = 1 }, -- 1 consumable use
    { key = 6,  line_1 = "Obtain a",         var_color = G.C.ORANGE,     difficulty_pool = 1 }, -- 1 joker
    { key = 7,  line_1 = "Defeat a",         var_color = G.C.GREEN,      difficulty_pool = 1 }, -- 1 blind

    -- easy
    { key = 8,  line_1 = "Play a",         var_color = G.C.RED,        difficulty_pool = 2 }, -- rdm pkr hand
    { key = 9,  line_1 = "Earn ",           var_color = G.C.MONEY,      difficulty_pool = 2 }, -- earn 18 - 25
    { key = 10, line_1 = "Spend ",          var_color = G.C.MONEY,      difficulty_pool = 2 }, -- spend 20 - 30
    { key = 11, line_1 = "Buy three",            var_color = G.C.BLUE,       difficulty_pool = 2 }, -- 3 cards
    { key = 12, line_1 = "Use two",            var_color = G.C.SECONDARY_SET.Tarot, difficulty_pool = 2 }, -- 2 tarot 
    { key = 13, line_1 = "Own three",            var_color = G.C.ORANGE,     difficulty_pool = 2 }, -- jokers
    { key = 14, line_1 = "Reach",          var_color = G.C.GREEN,      difficulty_pool = 2 }, -- ante

    -- hard
    { key = 15, line_1 = "Score in one hand",          var_color = G.C.CHIPS,      difficulty_pool = 3 }, -- 50k chips
    { key = 16, line_1 = "Use",            var_color = G.C.SECONDARY_SET.Spectral, difficulty_pool = 3 }, -- 1 spectral
    { key = 17, line_1 = "Upgrade",        var_color = G.C.PURPLE,     difficulty_pool = 3 }, -- poker hand
    { key = 18, line_1 = "Sell",           var_color = G.C.ORANGE,     difficulty_pool = 3 }, -- jokers
    { key = 19, line_1 = "Reach ",          var_color = G.C.GREEN,      difficulty_pool = 3 }, -- ante

    -- vry hard
    { key = 20, line_1 = "Beat in one hand a ",          var_color = G.C.CHIPS,      difficulty_pool = 4 }, -- boss blind one shot
    { key = 21, line_1 = "Play a",         var_color = G.C.RED,        difficulty_pool = 4 }, -- undiscovered hand
    { key = 22, line_1 = "Own 5 ",            var_color = G.C.ORANGE,     difficulty_pool = 4 }, -- okers
    { key = 23, line_1 = "Own a editioned ",            var_color = G.C.ORANGE,     difficulty_pool = 4 }, -- jokers (ediitioned)
    { key = 24, line_1 = "Use 5 ",            var_color = G.C.SECONDARY_SET.Tarot, difficulty_pool = 4 }, -- consumables
    { key = 25, line_1 = "Reach ",          var_color = G.C.GREEN,      difficulty_pool = 4 }, -- ante 
}










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
		
		local key = self.key
		if card.ability.extra.ascended == true then
			key = self.key .. "_a"
			info_queue[#info_queue+1] = {key = 'felijo_bld_explode', set = 'Other'}
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
--[[
SMODS.Joker {
	atlas = 'placeholder',
	pos = { x = 0, y = 0},
	soul_pos = {
		x = 0, y = 1,
	},
	pools = {["FelisJokeria"] = true,},
	key = "felijo_mypenis",
	rarity = 1,
	cost = 8,
    pronouns = "it_its",
	unlocked = true,
	discovered = false,	
	blueprint_compat = true,
	perishable_compat = false,
	eternal_compat = false,
    attributes = {"joker_slot", "joker_slot"},
	config = { extra = { text = "k_quest1_line1"}},
	loc_vars = function(self, info_queue, card)
		local other_text = "k_quest1_line2"
		return { vars = {localize(card.ability.extra.text), localize(other_text)}}
	end,
	add_to_deck = function(self, card,from_debuff)
		
	end,
	remove_from_deck = function(self,card,from_debuff)
		
	end,
	calculate = function(self, card, context)
		if context.card_added or context.buying_card or context.modify_shop_card or context.modify_booster_card then
			
		end
	end,
}
]]