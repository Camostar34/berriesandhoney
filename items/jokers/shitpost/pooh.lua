SMODS.Joker {
    key = "pooh",
    name = "Winnie The Pooh",

    atlas = "jokers",
    pos = { x = 4, y = 7 },
    config = { extra = { } },
    rarity = 2,
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
    in_pool = function(self, args)
        return false
    end,
}