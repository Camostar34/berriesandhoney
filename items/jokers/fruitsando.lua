SMODS.Joker {
    key = "fruitsando",
    name = "Fruit Sando",
   pronouns = "she_they",
    atlas = "jokers",
    pos = { x = 1, y = 8 },
    pools = { food = true},
    config = { extra = { bonus = 1.25, odds = 2 } },
    rarity = 2,
    cost = 4,
    blueprint_compat = true,
       unlocked = true,
    discovered = true,
    eternal_compat = false,
    perishable_compat = false,
    demicolon_compat = false,

    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'smsn_fruitsando')
        return { vars = {card.ability.extra.bonus, numerator, denominator } }
    end,

    calculate = function(self, card, context)

        
        if context.other_consumeable and context.other_consumeable.ability.set == 'Berry' then
            return {
                xchips = card.ability.extra.bonus,
                card = card
            }
        end

        if context.berry_activate and not context.blueprint then
            if SMODS.pseudorandom_probability(card, 'smsn_fruitsando', 1, card.ability.extra.odds) then
                SMODS.destroy_cards(card, nil, nil, true)
                    return {   message = localize('k_eaten_ex')}
            end
        end

    end,
       
}