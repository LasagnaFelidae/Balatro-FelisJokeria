local G_UIDEF_use_and_sell_buttons_ref = G.UIDEF.use_and_sell_buttons

function G.UIDEF.use_and_sell_buttons(card)
    local base = G_UIDEF_use_and_sell_buttons_ref(card)

    if card.config.center.key == "j_felijo_stock_exchange" then
		if not card or not card.ability or not card.ability.stock then return end
        local stock = card.ability.stock
        local names = card.ability.stock.names or {"LTHNK","JIMBO","SPCTL","STRHT"}

        -- Vanilla sell button on top
        local sell= {
            n = G.UIT.C,
            config = { align = "cr" },
            nodes = {
                {
                    n = G.UIT.C,
                    config = {
                        ref_table = card,
                        align = "cr",
                        padding = 0.1,
                        r = 0.08,
                        minw = 1.25,
                        hover = true,
                        shadow = true,
                        colour = G.C.UI.BACKGROUND_INACTIVE,
                        one_press = true,
                        button = "sell_card",
                        func = "can_sell_card",
                        handy_insta_action = "sell",
                    },
                    nodes = {
                        { n = G.UIT.B, config = { w = 0.1, h = 0.6 } },
                        {
                            n = G.UIT.C,
                            config = { align = "tm" },
                            nodes = {
                                {
                                    n = G.UIT.R,
                                    config = { align = "cm", maxw = 1.25 },
                                    nodes = {
                                        {
                                            n = G.UIT.T,
                                            config = {
                                                text = localize("b_sell"),
                                                colour = G.C.UI.TEXT_LIGHT,
                                                scale = 0.4,
                                                shadow = true,
                                            },
                                        },
                                    },
                                },
                                {
                                    n = G.UIT.R,
                                    config = { align = "cm" },
                                    nodes = {
                                        {
                                            n = G.UIT.T,
                                            config = {
                                                text = localize("$"),
                                                colour = G.C.WHITE,
                                                scale = 0.4,
                                                shadow = true,
                                            },
                                        },
                                        {
                                            n = G.UIT.T,
                                            config = {
                                                ref_table = card,
                                                ref_value = "sell_cost_label",
                                                colour = G.C.WHITE,
                                                scale = 0.55,
                                                shadow = true,
                                            },
                                        },
                                    },
                                },
                            },
                        },
                    },
                },
            },
        }

        local function wrapStockButton(name, card, button_name, func_name, color)
            return {
                n = G.UIT.C,
                config = {
                    ref_table = card,
                    padding = 0.05,
                    r = 0.08,
                    minw = 1.2,
                    hover = true,
                    shadow = true,
                    colour = color,
                    button = button_name,
                    func = func_name,
                    align = "cl"
                },
                nodes = {
                    { 
					n = G.UIT.T, 
					config = { 
						text = name, 
						align = "cr", 
						colour = G.C.UI.TEXT_LIGHT, 
						scale = 0.4, 
						shadow = true 
						} 
					}
                }
            }
        end

        -- Build buy row (all 4 buttons in one horizontal container)
        local buy_buttons = {}
        for i = 1, 4 do
            table.insert(buy_buttons, wrapStockButton("BUY  "..names[i], card, "buy_stock_"..i, "can_buy_stock_"..i, G.C.UI.BACKGROUND_INACTIVE))
        end
        local buy_row = { n = G.UIT.C, config = { spacing = 0.05 }, nodes = buy_buttons }

        -- Build sell row (all 4 buttons in one horizontal container)
        local sell_buttons = {}
        for i = 1, 4 do
            table.insert(sell_buttons, wrapStockButton("SELL "..names[i], card, "sell_stock_"..i, "can_sell_stock_"..i, G.C.UI.BACKGROUND_INACTIVE))
        end
        local sell_row = { n = G.UIT.C, config = { spacing = 0.05 }, nodes = sell_buttons }

        -- Cycle button row
        local cycle_button = wrapStockButton("x"..stock.mode[stock.mode_i], card, "cycle", nil, G.C.SUITS.Diamonds)
        local cycle_row = { n = G.UIT.C, config = { align = "cr" }, nodes = { cycle_button } }

        return {
            n = G.UIT.ROOT,
            config = { padding = 0, colour = G.C.CLEAR },
            nodes = {
                {
                    n = G.UIT.C,
                    config = { padding = 0, align = "cl" },
                    nodes = {
                        { n = G.UIT.R, config = { align = "cl" }, nodes = {
                            sell,
                        } },
                    },
                },
                {
                    n = G.UIT.C,
                    config = { padding = 0, align = "cl" },
                    nodes = {
                        { 
							n = G.UIT.R, 
							config = { align = "cr" }, 
							nodes = {
								buy_row,
							}
						},
                        {
                            n = G.UIT.R,
                            config = { align = "cr" },
                            nodes = {
                                sell_row,
                            },
                        },
						{
                            n = G.UIT.R,
                            config = { align = "cr" },
                            nodes = {
                                cycle_row,
                            },
                        },
                    }
                },
            },
        }
    end

    return base
end





for i = 1,4 do
    G.FUNCS["buy_stock_"..i] = function(e)
        e.config.ref_table.config.center:buyStock(e.config.ref_table, i)
    end
end

for i = 1, 4 do
    G.FUNCS["can_buy_stock_"..i] = function(e)
        local card = e.config.ref_table
        if not card or not card.ability or not card.ability.stock then
            e.config.colour = G.C.UI.BACKGROUND_INACTIVE
            e.config.button = nil
            return
        end

        local s = card.ability.stock
        local price = s.price[i]

        if not price or price <= 0 then
            e.config.colour = G.C.UI.BACKGROUND_INACTIVE
            e.config.button = nil
            return
        end

        local bankrupt_at = G.GAME.bankrupt_at or 0
        local max_affordable = math.floor((G.GAME.dollars - bankrupt_at) / price)

        if max_affordable <= 0 then
            e.config.colour = G.C.UI.BACKGROUND_INACTIVE
            e.config.button = nil
            return
        end

        local mode_value = s.mode[s.mode_i]
        local qty = mode_value == "ALL" and max_affordable or mode_value

        if qty <= max_affordable then
            e.config.colour = G.C.GREEN
            e.config.button = "buy_stock_"..i
        else
            e.config.colour = G.C.UI.BACKGROUND_INACTIVE
            e.config.button = nil
        end
    end
end


for i = 1,4 do
    G.FUNCS["sell_stock_"..i] = function(e)
        e.config.ref_table.config.center:sellStock(e.config.ref_table, i)
    end
end

for i = 1, 4 do
    G.FUNCS["can_sell_stock_"..i] = function(e)
        local card = e.config.ref_table
        if not card or not card.ability or not card.ability.stock then
            e.config.colour = G.C.UI.BACKGROUND_INACTIVE
            e.config.button = nil
            return
        end

        local s = card.ability.stock
        local owned = s.stock[i]
        local price = s.price[i]

        if not owned or owned <= 0 or not price or price <= 0 then
            e.config.colour = G.C.UI.BACKGROUND_INACTIVE
            e.config.button = nil
            return
        end

        local mode_value = s.mode[s.mode_i]
        local qty = mode_value == "ALL" and owned or mode_value

        if owned >= qty and qty > 0 then
            e.config.colour = G.C.RED
            e.config.button = "sell_stock_"..i
        else
            e.config.colour = G.C.UI.BACKGROUND_INACTIVE
            e.config.button = nil
        end
    end
end


G.FUNCS.cycle = function(e)
    local card = e.config.ref_table
    if not card or not card.ability or not card.ability.stock then return end

    local s = card.ability.stock
    s.mode_i = s.mode_i % #s.mode + 1
    card:juice_up()
end

SMODS.Joker {
    atlas = 'placeholder',
    pos = { x = 0, y = 0 },
    pools = {["FelisJokeria"] = true, ["Money"] = true },
    key = "felijo_stock_exchange",
    rarity = 2,
    cost = 6,
	blueprint_compat = true,
    config = 
		{ 
		extra = 
		{ 
			chips = 10 
		},
		stock = 
		{ 
			names = {"LTHNK","JIMBO","SPCTL","JOKER"}, 
			stock = {0,0,0,0}, 
			price = {2,3,5,8}, 
			mode = {1, 5, 10, "ALL"}, mode_i = 1, 
			volatility = {0.5, 0.2, 0.6, 0.8}, 
			trend = {0.01, 0.05, 0, 0.02}, 
			colours = {G.C.UI.TEXT_INACTIVE,G.C.UI.TEXT_INACTIVE,G.C.UI.TEXT_INACTIVE,G.C.UI.TEXT_INACTIVE}, 
			indicators = {"","","",""}, 
			change_p = {0,0,0,0},
		},  
	},
    loc_vars = function(self, info_queue, center)
			if center.ability.stock.mode[center.ability.stock.mode_i] == "ALL" then
			return { vars = {
				center.ability.stock.names[1], center.ability.stock.stock[1], center.ability.stock.price[1],center.ability.stock.stock[1] * center.ability.stock.price[1],
				center.ability.stock.names[2], center.ability.stock.stock[2], center.ability.stock.price[2],center.ability.stock.stock[1] * center.ability.stock.price[2],
				center.ability.stock.names[3], center.ability.stock.stock[3], center.ability.stock.price[3],center.ability.stock.stock[1] * center.ability.stock.price[3],
				center.ability.stock.names[4], center.ability.stock.stock[4], center.ability.stock.price[4],center.ability.stock.stock[1] * center.ability.stock.price[4],
				center.ability.stock.mode[center.ability.stock.mode_i], 
				center.ability.stock.indicators[1],
				center.ability.stock.indicators[2],
				center.ability.stock.indicators[3],
				center.ability.stock.indicators[4],
				(#SMODS.find_card("j_oops") or 0) * 0.02,
				(G.GAME.round or 0) * 0.12,
				0.02,
				0.12,
				center.ability.stock.price[1] * math.floor((G.GAME.dollars - G.GAME.bankrupt_at) / center.ability.stock.price[1]),
				center.ability.stock.price[2] * math.floor((G.GAME.dollars - G.GAME.bankrupt_at) / center.ability.stock.price[2]),
				center.ability.stock.price[3] * math.floor((G.GAME.dollars - G.GAME.bankrupt_at) / center.ability.stock.price[3]),
				center.ability.stock.price[4] * math.floor((G.GAME.dollars - G.GAME.bankrupt_at) / center.ability.stock.price[4]),
				
				center.ability.stock.change_p[1],
				center.ability.stock.change_p[2],
				center.ability.stock.change_p[3],
				center.ability.stock.change_p[4],
				colours = {
					center.ability.stock.colours[1], 
					center.ability.stock.colours[2], 
					center.ability.stock.colours[3], 
					center.ability.stock.colours[4]
					},
			}}
			else
			return { vars = {
				center.ability.stock.names[1], center.ability.stock.stock[1], center.ability.stock.price[1],center.ability.stock.stock[1] * center.ability.stock.price[1],
				center.ability.stock.names[2], center.ability.stock.stock[2], center.ability.stock.price[2],center.ability.stock.stock[2] * center.ability.stock.price[2],
				center.ability.stock.names[3], center.ability.stock.stock[3], center.ability.stock.price[3],center.ability.stock.stock[3] * center.ability.stock.price[3],
				center.ability.stock.names[4], center.ability.stock.stock[4], center.ability.stock.price[4],center.ability.stock.stock[4] * center.ability.stock.price[4],
				center.ability.stock.mode[center.ability.stock.mode_i], 
				center.ability.stock.indicators[1], 
				center.ability.stock.indicators[2], 
				center.ability.stock.indicators[3], 
				center.ability.stock.indicators[4], 
				(#SMODS.find_card("j_oops") or 0) * 0.02,
				(G.GAME.round or 0) * 0.12,
				0.02,
				0.12,
				center.ability.stock.price[1] * center.ability.stock.mode[center.ability.stock.mode_i],
				center.ability.stock.price[2] * center.ability.stock.mode[center.ability.stock.mode_i],
				center.ability.stock.price[3] * center.ability.stock.mode[center.ability.stock.mode_i],
				center.ability.stock.price[4] * center.ability.stock.mode[center.ability.stock.mode_i],
				
				center.ability.stock.change_p[1],
				center.ability.stock.change_p[2],
				center.ability.stock.change_p[3],
				center.ability.stock.change_p[4],
				colours = {
					center.ability.stock.colours[1], 
					center.ability.stock.colours[2], 
					center.ability.stock.colours[3],
					center.ability.stock.colours[4]
					},
			}}
			end
    end,
	
	createBuy = function (self, card, i)
		return {
			n = G.UIT.C,
			config = {
				ref_table = card,
				padding = 0.1,
				r = 0.08,
				minw = 1.2,
				hover = true,
				shadow = true,
				colour = G.C.UI.BACKGROUND_INACTIVE,
				button = "buy_stock_"..i,
				func = "can_buy_stock_"..i,
			},
			nodes = {
				{
					n = G.UIT.T,
					config = {
						text = "BUY "..i,
						colour = G.C.UI.TEXT_LIGHT,
						scale = 0.4,
						shadow = true,
					}
				}
			}
		}
	end,
	createSell = function (self, card, i)
		return {
			n = G.UIT.C,
			config = {
				ref_table = card,
				padding = 0.1,
				r = 0.08,
				minw = 1.2,
				hover = true,
				shadow = true,
				colour = G.C.UI.BACKGROUND_INACTIVE,
				button = "sell_stock_"..i,
				func = "can_sell_stock_"..i,
			},
			nodes = {
				{
					n = G.UIT.T,
					config = {
						text = "SELL"..i,
						colour = G.C.UI.TEXT_LIGHT,
						scale = 0.4,
						shadow = true,
					}
				}
			}
		}
	end,
	createCycle = function (self, card)
		local s = card.ability.stock
		return {
			n = G.UIT.C,
			config = {
				ref_table = card,
				padding = 0.1,
				r = 0.08,
				minw = 1.2,
				hover = true,
				shadow = true,
				colour = G.C.ORANGE,
				button = "cycle",
			},
			nodes = {
				{
					n = G.UIT.T,
					config = {
						text = "x"..s.mode[s.mode_i],
						scale = 0.4,
						colour = G.C.WHITE,
						shadow = true
					}
				}
			}
		}
	end,
	buyStock = function(self, card, i)
		local s = card.ability.stock
		local price = s.price[i]

		if not price or price <= 0 then return end

		local qty = s.mode[s.mode_i]
		if qty == "ALL" then
			qty = math.floor((G.GAME.dollars - G.GAME.bankrupt_at) / price)
		end

		if qty <= 0 then return end

		local max_affordable = math.floor((G.GAME.dollars - G.GAME.bankrupt_at) / price)
		qty = math.min(qty, max_affordable)

		if qty <= 0 then return end

		G.GAME.dollars = G.GAME.dollars - price * qty
		s.stock[i] = s.stock[i] + qty
		card:juice_up()
	end,
	
	sellStock = function(self, card, i)
		local s = card.ability.stock
		local owned = s.stock[i]
		local price = s.price[i]

		if not owned or owned <= 0 then return end
		if not price or price <= 0 then return end

		local mode_value = s.mode[s.mode_i]
		local qty

		if mode_value == "ALL" then
			qty = owned
		else
			qty = math.min(mode_value, owned)
		end

		if qty <= 0 then return end
		G.GAME.dollars = G.GAME.dollars + price * qty
		s.stock[i] = owned - qty
		card:juice_up()
	end,
	
	updateStockUI = function(self, card)
		local s = card.ability.stock
		if not card.nodes or #card.nodes < 3 then return end

		for i = 1, 4 do
			local buy_btn = card.nodes[1].nodes[i]
			if buy_btn and buy_btn.config then
				local price = s.price[i] or 0
				local bankrupt_at = G.GAME.bankrupt_at or 0
				local max_affordable = math.floor((G.GAME.dollars - bankrupt_at) / price)
				local mode_value = s.mode[s.mode_i]
				local qty = mode_value == "ALL" and max_affordable or mode_value

				if price > 0 and max_affordable > 0 and qty <= max_affordable then
					buy_btn.config.colour = G.C.GREEN
					buy_btn.config.button = "buy_stock_"..i
				else
					buy_btn.config.colour = G.C.UI.BACKGROUND_INACTIVE
					buy_btn.config.button = nil
				end
			end
		end

		for i = 1, 4 do
			local sell_btn = card.nodes[2].nodes[i]
			if sell_btn and sell_btn.config then
				local owned = s.stock[i] or 0
				local price = s.price[i] or 0
				local mode_value = s.mode[s.mode_i]
				local qty = mode_value == "ALL" and owned or math.min(mode_value, owned)

				if owned > 0 and price > 0 and qty > 0 and owned >= qty then
					sell_btn.config.colour = G.C.RED
					sell_btn.config.button = "sell_stock_"..i
				else
					sell_btn.config.colour = G.C.UI.BACKGROUND_INACTIVE
					sell_btn.config.button = nil
				end
			end
		end

		local cycle_btn = card.nodes[3].nodes[1]
		if cycle_btn and cycle_btn.nodes and cycle_btn.nodes[1] and cycle_btn.nodes[1].config then
			cycle_btn.nodes[1].config.text = "x"..s.mode[s.mode_i]
			if cycle_btn.nodes[1].update_nodes then
				cycle_btn.nodes[1]:update_nodes()
			elseif cycle_btn.nodes[1].reload then
				cycle_btn.nodes[1]:reload()
			end
		end
	end,
	
	updateStockPrices = function(self,card)
		local s = card.ability.stock
		for i = 1, #s.names do
			local rdm = pseudorandom("felijo_stock"..G.GAME.round)
			local roundsMod = (G.GAME.round or 0) * 0.12
			local totalVol = s.volatility[i] + roundsMod
			local randomChange = (rdm * 2 - 1) * s.volatility[i]
			local oopsMod = (#SMODS.find_card("j_oops") or 0) * 0.02
			
			local totalTrend = s.trend[i] + oopsMod
			local totalChange = totalTrend + randomChange
			local oldPrice = s.price[i]			
			s.price[i] = s.price[i] * (1 + totalChange)
			s.price[i] = math.max(s.price[i], 0.1)
			s.change_p[i] = math.abs(((s.price[i] - oldPrice) / oldPrice) * 100)

			if oldPrice > s.price[i] then
				s.colours[i] = G.C.RED
				s.indicators[i] = "-"
			elseif oldPrice < s.price[i] then
				s.colours[i] = G.C.GREEN
				s.indicators[i] = "+"
			else
				s.colours[i] = G.C.UI.TEXT_INACTIVE
				s.indicators[i] = " "
			end
		end

		card:juice_up()
	end,
	update = function(self, card, dt)
		self:updateStockUI(card)
	end,
    calculate = function(self, card, context)
        if context.joker_main then
			self:updateStockPrices(card)
			
            return {
                chips = card.ability.extra.chips,
            }
        end
    end,

	
}





