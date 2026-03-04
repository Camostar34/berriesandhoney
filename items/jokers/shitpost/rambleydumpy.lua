SMODS.Joker {
    key = "rambleydumpy",
    name = "Rambley Dumpy",
    pronouns = "he_him",
    atlas = "jokers",
    pos = {
        x = 0,
        y = 0,
     },
    pools = {
        shitpost = true,
        rambley = true,
     },
    config = {
        extra = {
            odds = 4,
         },
    },
    rarity = 3,
    cost = 10,
    blueprint_compat = false,
    unlocked = true,
    discovered = true,
    eternal_compat = false,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card) return {} end,

    calculate = function(self, card, context)
        if context.setting_blind and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit and
            SMODS.pseudorandom_probability(card, "rambleydumpy", 1, card.ability.extra.odds) then
            G.GAME.joker_buffer = G.GAME.joker_buffer + 1
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound("timpani")
                    SMODS.add_card {
                        key = "j_egg",
                        key_append = "rambleydumpy",
                     }
                    G.GAME.joker_buffer = 0
                    card:juice_up()
                    return true
                end,
            }))
        end

        if context.first_hand_drawn and #G.consumeables.cards + G.GAME.consumeable_buffer <
            G.consumeables.config.card_limit then
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            G.E_MANAGER:add_event(Event({
                func = (function()
                    SMODS.add_card {
                        key = "c_smsn_rambleberry",
                        key_append = "rambleydumpyberry",
                     }
                    G.GAME.consumeable_buffer = 0
                    return true
                end),
            }))
            return {
                message = localize("k_plus_dumpyrambley"),
                colour = G.C.PURPLE,
             }

        end

        if context.end_of_round and context.game_over and context.main_eval and not context.blueprint then

            G.E_MANAGER:add_event(Event({
                func = function()
                    G.hand_text_area.blind_chips:juice_up()
                    G.hand_text_area.game_chips:juice_up()
                    play_sound("tarot1")
                    card:start_dissolve()
                    return true
                end,
            }))
            return {
                message = localize("k_saved_ex"),
                saved = "Saved by Rambley Dumpy",
                colour = G.C.RED,
             }

        end

    end,
    credits = {
        character = "UniqueGeese / JakeNeutron",
     },
}
