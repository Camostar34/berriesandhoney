SMODS.Joker {
    key = "crazyglazer",
    name = "Crazy Glazer",

    atlas = "jokers",
    pos = { x = 6, y = 10 },
    pools = { wip = true},
    config = { extra = {odds = 4} },
    rarity = 1,
    cost = 3,
    blueprint_compat = false,
       unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

  loc_vars = function(self, info_queue, card)
          local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'smsn_crazyglazer')
        return { vars = {numerator, denominator} }
    end,

    calculate = function(self, card, context)

      

    end,
}