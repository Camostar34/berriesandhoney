SMODS.Joker {
    key = "paddington",
    name = "Paddington Bear",
    pronouns = "he_him",
    atlas = "jokers",
    pos = { x = 1, y = 3 },
    soul_pos = { x = 2, y = 3 },
    pools = { wip = true},
    config = { extra = { } },
    rarity = 4,
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