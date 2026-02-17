SMODS.Joker { 
    key = "rivalshercule",
    name = "ROA Hercule",
    pools = { oc = true, wip = true },
    atlas = "jokers",
    pos = { x = 5, y = 0 },

    config = { extra = { hand = 2,} },
    rarity = 1,
    cost = 3,
    blueprint_compat = false,
       unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.hand,} }
    end,

    calculate = function(self, card, context)
       

    end,
}