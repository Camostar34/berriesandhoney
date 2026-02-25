SMODS.Joker {
    key = "cookiemonster",
    name = "Cookie Monster",

    atlas = "jokers",
    pos = { x = 2, y = 10 },
    pools = { sesamestreet = true },
    config = { extra = { added_xchips = 0.25, current_xchips = 1, odds = 4 } },
    rarity = 2,
    cost = 6,
    blueprint_compat = true,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = false,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        local num, denom = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, "cookiemonster")
        return { vars = { card.ability.extra.added_xchips, card.ability.extra.current_xchips, num, denom } }
    end,

    calculate = function(self, card, context)
        if context.remove_playing_cards and not context.blueprint then
            local cookies = 0
            for _, removed_card in ipairs(context.removed) do
                if SMODS.has_enhancement(removed_card, "m_smsn_cookie") then cookies = cookies + 1 end
            end
            if cookies > 0 then
                card.ability.extra.current_xchips = card.ability.extra.current_xchips + (cookies * card.ability.extra.added_xchips)
                return { message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.current_xchips } } }
            end
        end
        if context.joker_main then
            return { xchips = card.ability.extra.current_xchips }
        end

        if context.destroy_card
        and SMODS.has_enhancement(context.destroy_card, "m_smsn_cookie")
        and SMODS.pseudorandom_probability(card, "cookiemonster", 1, card.ability.extra.odds)
        and not context.blueprint then return { remove = true } end
    end,
    enhancement_gate = "m_smsn_cookie"
}