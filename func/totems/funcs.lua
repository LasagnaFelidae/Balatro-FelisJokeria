FELIJO.indexTribe = function(tribe_key)
    if not tribe_key then return nil end

    for _, data in ipairs(FELIJO.tribe_table) do
        if data.key == tribe_key then
            return data
        end
    end

    return nil
end

FELIJO.indexTotemSigil = function(sigil_key)
    if not sigil_key then return nil end

    for _, data in ipairs(FELIJO.totem_sigil_table) do
        if data.key == sigil_key then
            return data
        end
    end

    return nil
end

FELIJO.getTribefromTotem = function(totem_key)
    if not totem_key then return nil end

    for _, data in ipairs(FELIJO.tribe_table) do
        if data.totem_key == totem_key then
            return data.key
        end
    end

    return nil
end

FELIJO.getSigilfromTotem = function(totem_key)
    if not totem_key then return nil end

    for _, data in ipairs(FELIJO.totem_sigil_table) do
        if data.totem_key == totem_key then
            return data.key
        end
    end

    return nil
end

FELIJO.removeTotemSigils = function()
    if not G.jokers or not G.jokers.cards then return end
    for _, card in ipairs(G.jokers.cards) do
        if card.ability then
            for _, sigil_data in ipairs(FELIJO.totem_sigil_table) do
                local sticker_key = sigil_data.key
                if card.ability[sticker_key] then
                    card:remove_sticker(sticker_key, true)
                end
            end
        end
    end
end

FELIJO.applyTotemSigils = function(totem_body, tribe)
    if not totem_body then return end
    if not totem_body.ability.totem_sigil then return end
    if not G.jokers or not G.jokers.cards then return end

    local sigil_key = totem_body.ability.totem_sigil
	local applied = false
    for _, card in ipairs(G.jokers.cards) do
        

        if card.ability and card.config and card.config.center and card.config.center.pools then
            if card.config.center.pools[tribe] and not card.ability.sigil_key then
                card:add_sticker(sigil_key, true)
                applied = true
            elseif tribe == "Feline" and (card.config.center.pools["Kitty"] or card.config.center.pools["Cat"]) then
				card:add_sticker(sigil_key, true)
                applied = true
			elseif tribe == "Canine" and (card.config.center.pools["Dog"] or card.config.center.pools["Puppy"]) then
				card:add_sticker(sigil_key, true)
                applied = true
			elseif tribe == "Avian" and (card.config.center.pools["Birb"] or card.config.center.pools["Bird"]) then
				card:add_sticker(sigil_key, true)
                applied = true
			elseif tribe == "Human" and (card.config.center.pools["Humanoid"]) then
				card:add_sticker(sigil_key, true)
                applied = true
			elseif tribe == "Other" and (card.config.center.pools["Food"]) then
				card:add_sticker(sigil_key, true)
                applied = true
			elseif tribe == "Object" and (card.config.center.pools["Meme"]) then
				card:add_sticker(sigil_key, true)
                applied = true
			end
        end
    end
	if applied then
        play_sound("felijo_totem_activate",1)
    end
end