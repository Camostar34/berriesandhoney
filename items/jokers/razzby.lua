SMODS.Joker { 

    key = "razzby",
    name = "Black Razzby",
    pronouns = "she_her",
    atlas = "jokers",
    pos = { x = 5, y = 8 },
    pools = { bugsnax = true,},
    config = { extra = { } },
    rarity = 3,
    unlocked = true,
    discovered = true,
    cost = 7,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,

    calculate = function(self, card, context)

        if context.selling_card then
            if context.card.ability.set == 'Joker' then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                G.E_MANAGER:add_event(Event({
                    func = (function()
                        SMODS.add_card {
                            set = 'berry',
                            edition = "e_negative"
                        }
                        G.GAME.consumeable_buffer = 0
                        return true
                    end)
                }))
                return {
                    message = "Razzby!",
                    colour = G.C.PURPLE
                }
            end
        end

       
        if context.joker_type_destroyed then
            
            if context.card.ability.set == 'Joker' then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                G.E_MANAGER:add_event(Event({
                    func = (function()
                        SMODS.add_card {
                            set = 'berry',
                            edition = "e_negative"
                        }
                        G.GAME.consumeable_buffer = 0
                        return true
                    end)
                }))
                return {
                    message = "Razzby!",
                    colour = G.C.PURPLE
                }
            end
        end
    end,
}
