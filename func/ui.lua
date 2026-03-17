--[[ Credit: Revo]]--
FELIJO.button_func = function(card, args) 
	if args.under then
		if not args.bw then args.bw = -0.1 end
		if not args.bh then args.bh = 0.8 end
		if not args.align_text then args.align_text = "bm" end
	end

	if not args.bw then args.bw = 0.1 end
	if not args.bh then args.bh = 0.6 end
	if not args.align_other then args.align_other = "cm" end
	if not args.align then args.align = "cr" end
	if not args.align_text then args.align_text = "tm" end
	if not args.colour then args.colour = G.C.RED end
	if not args.one_press then args.one_press = false end
	if not args.text_colour then args.text_colour = G.C.UI.TEXT_LIGHT end
	if not args.text_scale then args.text_scale = 0.5 end
	if not args.r then args.r = 0.08 end
	if not args.minw then args.minw = 1.25 end
	if not args.minh then args.minh = 0 end
	if not args.padding_1 then args.padding_1 = 0.1 end
	if not args.align_after_text then args.align_after_text = "cm" end
	if not args.ref_table then args.ref_table = card end
	if not args.hover then args.hover = true end
	if not args.shadow then args.shadow = true end
	if not args.shadow_text then args.shadow_text = true end
	if not args.maxw then args.maxw = 1.25 end
	if not args.maxw_after_text then args.maxw_after_text = 1.25 end

	local args = args or {}
	local sell = nil
	local use = nil

	if args.sell then
		sell = {
			n = G.UIT.C,
			config = {
				align = "cr",
			},
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
					},
					nodes = {
						{
							n = G.UIT.B,
							config = {
								w = 0.1,
								h = 0.6,
							},
						},
						{
							n = G.UIT.C,
							config = {
								align = "tm",
							},
							nodes = {
								{
									n = G.UIT.R,
									config = {
										align = "cm",
										maxw = 1.25,
									},
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
									config = {
										align = "cm",
									},
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
	end

	if args.use then
		use = {
			n = G.UIT.C,
			config = {
				align = args.align,
			},
			nodes = {
				{
					n = G.UIT.C,
					config = {
						ref_table = args.ref_table,
						align = args.align_other,
						maxw = args.maxw,
						padding = args.padding_1,
						r = args.r,
						minw = args.minw,
						minh = args.minh,
						hover = args.hover,
						shadow = args.shadow,
						colour = args.colour,
						button = args.button,
						func = args.func,
					},
					nodes = {
						{
							n = G.UIT.B,
							config = {
								w = args.bw,
								h = args.bh,
							},
						},
						{
							n = G.UIT.C,
							config = {
								align = args.align_text,
							},
							nodes = {
								{
									n = G.UIT.R,
									config = {
										align = args.align_after_text,
										maxw = args.maxw_after_text,
									},
									nodes = {
										args.text and not args.ref_table_text and {
											n = G.UIT.T,
											config = {
												text = args.text,
												colour = args.text_colour,
												scale = args.text_scale,
												shadow = args.shadow_text,
											},
										},
										args.ref_table_text and not args.text and {
											n = G.UIT.T,
											config = {
												ref_table = args.ref_table_text,
												ref_value = args.ref_value_text,
												colour = args.text_colour,
												scale = args.text_scale,
												shadow = args.shadow_text,
											},
										},

									},
								},
								args.second_text
							},
						},
					},
				},
			},
		}
	end

	return {
		n = G.UIT.ROOT,
		config = {
			align = "cr",
			padding = 0,
			colour = G.C.CLEAR,
		},
		nodes = {
			{
				n = G.UIT.C,
				config = {
					padding = 0.15,
					align = "cl",
				},
				nodes = {
					sell and {
						n = G.UIT.R,
						config = {
							align = "cl",
						},
						nodes = { sell },
					} or nil,
					use and {
						n = G.UIT.R,
						config = {
							align = "cl",
						},
						nodes = { use },
					} or nil,
				},
			},
		},
	}
end



local cardhighold = Card.highlight
function Card:highlight(is_highlighted)
	self.highlighted = is_highlighted
	
	if not self.highlighted and FELIJO.highlighted_head == self then
		FELIJO.highlighted_head = nil
	elseif self.highlighted and self.ability and self.ability.is_totem_head then
		FELIJO.highlighted_head = self
	end
	if self.highlighted and (G.pack_cards and self.area == G.pack_cards and self.ability.set == "felijo_totem_parts") then
		if self.children.use_button then
			self.children.use_button:remove()
			self.children.use_button = nil
		end

		self.children.use_button = UIBox({
			definition = FELIJO.button_func(self, {
				use = true,
				align = "cr",
				align_other = "bm",
				text = "PULL",                           
				button = "felijo_pull",  
				func = "felijo_can_pull",
				one_press = true,
				text_colour = G.C.WHITE,
				colour = G.C.PURPLE,  
				under = true,
			}),
			config = {
				align = "cm",
				offset = {
					x = 0,
					y = 1.5,
				},
				parent = self,
				ref_table = s,
			},
		})
	elseif self.highlighted and self.ability and self.ability.is_totem_head and self.area and self.area == G.felijo_totems then
		if self.children.use_button then
			self.children.use_button:remove()
			self.children.use_button = nil
		end
		
		self.children.use_button = UIBox({
			definition = FELIJO.button_func(self, {
				sell = true,
				use = nil,
				ref_table_text = FELIJO,
				ref_value_text = "totem_text",                      
				button = nil,  
				func = "felijo_totem_button",
				one_press = true,
				text_colour = G.C.WHITE,
				colour = G.C.UI.BACKGROUND_INACTIVE,  
				text_scale = 0.45,
				align_text = "cm",
			}),
			config = {
				align = "cr",
				offset = {
					x = -0.4,
					y = 0,
				},
				parent = self,
				ref_table = self,
			},
		})
		
	elseif self.highlighted and self.ability and self.ability.is_totem_body and self.area and self.area == G.felijo_totems then
		if self.children.use_button then
			self.children.use_button:remove()
			self.children.use_button = nil
		end

		self.children.use_button = UIBox({
			definition = FELIJO.button_func(self, {
				sell = true,
				use = true,
				ref_table_text = FELIJO,
				ref_value_text = "totem_text",                          
				button = "felijo_combine_totem",  
				func = "felijo_totem_button",
				one_press = false,
				text_colour = G.C.WHITE,
				colour = G.C.UI.BACKGROUND_INACTIVE,  
				text_scale = 0.45,
				align_text = "cm",
			}),
			config = {
				align = "cr",
				offset = {
					x = -0.4,
					y = 0,
				},
				parent = self,
				ref_table = self,
			},
		})
	else
		cardhighold(self, is_highlighted)	
	end
end