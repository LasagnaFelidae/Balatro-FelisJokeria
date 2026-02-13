SMODS.Voucher {
    key = "beartrap",
    atlas = 'inscryptionVouchers', pos = { x = 0, y = 0 } ,
    cost = 10,
    config = {},
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
    atlas = 'inscryptionVouchers', pos = { x = 0, y = 1 } ,
	requires = { 'v_felijo_beartrap' },
    cost = 10,
    config = {},
    loc_vars = function (self, info_queue, card)
        return {}
    end,
    redeem = function (self, card) 
        G.GAME.felijo_pelts_sale  = true
    end,
    unredeem = function (self, card) 
        G.GAME.felijo_pelts_sale  = false
    end,
}