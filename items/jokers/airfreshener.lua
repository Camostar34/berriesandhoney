SMODS.Joker {
    key = "airfreshener",
    name = "Air Freshener",
       pronouns = "it_its",
    atlas = "jokers",
    pos = { x = 5, y = 2 },

    config = { extra = {amount = 2, } },
    rarity = 1,
    cost = 3,
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
                    trigger = "immediate",
                    func = (function()
                        if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                            SMODS.add_card({set = 'Berry'})
                            play_sound('polychrome1', 1.2 + math.random() * 0.1, 0.8)
                            card:juice_up(0.3, 0.4)
                        end
                        return true
                    end)
                }))
        
       end

    end,
}