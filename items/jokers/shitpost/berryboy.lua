SMODS.Joker { 
    key = "berryboy",
    name = "Berryboy Joker",
       pronouns = "he_him",
    atlas = "jokers",
    pos = { x = 3, y = 1 },
    pools = { shitpost = true, wip = true },
    config = { extra = { } },
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