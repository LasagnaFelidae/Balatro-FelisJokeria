G.effectmanager = {}

local drawhook = love.draw
function love.draw()
    drawhook()

    function loadThatFuckingImage(fn)
        local full_path = (FELIJO.path 
        .. "gifs/" .. fn)
        local file_data = assert(NFS.newFileData(full_path),("Epic fail"))
        local tempimagedata = assert(love.image.newImageData(file_data),("Epic fail 2"))
        --print ("LTFNI: Successfully loaded " .. fn)
        return (assert(love.graphics.newImage(tempimagedata),("Epic fail 3")))
    end

    function loadThatFuckingImageSpritesheet(fn,px,py,subimg,orientation)
        local full_path = (FELIJO.path 
        .. "gifs/" .. fn)
        local file_data = assert(NFS.newFileData(full_path),("Epic fail"))
        local tempimagedata = assert(love.image.newImageData(file_data),("Epic fail 2"))

        local tempimg = assert(love.graphics.newImage(tempimagedata),("Epic fail 3"))

        local spritesheet = {}
        for i = 1, subimg do
            if orientation == 0 then -- 0 = downwards spritesheet
                table.insert(spritesheet,love.graphics.newQuad(0, (i-1)*py, px, py, tempimg))
            end
            if orientation == 1 then -- 1 = rightwards spritesheet
                table.insert(spritesheet,love.graphics.newQuad((i-1)*px, 0, px, py, tempimg))
            end
        end
        --print ("LTFNIS: Successfully loaded spritesheet " .. fn)

        return (spritesheet)
    end
    

    local _xscale = love.graphics.getWidth()/1920
    local _yscale = love.graphics.getHeight()/1080

	 -- EFFECT MANAGER!!! 
    -- this is where on-screen little gifs play
	-- stolen from le yahimod
    if G.effectmanager then
       
        for i = 1, #G.effectmanager do
            local _xscale = love.graphics.getWidth()/1920
            local _yscale = love.graphics.getHeight()/1080
            --print("G.effectmanager[i].name".. G.effectmanager[i][1].name)
            if G.effectmanager[i] ~= nil then
                if G.effectmanager[i][1].name == "explosion" then
                    if FELIJO.imageexplosion == nil then FELIJO.imageexplosion = loadThatFuckingImage("explosiongif.png") end
                    if FELIJO.imageexplosionsprite == nil then FELIJO.imageexplosionsprite = loadThatFuckingImageSpritesheet("explosiongif.png",384,384,14,0) end
                    imagetodraw = FELIJO.imageexplosion
                    quadtodraw = FELIJO.imageexplosionsprite
                    _imgindex = G.effectmanager[i][1].frame
                    _xpos = G.effectmanager[i][1].xpos-(384/2)
                    _ypos = G.effectmanager[i][1].ypos-(384/2)
                    --print("_imgindex ".. _imgindex)
                    love.graphics.setColor(1, 1, 1, 1)
                end
				love.graphics.draw(imagetodraw, quadtodraw[_imgindex], _xpos, _ypos, 0 ,_xscale,_yscale)
            end
        end
    end
end
function decrementingTickEvent(type,tick)
	--event manager
    if type == "G.effectmanager" then
        for i = 1, #G.effectmanager do
            if G.effectmanager[i] and G.effectmanager[i][1] then
                if G.effectmanager[i][1].duration ~= nil and G.effectmanager[i][1].duration >= -1 then
                    _eff = G.effectmanager[i][1]

                    _eff.tfps = _eff.tfps + 1
                    _eff.duration = _eff.duration - 1
                    
                    if _eff.tfps > 100/_eff.fps and _eff.fps ~= 0 then
                        _eff.frame = _eff.frame + 1
                        _eff.tfps = 0

                        if G.effectmanager[i][1].name == "parry" and G.effectmanager[i][1].duration > 77 then 
                            _eff.frame = 1 end     
                    end
                    if _eff.frame > _eff.maxframe then
                        _eff.frame = 1
                    end
            
        
                

                elseif G.effectmanager[i][1].duration ~= nil and G.effectmanager[i][1].duration <= 0 then
                    G.effectmanager[i] = nil
                end
            end
        end
    end
end


local upd = Game.update
function Game:update(dt)
    upd(self, dt)

    -- tick based events
    if FELIJO.ticks == nil then FELIJO.ticks = 0 end
    if FELIJO.dtcounter == nil then FELIJO.dtcounter = 0 end
    FELIJO.dtcounter = FELIJO.dtcounter+dt
    FELIJO.dt = dt

    while FELIJO.dtcounter >= 0.010 do
        FELIJO.ticks = FELIJO.ticks + 1
        FELIJO.dtcounter = FELIJO.dtcounter - 0.010
		
		if #G.effectmanager > 0 then decrementingTickEvent("G.effectmanager",0) end

    end
end






function playEffect(effect,posx,posy)
    if effect == "explosion" then
        neweffect = 
            {
            name = "explosion",
            duration = 50,

            frame = 1,
            maxframe = 14,
            fps = 20,
            tfps = 0, -- ticks per frame per second


            xpos = posx,
            ypos = posy,
            xvel = 0,
            yvel = 0,
            }
	end
    table.insert(G.effectmanager,{neweffect})
end

function FELIJO.deleteCard(card)
    play_sound("felijo_rbx_delete")
    playEffect("explosion",card.tilt_var.mx,card.tilt_var.my)
    SMODS.destroy_cards(card)
end

function FELIJO.explodeCard(card)
    play_sound("felijo_rbx_explosion")
    playEffect("explosion",card.tilt_var.mx,card.tilt_var.my)
    SMODS.destroy_cards(card)
end

function FELIJO.subspaceExplode()
	play_sound("felijo_rbx_subspace")
	Blind:change_colour(HEX('F400F0')) -- Blind box
	ease_background_colour{new_colour = HEX('F400F0')}
	for _, _c in ipairs(G.hand.cards) do
		if _c.ability.felijo_stk_subspace == nil or _c.ability.felijo_stk_subspace == false then
			_c.ability.perma_h_chips = _c.ability.perma_h_chips or 0
			_c.ability.perma_h_chips = _c.ability.perma_h_chips + 100
		end
		_c.ability.felijo_stk_subspace = true
	end
	for _, _c in ipairs(G.jokers.cards) do
		if _c.ability.felijo_stk_subspace == nil or _c.ability.felijo_stk_subspace == false then
			_c.ability.perma_h_chips = _c.ability.perma_h_chips or 0
			_c.ability.perma_h_chips = _c.ability.perma_h_chips + 100
		end
		_c.ability.felijo_stk_subspace = true
	end
	for _, _c in ipairs(G.consumeables.cards) do
		if _c.ability.felijo_stk_subspace == nil or _c.ability.felijo_stk_subspace == false then
			_c.ability.perma_h_chips = _c.ability.perma_h_chips or 0
			_c.ability.perma_h_chips = _c.ability.perma_h_chips + 100
		end
		_c.ability.felijo_stk_subspace = true
	end
end

