SMODS.Voucher {
    key = "beartrap",
    atlas = 'insVouchers', pos = { x = 0, y = 0 } ,
    cost = 10,
    config = { },
    loc_vars = function (self, info_queue, card)
        return {}
    end,
    redeem = function (self, card) 
        G.GAME.felijo_pelts_enabled  = true
    end,
    unredeem = function (self, card) 
        G.GAME.felijo_pelts_enabled  = false
    end,
}
SMODS.Voucher {
    key = "peltmarket",
    atlas = 'insVouchers', pos = { x = 0, y = 1 } ,
	requires = {'v_felijo_beartrap'},
    cost = 10,
    config = {extra = { peltchance = 2 }},
	
	in_pool = function(self,args)
		return (G.GAME.felijo_pelts_enabled or next(SMODS.find_card("v_felijo_beartrap"))) or false
	end,
		
    loc_vars = function (self, info_queue, card)
        return {vars = {card.ability.extra.peltchance}}
    end,
    redeem = function (self, card) 
		G.GAME.felijo_peltchance = (G.GAME.felijo_peltchance or 1)*(card and card.ability.extra or self.config.extra).peltchance
        G.GAME.felijo_pelts_sale  = true
    end,
    unredeem = function (self, args) 
        G.GAME.felijo_pelts_sale  = false
    end,
}
SMODS.Voucher {
    key = "totemmerchant",
    atlas = 'insVouchers', pos = { x = 1, y = 0 } ,
    cost = 10,
    config = { },
    loc_vars = function (self, info_queue, card)
        return {}
    end,
    redeem = function(self)
		G.E_MANAGER:add_event(Event({
			func = function()
				G.GAME.felijo_totem_parts_rate = (G.GAME.felijo_totem_parts_rate or 0) + 4
                G.GAME.felijo_totems_enabled = true
				return true
			end,
		}))
	end,
	unredeem = function(self)
		G.E_MANAGER:add_event(Event({
			func = function()
				G.GAME.felijo_totem_parts_rate = math.max(0, G.GAME.felijo_totem_parts_rate - 4)
				return true
			end,
		}))
	end,
}
SMODS.Voucher {
    key = "totemtycoon",
    atlas = 'insVouchers', pos = { x = 1, y = 1 } ,
    cost = 10,
    unlocked = false,
    config = { },
    loc_vars = function (self, info_queue, card)
        return {}
    end,
    requires = { 'v_felijo_totemmerchant' },
    check_for_unlock = function(self, args)
        return args.type == 'win_deck' and get_deck_win_stake('b_felijo_ttm_deck') and true
    end,
    redeem = function(self)
		G.E_MANAGER:add_event(Event({
			func = function()
				G.GAME.felijo_totem_parts_rate = (G.GAME.felijo_totem_parts_rate or 0) + 4
                G.GAME.felijo_totems_enabled = true
				return true
			end,
		}))
	end,
	unredeem = function(self)
		G.E_MANAGER:add_event(Event({
			func = function()
				G.GAME.felijo_totem_parts_rate = math.max(0, G.GAME.felijo_totem_parts_rate - 4)
                return true
			end,
		}))
	end,
}