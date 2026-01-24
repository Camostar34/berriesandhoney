SMODS.Joker {
    key = "dieting",
    name = "Dieting Joker",

    atlas = "jokers",
    pos = { x = 0, y = 6 },

    config = { extra = {bonus = 45} },
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

        if context.joker_main then
        return {
                chips = math.floor(card.ability.extra.bonus * #G.consumeables.cards),
     
            }
        end

    end,
}