
SMODS.Joker {
    key = "boykisser",
    name = "Boykisser",
    pools = { shitpost = true, wip = true },
    atlas = "jokers",
    pos = { x = 6, y = 8 },

    config = { extra = {bonus = 2} },
    rarity = 1,
    cost = 3,
    blueprint_compat = false,
       unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.bonus} }
    end,

    calculate = function(self, card, context)

       

    end,
}