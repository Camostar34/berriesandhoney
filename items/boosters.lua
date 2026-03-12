SMODS.Shader {
    key = "sky",
    path = "sky.fs"
}

SMODS.Booster {
    key = "berry_normal_1",
    weight = 1,
    kind = "berry",
    cost = 4,
    atlas = "boosters",
    group_key = 'k_smsn_picnic_pack',
    pos = { x = 0, y = 0 },
    config = { extra = 3, choose = 1 },
    draw_hand = false,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra },
            key = self.key:sub(1, -3), -- This uses the description key of the booster without the number at the end. Remove this if your booster doesn't have artwork variants like vanilla
        }
    end,
    
    ease_background_colour = function(self)
        SMSN_set_berry_background()
    end,

    create_card = function(self, card, i)
        return {
            set = "berry",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = false
        }
    end
}

SMODS.Booster {
    key = "berry_normal_2",
    weight = 1,
    kind = "berry",
    atlas = "boosters",
     group_key = 'k_smsn_picnic_pack',
    cost = 4,
    pos = { x = 1, y = 0 },
    config = { extra = 3, choose = 1 },
    draw_hand = false,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra },
            key = self.key:sub(1, -3), -- This uses the description key of the booster without the number at the end. Remove this if your booster doesn't have artwork variants like vanilla
        }
    end,

    ease_background_colour = function(self)
        SMSN_set_berry_background()
    end,


    create_card = function(self, card, i)
        return { set = "berry", area = G.pack_cards, skip_materialize = true, soulable = false }
    end
}

SMODS.Booster {
    key = "berry_jumbo",
    weight = 1,
    kind = "berry",
    atlas = "boosters",
    cost = 6,
    pos = { x = 2, y = 0 },
     group_key = 'k_smsn_picnic_pack',
    config = { extra = 5, choose = 1 },
    draw_hand = false,

        ease_background_colour = function(self)
        SMSN_set_berry_background()
    end,

    create_card = function(self, card, i)
        return { set = "berry", area = G.pack_cards, skip_materialize = true, soulable = false }
    end
}

SMODS.Booster {
    key = "berry_mega",
    weight = 1,
    kind = "berry",
    atlas = "boosters",
     group_key = 'k_smsn_picnic_pack',
    cost = 8,
    pos = { x = 3, y = 0 },
    config = { extra = 5, choose = 2 },
    draw_hand = false,

       ease_background_colour = function(self)
        SMSN_set_berry_background()
    end,

    create_card = function(self, card, i)
        return { set = "berry", area = G.pack_cards, skip_materialize = true, soulable = false }
    end
}

function SMSN_set_berry_background()
    if not (G and G.SPLASH_BACK) then return end
    
    local shader_key = G.SHADERS["smsn_sky"] and "smsn_sky" or (G.SHADERS["sky"] and "sky" or nil)
    if not shader_key then return end

    G.GAME = G.GAME or {}
    G.GAME.smsn_sky_alpha = 0 

   
    G.SPLASH_BACK:define_draw_steps({
        {
            shader = "background",
            send = {
                { name = "time", ref_table = G.TIMERS, ref_value = "REAL_SHADER" },
                { name = "spin_time", ref_table = G.TIMERS, ref_value = "BACKGROUND" },
                { name = "colour_1", ref_table = G.C.BACKGROUND, ref_value = "C" },
                { name = "colour_2", ref_table = G.C.BACKGROUND, ref_value = "L" },
                { name = "colour_3", ref_table = G.C.BACKGROUND, ref_value = "D" },
                { name = "contrast", ref_table = G.C.BACKGROUND, ref_value = "contrast" },
                { name = "spin_amount", ref_table = G.ARGS.spin, ref_value = "amount" }
            }
        },
        {
            shader = shader_key,
            send = {
                { name = "time", ref_table = G.TIMERS, ref_value = "REAL_SHADER" },
                { name = "bg_alpha", ref_table = G.GAME, ref_value = "smsn_sky_alpha" }
            }
        }
    })

    G.GAME.smsn_using_berry_bg = true

    
    G.E_MANAGER:add_event(Event({
        trigger = 'ease',
        ref_table = G.GAME,
        ref_value = 'smsn_sky_alpha',
        ease_to = 1,
        delay = 0.5,
        func = (function(t) return t end)
    }))
end

function SMSN_restore_run_background()
    if not (G and G.GAME and G.GAME.smsn_using_berry_bg) then return end

   
    G.E_MANAGER:add_event(Event({
        trigger = 'ease',
        ref_table = G.GAME,
        ref_value = 'smsn_sky_alpha',
        ease_to = 0,
        delay = 0.5,
        func = (function(t) return t end)
    }))

   
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.5,
        func = function()
            if G.SPLASH_BACK then
                G.SPLASH_BACK:define_draw_steps({
                    {
                        shader = "background",
                        send = {
                            { name = "time", ref_table = G.TIMERS, ref_value = "REAL_SHADER" },
                            { name = "spin_time", ref_table = G.TIMERS, ref_value = "BACKGROUND" },
                            { name = "colour_1", ref_table = G.C.BACKGROUND, ref_value = "C" },
                            { name = "colour_2", ref_table = G.C.BACKGROUND, ref_value = "L" },
                            { name = "colour_3", ref_table = G.C.BACKGROUND, ref_value = "D" },
                            { name = "contrast", ref_table = G.C.BACKGROUND, ref_value = "contrast" },
                            { name = "spin_amount", ref_table = G.ARGS.spin, ref_value = "amount" }
                        }
                    }
                })
            end
            G.GAME.smsn_using_berry_bg = nil
            return true
        end
    }))
end

function SMODS.Mods.SMSN.update(dt)
   
    if G.GAME and G.GAME.smsn_using_berry_bg and G.STATE ~= G.STATES.TAROT_PACK then
        
       
        G.GAME.smsn_using_berry_bg = false 
        
      
        G.E_MANAGER:add_event(Event({
            trigger = 'ease',
            ref_table = G.GAME,
            ref_value = 'smsn_sky_alpha',
            ease_to = 0,
            delay = 0.5,
            func = (function(t) return t end)
        }))
        
       
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.5,
            func = function()
                SMSN_restore_run_background()
                return true
            end
        }))
    end
end


local ease_bg_ref = ease_background_colour_blind


function ease_background_colour_blind(state, override_colour)
   
    if G.GAME and G.GAME.smsn_using_berry_bg and state ~= G.STATES.TAROT_PACK then
        SMSN_restore_run_background()
    end
    

    ease_bg_ref(state, override_colour)
end