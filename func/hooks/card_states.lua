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

local old_addtodeck = Card.add_to_deck
function Card:add_to_deck(from_debuff)
    if FELIJO.active_totem and self.ability.set == "Joker" then
        for _, _c in ipairs(G.felijo_totems.cards) do
		    if _c.ability.totem_active then
                G.E_MANAGER:add_event(Event({
                    func = function() 
                        FELIJO.applyTotemSigils(_c, _c.ability.totem_tribe)
                        return true
                    end
			    }))
            end
	    end
        
    end
    local ret = old_addtodeck(self, from_debuff)
    return ret
end


local cardSetCostHook = Card.set_cost
function Card:set_cost()
    local ret = cardSetCostHook(self)
    if self.ability.felijo_copied then
        self.cost = 1
        self.sell_cost = 0
    end
    return ret
end


