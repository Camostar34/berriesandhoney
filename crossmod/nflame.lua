SMODS.Joker { --Samson

    key = "microplastics",
    name = "Full of Microplastics",

    atlas = "crossmodjokers",
    pos = { x = 0, y = 0 },
    pools = {
        ["silicon"] = true,
    },
    config = { extra = { } },
    rarity = 2,
    unlocked = true,
    discovered = true,
    cost = 5,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,

    calculate = function(self, card, context)

        if context.setting_blind and G.GAME.blind.boss then
            

            for i = 1, G.nflame_get_silicontotal(context) do
            SMODS.add_card({set = "Berry", area = G.consumeables})
            end

        end
       

    end,
}

SMODS.Joker { 

    key = "rabbicksappy",
    name = "Rabbick Sappy",

    atlas = "crossmodjokers",
    pos = { x = 2, y = 0 },
    config = { extra = { } },
    rarity = 2,
    unlocked = true,
    discovered = true,
    cost = 5,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,

    calculate = function(self, card, context)
       

    end,
}


SMODS.Joker { 

    key = "evilsappy",
    name = "Evil Sappy (Yappy)",

    atlas = "crossmodjokers",
    pos = { x = 1, y = 0 },
    config = { extra = { current = 1, gain = 0.25 } },
    rarity = 2,
    unlocked = true,
    discovered = true,
    cost = 5,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.current, card.ability.extra.gain} }
    end,

    calculate = function(self, card, context)
       

    end,
}

SMODS.Joker { 

    key = "nostalgicsappy",
    name = "Nostalgic Sappy",

    atlas = "crossmodjokers",
    pos = { x = 1, y = 1 },
    config = { extra = {} },
    rarity = 2,
    unlocked = true,
    discovered = true,
    cost = 5,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,

    calculate = function(self, card, context)
       

    end,
}

SMODS.Joker { 

    key = "papersappy",
    name = "Paper Sappy",

    atlas = "crossmodjokers",
    pos = { x = 2, y = 1 },
    config = { extra = {rounds = 3, reduction = 25, current = 0,  } },
    rarity = 2,
    unlocked = true,
    discovered = true,
    cost = 5,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.rounds, card.ability.extra.reduction, card.ability.extra.current} }
    end,

    calculate = function(self, card, context)
       

    end,
}

SMODS.Joker { 

    key = "jollysappy",
    name = "Jolly Sappy",

    atlas = "crossmodjokers",
    pos = { x = 4, y = 1 },
    config = { extra = {rounds = 3, reduction = 25, current = 0,  } },
    rarity = 1,
    unlocked = true,
    discovered = true,
    cost = 5,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.rounds, card.ability.extra.reduction, card.ability.extra.current} }
    end,

    calculate = function(self, card, context)
       

    end,
}