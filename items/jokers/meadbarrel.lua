SMODS.Joker {
    key = "meadbarrel",
   pronouns = "she_they",
    atlas = "jokers",
    pos = { x = 7, y = 12 },
    pools = { },
    config = { extra = { } },
    rarity = 2,
    cost = 6,
    blueprint_compat = false,
       unlocked = true,
        enhancement_gate = 'm_gold',
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = false,

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,

    calculate = function(self, card, context)
       

    end,

    add_to_deck = function(self, card, from_debuff)
        G.GAME.interest_amount = G.GAME.interest_amount - 1
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.GAME.interest_amount = G.GAME.interest_amount + 1
    end,
}