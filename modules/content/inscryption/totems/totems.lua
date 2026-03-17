FELIJO.highlighted_head = FELIJO.highlighted_head or nil
FELIJO.active_totem = FELIJO.active_totem or nil

G.FUNCS.felijo_separate_totem = function(body_card)
    if not body_card then return end
    if not body_card.config.totem_active then return end
    if FELIJO.active_totem ~= body_card then return end

    local tribe = body_card.config.totem_tribe
    if tribe then
        local tribe_data = FELIJO.indexTribe(tribe)
        if tribe_data then
            local head_key = "c_felijo_" .. tribe_data.totem_key
            SMODS.add_card{ key = head_key, area = G.felijo_totems }
        end
    end

    FELIJO.removeTotemSigils()

	body_card.children.center:set_sprite_pos({x = body_card.children.center.pos.x, y = 3})
	body_card.children.center:set_soul_pos({x = body_card.children.center.soul_pos.x, y = 5})

    body_card.config.totem_active = false
    body_card.config.totem_tribe = nil

    FELIJO.active_totem = nil
end

G.FUNCS.felijo_combine_totem = function(body_card)
    if not body_card then return end
    if not FELIJO.highlighted_head then return end
    local head = FELIJO.highlighted_head


    if not body_card.config.is_totem_body then return end

    local active_totem = FELIJO.active_totem

    -- SWITCH
    if active_totem == body_card then
        if head.config.tribe ~= body_card.config.totem_tribe then
			
            local old_tribe = body_card.config.totem_tribe
			local old_tribe_data = FELIJO.indexTribe(old_tribe)
			local old_tribe_key = "c_felijo_" .. old_tribe_data.totem_key
			
            SMODS.destroy_cards(head, nil, nil, true)
            FELIJO.highlighted_head = nil
			
			SMODS.add_card{ key = old_tribe_key, area = G.felijo_totems }

            FELIJO.removeTotemSigils()

            body_card.config.totem_tribe = head.config.tribe
            local tribe_data = felijo.indexTribe(head.config.tribe)
            if tribe_data then
				body_card.children.center:set_soul_pos({x = tribe_data.totem_x, y = 1})
            end

            FELIJO.applyTotemSigils(body_card, body_card.config.totem_tribe)

        end
        return
    end

    -- SEPARATE ACTIVE TOTEM IF EXISTS AND IS NOT SELECTED BODY
    if active_totem and active_totem ~= body_card then
        G.FUNCS.felijo_separate_totem(active_totem)
    end

    -- COMBINE
    body_card.config.totem_tribe = head.config.tribe
    body_card.config.totem_active = true
	body_card.children.center:set_sprite_pos({x = body_card.children.center.pos.x, y = 3})

    local tribe_data = FELIJO.indexTribe(head.config.tribe)
    if tribe_data then
        body_card.soul_pos = {x = tribe_data.totem_x, y = 1}
    end

    SMODS.destroy_cards(head, nil, nil, true)
    FELIJO.highlighted_head = nil

    FELIJO.active_totem = body_card

    FELIJO.applyTotemSigils(body_card, body_card.config.totem_tribe)

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
    felijo_ttm_sgl_midas     = { SMODS.Stickers["felijo_ttm_sgl_midas"]     and SMODS.Stickers["felijo_ttm_sgl_midas"].config.val1 },
    felijo_ttm_sgl_leader    = SMODS.Stickers["felijo_ttm_sgl_leader"] and {
        SMODS.Stickers["felijo_ttm_sgl_leader"].config.val1,
        SMODS.Stickers["felijo_ttm_sgl_leader"].config.val2
    },
    felijo_ttm_sgl_stinky    = SMODS.Stickers["felijo_ttm_sgl_stinky"] and { SMODS.Stickers["felijo_ttm_sgl_stinky"].config.val1 },
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
        },
        atlas = "inscryptionTotems",
        pos = {x = data.totem_x, y = 3},
		soul_pos = {x = data.totem_x, y = 5},
        cost = data.cost,
		unlocked = true,
		discovered = true,
		loc_vars = function(self, info_queue, card)
			local tribe_name = card.config.totem_tribe
			local sigil = card.config.totem_sigil
			local display = tribe_name and localize { type = 'name_text', set = 'felijo_totem_parts', key = tribe_name } or localize('k_none')
			local colour = tribe_name and HEX('757CDC') or G.C.UI.TEXT_INACTIVE

			if card.config.totem_sigil then
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
        can_use = function(self, card)
		
        end,
        use = function(self, card, area, copier)

        end,
        
    }
end

for _, data in ipairs(FELIJO.tribe_table) do
    SMODS.Consumable {
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





G.FUNCS.felijo_totem_button = function(e)
	if G.felijo_totems then
		e.config.button = "felijo_combine_button"
		
		local card = e.config.ref_table
		local highlighted_head = FELIJO.highlighted_head or nil
		local active_totem = FELIJO.active_totem or nil
		
		if card.config.totem_active == true 
		and active_totem and active_totem == card 
		and highlighted_head and highlighted_head.config.tribe ~= card.config.totem_tribe then
			e.config.text = localize("felijo_switch_button")
			e.config.button = "felijo_combine_totem"
			e.config.colour = G.C.BLUE
			
		elseif card.config.totem_active == true 
		and active_totem and active_totem == card 
		and highlighted_head and highlighted_head.config.tribe == card.config.totem_tribe then
			e.config.text = localize("felijo_switch_button")
			e.config.button = nil
			e.config.colour = G.C.UI.BACKGROUND_INACTIVE
			
		elseif card.config.totem_active == true 
		and active_totem and active_totem == card 
		and highlighted_head == nil then
			e.config.text = localize("felijo_switch_button")
			e.config.button = nil
			e.config.colour = G.C.UI.BACKGROUND_INACTIVE
			
		elseif card.config.totem_active == true 
		and active_totem and active_totem == card then
			e.config.text = localize("felijo_separate_button")
			e.config.button = "felijo_separate_totem"
			e.config.colour = G.C.RED
			
		elseif card.config.totem_active == false 
		and highlighted_head then
			e.config.text = localize("felijo_combine_button")
			e.config.button = "felijo_combine_totem"
			e.config.colour = G.C.BLUE
			
		elseif card.config.totem_active == false 
		and highlighted_head == nil then
			e.config.text = localize("felijo_combine_button")
			e.config.button = nil
			e.config.colour = G.C.UI.BACKGROUND_INACTIVE
		end
	end
end
