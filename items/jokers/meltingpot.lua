SMODS.Joker {
    key = "meltingpot",
   pronouns = "she_they",
    atlas = "jokers",
    pos = { x = 0, y = 0 },
    pools = { },
    config = { extra = {  } },
    rarity = 2,
    cost = 6,
    blueprint_compat = false,
       unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = false,

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,

    calculate = function(self, card, context)
       

    end,
}