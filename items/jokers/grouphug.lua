SMODS.Joker {
    key = "grouphug",
    name = "Group Hug!",
    pronouns = "any_all",
    atlas = "jokers",
    pos = {
        x = 0,
        y = 0,
     },
    config = {
        extra = {
            mult = 12,
         },
    },
    rarity = 2,
    unlocked = true,
    discovered = true,
    cost = 5,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.mult },
         }
    end,

    calculate = function(self, card, context)
        if context.other_joker and context.other_joker.config.center and context.other_joker.config.center.pools and
            (context.other_joker.config.center.pools.oc or context.other_joker.config.center.pools.guest) then
            return {
                mult = card.ability.extra.mult,
             }
        end
    end,
}
