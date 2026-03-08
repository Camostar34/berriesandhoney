SMODS.Joker {
    key = "clubsandwich",
    name = "Club Sandwich",

    atlas = "jokers",
    pos = { x = 7, y = 7 },
  pools = { food = true},
    config = { extra = {bonus = 50, suit = 'Clubs'} },
    rarity = 2,
    cost = 6,
    blueprint_compat = true,
       unlocked = true,
    discovered = true,
    eternal_compat = false,
    perishable_compat = false,
    demicolon_compat = false,

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.bonus} }
    end,

    calculate = function(self, card, context)
       if not context.end_of_round and context.individual and context.cardarea == G.hand and context.other_card:is_suit(card.ability.extra.suit) then
            return {
				card = card,
                chips = card.ability.extra.bonus
            }
        end
    

      if context.final_scoring_step and not context.blueprint then

                local suit_count = 0

                for _, held_card in ipairs(G.hand.cards) do
                    if held_card:is_suit(card.ability.extra.suit) then
                        suit_count = suit_count + 1
                    end
                end

                if suit_count == 0 then
                SMODS.destroy_cards(card, nil, nil, true)
                return {   message = localize('k_eaten_ex')}
                end
        end
       
    end,
}