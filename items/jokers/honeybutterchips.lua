SMODS.Joker { 

    key = "honeybutterchips",
    name = "Honey Butter Chips",
    pronouns = "she_her",
    atlas = "jokers",
    pos = { x = 6, y = 6 },
    pools = { Food = true},
     enhancement_gate = 'm_gold',
    config = { extra = { bonus = 2, decay = 0.1} },
    rarity = 2,
    unlocked = true,
    discovered = true,
    cost = 6,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = false,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.bonus,  card.ability.extra.decay} }
    end,

   calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            
            if context.other_card.config.center.key == 'm_gold' then
                
                local is_first_gold = false
                for i = 1, #context.scoring_hand do
                    if context.scoring_hand[i].config.center.key == 'm_gold' then
                        is_first_gold = (context.scoring_hand[i] == context.other_card)
                        break
                    end
                end


                if is_first_gold then
                    local current_xchips = card.ability.extra.bonus
                    
                    if not context.blueprint then
                        card.ability.extra.bonus = card.ability.extra.bonus - card.ability.extra.decay
                        
                        if card.ability.extra.bonus <= 1 then 
                            SMODS.destroy_cards(card, nil, nil, true)
                            return {
                                message = localize('k_eaten_ex'),
                                colour = G.C.FILTER,
                                xchips = current_xchips 
                            }
                        end
                    end


                    return {
                        xchips = current_xchips,
        
                    }
                end
            end
        end
    end,
}
