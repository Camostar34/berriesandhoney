SMODS.Joker {
    key = "ruben",
    name = "Ruben Sandwich",

    atlas = "jokers",
    pos = { x = 0, y = 8 },
    pools = { wip = true},
    config = { extra = {bonus = 1.25} },
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