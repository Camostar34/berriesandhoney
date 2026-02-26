SMODS.Joker {
    key = "goldentooth",
    name = "Golden Tooth",
    pronouns = "she_her",
    atlas = "jokers",
    pos = {
        x = 0,
        y = 5,
     },
    config = {
        extra = {
            odds = 4,
         },
    },
    rarity = 1,
    unlocked = true,
    discovered = true,
    cost = 5,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        local num, denom = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, "goldentooth")
        return {
            vars = { num, denom },
         }
    end,

    calculate = function(self, card, context)
        if context.buying_card and context.card ~= card and
            SMODS.pseudorandom_probability(card, "goldentooth", 1, card.ability.extra.odds) then
            smsn_add_gold_cards(1, card)
        end
    end,

    credits = {
        code = "GhostSalt",
     },
}
