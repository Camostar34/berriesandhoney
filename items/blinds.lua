SMODS.Blind {
    key = "mess",
    name = "The Mess",
    -- dollars = 8, Why?
    mult = 2,
    boss = { min = 1 },
    boss_colour = HEX("ffd459"),
    atlas = "blinds",
    pos = { x = 0, y = 2 },
  
    -- does nothing?


}



local honey_transition = 0.0
local transition_speed = 0.5 

local honey_transition = 0.0
local transition_speed = 0.5 

SMODS.ScreenShader {
    key = "slime",
    path = "slime.fs",
    
    send_vars = function(self)
        local dt = love.timer.getDelta()
        
 
        local is_active = false
        if G.GAME and G.GAME.blind and G.GAME.blind.name == 'The Mess' and not G.GAME.blind.disabled then
            is_active = true
        end

       
        if G.STATE == G.STATES.GAME_OVER then
            is_active = false
        end
        
      
        if is_active then
            honey_transition = math.min(1.0, honey_transition + dt * transition_speed)
        else
            honey_transition = math.max(0.0, honey_transition - dt * transition_speed)
        end

  
        if honey_transition > 0 and G.STATE ~= G.STATES.GAME_OVER then
            G.PITCH_MOD = 1.0 - (honey_transition * 0.4)
        end

        return {
            time = love.timer.getTime(),
            transition = honey_transition 
        }
    end,
    
    should_apply = function()
        local is_active = false
        if G.GAME and G.GAME.blind and G.GAME.blind.name == 'The Mess' and not G.GAME.blind.disabled then
            is_active = true
        end
        
       
        if G.STATE == G.STATES.GAME_OVER then
            is_active = false
        end

        return is_active or honey_transition > 0.0
    end
}


SMODS.Blind {
    key = "grizzly",
    name = "The Grizzly",
    -- dollars = 8, Boss Blinds tend to reward $5, so I'm removing these.
    mult = 2,
    boss = { min = 4 },
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
                                G.GAME.blind.triggered = true 
                                return true
                            end
                        }))
                        
                   
                    else 
                        G.GAME.blind:wiggle()
                        play_sound('timpani')

                
                        G.GAME.blind.chips = math.floor(G.GAME.blind.chips * 1.5)
                        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                        
                        G.GAME.blind.grizzly_punished = true
                        
                        G.GAME.blind.triggered = true
                    end
                end
                
                return true
            end
        }))
    end,

    disable = function(self)
   
        if G.GAME.blind and G.GAME.blind.grizzly_punished then
            
            G.GAME.blind.chips = math.ceil(G.GAME.blind.chips / 1.5)
            G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
            
            G.GAME.blind.grizzly_punished = false
        end
    end
}


SMODS.Blind {
    key = "preserves",
    name = "The Preserves",
    --dollars = 3, Same here.
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