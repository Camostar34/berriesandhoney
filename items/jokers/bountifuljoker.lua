SMODS.Joker { 

    key = "bountifuljoker",
    name = "Bountiful Joker",
    pronouns = "she_her",
    atlas = "jokers",
    pos = { x = 7, y = 5 },
    pools = { },
    config = { extra = { mult = 7} },
    rarity = 1,
    unlocked = true,
    discovered = true,
    cost = 4,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.mult} }
    end,

    calculate = function(self, card, context)
       
                if context.other_consumeable and context.other_consumeable.ability.set == 'Berry' then
            return {
                mult = card.ability.extra.mult,
                card = other_consumeable
            }
        end

    end,
}
