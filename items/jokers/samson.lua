SMODS.Joker { --Samson

    key = "samson",
    name = "Samson",
    pronouns = "he_him",
    atlas = "jokers",
    pos = { x = 5, y = 3 },
    pools = { oc = true, smsn_sticky = true, },
    config = { extra = { } },
    rarity = 2,
    unlocked = true,
    discovered = true,
    cost = 7,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,

    calculate = function(self, card, context)
       

    end,
}
