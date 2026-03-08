SMODS.Joker {
    key = "mintjams",
    name = "Mint Jams",
    pronouns = "he_they",
    atlas = "jokers",
    pos = { x = 6, y = 1 },
    config = { extra = { odds = 4 } },
    rarity = 1,
    cost = 5,
    blueprint_compat = true, 
    unlocked = true,
    discovered = true,
    eternal_compat = false, 
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
       
        return { vars = { SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'smsn_mintjams') } }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            
           
            if context.other_card.seal or context.other_card.edition or (SMODS.get_enhancements and next(SMODS.get_enhancements(context.other_card) or {}) ~= nil) then
                
          
                if not card.shattered and not context.blueprint then
                    card.shattered = true
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            card:start_dissolve()
                            return true
                        end
                    }))
                    return {
                        message = localize('k_eaten_ex'),
                        colour = G.C.RED
                    }
                end

            else
            
                if SMODS.pseudorandom_probability(card, 'smsn_mintjams', 1, card.ability.extra.odds) and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                    G.GAME.consumeable_buffer = (G.GAME.consumeable_buffer or 0) + 1

                    G.E_MANAGER:add_event(Event({
                        func = function()
                            SMODS.add_card({
                                set = 'Berry',
                                area = G.consumeables
                            })
                            G.GAME.consumeable_buffer = 0
                            return true
                        end
                    }))

                    return {
                        message = localize('k_plus_commonrambley'),
                        colour = G.C.SECONDARY_SET.Tarot,
                        card = card
                    }
                end
            end
        end
    end,
}