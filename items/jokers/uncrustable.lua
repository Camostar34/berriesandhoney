SMODS.Joker { 
    key = "uncrustable",
    name = "Uncrustable",
    pronouns = "they_them",
    atlas = "jokers",
    pos = { x = 0, y = 13 },
    config = { extra = { mult = 10, chips = 50, dec_mult = 2, dec_chips = 10 } },
    rarity = 1, 
    unlocked = true,
    discovered = true,
    cost = 4,
    blueprint_compat = true,
    eternal_compat = false,  
    perishable_compat = true,
    demicolon_compat = true,
    pools = {smsn_berry_themed = true},

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.e_negative
        return { vars = { card.ability.extra.mult, card.ability.extra.chips, card.ability.extra.dec_mult, card.ability.extra.dec_chips } }
    end,

    calculate = function(self, card, context)
        
        if context.joker_main then
            return {
                mult = card.ability.extra.mult,
                chips = card.ability.extra.chips,
            }
        end

       
        if context.after and not context.blueprint then
            
           
            if card.ability.extra.mult - card.ability.extra.dec_mult <= 0 then
                
               
                SMODS.destroy_cards(card, nil, nil, true)
                
               
                G.E_MANAGER:add_event(Event({
                    func = function()
                        uncrustable_berry = create_card('berry', G.consumeables, nil, nil, nil, nil, nil, 'smuckers_berry')
                        uncrustable_berry:set_edition({negative = true}, true, true)
                        uncrustable_berry:add_to_deck()
                        G.consumeables:emplace(uncrustable_berry)
                        uncrustable_berry:juice_up(0.3, 0.5)
                        return true
                    end
                }))

               
                return {
                    message = localize('k_eaten_ex'),
                    colour = G.C.MULT
                }
            else
                
                card.ability.extra.mult = card.ability.extra.mult - card.ability.extra.dec_mult
                card.ability.extra.chips = card.ability.extra.chips - card.ability.extra.dec_chips
                
                return {
                    message = "-" .. card.ability.extra.dec_mult .. " Mult",
                    colour = G.C.RED
                }
            end
        end
    end
}