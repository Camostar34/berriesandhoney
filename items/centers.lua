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

SMODS.Enhancement {
    key = 'gingham',
    atlas = 'centers',
    pos = { x = 1, y = 0 },
    config = { extra = { multper = 3 }},
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.multper } }
    end,

    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            local suit_count = 0
            for k, _ in pairs(SMODS.Suits) do
                for i = 1, #context.full_hand do
                    if context.full_hand[i]:is_suit(k) then
                        suit_count = suit_count + 1
                        break
                    end
                end
            end

            if suit_count > 0 then
               
                if next(SMODS.find_card('j_smsn_fireblanket')) and SMODS.pseudorandom_probability(card, "smsn_fireblanket", 1, 4) then
                    return {
                        x_mult = 1 * suit_count,
                    }
                elseif card.ability.extra.multper > 0 then
                    return {
                        mult = card.ability.extra.multper * suit_count,
                    }
                end
            end
        end
    end,
}