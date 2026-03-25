if CardSleeves then
    CardSleeves.Sleeve {
        key = "ttm_deck",
        atlas = "insSleeves",
        pos = { x = 0, y = 0 },
        config = { felijo_totems_enabled = true},
        loc_vars = function (self, info_queue, card)
            local key = self.key
            if self.get_current_deck_key() == "b_felijo_ttm_deck" then
                key = self.key .. "_alt"
            end
            return {
                key = key
            }
        end,
        apply = function(self, sleeve)
            if (sleeve.config.felijo_totems_enabled) then
                G.GAME.felijo_totems_enabled = sleeve.config.felijo_totems_enabled
            end
            if self.get_current_deck_key() == "b_felijo_ttm_deck" then
                G.felijo_totems.config.card_limit = G.felijo_totems.config.card_limit + 1
            end
            CardSleeves.Sleeve.apply(sleeve)
        end
    }
end