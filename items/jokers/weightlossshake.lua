SMODS.Joker {
    key = "weightlossshake",
    name = "Weight Loss Shake",

    atlas = "jokers",
    pos = { x = 2, y = 5 },

    config = { extra = {bonus = 45} },
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
}
