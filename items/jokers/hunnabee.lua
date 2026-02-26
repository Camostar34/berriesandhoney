SMODS.Joker {
    key = "hunnabee",
    name = "Hunnabee",
    pronouns = "she_her",
    atlas = "jokers",
    pos = {
        x = 4,
        y = 8,
     },
    pools = {
        bugsnax = true,
     },
    config = {
        extra = {
            golds = 3,
         },
    },
    rarity = 3,
    unlocked = true,
    discovered = true,
    cost = 9,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_gold
        return {
            vars = { card.ability.extra.golds },
         }
    end,

    calculate = function(self, card, context)
        if context.remove_playing_cards then
            local face_cards = 0
            for _, removed_card in ipairs(context.removed) do
                if removed_card:is_face() then face_cards = face_cards + 1 end
            end
            if face_cards > 0 then
                smsn_add_gold_cards(face_cards * card.ability.extra.golds, context.blueprint_card or card)
            end
        end
    end,

    credits = {
        code = "GhostSalt",
     },
}
