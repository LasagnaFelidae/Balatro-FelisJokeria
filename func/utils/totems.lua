--[[
Lookup tribe object by tribe key.

Parameters:
  tribe_key (string): required key of the tribe.

Returns:
  table|nil: tribe data if found, otherwise nil.
]]--
FELIJO.indexTribe = function(tribe_key)
    if not tribe_key then return nil end

    for _, data in ipairs(FELIJO.tribe_table) do
        if data.key == tribe_key then
            return data
        end
    end

    return nil
end

--[[
Lookup totem sigil object by sigil key.

Parameters:
  sigil_key (string): required key of the totem sigil.

Returns:
  table|nil: sigil data if found, otherwise nil.
]]--
FELIJO.indexTotemSigil = function(sigil_key)
    if not sigil_key then return nil end

    for _, data in ipairs(FELIJO.totem_sigil_table) do
        if data.key == sigil_key then
            return data
        end
    end

    return nil
end

--[[
Get tribe key from a totem key.

Parameters:
  totem_key (string): required totem key to look up.

Returns:
  string|nil: the matching tribe key or nil if not found.
]]--
FELIJO.getTribefromTotem = function(totem_key)
    if not totem_key then return nil end

    for _, data in ipairs(FELIJO.tribe_table) do
        if data.totem_key == totem_key then
            return data.key
        end
    end

    return nil
end

--[[
Get sigil key from a totem key.

Parameters:
  totem_key (string): required totem key to look up.

Returns:
  string|nil: the matching sigil key or nil if not found.
]]--
FELIJO.getSigilfromTotem = function(totem_key)
    if not totem_key then return nil end

    for _, data in ipairs(FELIJO.totem_sigil_table) do
        if data.totem_key == totem_key then
            return data.key
        end
    end

    return nil
end

--[[
Remove all totem sigils from all jokers.

No parameters.
]]--
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

--[[
Apply totem sigils to jokers based on tribe and card pools.

Valid tribes:
  "Avian", "Canine", "Feline", "Hooved", "Insect", "Reptile", "Vermin",
  "Object", "Other", "Human", "Banana", "Printer", "All"

Parameters:
  totem_body (table): required totem body card containing ability.totem_sigil.
  tribe (string): required tribe to apply.
]]--
FELIJO.applyTotemSigils = function(totem_body, tribe)
    totem_body = totem_body or FELIJO.active_totem
    tribe = tribe or (totem_body and totem_body.ability.totem_tribe)
    
    if not totem_body or not tribe or not totem_body.ability.totem_sigil then
        return
    end
    if not G.jokers or not G.jokers.cards then
        return
    end

    local sigil_key = totem_body.ability.totem_sigil
    local applied = false

    for _, card in ipairs(G.jokers.cards) do
        if card.ability and card.ability.sigil_key then
            goto continue
        end

        local tribes = FELIJO.getCardTribe(card)

        if tribes and type(tribes) ~= "table" then
            tribes = {tribes}
        elseif not tribes then
            return
        end

        local flag = false

        for _, t in ipairs(tribes) do
            if t == tribe or t == "All" then
                flag = true
                break
            end
        end

        if flag then
            card:add_sticker(sigil_key, true)
            applied = true
        end

        ::continue::
    end

    if applied then
        play_sound("felijo_totem_activate", 1)
    end
end

--[[
Grab tribe keys for a card.

Valid tribes:
  "Avian", "Canine", "Feline", "Hooved", "Insect", "Reptile", "Vermin",
  "Object", "Other", "Human", "Banana", "Printer", "All"

Parameters:
  card: required card to check for tribe keys. Should have config.center

Returns:
    table: list of tribe keys that apply to the card, or {"Other"} if none found.
]]--
FELIJO.getCardTribe = function(card)
    if not card or not card.config or not card.config.center then
        return nil
    end

    local tribes = {}

    -- Menthol XMOD
    if card.ability and card.ability.minty_cat_ears then
        table.insert(tribes, "Feline")
    end

    -- Revo XMOD
    if FELIJO.is_mod_loaded("RevosVault") then
        if card.config.center.pools and card.config.center.pools["BananaPool"] then
            table.insert(tribes, "Banana")
        end
        if card.config.center.rarity == "crv_p" then
            table.insert(tribes, "Printer")
        end
    end

    -- JoyousSpring XMOD
    if JoyousSpring and JoyousSpring.is_monster_card(card) then
        local js = card.ability.extra.joyous_spring
        if js.is_all_types then
            table.insert(tribes, "All")
        elseif FELIJO.JoyousTribes then
            for tribe_name, type_table in pairs(FELIJO.JoyousTribes) do
                if type_table[js.monster_type] then
                    table.insert(tribes, tribe_name)
                end
            end
        end
    end

    -- XMOD Pool Aliases
    local pools = card.config.center.pools
    if pools and FELIJO.PoolTribes then
        for tribe_name, pool_list in pairs(FELIJO.PoolTribes) do
            for _, pool_name in ipairs(pool_list) do
                if pools[pool_name] then
                    table.insert(tribes, tribe_name)
                    break  
                end
            end
        end
    end

    -- Base Felijo Tribes
    if pools then
        for tribe_name, _ in pairs(FELIJO.PoolTribes or {}) do
            if pools[tribe_name] then
                table.insert(tribes, tribe_name)
            end
        end
    end

    -- Default to "Other" if no tribes found
    if #tribes == 0 then
        table.insert(tribes, "Other")
    end

    return tribes
end