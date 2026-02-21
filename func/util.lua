FELIJO.is_mod_loaded = function(var) 
    if not var then return false end
    return (SMODS.Mods[var] and SMODS.Mods[var].can_load) and true or false
end



-- thanks aiko