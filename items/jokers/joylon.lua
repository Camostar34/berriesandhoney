SMODS.Joker {
    key = "joylon",
    name = "Joylon",
    pronouns = "he_him",
    atlas = "jokers",
    pos = { x = 0, y = 0 }, 
    pools = { oc = true },
    config = { extra = { dollars = 1, odds = 4 } },
    rarity = 1, 
    cost = 5,
    blueprint_compat = true, 
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true, 
    demicolon_compat = false,

    loc_vars = function(self, info_queue, card)
          local num, dem = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'smsn_joylon')
        return { vars = { card.ability.extra.dollars, num, dem } }
    end,

    calculate = function(self, card, context)
        
        if context.individual and context.cardarea == G.play then
            if context.other_card:is_face() then
                
    
                if SMODS.pseudorandom_probability(card, 'smsn_joylon', 1, card.ability.extra.odds) then
                    
                    context.other_card.ability.perma_p_dollars = (context.other_card.ability.perma_p_dollars or 0) + card.ability.extra.dollars
                    
                    return {
                        message = localize('k_upgrade_ex'),
                        colour = G.C.MONEY
                    }
                end
            end
        end
    end,
}