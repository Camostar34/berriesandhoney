SMODS.Joker {
    key = "sappy",
    name = "Sappy",
    pronouns = "he_him",
    atlas = "jokers",
    pos = {
        x = 2,
        y = 4,
     },
    pools = {
        guest = true,
     },
    config = {
        extra = {
            draw_bonus = 0,
         },
    },
    rarity = 2,
    cost = 6,
    blueprint_compat = true,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_SEALS.Gold
        return {}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and (context.other_card:is_suit("Diamonds") or context.other_card.seal == "Gold") and not context.blueprint then
            card.ability.extra.draw_bonus = card.ability.extra.draw_bonus + 1
        end

        if context.hand_drawn and card.ability.extra.draw_bonus > 0 then
            local v = context.blueprint_card or card
            v:juice_up()
            for i = 1, card.ability.extra.draw_bonus do
                draw_card(G.deck, G.hand, i * 100 / card.ability.extra.draw_bonus, 'up', true)
            end
            card.ability.extra.draw_bonus = 0
        end
    end,
    credits = {
        character = "Candycanearter07",
        idea = "Candycanearter07",
        code = "GhostSalt",
     },
}
