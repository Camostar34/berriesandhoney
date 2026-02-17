SMODS.Joker {
    key = "piggybank",
    name = "Piggy Bank",

    atlas = "jokers",
    pos = { x = 6, y = 2 },
    pools = { },
    config = { extra = { reward = 15 } },
    rarity = 2,
    cost = 3,
    blueprint_compat = false,
       unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.reward} }
    end,

    calculate = function(self, card, context)
       
       if context.remove_playing_cards then
            for _, removed_card in ipairs(context.removed) do
                if SMODS.has_enhancement(removed_card, 'm_gold') then  
                    G.E_MANAGER:add_event(Event({
                    trigger = "immediate",
                    func = (function()
                            SMODS.calculate_effect({ dollars = card.ability.extra.reward }, card)
                        return true
                    end)
                }))
                end
            end
           
           

        end
    end,
}