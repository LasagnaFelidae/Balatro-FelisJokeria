SMODS.Back{
    key = "ttm_deck",
    atlas = "insBacks",
    pos = { x = 0, y = 0},
    config = { felijo_totems_enabled = true, voucher = "v_felijo_totemmerchant"},
    set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_ins'), HEX('7f1232'), HEX('f2a655'), 1 )
	end,
    loc_vars = function (self, info_queue, card)
    end,
}