SMODS.Joker { 

    key = "strawberrygirl",
    name = "Strawberry Girl",
    pronouns = "she_her",
    atlas = "jokers",
    pos = { x = 1, y = 13 },
    pools = { },
    config = { extra = { } },
    rarity = 2,
    unlocked = true,
    discovered = true,
    cost = 6,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,

 calculate = function(self, card, context)
       
        if context.joker_main then
            
            
            if context.scoring_name == "Flush" then
                
               
                local is_heart_flush = true
                for _, scoring_card in ipairs(context.scoring_hand) do
                    if not scoring_card:is_suit('Hearts') then
                        is_heart_flush = false
                        break
                    end
                end

                if is_heart_flush then
                    
                    
                    if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                        
                        
                        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                        
                        
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                SMODS.add_card({
                                    key = 'c_smsn_strawberry',
                                    area = G.consumeables
                                })
                                G.GAME.consumeable_buffer = 0
                                return true
                            end
                        }))

                        return {
                            message = "Strawberry!",
                            colour = G.C.RED,
                            card = card
                        }
                    end
                end
            end
        end
    end,
    credits = {
        art = "Maridaka",
     },
}
