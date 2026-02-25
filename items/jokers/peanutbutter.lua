SMODS.Joker {
    key = "peanutbutter",
    name = "Peanut Butter",

    atlas = "jokers",
    pos = { x = 3, y = 9 },
    pools = { Food = true},
    config = { extra = {hands = 5} },
    rarity = 2,
    cost = 5,
    blueprint_compat = false,
       unlocked = true,
    discovered = true,
    eternal_compat = false,
    perishable_compat = false,
    demicolon_compat = false,

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.hands} }
    end,

    calculate = function(self, card, context)

      if context.after then

        if card.ability.extra.hands > 1 then
            card.ability.extra.hands = card.ability.extra.hands - 1
            return {
                message = tostring(card.ability.extra.hands)
            }
        else if card.ability.extra.hands <= 1 then
            SMODS.destroy_cards(card, nil, nil, true)
                return {   message = localize('k_eaten_ex')}
                
        end

      end

    end
end
}