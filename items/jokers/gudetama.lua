SMODS.Joker { 

   key = "gudetama",
    name = "Gudetama",
    pronouns = "he_him",
    atlas = "jokers",
    pos = { x = 4, y = 13 },
    pools = { yuru = true, },
    config = { extra = { dollars = 6 } },
    rarity = 1,
    unlocked = true,
    discovered = true,
    cost = 4,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.dollars } }
    end,

    calculate = function(self, card, context)
        if context.skip_blind and not context.blueprint then
            card.ability.extra_value = (card.ability.extra_value or 0) + card.ability.extra.dollars
            card:set_cost()
            
            return {
                message = localize('k_val_up'),
                colour = G.C.MONEY,
                card = card
            }
        end
    end,
}

