SMODS.Joker {
    key = "stilton",
    name = "Geronimo Stilton",
       pronouns = "he_him",
    atlas = "jokers",
    pos = { x = 0, y = 0 },
    pools = { schoolastic = true, wip = true },
    config = { extra = { } },
    rarity = 2,
    cost = 4,
    blueprint_compat = false,
       unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = false,

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,

    calculate = function(self, card, context)
       

    end,
}