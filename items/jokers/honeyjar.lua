SMODS.Joker { 
    key = "honeyjar",
    name = "Honey Jar",
    pronouns = "she_it",
    atlas = "jokers",
    pos = { x = 6, y = 3 },
    pools = { wip = true },
    config = { extra = { glaze_odds = 3, gold_odds = 6 } },
    rarity = 2,
    cost = 8,
    blueprint_compat = true,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = false,

    loc_vars = function(self, info_queue, card)
        local prob_num, glaze_den = SMODS.get_probability_vars(card, 1, card.ability.extra.glaze_odds, 'smsn_honeyglaze')
        local _, gold_den = SMODS.get_probability_vars(card, 1, card.ability.extra.gold_odds, 'smsn_honeygold')
        
    
        return { vars = { prob_num, glaze_den, gold_den } }
    end,

    calculate = function(self, card, context)
        
        if context.individual and context.cardarea == G.play then
            
    
            if SMODS.pseudorandom_probability(card, 'smsn_honeyglaze', 1, card.ability.extra.glaze_odds) then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        context.other_card:set_edition({e_smsn_orangeglaze = true}, true, true)
                        context.other_card:juice_up(0.3, 0.3)
                        play_sound('tarot1', 0.9 + math.random() * 0.1, 0.8)
                        return true
                    end
                }))
            end
            

            if SMODS.pseudorandom_probability(card, 'smsn_honeygold', 1, card.ability.extra.gold_odds) then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        context.other_card:set_ability(G.P_CENTERS.m_gold, nil, true)
                        context.other_card:juice_up(0.3, 0.3)
                        play_sound('tarot1', 0.9 + math.random() * 0.1, 0.8)
                        return true
                    end
                }))
            end

        end
    end
}