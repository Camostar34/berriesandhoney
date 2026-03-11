SMODS.Joker {
    key = "airfreshener",
    name = "Air Freshener",
       pronouns = "it_its",
    atlas = "jokers",
    pos = { x = 5, y = 2 },
    pools = {smsn_berry_themed = true,},
    config = { extra = {amount = 2, } },
    rarity = 1,
    cost = 5,
    blueprint_compat = false,
       unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.amount} }
    end,

    calculate = function(self, card, context)
       if context.setting_blind and G.GAME.blind:get_type() == 'Small' then
         G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        for i = 1, card.ability.extra.amount do
                           
                            if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                                
                                
                                local berry = create_card('berry', G.consumeables, nil, nil, nil, nil, nil, 'smsn_airfreshener')
                                berry:add_to_deck()
                                G.consumeables:emplace(berry)
                                
                                G.GAME.consumeable_buffer = 0
                            end
                        end
                        return true
                    end
                }))
        
       end

    end,
}