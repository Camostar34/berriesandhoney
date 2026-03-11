SMODS.Joker {
    key = "compost",
    name = "Compost Bin",
   pronouns = "it_its",
    atlas = "jokers",
    pos = { x = 0, y = 7 },
pools = { smsn_berry_themed = true,},
    config = { extra = { payout = 2, current = 0, gain = 3, } },
    rarity = 1,
    cost = 5,
    blueprint_compat = false,
       unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = false,

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.gain, card.ability.extra.payout} }
    end,

    calculate = function(self, card, context)
  
        if context.selling_card and not context.blueprint then

            if context.card.ability.set == 'berry' then
                
                card.ability.extra.current = card.ability.extra.current + 1

              
                if card.ability.extra.current >= card.ability.extra.payout then
                    
                    card.ability.extra.current = 0
                    
                    card.ability.extra_value = card.ability.extra_value + card.ability.extra.gain
                    
                    card:set_cost()

                    return {
                        message = localize('k_val_up'),
                        colour = G.C.MONEY,
                        card = card
                    }
                else
                    
                    return {
                        message = card.ability.extra.current .. "/" .. card.ability.extra.payout,
                        colour = G.C.PURPLE 
                    }
                end
            end
        end
    end,
}
