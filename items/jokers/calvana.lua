SMODS.Joker {
    key = "calvana",
    name = "Calvana Family",
    pronouns = "they_them",
    atlas = "jokers",
    pos = {
        x = 0,
        y = 0,
     },
    pools = {
        oc = true,
     },
    rarity = 2,
    cost = 6,
    blueprint_compat = true,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            for i, v in ipairs(context.scoring_hand) do
                if i > #context.scoring_hand - 2 then break end
                if not v.smsn_calvana_retrigger then
                    local counted = { v }
                    for j = i + 1, #context.scoring_hand do
                        if v:get_id() == context.scoring_hand[j]:get_id() then
                            counted[#counted + 1] = context.scoring_hand[j]
                        end
                    end

                    if #counted >= 3 then
                        counted[1].smsn_calvana_retrigger = true
                        counted[2].smsn_calvana_retrigger = true
                        counted[3].smsn_calvana_retrigger = true
                    end
                end
            end
        end

        if context.repetition and context.cardarea == G.play and context.other_card.smsn_calvana_retrigger then
            return {
                repetitions = 1,
             }
        end

        if context.after and not context.blueprint then
            for i, v in ipairs(G.playing_cards) do v.smsn_calvana_retrigger = false end
        end
    end,

    credits = {
        code = "GhostSalt",
     },
}
