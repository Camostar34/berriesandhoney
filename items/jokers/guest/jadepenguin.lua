SMODS.Joker {
    key = "jadepenguin",
    name = "Jade Penguin",
    pools = { guest = true, wip = true  },
    atlas = "jokers",
    pos = { x = 5, y = 4 },
     soul_pos = { x = 6, y = 4 },
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
        return { vars = {} }
    end,

    calculate = function(self, card, context)
       
        if context.end_of_round and context.cardarea == G.jokers then

        end

    end,
}