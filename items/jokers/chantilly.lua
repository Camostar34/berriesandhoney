SMODS.Joker {
    key = "chantilly",
    name = "Chantilly Cake",
   pronouns = "she_her",
    atlas = "jokers",
    pos = { x = 2, y = 6 },
    pools = { wip = true},
    config = { extra = { evil_xmult = 0, addxmult = 0.5, } },
    rarity = 1,
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
