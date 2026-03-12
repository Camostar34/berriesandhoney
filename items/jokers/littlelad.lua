
SMODS.Joker {
    key = "littlelad",
    name = "Little Lad",
    pronouns = "he_him",
    atlas = "jokers",
    pos = { x = 7, y = 2 },
    soul_pos = { x = 0, y = 3 },
    pools = { starburst = true, smsn_berry_themed = true, },
    config = { extra = { bonus_chips = 0, bonus_xchips = 1, bonus_mult = 0, bonus_xmult = 1,} },
    rarity = 4,
    cost = 20,
    blueprint_compat = true,
       unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.bonus_chips, card.ability.extra.bonus_xchips, card.ability.extra.bonus_mult, card.ability.extra.bonus_xmult} }
    end,

    calculate = function(self, card, context)
       
    if context.berry_activate and not context.blueprint then
       
        if context.berry_activate.ability.extra.berry_chips or context.berry_activate.ability.extra.berry_mult or context.berry_activate.ability.extra.berry_xmult or context.berry_activate.ability.extra.berry_xchips then

            if context.berry_activate.ability.extra.berry_mult then 
                card.ability.extra.bonus_mult = card.ability.extra.bonus_mult + context.berry_activate.ability.extra.berry_mult
            end

             if context.berry_activate.ability.extra.berry_xchips then
                card.ability.extra.bonus_xchips = card.ability.extra.bonus_xchips + context.berry_activate.ability.extra.berry_xchips
            end

            if context.berry_activate.ability.extra.berry_chips then
                card.ability.extra.bonus_chips = card.ability.extra.bonus_chips + context.berry_activate.ability.extra.berry_chips
            end

             if context.berry_activate.ability.extra.berry_xmult then
            
                card.ability.extra.bonus_xmult = card.ability.extra.bonus_xmult + context.berry_activate.ability.extra.berry_xmult
            end

           
            return {
                message = "Hooray!"
            }
        end
    end

        if context.joker_main then
            return {
                chips = card.ability.extra.bonus_chips,
                xchips = card.ability.extra.bonus_xchips,
                mult = card.ability.extra.bonus_mult,
                xmult = card.ability.extra.bonus_xmult,
            }
        end

    end,

}