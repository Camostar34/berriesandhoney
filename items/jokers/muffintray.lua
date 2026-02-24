SMODS.Joker {
    key = "muffintray",
    name = "Muffin Tray",

    atlas = "jokers",
    pos = { x = 5, y = 9 },
    pools = {},
    config = { extra = {} },
    rarity = 1,
    cost = 5,
    blueprint_compat = true,
       unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = false,

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.bonus} }
    end,

    calculate = function(self, card, context)

            if not context.end_of_round and context.individual and context.cardarea == G.hand then 

            if context.other_card.config.center == G.P_CENTERS.m_bonus then
                print(context.other_card.ability)
            return {
				card = other_card,
                chips = context.other_card.ability.bonus
            }
            end

            if context.other_card.config.center == G.P_CENTERS.m_mult then
            return {
				card = other_card,
                mult = context.other_card.ability.mult
            }
            end
            

        end

    end,
}