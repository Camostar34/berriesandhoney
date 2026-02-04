-- Cookie
SMODS.Enhancement {
    key = 'cookie',
    atlas = 'centers',
    pos = { x = 0, y = 0 },
    config = { bonus = 50, mult = 15, extra = { uses = 4 }},
    replace_base_card = true,
    no_rank = true,
    no_suit = true,
    always_scores = true,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.bonus, card.ability.mult, card.ability.extra.uses } }
    end,

    calculate = function(self, card, context)
        if context.main_scoring and (context.cardarea == G.play or context.cardarea == G.hand) then
            card.ability.extra.uses =
                math.max(0, (card.ability.extra.uses or 0) - 1)
        end

        if context.destroy_card
           and context.cardarea == G.play
           and context.destroy_card == card
           and card.ability.extra.uses <= 0
        then
            return { remove = true }
        end
    end,
}

-- Gingham
SMODS.Enhancement {
    key = 'gingham',
    atlas = 'centers',
    pos = { x = 1, y = 0 },
    config = { extra = { multper = 3 }},
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.multper } }
    end,

    calculate = function(self, card, context)
        -- Only when THIS card is individually scoring in play

        if context.main_scoring and context.cardarea == G.play then
            local hand = context.full_hand or G.play.cards
            if not hand then return end

            local suits = {}
            for i = 1, #hand do
                suits[hand[i].base.suit] = true
            end

            local unique = 0
            for _ in pairs(suits) do unique = unique + 1 end
            if unique == 0 then return end

            local multper = (card.ability and card.ability.extra and card.ability.extra.multper) or 0
            if multper == 0 then return end

        return {
            mult = multper * unique,
        }
    end
    end,
}