FELIJO.highlighted_head = FELIJO.highlighted_head or nil
FELIJO.active_totem = FELIJO.active_totem or nil
FELIJO.totem_text = "NULL"

G.FUNCS.felijo_totem_button = function(e)
	if G.felijo_totems then
		local card = e.config.ref_table
		local highlighted_head = FELIJO.highlighted_head or nil
		if card.ability.totem_active then
			if highlighted_head then
				if highlighted_head.ability.tribe ~= card.ability.totem_tribe then
					-- SWITCH
					FELIJO.totem_text = localize("k_felijo_switch_button")
					e.config.button = "felijo_combine_totem"
					e.config.colour = G.C.BLUE
				else
					FELIJO.totem_text = localize("felijo_switch_button")
					e.config.button = nil
					e.config.colour = G.C.UI.BACKGROUND_INACTIVE
				end
			else
				FELIJO.totem_text = localize("k_felijo_separate_button")
				e.config.button = "felijo_separate_totem"
				e.config.colour = G.C.RED
			end
		else
			if highlighted_head and FELIJO.active_totem == nil then
				FELIJO.totem_text = localize("k_felijo_combine_button")
				e.config.button = "felijo_combine_totem"
				e.config.colour = G.C.BLUE
			else
				FELIJO.totem_text = localize("k_felijo_combine_button")
				e.config.button = nil
				e.config.colour = G.C.UI.BACKGROUND_INACTIVE
			end
		end
	end
end

G.FUNCS.felijo_can_pull = function(e)
	local card = e.config.ref_table
    if #G.felijo_totems.cards < G.felijo_totems.config.card_limit then
        e.config.colour = G.C.PURPLE
        e.config.button = "felijo_pull"
    elseif (#G.felijo_totems.cards < G.felijo_totems.config.card_limit + 2) and card.ability.is_totem_head then
		e.config.colour = G.C.PURPLE
        e.config.button = "felijo_pull"
	else
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        e.config.button = nil
    end
end

G.FUNCS.felijo_pull = function(e)
    local card = e.config.ref_table
    card.area:remove_card(card)
    card:add_to_deck()
    G.felijo_totems:emplace(card)
end

G.FUNCS.felijo_separate_totem = function(e)
    local body_card = e.config.ref_table
    if not body_card then return end
    if not body_card.ability.totem_active then return end

    local tribe = body_card.ability.totem_tribe
    if tribe then
        local tribe_data = FELIJO.indexTribe(tribe)
        if tribe_data then
            local head_key = "c_felijo_" .. tribe_data.totem_key
            SMODS.add_card{ key = head_key, area = G.felijo_totems }
        end
    end

    FELIJO.removeTotemSigils()

	body_card.children.center:set_sprite_pos({x = body_card.children.center.sprite_pos.x, y = 3})
	body_card.ability.sprite_pos ={
        x = body_card.children.center.sprite_pos.x,
        y = 3
    }

    body_card.ability.totem_active = false
    body_card.ability.totem_tribe = nil

    FELIJO.active_totem = nil
	play_sound("felijo_totem_separate",1)
end

G.FUNCS.felijo_combine_totem = function(e)
    local body_card = e.config.ref_table
    if not body_card then return end
    if not FELIJO.highlighted_head then return end

    local head = FELIJO.highlighted_head

    if not body_card.ability.is_totem_body then return end

    local active_totem = FELIJO.active_totem

    -- SWITCH
    if body_card.ability.totem_active then
        if head.ability.tribe ~= body_card.ability.totem_tribe then
            local old_tribe = body_card.ability.totem_tribe
            local old_tribe_data = FELIJO.indexTribe(old_tribe)
            local old_tribe_key = "c_felijo_" .. old_tribe_data.totem_key

            SMODS.destroy_cards(head, nil, nil, true)
            FELIJO.highlighted_head = nil

            SMODS.add_card{ key = old_tribe_key, area = G.felijo_totems }

            FELIJO.removeTotemSigils()

            body_card.ability.totem_tribe = head.ability.tribe

            local tribe_data = FELIJO.indexTribe(head.ability.tribe)


            FELIJO.applyTotemSigils(body_card, body_card.ability.totem_tribe)
			play_sound("felijo_totem_switch",1)
        end
    end


    -- COMBINE
    body_card.ability.totem_tribe = head.ability.tribe
    body_card.ability.totem_active = true

    body_card.children.center:set_sprite_pos({
        x = body_card.children.center.sprite_pos.x,
        y = 2
    })
    body_card.ability.sprite_pos = {
        x = body_card.children.center.sprite_pos.x,
        y = 2
    }

    local tribe_data = FELIJO.indexTribe(head.ability.tribe)

    SMODS.destroy_cards(head, nil, nil, true)
    FELIJO.highlighted_head = nil

    FELIJO.active_totem = body_card
    FELIJO.applyTotemSigils(body_card, body_card.ability.totem_tribe)
	play_sound("felijo_totem_combine",1)
end

FELIJO.Consumable = SMODS.Consumable:extend{
    in_pool = function (self, args)
       return true
    end,
	set_badges = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_felijo_ins'), HEX('7f1232'), HEX('f2a655'), 1 )
	end,
	select_card = G.felijo_totems,
}

SMODS.ConsumableType {
    key = 'felijo_totem_parts',
    default = 'c_felijo_ttm_undying',
    primary_colour = HEX('FFFFFF'),
    secondary_colour = HEX('C49761'),
    collection_rows = { 5, 5},
	shop_rate=0.8,
	select_card = G.felijo_totems,
}

local retvars_lookup = {
    felijo_ttm_sgl_midas     = { SMODS.Stickers["felijo_ttm_sgl_midas"]     and SMODS.Stickers["felijo_ttm_sgl_midas"].config.extra.dollars },
    felijo_ttm_sgl_leader    = SMODS.Stickers["felijo_ttm_sgl_leader"] and {
        SMODS.Stickers["felijo_ttm_sgl_leader"].config.extra.mult_mod,
        0
    },
    felijo_ttm_sgl_stinky    = SMODS.Stickers["felijo_ttm_sgl_stinky"] and { SMODS.Stickers["felijo_ttm_sgl_stinky"].config.extra.xbscore*100 },
}

for _, data in ipairs(FELIJO.totem_sigil_table) do
    FELIJO.Consumable {
        key = "felijo_" .. data.totem_key,
        set = "felijo_totem_parts",
        config = {
			is_totem_body 	= true,
            totem_sigil 	= data.key,   
            totem_active    = false,               
            totem_tribe     = nil,
			sprite_pos = {x = data.totem_x, y = 3},
			soul_pos = {x = data.totem_x, y = 5},
        },
        atlas = "inscryptionTotems",
        pos = {x = data.totem_x, y = 3},
		soul_pos = {x = data.totem_x, y = 5, draw = function (card, scale_mod, rotate_mod)
            card.children.floating_sprite:draw_shader('dissolve',0, nil, nil, card.children.center,scale_mod, rotate_mod,0,-100,nil, 0.2)
            card.children.floating_sprite:draw_shader('dissolve', nil, nil, nil, card.children.center, scale_mod, rotate_mod,0,0-0.2)
        end},
        cost = data.cost,
		unlocked = true,
		discovered = true,
		loc_vars = function(self, info_queue, card)
			local tribe_name = card.ability.totem_tribe
			local sigil = card.ability.totem_sigil
			local display = tribe_name and tribe_name or localize('k_none')
			local colour = tribe_name and G.C.FILTER or G.C.UI.TEXT_INACTIVE

			if card.ability.totem_sigil then
				local retvars = retvars_lookup[sigil] or {}
				info_queue[#info_queue + 1] = { key = sigil, set = "Other", vars = retvars }
			end

			local main_end = {
				{
					n = G.UIT.C,
					config = { align = "bm", padding = 0.02 },
					nodes = {
						{
							n = G.UIT.C,
							config = { align = "m", colour = colour, r = 0.05, padding = 0.05 },
							nodes = {
								{ n = G.UIT.T, config = { text = ' ' .. display .. ' ', colour = G.C.UI.TEXT_LIGHT, scale = 0.3, shadow = true } },
							}
						}
					}
				}
			}

			return { vars = { display }, main_end = main_end }
		end,
		load = function (self,card)
			G.E_MANAGER:add_event(Event({
				func = function() 
						if card.ability.totem_active then
							FELIJO.active_totem = card
							FELIJO.applyTotemSigils(card, card.ability.totem_tribe)
						end
						card.children.center:set_sprite_pos({
							x = card.ability.sprite_pos.x,
							y = card.ability.sprite_pos.y,
						})
					return true 
				end
			}))
		end,
        can_use = function(self, card)
		
        end,
        use = function(self, card, area, copier)

        end,
        remove_from_deck = function(self,card,from_debuff)
			if card.ability.totem_active and not from_debuff then
				local old_tribe = card.ability.totem_tribe
				local old_tribe_data = FELIJO.indexTribe(old_tribe)
				local old_tribe_key = "c_felijo_" .. old_tribe_data.totem_key
				SMODS.add_card{ key = old_tribe_key, area = G.felijo_totems }
				FELIJO.removeTotemSigils()
				FELIJO.active_totem = nil
			elseif card.ability.totem_active and from_debuff then
				FELIJO.removeTotemSigils()
			end
		end,
		add_to_deck = function(self,card,from_debuff)
			if card.ability.totem_active and from_debuff then 
				FELIJO.applyTotemSigils(card, card.ability.totem_tribe)
			elseif not card.ability.totem_active and not from_debuff then
				play_sound('felijo_totem_add', 1)	
			end
		end,
		calculate = function(self,card,context) 
			if context.selling_self and card.ability.totem_active then
				local old_tribe = card.ability.totem_tribe
				local old_tribe_data = FELIJO.indexTribe(old_tribe)
				local old_tribe_key = "c_felijo_" .. old_tribe_data.totem_key
				SMODS.add_card{ key = old_tribe_key, area = G.felijo_totems }
				FELIJO.removeTotemSigils()
			end
			if context.drawing_cards and card.ability.totem_active then 
				FELIJO.applyTotemSigils(card, card.ability.totem_tribe)
			end
		end,
    }
end

for _, data in ipairs(FELIJO.tribe_table) do
    FELIJO.Consumable {
        key = "felijo_" .. data.totem_key,
        set = "felijo_totem_parts",
        config = {
			is_totem_head 	= true,           
            tribe     		= data.key,                 
        },
        atlas = "inscryptionTotems",
        pos = {x = data.totem_x, y = 0},
        cost = data.cost,
        can_use = function(self, card)

        end,
        use = function(self, card, area, copier)

        end,
        
    }
end



FELIJO.get_totem_head = function(totem)
    local a = nil -- var to store the found totem
    for k, v in pairs(FELIJO.tribe_table) do -- <- go through the tribe_table and find the matching one
        if v.key == totem.ability.totem_tribe then
            a = v.key
        end
    end
    for k, v in pairs(G.P_CENTER_POOLS.felijo_totem_parts) do
        if v.config.tribe == a and a then
            return v -- return the center if it matches
        end
    end
end

SMODS.DrawStep { -- mostly taken from the seal drawing thing
    key = 'felijo_totem_head',
    order = -10, -- so it draws behind the card, higher nums draw above
    func = function(self, layer)
        G.totem_heads_shared = G.totem_heads_shared or {} -- create the table to store all sprites 
        if self.ability and self.ability.totem_tribe and FELIJO.get_totem_head(self) then -- proper checks, self explanatory
            local totem = FELIJO.get_totem_head(self) -- for easy access
            if not G.totem_heads_shared[totem.key] then -- if not found in table, create the sprite inside to be able to draw it
                G.totem_heads_shared[totem.key] = SMODS.create_sprite(0, 0, G.CARD_W, G.CARD_H, totem.atlas, {x = totem.pos.x, y = totem.pos.y+1}) -- sprite // y+1 to get activated sprite pos instead
            end
            G.totem_heads_shared[totem.key].role.draw_major = self -- taken from seal code so idk much either
            G.totem_heads_shared[totem.key]:draw_shader('dissolve', nil, nil, nil, self.children.center, nil, nil, nil,-1.80) -- -1.5 controls the height offset here // -1.5 can be changed dynamically if you asign a value for it in each head center and changing the -1.5 here to totem["whatever_value_you_set"]
            if self.edition then G.totem_heads_shared[totem.key]:draw_shader(SMODS.Edition.obj_table[self.edition.key].shader, nil, self.ARGS.send_to_shader, nil, self.children.center, nil, nil, nil,-1.5) end -- check if an edition exists and apply it on the drawn head
            
        end
    end,
    conditions = { vortex = false, facing = 'front' },
}