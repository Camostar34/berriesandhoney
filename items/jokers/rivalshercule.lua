SMODS.Joker {
    key = "rivalshercule",
    name = "ROA Hercule",
    pools = {
        oc = true,
     },
    atlas = "jokers",
    pos = {
        x = 5,
        y = 0,
     },

    config = {
        extra = {
            added_hand_size = 2,
            current_hand_size = 0,
         },
    },
    rarity = 3,
    cost = 9,
    blueprint_compat = false,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.added_hand_size, card.ability.extra.current_hand_size },
         }
    end,
    remove_from_deck = function(self, card, from_debuff) G.hand:change_size(-card.ability.extra.current_hand_size) end,

    calculate = function(self, card, context)
        if context.after and not context.blueprint then
            G.E_MANAGER:add_event(Event({
                func = function()
                    card.ability.extra.current_hand_size = card.ability.extra.current_hand_size +
                                                               card.ability.extra.added_hand_size
                    G.hand:change_size(card.ability.extra.added_hand_size)
                    return true
                end,
            }))
        end

        if context.end_of_round and not context.individual and not context.repetition and not context.blueprint then
            G.hand:change_size(-card.ability.extra.current_hand_size)
            card.ability.extra.current_hand_size = 0
            return {
                message = localize("k_reset"),
                colour = G.C.RED,
             }
        end
    end,

    credits = {
        code = "GhostSalt",
     },
}
