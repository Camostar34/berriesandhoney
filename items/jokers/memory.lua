
SMODS.Joker {
    key = "memory",
    name = "Memory of Apprenticeship",
       pronouns = "she_they",
    atlas = "jokers",
    pos = { x = 0, y = 0 },

    config = { extra = {faceneed = 2, } },
    rarity = 1,
    cost = 3,
    blueprint_compat = false,
       unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.faceneed} }
    end,

    calculate = function(self, card, context)


    end,
}