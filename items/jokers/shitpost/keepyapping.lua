SMODS.Joker { 

    key = "keepyapping",
    name = "Keep Yapping Your Mouth, Buddy",
    pronouns = "any_all",
    atlas = "jokers",
    pos = { x = 0, y = 0 },
    pools = { shitpost = true, wip = true },
    config = { extra = { multper = 1, current = 0 } },
    rarity = 2,
    unlocked = true,
    discovered = true,
    cost = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.multper, card.ability.extra.multper} }
    end,

    calculate = function(self, card, context)

       if context.joker_main then
        return { mult = char_count * card.ability.extra.multper}
       end

    end,


    update = function(self, card, dt)
    if G.GAME and G.GAME.blind and G.GAME.blind.config and G.GAME.blind.config.blind then
        local center = G.GAME.blind.config.blind

            local lines = localize{
                type = "descriptions",
                set  = center.set or "Blind",
                key  = center.key,
            } or {}

            local desc = table.concat(lines, " ")
            local char_count = #desc
    end
    end
}
