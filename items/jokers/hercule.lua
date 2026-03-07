SMODS.Joker {
    key = "hercule",
    name = "Hercule",
    pronouns = "he_they",
    atlas = "jokers",
    pos = {
        x = 0,
        y = 0,
     },
    pools = {
        oc = true,
     },
    config = {
        extra = {
            draw_bonus_lower = 1,
            draw_bonus_upper = 5,
         },
    },
    rarity = 1,
    cost = 4,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.draw_bonus_lower, card.ability.extra.draw_bonus_upper },
         }
    end,

    calculate = function(self, card, context)
        if context.first_hand_drawn then
            local draw_bonus = pseudorandom("hercule", card.ability.extra.draw_bonus_lower, card.ability.extra.draw_bonus_upper)
            local v = context.blueprint_card or card
            v:juice_up()
            for i = 1, draw_bonus do
                draw_card(G.deck, G.hand, i * 100 / draw_bonus, "up", true)
            end
        end
    end,
    credits = {
        code = "GhostSalt",
     },
}
