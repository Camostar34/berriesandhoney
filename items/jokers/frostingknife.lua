SMODS.Joker {
    key = "frostingknife",
    name = "Frosting Knife",

    atlas = "jokers",
    pos = {
        x = 4,
        y = 10,
     },
    config = {
        extra = {
            odds = 4,
         },
    },
    rarity = 1,
    cost = 5,
    blueprint_compat = true,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        local num, denom = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, "frostingknife")
        return {
            vars = { num, denom },
         }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card.edition and
            G.P_CENTERS[context.other_card.edition.key] and G.P_CENTERS[context.other_card.edition.key].pools and
            G.P_CENTERS[context.other_card.edition.key].pools.Glaze and
            SMODS.pseudorandom_probability(card, "frostingknife", 1, card.ability.extra.odds) and #context.scoring_hand >
            1 then
            local me
            for i, v in ipairs(context.scoring_hand) do if v == context.other_card then me = i end end
            local affected = {}
            if context.scoring_hand[me - 1] then affected[#affected + 1] = context.scoring_hand[me - 1] end
            if context.scoring_hand[me + 1] then affected[#affected + 1] = context.scoring_hand[me + 1] end
            local other_card = context.other_card

            if next(affected) then
                G.E_MANAGER:add_event(Event({
                    trigger = "after",
                    delay = 0.4,
                    func = function()
                        play_sound("tarot1")
                        card:juice_up()
                        return true
                    end,
                }))
                for i = 1, #affected do
                    local percent = 1.15 - (i - 0.999) / (#affected - 0.998) * 0.3
                    G.E_MANAGER:add_event(Event({
                        trigger = "after",
                        delay = 0.15,
                        func = function()
                            affected[i]:flip();
                            play_sound("card1", percent);
                            affected[i]:juice_up(0.3, 0.3);
                            return true
                        end,
                    }))
                end
                delay(0.2)
                G.E_MANAGER:add_event(Event({
                    blocking = false,
                    func = function()
                        other_card:juice_up()
                        return true
                    end,
                }))
                for i = 1, #affected do
                    affected[i].smsn_preserve_glaze = true
                    G.E_MANAGER:add_event(Event({
                        trigger = "after",
                        delay = 0.1,
                        func = function()
                            affected[i]:set_edition(other_card.edition.key, true, true);
                            return true
                        end,
                    }))
                end
                for i = 1, #affected do
                    local percent = 0.85 + (i - 0.999) / (#affected - 0.998) * 0.3
                    G.E_MANAGER:add_event(Event({
                        trigger = "after",
                        delay = 0.15,
                        func = function()
                            affected[i]:flip();
                            play_sound("tarot2", percent, 0.6);
                            affected[i]:juice_up(0.3, 0.3);
                            return true
                        end,
                    }))
                end
                delay(0.2)
                return { message = localize("k_m_smsn_glazed_ex"), colour = G.C.FILTER }
            end
        end
    end,
}
