

SMODS.Joker {
    key = "twistedgarden",
    name = "Twisted Garden",
       pronouns = "it_its",
    atlas = "jokers",
    pos = { x = 0, y = 0 },
    pools = { wip = true},
    config = { extra = {} },
    rarity = 3,
    cost = 3,
    blueprint_compat = false,
       unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,

    calculate = function(self, card, context)


    end,
}