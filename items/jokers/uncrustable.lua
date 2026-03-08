SMODS.Joker { 
    key = "uncrustable",
    name = "Uncrustable",
    pronouns = "they_them",
    atlas = "jokers",
    pos = { x = 0, y = 0 },
    config = { extra = { mult = 10, chips = 50, dec_mult = 2, dec_chips = 10 } },
    rarity = 1, 
    unlocked = true,
    discovered = true,
    cost = 4,
    blueprint_compat = true,
    eternal_compat = false,  
    perishable_compat = true,
    demicolon_compat = true,

   loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.e_negative
        return { vars = { card.ability.extra.mult, card.ability.extra.chips, card.ability.extra.dec_mult, card.ability.extra.dec_chips } }
    end,

  calculate = function(self, card, context)
        
       
        if context.joker_main and card.ability.extra.mult > 0 then
            return {
                message = localize{type='variable',key='a_mult',vars={card.ability.extra.mult}},
                mult_mod = card.ability.extra.mult,
                chip_mod = card.ability.extra.chips
            }
        end

        
        if context.after then
            
          
            if not context.blueprint then
                card.ability.extra.mult = card.ability.extra.mult - card.ability.extra.dec_mult
                card.ability.extra.chips = card.ability.extra.chips - card.ability.extra.dec_chips
            end
            
            
            if card.ability.extra.mult <= 0 then
                
                
                if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local new_berry = create_card('Berry', G.consumeables, nil, nil, nil, nil, nil, 'smuckers_berry')
                            new_berry:set_edition({negative = true}, true, true)
                            new_berry:add_to_deck()
                            G.consumeables:emplace(new_berry)
                            G.GAME.consumeable_buffer = 0
                            new_berry:juice_up(0.3, 0.5)
                            return true
                        end
                    }))
                end
                
               
                if not context.blueprint then
                    card:start_dissolve()
                    return {
                        message = localize('k_eaten_ex'),
                        colour = G.C.MULT
                    }
                end
            else
          
                if not context.blueprint then
                    return {
                        message = "-" .. tostring(card.ability.extra.dec_mult) .. " Mult",
                        colour = G.C.RED
                    }
                end
            end
        end
    end
}