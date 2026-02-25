SMODS.Joker {
    key = "peoplepleaser",
    name = "People Pleaser",

    atlas = "jokers",
    pos = {
        x = 0,
        y = 10,
     },
    config = {
        extra = {},
     },
    rarity = 1,
    cost = 5,
    blueprint_compat = false,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {},
         }
    end,

    calculate = function(self, card, context)
        if context.after and not context.blueprint then
            local face_cards = {}
            for _, v in ipairs(context.scoring_hand) do
                -- Replace Glazed cards because they don't get new glazes when their old one is removed, for some reason
                if v:is_face() and (not v.edition or (G.P_CENTERS[v.edition.key] and G.P_CENTERS[v.edition.key].pools and G.P_CENTERS[v.edition.key].pools.Glaze)) then face_cards[#face_cards + 1] = v end
            end

            if #face_cards > 0 then
                G.E_MANAGER:add_event(Event({
                    trigger = "after",
                    delay = 0.2,
                    func = function()
                        play_sound("tarot1")
                        card:juice_up()
                        return true
                    end,
                }))
                for i = 1, #face_cards do
                    local percent = 1.15 - (i - 0.999) / (#face_cards - 0.998) * 0.3
                    G.E_MANAGER:add_event(Event({
                        trigger = "after",
                        delay = 0.15,
                        func = function()
                            face_cards[i]:flip();
                            play_sound("card1", percent);
                            face_cards[i]:juice_up(0.3, 0.3);
                            return true
                        end,
                    }))
                end
                for i = 1, #face_cards do
                    G.E_MANAGER:add_event(Event({
                        trigger = "after",
                        delay = 0.1,
                        func = function()
                            smsn_apply_random_glaze(face_cards[i])
                            return true
                        end,
                    }))
                end
                for i = 1, #face_cards do
                    local percent = 0.85 + (i - 0.999) / (#face_cards - 0.998) * 0.3
                    G.E_MANAGER:add_event(Event({
                        trigger = "after",
                        delay = 0.15,
                        func = function()
                            face_cards[i]:flip();
                            play_sound("tarot2", percent, 0.6);
                            face_cards[i]:juice_up(0.3, 0.3);
                            return true
                        end,
                    }))
                end
                G.E_MANAGER:add_event(Event({
                    trigger = "after",
                    delay = 0.5,
                    func = function()
                        card_eval_status_text(card, "extra", nil, nil, nil, {
                            message = localize("k_m_smsn_glazed_ex"),
                            colour = G.C.FILTER,
                            card = card,
                        })
                        return true
                    end,
                }))
            end
        end
    end,
}
