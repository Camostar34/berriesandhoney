SMODS.Joker {
    key = "beebear",
    pronouns = "he_him",
     enhancement_gate = 'm_gold',
    atlas = "jokers",
    pos = {
        x = 0,
        y = 0,
     },
    config = {
        extra = {
            added_mult = 6,
            current_mult = 0,
         },
    },
    rarity = 1,
    cost = 6,
    blueprint_compat = true,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = false,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_gold
        return {
            vars = { card.ability.extra.added_mult, card.ability.extra.current_mult },
         }
    end,

    calculate = function(self, card, context)
        if context.joker_main and card.ability.extra.current_mult > 0 then
            return {
                mult = card.ability.extra.current_mult,
             }
        end

        if context.end_of_round and not context.repetition and not context.blueprint and context.cardarea == G.hand and
            SMODS.has_enhancement(context.other_card, "m_gold") then
            card.ability.extra.current_mult = card.ability.extra.current_mult + card.ability.extra.added_mult
            SMODS.destroy_cards({ context.other_card })

            return {
                message = localize {
                    type = "variable",
                    key = "a_mult",
                    vars = { card.ability.extra.current_mult },
                 },
                message_card = card,
            }
        end
    end,
    credits = {
        code = "GhostSalt",
     },
}
