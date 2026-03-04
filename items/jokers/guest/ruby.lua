SMODS.Joker {
    key = "ruby",
    name = "Ruby",
    pronouns = "she_her",
    atlas = "jokers",
    pos = {
        x = 0,
        y = 0,
     },
    pools = {
        guest = true,
     },
    config = {
        extra = {
            discards = 0,
         },
    },
    rarity = 3,
    cost = 8,
    blueprint_compat = true,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.discards },
         }
    end,

    calculate = function(self, card, context)
        if context.before and G.GAME.current_round.hands_left <= 0 and
            G.GAME.current_round.discards_left <= card.ability.extra.discards and -- Being lenient here. If discards becomes 1, let's allow 0 discards remaining too.
            not (context.blueprint_card or card).getting_sliced and #G.consumeables.cards + G.GAME.consumeable_buffer <
            G.consumeables.config.card_limit then
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1

            G.E_MANAGER:add_event(Event({
                func = function()
                    local new_card = SMODS.add_card({
                        set = "Spectral",
                        key_append = "ruby",
                     })
                    G.GAME.consumeable_buffer = 0
                    return true
                end,
            }))

            return {
                message = localize("k_plus_spectral"),
                colour = G.C.SECONDARY_SET.Spectral,
             }
        end
    end,
    credits = {
        character = "lord-ruby",
        code = "GhostSalt",
     },
}

