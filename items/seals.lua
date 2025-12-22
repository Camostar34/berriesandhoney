-- Blue Seal
SMODS.Seal {
    key = 'freshness',
    atlas = "seals",
    pos = { x = 0, y = 0 },
    badge_colour = G.C.BLUE,
    calculate = function(self, card, context)
        if context.playing_card_end_of_round and context.cardarea == G.hand and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.0,
                func = function()
                    if G.GAME.last_hand_played then
                    SMODS.add_card({ set = 'Berry' })
                        G.GAME.consumeable_buffer = 0
                    end
                    return true
                end
            }))
        end
    end
}