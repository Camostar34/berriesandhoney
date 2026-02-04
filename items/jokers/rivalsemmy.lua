SMODS.Joker { 
    key = "rivalsemmy",
    name = "ROA Emmy",
    pools = { oc = true, wip = true },
    atlas = "jokers",
    pos = { x = 5, y = 0 },

    config = { extra = { miniboss = 1000, time_limit = 3,} },
    rarity = 1,
    cost = 3,
    blueprint_compat = false,
       unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.miniboss, card.ability.extra.time_limit,} }
    end,

    calculate = function(self, card, context)
       

    end,
}