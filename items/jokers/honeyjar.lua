SMODS.Joker { 
    key = "honeyjar",
    name = "Honey Jar",
       pronouns = "she_it",
    atlas = "jokers",
    pos = { x = 6, y = 3 },

    config = { extra = { 
        odds = 1, } },
    rarity = 2,
    cost = 3,
    blueprint_compat = false,
       unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = false,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
         local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'smsn_honeyjar')
        return { vars = {numerator, denominator} }
    end,

   calculate = function(self, card, context)
            
            if context.before and SMODS.pseudorandom_probability(card, 'smsn_honeyjar', 1, card.ability.extra.odds) then


                if context.scoring_hand then
                    for i = 1, #context.scoring_hand do
                        if context.scoring_hand[i].config.center ~= G.P_CENTERS.m_gold then
                            context.scoring_hand[i]:set_ability(G.P_CENTERS.m_gold, nil, true)
                            G.E_MANAGER:add_event(Event({trigger = 'before', delay = 0.3,
                                func = (function()
                                    context.scoring_hand[i]:juice_up(0.3, 0.3)
                                    play_sound('tarot1', 0.9 + math.random() * 0.1, 0.8)
                                    return true
                                end)
                            }))

                        end
                    end
                
                end
                        
                    
            end

            if context.after and context.cardarea == G.jokers then
                card.ability.extra.odds = card.ability.extra.odds + 1
                return { message = "+1" }
            end

    end

}