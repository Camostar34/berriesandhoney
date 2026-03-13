SMODS.Back({
    key = "defunct",
    name = "Defunct Deck",
    config = {no_faces = true}, 
    atlas = "backs",
    pos = { x = 2, y = 0 },

    apply = function(self, back)
        G.GAME.starting_params.no_faces = true
        G.E_MANAGER:add_event(Event({
            func = function()
                rambley_card = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_smsn_commonrambley')
                rambley_card:set_edition({foil = true}, true, true)
                rambley_card:add_to_deck()
                G.jokers:emplace(rambley_card)
                return true
            end
        }))
    end,

    calculate = function(self, back, context)
        if context.playing_card_added then
            for _, _card in pairs(context.cards) do
                if _card:is_face() then
                    if not (G.GAME.modifiers and G.GAME.modifiers.smsn_defunct_combo) then
                        _card:set_edition({holo = true}, true, true)
                    end
                end
            end
        end
    end
})