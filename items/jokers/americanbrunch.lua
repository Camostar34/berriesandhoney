SMODS.Joker {
    key = "americanbrunch",
    name = "American Brunch",
      pronouns = "she_her",
    atlas = "jokers",
    pos = { x = 0, y = 0 },
    pools = { wip = true},
    config = { extra = { berrybonus = 2 } },
    rarity = 2,
    cost = 4,
    blueprint_compat = false,
       unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = false,

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.berrybonus} }
    end,

    calculate = function(self, card, context)
       

    end,
}
