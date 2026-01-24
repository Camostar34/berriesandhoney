SMODS.Joker {
    key = "compost",
    name = "Compost Bin",
   pronouns = "it_its",
    atlas = "jokers",
    pos = { x = 0, y = 7 },

    config = { extra = { payout = 2, current = 0, gain = 1, } },
    rarity = 1,
    cost = 4,
    blueprint_compat = false,
       unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = false,

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.gain, card.ability.extra.payout, card.ability.extra.current} }
    end,

    calculate = function(self, card, context)
       

    end,
}