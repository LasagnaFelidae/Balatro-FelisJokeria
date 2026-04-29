SMODS.Joker {
    key = "felijo_synthb_yokatsu",
    blueprint_compat = true,
    rarity = 3,
    cost = 8,
    atlas = "synthbJokers",
    pos = { x = 0, y = 0 },
    config = { extra = { copy = 1, max_copies = 3} },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {set = "SongInfo", key = "synthb_yokatsu", type="descriptions"}
        
        return { vars = { math.floor(card.ability.extra.copy), math.floor(card.ability.extra.max_copies) } }
    end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(localize('k_felijo_synthb'), HEX('D94169'), HEX('ffffff'), 1 )
    end,
    calculate = function(self, card, context)
        if context.first_hand_drawn and not context.blueprint then
            local eval = function() return G.GAME.current_round.hands_played == 0 and not G.RESET_JIGGLES end
            juice_card_until(card, eval, true)
        end
        if context.before and G.GAME.current_round.hands_played == 0 and #context.full_hand == math.floor(card.ability.extra.copy) then
            local roll = pseudorandom("j_felijo_synthb_yokatsu",0, math.floor(card.ability.extra.max_copies))
            if roll > 0 then
                for i = 1, roll do
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                            local card_copied = copy_card(context.full_hand[1], nil, nil, G.playing_card)
                            card_copied:add_to_deck()
                            G.deck.config.card_limit = G.deck.config.card_limit + 1
                            table.insert(G.playing_cards, card_copied)
                            G.hand:emplace(card_copied)
                            card_copied.states.visible = nil

                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    card_copied:start_materialize()
                                    SMODS.calculate_context({ playing_card_added = true, cards = { card_copied } })
                                    return true
                                end
                            }))
                            return true
                            
                        end
                    }))
                end
                return {
                    message = localize('k_copied_ex'),
                    colour = G.C.CHIPS,
                }
            else
                return {
                    message = localize('k_nope_ex'),
                    colour = G.C.CHIPS,
                }
            end
        end
    end
}
