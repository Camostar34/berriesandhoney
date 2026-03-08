SMODS.Joker {
    key = "fireblanket",
    name = "Fire Blanket",
    atlas = "jokers",
    pos = { x = 0, y = 0 },
    config = { extra = { odds = 4, x_mult_per = 1 } },
    rarity = 2,
    cost = 7,
    blueprint_compat = false,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        if info_queue then
            info_queue[#info_queue + 1] = G.P_CENTERS.m_smsn_gingham
        end
        

        local num, denom = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, "smsn_fireblanket")
        
        return { vars = { num, denom, card.ability.extra.x_mult_per } }
    end,
}