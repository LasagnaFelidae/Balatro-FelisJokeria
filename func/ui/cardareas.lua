
FELIJO.states = {}
SMODS.current_mod.custom_card_areas = function(game) -- game is the same as G
    game.felijo_totems = CardArea( -- Should be saved in G for it to be preserved between reloads
        G.jokers.T.x , -- x coordinate
        (G.jokers.T.y) - 4, -- y coordinate SET TO G.JOKERS.T.Y - 4 WHEN DONE
        G.jokers.T.w, -- width (this is the default for G.jokers)
        game.CARD_H * 0.95, -- height (this is the default for G.jokers)
        {
            -- optional, but recommended configs:
            card_limit = 6, -- card limit, doesn't actually affect the area unless checked manually
            type = 'joker', -- area type, doesn't affect what type of cards can be in it, only how they're displayed and act
            -- values can be `title`, `title_2`, `joker`, `shop`, `deck`, `hand`, `consumeable`, `voucher`, `play`, `discard`
            highlight_limit = 2,
            -- optional:
            no_card_count = false, -- removes the card count ui for the area types that have it by default
            align_buttons = true, -- aligns the buttons for cards like in the Joker/Consumable areas
        }
    )
    FELIJO.states.slot_visible = 1
    FELIJO.animate_areas()
end

G.FUNCS.toggle_totems = function(e)
    FELIJO.states.slot_visible = FELIJO.states.slot_visible * -1
    play_sound('paper1')
    FELIJO.animate_areas()
end

G.FUNCS.felijo_can_toggle_totem = function(e)
    if G.STATE ~= G.STATES.HAND_PLAYED and G.STATE ~= G.STATES.DRAW_TO_HAND and G.STATE ~= G.STATES.PLAY_TAROT and not FELIJO.states.areas_moving then
        e.config.colour = G.ARGS.LOC_COLOURS.felijo_ttm
        e.config.button = 'toggle_totems'
    else
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        e.config.button = nil
    end
end

-- Area toggle helpers
function FELIJO.animate_areas(animate)
    FELIJO.states.areas_moving = true
    if FELIJO.states.slot_visible == -1 then
        ease_alignment('jokers', 0, -4, true, animate)
        ease_alignment('felijo_totems', -4, 0, nil, animate)
    else
        ease_alignment('felijo_totems', 0, -4, true, animate)
        ease_alignment('jokers', -4, 0, nil, animate)
    end
    G.E_MANAGER:add_event(Event({
        func = function()
            FELIJO.states.areas_moving = false
            return true;
        end
    }))
end

-- Consumeables/Totem Area Easing
function ease_alignment(area, value_o, value_t, hide, instant, type)
    type = type or 'y'
    if not G[area] then return end
    if instant then
        G.E_MANAGER:add_event(Event({
            trigger = 'immediate',
            blocking = true,
            blockable = false,
            func = function()
                G[area].T[type] = value_t
                G[area].VT[type] = value_t
                G[area].config.type = hide and 'totems_hide' or 'joker'
                return true;
            end
        }))
    else
        if not hide then
            G[area].VT[type] = value_o
            G[area].T[type] = value_o
            G.E_MANAGER:add_event(Event({
                trigger = 'immediate',
                blocking = true,
                blockable = false,
                func = function()
                    G[area].config.type = 'joker'
                    return true
                end
            }))
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'ease',
            delay = 0.7,
            blocking = false,
            blockable = false,
            ref_table = G[area].T,
            ref_value = type,
            ease_to = value_t,
            func = (function(t) return t end)
        }))
        if hide then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.7,
                blocking = true,
                blockable = false,
                func = function()
                    G[area].config.type = 'totems_hide'
                    G[area].T[type] = value_t
                    return true
                end
            }))
        end
    end
end
