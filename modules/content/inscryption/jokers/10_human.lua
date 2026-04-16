SMODS.Joker{  --rare Mycologists, The
	atlas = 'insDeathcard',
	pos = { x = 3, y = 0 },
	pools = {
		["FelisJokeria"]=true,
		["Beast"] = true,	
		["Inscryption"] = true, 
		["Human"] = true 
	},
	key = "felijo_ins_myco",
	pronouns = "they_them",
	rarity = 3,
	cost = 8,
	blueprint_compat = false,
	eternal_compat = true,
	perishable_compat = true,
	unlocked = true,
	discovered = false,
	config = { extra = {} },
	attributes = {"chips", "mult", "modify_card", "destroy_card"},
	set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_ins'), HEX('7f1232'), HEX('f2a655'), 1 )
	end,
	loc_vars = function(self, info_queue, card)
		return { vars = {colours = { HEX('F0C590'), HEX('351A09'), HEX('998377'),HEX('7E9978')} } }
	end,
	calculate = function(self, card, context)
		if context.final_scoring_step and context.cardarea == G.jokers  then
			if context.scoring_name == "Pair" and #context.scoring_hand == 2 and not (G.GAME.hands[context.scoring_name] and G.GAME.hands[context.scoring_name].played_this_round > 1) then
				local c1 = context.scoring_hand[1]
				local c2 = context.scoring_hand[2]
				local suit = pseudorandom(pseudoseed('merge_suit')) < 0.5 and c1.base.suit or c2.base.suit
				local rank = c1:get_id()
				
				
				local new_front_key = suit:sub(1,1) .. '_' .. FELIJO.number_to_pip(rank)
				local new_front = G.P_CARDS[new_front_key]
				
				local enhancements = {}
				if c1.config.center then table.insert(enhancements, c1.config.center) end
				if c2.config.center then table.insert(enhancements, c2.config.center) end
				if #enhancements == 0 then enhancements = {G.P_CENTERS.c_base} end
				local new_center = pseudorandom_element(enhancements, pseudoseed('merge_enhancement')) or nil
				
				local seals = {}
				if c1.seal then table.insert(seals, c1.seal) end
				if c2.seal then table.insert(seals, c2.seal) end
				local new_seal = #seals > 0 and pseudorandom_element(seals, pseudoseed('merge_seal')) or nil
				
				local editions = {}
				if c1.edition then table.insert(editions, c1.edition) end
				if c2.edition then table.insert(editions, c2.edition) end
				local new_edition = #editions > 0 and pseudorandom_element(editions, pseudoseed('merge_edition')) or nil
				
				local merged_card = create_playing_card({
					front = new_front,
					center = new_center,
				}, G.play, true, false, nil, true)
				
				merged_card.ability.perma_bonus = FELIJO.rank_to_chips(rank)
				merged_card.ability.felijo_stk_stitched = true
				if new_seal then
					merged_card:set_seal(new_seal, true)
				end
				
				if new_edition then
					merged_card:set_edition(new_edition, true)
				end
				
				SMODS.destroy_cards(c1)
				SMODS.destroy_cards(c2)
				G.E_MANAGER:add_event(Event({
					delay = 1,
					func = function()
						merged_card:start_materialize()
						G.deck:emplace(merged_card)
						return true
					end
				}))
				
				return {
					message = "Merged!"
				}
			end
		end
	end
}