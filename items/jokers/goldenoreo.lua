SMODS.Joker {
    key = "goldenoreo",
    name = "Gold Sandwich Cookie",
    pronouns = "any_all",
    atlas = "jokers",
    pos = {
        x = 7,
        y = 10,
     },
    config = {
        extra = {
            money = 2,
         },
    },
    rarity = 1,
    unlocked = true,
    discovered = true,
    cost = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.money },
         }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and
            SMODS.has_enhancement(context.other_card, "m_smsn_cookie") then return { dollars = card.ability.extra.money } end
    end,
}
