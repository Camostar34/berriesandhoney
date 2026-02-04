SMODS.Joker {
    key = "rambleydumpy",
    name = "Rambley Dumpy",
    pronouns = "he_him",
    atlas = "jokers",
    pos = { x = 0, y = 0 },
    pools = { shitpost = true, rambley = true, wip = true },
    config = { extra = { } },
    rarity = 3,
    cost = 3,
    blueprint_compat = false,
       unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,

    calculate = function(self, card, context)
       
         if context.first_hand_drawn and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                         G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                G.E_MANAGER:add_event(Event({
                    func = (function()
                        SMODS.add_card {
                            key = 'c_smsn_rambleberry',
                        }
                        G.GAME.consumeable_buffer = 0
                        return true
                    end)
                }))
                return {
                    message = localize('k_plus_commonrambley'),
                    colour = G.C.SECONDARY_SET.Tarot,
                }
            
         end

        if context.end_of_round and context.game_over and context.main_eval then
                    
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                G.hand_text_area.blind_chips:juice_up()
                                G.hand_text_area.game_chips:juice_up()
                                play_sound('tarot1')
                                card:start_dissolve()
                                return true
                            end
                        }))
                        return {
                            message = localize('k_saved_ex'),
                            saved =  "Saved by Rambley Dumpy",
                            colour = G.C.RED
                        }
                    
                end

            end,
            credits = {
		character = "UniqueGeese / JakeNeutron"              -- you can also leave out fields if you wish
	}
}

------