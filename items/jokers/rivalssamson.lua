SMODS.Joker { --ROA Samson
    key = "rivalssamson",
    name = "ROA Samson",
    pronouns = "he_him",
    atlas = "jokers",
    pos = { x = 1, y = 0 },
    pools = { oc = true, wip = true },
    config = { extra = { miniboss = 4000, time_limit = 3, reward = 25,} },
    rarity = 3,
    cost = 3,
    blueprint_compat = false,
       unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,
    

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.miniboss, card.ability.extra.time_limit,card.ability.extra.reward,} }
    end,

    calculate = function(self, card, context)
       

    end,
}