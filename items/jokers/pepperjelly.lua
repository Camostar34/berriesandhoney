SMODS.Joker {
    key = "pepperjelly",
    name = "Ghost Pepper Jelly",
    pronouns = "she_it",
    atlas = "jokers",
    pos = { x = 0, y = 4 },
    pools = { },

    config = { extra = { x_mult = 1.5, odds = 2 } },
    rarity = 2,
    cost = 6,
    blueprint_compat = true, 
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = false,

    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'smsn_pepperjelly')
        return { vars = { card.ability.extra.x_mult, numerator, denominator } }
    end,

    calculate = function(self, card, context)
       
        if context.joker_main and G.consumeables and #G.consumeables.cards > 0 then
            
          
            local total_xmult = 1
            
            for i = 1, #G.consumeables.cards do
                if G.consumeables.cards[i].ability.set == 'Berry' then
                    total_xmult = total_xmult * card.ability.extra.x_mult
                    
                    
                    local target_berry = G.consumeables.cards[i]
                    
                 
                    if not context.blueprint then
                        if SMODS.pseudorandom_probability(card, 'smsn_pepperjelly', 1, card.ability.extra.odds) then
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    target_berry:start_dissolve()
                                    return true
                                end
                            }))
                        else
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    target_berry:juice_up(0.3, 0.4)
                                    return true
                                end
                            }))
                        end
                    else
                       
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                target_berry:juice_up(0.3, 0.4)
                                return true
                            end
                        }))
                    end
                end
            end

         
            if total_xmult > 1 then
                return {
                    message = localize{type='variable',key='a_xmult',vars={total_xmult}},
                    Xmult_mod = total_xmult
                }
            end
        end
    end,
}