SMODS.Joker {
    key = "weightlossshake",
    name = "Weight Loss Shake",

    atlas = "jokers",
    pos = {
        x = 2,
        y = 5,
     },
    pools = {
        Food = true,
     },
    config = {
        extra = {
            prob_add = 3,
            prob_add_minus = 1,
         },
    },
    rarity = 2,
    cost = 5,
    blueprint_compat = false,
    unlocked = true,
    discovered = true,
    eternal_compat = false,
    perishable_compat = true,
    demicolon_compat = true,
    

    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.prob_add, card.ability.extra.prob_add_minus },
         }
    end,

    calculate = function(self, card, context)
        if context.mod_probability and not context.blueprint then
            return {
                numerator = context.numerator * card.ability.extra.prob_add,
             }
        end

        if context.using_consumeable and not context.blueprint then
            card.ability.extra.prob_add = card.ability.extra.prob_add - card.ability.extra.prob_add_minus
            if card.ability.extra.prob_add > 0 then
                return {
                    message = -card.ability.extra.prob_add_minus.."",
                    colour = G.C.GREEN
                }
            else
                SMODS.destroy_cards(card, nil, nil, true)
                return {
                    message = localize('k_drank_ex')
                }
            end
        end
    end
}
