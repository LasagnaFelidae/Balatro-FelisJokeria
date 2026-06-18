SMODS.Achievement{
    key = "j_o_permit",
    hidden_name = false,
    hidden_text = false,
    bypass_all_unlocked = true,
    unlock_condition = function (self, args)
        if args and (args.type == "akyrs_spell_word" and FELIJO.lexicographer_slurs[args.lowercase_word]) then
            return true
        end
    end
}
SMODS.Achievement{
    key = "red_letter",
    hidden_name = false,
    hidden_text = false,
    bypass_all_unlocked = true,
    unlock_condition = function (self, args)
        if args and (args.type == "win") then
            if next(SMODS.find_card("j_felijo_akyrs_lexicographer")) then
                return true
            end
        end
    end
}