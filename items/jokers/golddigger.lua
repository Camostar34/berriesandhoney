SMODS.Joker { 

    key = "golddigger",
    name = "Gold Digger",
    pronouns = "any_all",
    atlas = "jokers",
    pos = { x = 6, y = 5 },
    pools = { warioware = true, wip = true },
    config = { extra = { } },
    rarity = 2,
    unlocked = true,
    discovered = true,
    cost = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,

    calculate = function(self, card, context)
       
 -- Samson himself does nothing, the stupid idiot. A lovely patch is doing all the work. 
    end,
}
