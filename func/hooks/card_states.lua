local old_set_debuff = Card.set_debuff
function Card:set_debuff(should_debuff)
    old_set_debuff(self, should_debuff)

    if self.ability.felijo_sgl_repulsive or self.ability.felijo_ttm_sgl_repulsive then
        self.debuff = false
        self.perma_debuff = false
    end


end

local orig_card_drag = Card.drag
function Card:drag()
    if self.area and self.area == G.jokers then
        SMODS.calculate_context({dragging = true, drag_target = self})
    end
    local ret = orig_card_drag(self)
    return ret
end


local cardSetCostHook = Card.set_cost
function Card:set_cost()
    local ret = cardSetCostHook(self)
    if self.ability.felijo_copied then
        self.cost = 1
        self.sell_cost = 1
    end
    return ret
end


