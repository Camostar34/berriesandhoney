smsn_valid_glazes = {
    "e_smsn_redglaze", "e_smsn_blueglaze", "e_smsn_yellowglaze", 
    "e_smsn_brownglaze", "e_smsn_orangeglaze", "e_smsn_candyglaze"
}

SMODS.Joker {
    key = "bearclaws",
    pronouns = "she_they",
    atlas = "jokers",
    pos = { x = 0, y = 0 },
    pools = {  },
    config = { extra = { money = 3 } },
    rarity = 1,
    cost = 7,
    blueprint_compat = false,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = false,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.money } }
    end,

    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            
           
            card.ability.extra.glazes_stripped = 0

            for i = 1, #context.scoring_hand do
                
                local scored_card = context.scoring_hand[i]
                
              
                if scored_card.edition and scored_card.edition.key and not scored_card.debuff and not scored_card.bearclawed then
                    
                   
                    for j = 1, #smsn_valid_glazes do
                        if scored_card.edition.key == smsn_valid_glazes[j] then
                            
                            card.ability.extra.glazes_stripped = card.ability.extra.glazes_stripped + 1
                            scored_card.bearclawed = true
                            
                           
                            scored_card:set_edition(nil, true)
                            
                          
                            card.ability.extra_value = (card.ability.extra_value or 0) + card.ability.extra.money
                            card:set_cost()

                        
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    scored_card:juice_up()
                                    scored_card.bearclawed = nil
                                    return true
                                end
                            }))
                            
                         
                            break
                        end
                    end
                end
            end

            
            if card.ability.extra.glazes_stripped > 0 then
                card.ability.extra.glazes_stripped = 0 
                
                return {
                    message = localize('k_val_up'),
                    colour = G.C.MONEY,
                    card = card
                }
            end
        end
    end
}