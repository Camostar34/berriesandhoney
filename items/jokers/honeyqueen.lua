SMODS.Joker {
    key = "honeyqueen",
    pronouns = "she_they",
    atlas = "jokers",
    pos = {
        x = 0,
        y = 0,
     },
    rarity = 4,
    cost = 20,
    blueprint_compat = true,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = false,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_gold
        return {}
    end,

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play and context.other_card:get_id() == 12 then
            local repetitions = 0
            for _, v in ipairs(G.hand.cards) do
                if SMODS.has_enhancement(v, "m_gold") then repetitions = repetitions + 1 end
            end
            if repetitions == 0 then return end
            return {
                repetitions = repetitions,
             }
        end
    end,
}
