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