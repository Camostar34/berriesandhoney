SMODS.Joker { 

    key = "keepyapping",
    name = "Keep Yapping Your Mouth, Buddy",
    pronouns = "any_all",
    atlas = "jokers",
    pos = { x = 0, y = 0 },
    pools = { shitpost = true, wip = true },
    config = { extra = { multper = 1, current = 0 } },
    rarity = 2,
    unlocked = true,
    discovered = true,
    cost = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.multper, card.ability.extra.multper} }
    end,

    calculate = function(self, card, context)

      

    end,


    update = function(self, card, dt)

    end
}
