SMODS.Joker {
    key = "paddington",
    name = "Paddington Bear",
    pronouns = "he_him",
    atlas = "jokers",
    pos = {
        x = 1,
        y = 3,
     },
    soul_pos = {
        x = 2,
        y = 3,
     },
    config = {
        extra = {
            added_xmult = 0.05,
            current_xmult = 1,
         },
    },
    rarity = 4,
    cost = 20,
    blueprint_compat = false,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = false,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.current_xmult, card.ability.extra.added_xmult },
         }
    end,

    calculate = function(self, card, context)
        if context.joker_main and card.ability.extra.current_xmult > 1 then
            return {
                xmult = card.ability.extra.current_xmult,
             }
        end

        if context.individual and context.cardarea == G.hand and context.other_card:is_suit("Diamonds") and not context.blueprint then
            card.ability.extra.current_xmult = card.ability.extra.current_xmult + card.ability.extra.added_xmult
            return { message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.current_xmult } }, message_card = card }
        end
    end,

    credits = {
        code = "GhostSalt",
     },
}
