SMODS.Joker {
    key = "cozy",
    name = "Cozy Fluffer Snugglepaws",
    pronouns = "any_all",
    atlas = "jokers",
    pos = {
        x = 0,
        y = 0,
     },
    pools = {
        guest = true,
     },
    config = {
        extra = {
            plus_hand_size = 3,
            minus_selection_limit = 1,
         },
    },
    rarity = 2,
    cost = 6,
    blueprint_compat = false,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.plus_hand_size, card.ability.extra.minus_selection_limit },
         }
    end,

    add_to_deck = function(self, card, from_debuff)
        G.hand:change_size(card.ability.extra.plus_hand_size)
        G.hand.config.highlighted_limit = G.hand.config.highlighted_limit - card.ability.extra.minus_selection_limit
        if not G.GAME.before_play_buffer then G.hand:unhighlight_all() end
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.hand:change_size(-card.ability.extra.plus_hand_size)
        G.hand.config.highlighted_limit = G.hand.config.highlighted_limit + card.ability.extra.minus_selection_limit
    end,

    credits = {
        character = "Reaver of Souls",
        code = "GhostSalt",
     },
}

