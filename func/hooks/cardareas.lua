local CardAreaold = CardArea.emplace
function CardArea:emplace(card, location, stay_flipped)
    if self == G.consumeables and (card.ability.set == "felijo_totem_parts") then
        G.felijo_totems:emplace(card, location, stay_flipped)
        return
    end

    CardAreaold(self, card, location, stay_flipped)
end

local check_for_buy_space_old = G.FUNCS.check_for_buy_space
G.FUNCS.check_for_buy_space = function(card)
	if card.ability.is_totem_body then
		if (#G.felijo_totems.cards < G.felijo_totems.config.card_limit) then
			return true
		else
			alert_no_space(card, G.felijo_totems)
			return false
		end
    elseif card.ability.is_totem_head then
		if (#G.felijo_totems.cards < G.felijo_totems.config.card_limit + 2) then
			return true
		else
			alert_no_space(card, G.felijo_totems)
			return false
		end
	end

    return check_for_buy_space_old(card)
end