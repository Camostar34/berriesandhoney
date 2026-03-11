SMODS.Joker {
    key = "ricepudding",
    name = "Rice Pudding",
    pronouns = "she_they",
    atlas = "jokers",
    pos = { x = 0, y = 0 },
    pools = { Food = true, smsn_sticky = true, },
    config = { extra = { cards = 3, subtract = 1 } },
    rarity = 2,
    cost = 5,
    blueprint_compat = false, 
    unlocked = true,
    discovered = true,
    eternal_compat = false, 
    perishable_compat = false,
    demicolon_compat = false,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_gold
        return { vars = { card.ability.extra.cards, card.ability.extra.subtract } }
    end,

    calculate = function(self, card, context)
        if context.end_of_round and not context.individual and not context.repetition then
            
            
            if card.ability.extra.cards > 0 and G.hand and #G.hand.cards > 0 then
                local valid_cards = {}
                for i = 1, #G.hand.cards do
                 
                    if G.hand.cards[i].config.center == G.P_CENTERS.c_base then
                        valid_cards[#valid_cards+1] = G.hand.cards[i]
                    end
                end

                if #valid_cards > 0 then
                   
                    local targets = {}
                    for i = 1, math.min(card.ability.extra.cards, #valid_cards) do
                        local chosen_idx = math.max(1, math.ceil(pseudorandom(pseudoseed('rice')) * #valid_cards))
                        targets[#targets+1] = valid_cards[chosen_idx]
                        table.remove(valid_cards, chosen_idx)
                    end

                   
                    for i = 1, #targets do
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after', delay = 0.1,
                            func = function()
                                targets[i]:flip()
                                play_sound('card1', 1.1 - (i*0.05))
                                return true
                            end
                        }))
                    end

                   
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after', delay = 0.3,
                        func = function()
                            for i = 1, #targets do
                                targets[i]:set_ability(G.P_CENTERS.m_gold, nil, true)
                               
                                targets[i]:set_sprites(targets[i].config.center) 
                            end
                            return true
                        end
                    }))

                
                    for i = 1, #targets do
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after', delay = 0.1,
                            func = function()
                                targets[i]:flip()
                                play_sound('tarot2', 0.9 + (i*0.05), 0.6)
                                targets[i]:juice_up(0.3, 0.3)
                                return true
                            end
                        }))
                    end
                end
            end

            
            card.ability.extra.cards = card.ability.extra.cards - card.ability.extra.subtract

            if card.ability.extra.cards <= 0 then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        card:start_dissolve()
                        return true
                    end
                }))
                return {
                    message = localize('k_eaten_ex'),
                    colour = G.C.MONEY
                }
            else
                return {
                    message = "-1 Card",
                    colour = G.C.RED
                }
            end
        end
    end,
    credits = { idea = "Candycanearter07" },
}