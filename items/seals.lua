-- stolen from purple seal 
SMODS.Seal {
    key = 'freshness',
    atlas = "seals",
    pos = { x = 0, y = 0 },
    badge_colour = G.C.BLUE,
    calculate = function(self, card, context)
        if context.discard and context.other_card == card and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.0,
                func = function()
                    SMODS.add_card({ set = 'berry' })
                    G.GAME.consumeable_buffer = 0
                    return true
                end
            }))
            return { message = localize('k_plus_berry'), colour = G.C.PURPLE }
        end
    end
}