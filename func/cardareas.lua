SMODS.current_mod.custom_card_areas = function(game) -- game is the same as G
    game.felijo_totems = CardArea( -- Should be saved in G for it to be preserved between reloads
        G.consumeables.T.x, -- x coordinate
        3, -- y coordinate
        (G.consumeables.T.w), -- width (this is the default for G.jokers)
        game.CARD_H * 0.95, -- height (this is the default for G.jokers)
        {
            -- optional, but recommended configs:
            card_limit = 3, -- card limit, doesn't actually affect the area unless checked manually
            type = 'joker', -- area type, doesn't affect what type of cards can be in it, only how they're displayed and act
            -- values can be `title`, `title_2`, `joker`, `shop`, `deck`, `hand`, `consumeable`, `voucher`, `play`, `discard`
            highlight_limit = 2,
            -- optional:
            no_card_count = false, -- removes the card count ui for the area types that have it by default
            align_buttons = true, -- aligns the buttons for cards like in the Joker/Consumable areas
        }
    )
end

