SMODS.Blind {
    key = "mess",
    name = "The Mess",
    dollars = 8,
    mult = 2,
    boss = { min = 1 },
    boss_colour = HEX("ffd459"),
    atlas = "blinds",
    pos = { x = 0, y = 2 },
  
    -- does nothing?


}



local honey_transition = 0.0
local transition_speed = 0.5 

SMODS.ScreenShader {
    key = "slime",
    path = "slime.fs",
    
    send_vars = function(self)
        
        
        local dt = love.timer.getDelta()
        
       
        local is_active = false
        if G.GAME and G.GAME.blind and G.GAME.blind.config and G.GAME.blind.config.blind then
            if G.GAME.blind.config.blind.key == 'bl_smsn_mess' and not G.GAME.blind.disabled then
                is_active = true
            end
        end
        
       
        if is_active then
            honey_transition = math.min(1.0, honey_transition + dt * transition_speed)
        else
            honey_transition = math.max(0.0, honey_transition - dt * transition_speed)
        end

        return {
            time = love.timer.getTime(),
            transition = honey_transition 
        }
    end,
    
    should_apply = function()
        local is_active = false
        if G.GAME and G.GAME.blind and G.GAME.blind.config and G.GAME.blind.config.blind then
            if G.GAME.blind.config.blind.key == 'bl_smsn_mess' and not G.GAME.blind.disabled then
                is_active = true
            end
        end
        
        
        return is_active or honey_transition > 0.0
    end
}





SMODS.Blind {
    key = "grizzly",
    name = "The Grizzly",
    dollars = 8,
    mult = 2,
    boss = { min = 1 },
    boss_colour = HEX("c6926a"),
    atlas = "blinds",
    pos = { x = 0, y = 0 },

    set_blind = function(self)
   
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            blocking = false, 
            delay = 0.8,      
            func = function()
                

                if G.GAME.blind and not G.GAME.blind.disabled then
                    
                    if G.consumeables and #G.consumeables.cards > 0 then
                        G.GAME.blind:wiggle()
                        
                     
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.1,
                            func = function()
                                for i = #G.consumeables.cards, 1, -1 do
                                    local card = G.consumeables.cards[i]
                                    card:start_dissolve() 
                                end
                                blind.triggered = true
                                return true
                            end
                        }))
                    end
                end
                
                return true
            end
        }))
    end
}


SMODS.Blind {
    key = "preserves",
    name = "The Preserves",
    dollars = 8,
    mult = 2,
    boss = { min = 1 },
    boss_colour = HEX("ad4826"),
    atlas = "blinds",
    pos = { x = 0, y = 1 },
  
     calculate = function(self, blind, context)
   if context.pre_discard and not G.GAME.blind.disabled then
   blind.triggered = true
    end
end

}