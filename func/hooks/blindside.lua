if FELIJO.is_mod_loaded("Blindside") then
    ---@alias hue "Red" | "Green" | "Blue" | "Yellow" | "Purple" | "Faded"
    FELIJO.BlindsideBlind = SMODS.Enhancement:extend {
        in_pool = function(self)
            if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return false end
                if self.pool_check then
                    return self:pool_check()
                end
                return true
            else
                return false
            end
        end,
        replace_base_card = true,
        no_rank = true,
        no_suit = true,
        overrides_base_rank = true,
        blind_debuff = function(card, external)
            if not (external and card.seal == 'bld_wild') then
                if card.facing ~= 'back' then 
                    card:flip()
                end
                card:set_debuff(true)
            end
        end,
        set_badges = function(self, card, badges)
            if card.config.center.weight == 67 then
                badges[#badges+1] = create_badge(localize('k_bld_curse'), G.C.BLACK, G.C.WHITE, 1 )
            elseif card.config.center.weight == 99 then
                badges[#badges+1] = create_badge(localize('k_bld_legendary'), G.C.PURPLE, G.C.WHITE, 1 )
            elseif card.config.center.weight == 33 then
                badges[#badges+1] = create_badge(localize('k_bld_basic'), G.C.BLUE, G.C.WHITE, 1 )
            elseif card.config.center.weight == 5 then
                badges[#badges+1] = create_badge(localize('k_bld_common'), G.C.MONEY, G.C.WHITE, 1 )
            elseif card.config.center.weight == 3 then
                badges[#badges+1] = create_badge(localize('k_bld_rare'), G.C.RED, G.C.WHITE, 1 )
            else
                badges[#badges+1] = create_badge(localize('k_bld_common'), G.C.GREEN, G.C.WHITE, 1 )
            end
            badges[#badges+1] = create_badge(localize('k_felijo_bs'), HEX('3F6AA4'), HEX('ffffff'), 1 )
        end,
        blindside_blind = true,
    }
end