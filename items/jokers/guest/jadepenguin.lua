SMODS.Joker {
    key = "jadepenguin",
    name = "Jade Penguin",
    pools = { guest = true },
    atlas = "jokers",
    pos = { x = 5, y = 4 },
    soul_pos = { x = 6, y = 4 },
    config = { extra = { no_of_cards = 3, odds = 2, money = 4 } },
    rarity = 2,
    cost = 7,
    blueprint_compat = true,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = false,

    loc_vars = function(self, info_queue, card)
        local num, denom = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, "jadepenguin")
        return { vars = { card.ability.extra.no_of_cards, num, denom, card.ability.extra.money } }
    end,

    calculate = function(self, card, context)
        if context.pre_discard and #context.full_hand >= card.ability.extra.no_of_cards and SMODS.pseudorandom_probability(card, "jadepenguin", 1, card.ability.extra.odds) then
            local chosen_card = pseudorandom_element(context.full_hand, pseudoseed("jadepenguin_chosencard"))
            chosen_card.smsn_jadepenguin_markedfordeath = true
        elseif context.discard and context.other_card.smsn_jadepenguin_markedfordeath and not context.blueprint then
            return { dollars = card.ability.extra.money, remove = true }
        end
    end
}
