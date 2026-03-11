SMODS.Joker {
    key = "hothoney",
    name = "Hot Honey",
      pronouns = "he_they",
    atlas = "jokers",
    pos = { x = 1, y = 1 },
     pools = {smsn_sticky = true, },
    config = { extra = { xmultbonus = 0.25, penalty = 1, } },
    rarity = 2,
    cost = 7,
    blueprint_compat = false,
       unlocked = true,
    discovered = true,
    eternal_compat = true,
     enhancement_gate = 'm_gold',
    perishable_compat = false,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.xmultbonus, card.ability.extra.penalty,} }
    end,

    calculate = function(self, card, context)
            if context.individual and context.cardarea == G.play and SMODS.has_enhancement(context.other_card, 'm_gold') then
                   
                print(tostring(context.other_card.ability.h_dollars))
                context.other_card.ability.h_dollars = context.other_card.ability.h_dollars - card.ability.extra.penalty
                 context.other_card.ability.perma_x_mult = context.other_card.ability.perma_x_mult or 1
                context.other_card.ability.perma_x_mult = context.other_card.ability.perma_x_mult + card.ability.extra.xmultbonus
                    
                    return {
                        extra = { message = localize('k_upgrade_ex'), colour = G.C.MULT },
                         card = card
                    }
                
            end
    end



  
}