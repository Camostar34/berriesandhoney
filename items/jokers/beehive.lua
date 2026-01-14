SMODS.Joker {
    key = "beehive",
    name = "Beehive",
      pronouns = "they_them",
    atlas = "jokers",
    pos = { x = 2, y = 2 },
    soul_pos = { x = 3, y = 2 },
    config = { extra = { bonus = 1, } },
    rarity = 3,
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
       if context.end_of_round and context.individual and context.cardarea == G.hand then
            if SMODS.has_enhancement(context.other_card, 'm_gold') then
                   
            context.other_card.ability.h_dollars = context.other_card.ability.h_dollars + card.ability.extra.bonus
            return {
                message = "Upgrade!",
                colour = G.C.MONEY
            }
        end
    end

    end,
}
