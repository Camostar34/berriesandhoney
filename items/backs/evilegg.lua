

SMODS.Back({
    key = "evilegg",
    name = "Evil Egg Deck",
    atlas = "backs",
    pos = { x = 3, y = 0 },
    config = { },

    loc_vars = function(self, info_queue, back)
        return { vars = {} }
    end,

     apply = function(self, back)
        G.GAME.starting_params.no_faces = true
        G.E_MANAGER:add_event(Event({
                func = function()
                    SMODS.add_card({set = 'Joker', area = G.jokers, skip_materialize = true, key = "j_ring_master", no_edition = true})
                return true end
            }))
    end,

    calculate = function(self, back, context)
        

        if context.setting_blind then
            G.GAME.current_round.reroll_cost = 0
        end


        if context.reroll_shop then
            G.GAME.current_round.reroll_cost = 0
            
        end
        
    end
})