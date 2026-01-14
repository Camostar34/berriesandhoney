
SMODS.Joker {
    key = "littlelad",
    name = "Little Lad",
    pronouns = "he_him",
    atlas = "jokers",
    pos = { x = 7, y = 2 },
    soul_pos = { x = 0, y = 3 },

    config = { extra = { bonus_chips = 0, bonus_mult = 0, bonus_xmult = 1,} },
    rarity = 4,
    cost = 3,
    blueprint_compat = false,
       unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.bonus_chips, card.ability.extra.bonus_mult, card.ability.extra.bonus_xmult} }
    end,

    calculate = function(self, card, context)
       
    if context.berry_activate then
        if context.berry_activate.ability.extra.berry_chips or context.berry_activate.ability.extra.berry_mult or context.berry_activate.ability.extra.berry_xmult then

            if context.berry_activate.ability.extra.berry_mult then
                card.ability.extra.bonus_mult = card.ability.extra.bonus_mult + context.berry_activate.ability.extra.berry_mult
            end

             if context.berry_activate.ability.extra.berry_chips then
                card.ability.extra.bonus_chips = card.ability.extra.bonus_chips + context.berry_activate.ability.extra.berry_chips
            end

             if context.berry_activate.ability.extra.berry_xmult then
                card.ability.extra.bonus_xmult = card.ability.extra.berry_xmult + context.berry_activate.ability.extra.berry_xmult
            end

            return
            {
                message = "yippie!"
            }
        end
    end

        if context.joker_main then
            return {
                chips = card.ability.extra.bonus_chips,
                mult = card.ability.extra.bonus_mult,
                xmult = card.ability.extra.bonus_xmult,
            }
        end

    end,

}