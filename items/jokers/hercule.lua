SMODS.Joker { 
    key = "hercule",
    name = "Hercule",
    pronouns = "he_they",
    atlas = "jokers",
    pos = { x = 0, y = 0 },

    config = { extra = { cards_draw = 1, hand_played = false,} },
    rarity = 1,
    cost = 3,
       unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.cards_draw} }
    end,

    calculate = function(self, card, context)
       
        if context.hand_drawn and card.ability.extra.hand_played == false then
          
            card.ability.extra.hand_played = true
            return {
                card = card,
            }
        end

        if context.discard or context.before then
          SMODS.draw_cards(card.ability.extra.cards_draw)
        end


    end,
}