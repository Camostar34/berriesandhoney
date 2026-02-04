SMODS.Joker { 

    key = "goldenoreo",
    name = "Gold Sandwich Cookie",
    pronouns = "any_all",
    atlas = "jokers",
    pos = { x = 7, y = 10 },
    config = { extra = { reward = 2} },
    rarity = 2,
    unlocked = true,
    discovered = true,
    pools = { wip = true},
    cost = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.reward} }
    end,

    calculate = function(self, card, context)
       
 -- Samson himself does nothing, the stupid idiot. A lovely patch is doing all the work. 
    end,
}
