SMODS.Joker {
    key = "crystalized",
   pronouns = "she_they",
    atlas = "jokers",
    pos = { x = 0, y = 0 },
     pools = {smsn_sticky = true, },
    config = { extra = { chips_per_dollar = 2 } },
    rarity = 2,
    cost = 7,
    blueprint_compat = false,
       unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = false,

    loc_vars = function(self, info_queue, card)

        local dollars = G.GAME and math.max(0, G.GAME.dollars) or 0
        local current_chips = dollars * card.ability.extra.chips_per_dollar
        
        return { vars = { card.ability.extra.chips_per_dollar, 1, current_chips } }
    end,

    calculate = function(self, card, context)
       
        if context.individual and context.cardarea == G.play then
            
           
            if SMODS.has_enhancement(context.other_card, "m_gold") then
                
            
                local dollars = math.max(0, G.GAME.dollars or 0)
                local bonus_chips = dollars * card.ability.extra.chips_per_dollar

               
                if bonus_chips > 0 then
                    return {
                        chips = bonus_chips,
                        card = card
                    }
                end
            end
        end
    end,
}
