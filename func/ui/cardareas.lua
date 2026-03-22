


SMODS.current_mod.custom_card_areas = function(game) -- game is the same as G
    game.felijo_totems = CardArea( -- Should be saved in G for it to be preserved between reloads
        G.consumeables.T.x, -- x coordinate
        G.consumeables.T.y + 3, -- y coordinate
        G.consumeables.T.w, -- width (this is the default for G.jokers)
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
    
    --FELIJO.states.slot_visible = 1
    --FELIJO.animate_areas()
end

--[[
G.FUNCS.toggle_totems = function(e)
    if not G.PROFILES[G.SETTINGS.profile].stocking_stuffer_completed then
        G.PROFILES[G.SETTINGS.profile].stocking_stuffer_completed = true
        local sprite = SMODS.create_sprite(0, 0, 3 * (231 / 117), 3, 'stocking_logo', { x = 0, y = 0 })
        PotatoPatchUtils.INFO_MENU.create_menu { menu_type = 'stocking_stuffer', outline_colour = G.C.RED, colour = HEX("22A617"), page_colour = HEX("22A617"), no_first_time = true, image = sprite, vars = { FELIJO.Developers.internal_count } }
    end
    FELIJO.states.slot_visible = FELIJO.states.slot_visible * -1
    play_sound('paper1')
    FELIJO.animate_areas()
end

G.FUNCS.can_toggle_presents = function(e)
    if G.STATE ~= G.STATES.HAND_PLAYED and G.STATE ~= G.STATES.DRAW_TO_HAND and G.STATE ~= G.STATES.PLAY_TAROT and not FELIJO.states.areas_moving then
        e.config.colour = G.C.RED
        e.config.button = 'toggle_jokers_presents'
    else
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        e.config.button = nil
    end
end

local should_handle = SMODS.should_handle_limit
function SMODS.should_handle_limit(area)
    return area.config.type == "stocking_stuffer_hide" or should_handle(area)
end

-- Area toggle helpers
function FELIJO.animate_areas()
    FELIJO.states.areas_moving = true
    if FELIJO.states.slot_visible == -1 then
        ease_alignment('consumeables', -4, true, FELIJO.config.animate_areas == 2)
        ease_alignment('felijo_totems', 0, nil, FELIJO.config.animate_areas == 2)
    else
        ease_alignment('felijo_totems', -4, true, FELIJO.config.animate_areas == 2)
        ease_alignment('jokers', 0, nil, FELIJO.config.animate_areas == 2)
    end
    G.E_MANAGER:add_event(Event({
        func = function()
            FELIJO.states.areas_moving = false
            return true;
        end
    }))
end

-- Consumeables/Totem Area Easing
function ease_alignment(area, value, hide, instant)
    if not G[area] then return end
    if instant then
        G.E_MANAGER:add_event(Event({
            trigger = 'immediate',
            blocking = true,
            blockable = false,
            func = function()
                G[area].T.y = value
                G[area].VT.y = value
                G[area].config.type = hide and 'totems_hide' or 'joker'
                return true;
            end
        }))
    else
        if not hide then
            G[area].VT.y = -4
            G[area].T.y = -4
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
            ref_value = 'y',
            ease_to = value,
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
                    G[area].T.y = 0
                    return true
                end
            }))
        end
    end
end


]]