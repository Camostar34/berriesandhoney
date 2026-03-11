













-- ROKUYO DECK

local ROKUYO_DAYS = {
    [1] = { name = "Senshou",    desc = "Small/Big Blind x2, Boss x0.5" },
    [2] = { name = "Tomobiki",   desc = "Small/Boss Blind x2, Big x0.5" },
    [3] = { name = "Senbu",      desc = "Boss Blind x2, Small/Big x0.5" },
    [4] = { name = "Shakku",     desc = "Big Blind x2, Small/Boss x0.5" },
    [5] = { name = "Taian",      desc = "All Probabilities x2" },
    [6] = { name = "Butsumetsu", desc = "All Probabilities x0.5" }
}

local ROKUYO_PROB_RULES = {
    [1] = { Small = 2,   Big = 2,   Boss = 0.5 }, -- Senshou
    [2] = { Small = 2,   Big = 0.5, Boss = 2   }, -- Tomobiki
    [3] = { Small = 0.5, Big = 0.5, Boss = 2   }, -- Senbu
    [4] = { Small = 0.5, Big = 2,   Boss = 0.5 }, -- Shakku
    [5] = { Small = 2,   Big = 2,   Boss = 2   }, -- Taian
    [6] = { Small = 0.5, Big = 0.5, Boss = 0.5 }, -- Butsumetsu
}

-- ui
local function generate_rokuyo_ui()
    local nodes = {}
    local current_day = (G.GAME and G.GAME.rokuyo_day) or 1

    for i, day_data in ipairs(ROKUYO_DAYS) do
        local is_active = (i == current_day)
        local text_colour = is_active and G.C.GOLD or G.C.UI.TEXT_INACTIVE

        local day_nodes = {
            {
                n = G.UIT.R,
                config = { align = "cm" },
                nodes = {
                    {
                        n = G.UIT.T,
                        config = {
                            text = day_data.name,
                            scale = is_active and 0.5 or 0.4,
                            colour = text_colour,
                            shadow = is_active
                        }
                    }
                }
            }
        }

        if is_active then
            table.insert(day_nodes, {
                n = G.UIT.R,
                config = { align = "cm", padding = 0.05 },
                nodes = {
                    {
                        n = G.UIT.T,
                        config = {
                            text = day_data.desc,
                            scale = 0.32,
                            colour = G.C.WHITE
                        }
                    }
                }
            })
        end

        table.insert(nodes, {
            n = G.UIT.R,
            config = { align = "cm", padding = 0.02, minw = 3.0 },
            nodes = {
                {
                    n = G.UIT.C,
                    config = { align = "cm" },
                    nodes = day_nodes
                }
            }
        })
    end

    return {
        n = G.UIT.ROOT,
        config = { align = "cm", colour = G.C.CLEAR },
        nodes = {
            {
                n = G.UIT.C,
                config = { align = "cm", padding = 0.1 },
                nodes = nodes
            }
        }
    }
end


-- Phase selection, changes every ante. If you go backwards, it will remember what the previous phase was.
-- To prevent constantly resetting for better odds, Taian and Butsumetsu will never appear Ante 1. 

local function rokuyo_set_for_ante(ante)
    G.GAME.rokuyo_schedule = G.GAME.rokuyo_schedule or {}
    G.GAME.rokuyo_bag = G.GAME.rokuyo_bag or {1,2,3,4,5,6}
    G.GAME.rokuyo_run_salt = G.GAME.rokuyo_run_salt or tostring(os.time())


    if G.GAME.rokuyo_schedule[ante] then
        G.GAME.rokuyo_day = G.GAME.rokuyo_schedule[ante]
        return G.GAME.rokuyo_day
    end

   
    if #G.GAME.rokuyo_bag == 0 then
        G.GAME.rokuyo_bag = {1,2,3,4,5,6}
    end

  
    local valid = {}
    for i, day in ipairs(G.GAME.rokuyo_bag) do
        if ante ~= 1 or (day ~= 5 and day ~= 6) then
            valid[#valid+1] = i
        end
    end


    if ante == 1 and #valid == 0 then
        G.GAME.rokuyo_bag = {1,2,3,4,5,6}
        for i, day in ipairs(G.GAME.rokuyo_bag) do
            if day ~= 5 and day ~= 6 then valid[#valid+1] = i end
        end
    end

    local seed = "rokuyo_" .. tostring(ante) .. "_" .. tostring(G.GAME.rokuyo_run_salt)
    local pick_i = valid[math.floor(pseudorandom(seed) * #valid) + 1]
    local day = G.GAME.rokuyo_bag[pick_i]

    G.GAME.rokuyo_schedule[ante] = day
    G.GAME.rokuyo_day = day
    table.remove(G.GAME.rokuyo_bag, pick_i)

    return day
end

SMODS.Back({
    key = "rokuyo",
    name = "Rokuyo Deck",
    atlas = "backs",
    pos = { x = 4, y = 0 },

    apply = function(self, back)
 
        G.GAME.rokuyo_schedule = G.GAME.rokuyo_schedule or {}
        G.GAME.rokuyo_bag = G.GAME.rokuyo_bag or {1,2,3,4,5,6}
        G.GAME.rokuyo_run_salt = tostring(os.time())

        local ante = (G.GAME.round_resets and G.GAME.round_resets.ante) or 1
        G.GAME.rokuyo_last_ante = ante

        rokuyo_set_for_ante(ante)
    end,

    calculate = function(self, back, context)
        if context.ante_change then
            local delta = context.ante_change or 0

    
            local from_ante = G.GAME.rokuyo_last_ante or ((G.GAME.round_resets and G.GAME.round_resets.ante) or 1)
            local to_ante = from_ante + delta
            if to_ante < 1 then to_ante = 1 end

            G.GAME.rokuyo_last_ante = to_ante

            local day_idx = rokuyo_set_for_ante(to_ante)
            local day = ROKUYO_DAYS[day_idx]

            return {
                message = day and day.name or "Unknown",
                colour = G.C.GOLD
            }
        end

        if context.mod_probability then
     
            if not G.GAME.rokuyo_day then
                local ante = (G.GAME.round_resets and G.GAME.round_resets.ante) or 1
                rokuyo_set_for_ante(ante)
            end

            if not G.GAME.rokuyo_day or not G.GAME.blind then return end

            local blind_type = G.GAME.blind:get_type()
            local factor = ROKUYO_PROB_RULES[G.GAME.rokuyo_day]
                and ROKUYO_PROB_RULES[G.GAME.rokuyo_day][blind_type]

            if factor == 2 then
                return { numerator = 2 }
            elseif factor == 0.5 then
                return { numerator = 0.5 }
            end
        end
    end
})

--Hover hook, OUGHHH I CANT STOP HOOKING IT!!
local original_card_hover = Card.hover
function Card:hover()
    if self.area == G.deck
    and G.GAME
    and G.GAME.selected_back
    and G.GAME.selected_back.effect
    and G.GAME.selected_back.effect.center
    and G.GAME.selected_back.effect.center.key == 'b_smsn_rokuyo' then

        self.config.h_popup = {
            n = G.UIT.C,
            config = { align = "cm", padding = 0.1 },
            nodes = {
                {
                    n = G.UIT.R,
                    config = { align = (self.params and self.params.deck_preview and "bm" or "cm") },
                    nodes = {
                        {
                            n = G.UIT.C,
                            config = { align = "cm", minh = 1.5, r = 0.1, colour = G.C.L_BLACK, padding = 0.1, outline = 1 },
                            nodes = {
                                {
                                    n = G.UIT.R,
                                    config = { align = "cm", r = 0.1, minw = 3, maxw = 4, minh = 0.4 },
                                    nodes = {
                                        {
                                            n = G.UIT.O,
                                            config = {
                                                object = UIBox{
                                                    definition = {
                                                        n = G.UIT.ROOT,
                                                        config = { align = "cm", colour = G.C.CLEAR },
                                                        nodes = {
                                                            {
                                                                n = G.UIT.O,
                                                                config = {
                                                                    object = DynaText({
                                                                        string = "Rokuyo Phases",
                                                                        maxw = 4,
                                                                        colours = {G.C.WHITE},
                                                                        shadow = true,
                                                                        bump = true,
                                                                        scale = 0.5,
                                                                        pop_in = 0,
                                                                        silent = true
                                                                    })
                                                                }
                                                            }
                                                        }
                                                    },
                                                    config = { offset = {x=0,y=0}, align = "cm" }
                                                }
                                            }
                                        }
                                    }
                                },
                                {
                                    n = G.UIT.R,
                                    config = { align = "cm", colour = G.C.CLEAR, minh = 1.3, maxh = 6, minw = 3, maxw = 4, r = 0.1 },
                                    nodes = {
                                        {
                                            n = G.UIT.O,
                                            config = {
                                                object = UIBox{
                                                    definition = generate_rokuyo_ui(),
                                                    config = { offset = {x=0,y=0} }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        self.config.h_popup_config = self:align_h_popup()
        return Node.hover(self)
    end

    return original_card_hover(self)
end


