SMODS.Joker { -- ROA Samson
    key = "rivalssamson",
    name = "ROA Samson",
    pronouns = "he_him",
    atlas = "jokers",
    pos = {
        x = 1,
        y = 0,
     },
    pools = {
        oc = true,
     },
    config = {
        extra = {
            create = 2,
         },
    },
    rarity = 3,
    cost = 9,
    blueprint_compat = false,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.create },
         }
    end,

    calculate = function(self, card, context)
        if context.destroy_card and context.cardarea == G.play and #G.play.cards == 1 and
            SMODS.has_enhancement(G.play.cards[1], "m_gold") then
            local conv_cards = {}
            for i = 1, card.ability.extra.create do
                local eligables = {}
                for _, v in ipairs(G.hand.cards) do
                    if not next(SMODS.get_enhancements(v)) then
                        local found = false
                        for _, vv in ipairs(conv_cards) do
                            if vv == v then
                                found = true
                                break
                            end
                        end
                        if not found then eligables[#eligables + 1] = v end
                    end
                end
                conv_cards[#conv_cards + 1] = pseudorandom_element(eligables, pseudoseed("rivalssamson"))
            end

            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound("tarot1")
                    card:juice_up()
                    card_eval_status_text(card, "extra", nil, nil, nil, {
                        message = localize("k_gold"),
                        colour = G.C.MONEY,
                        card = card,
                    })
                    return true
                end,
            }))

            for i = 1, #conv_cards do
                local percent = 1.15 - (i - 0.999) / (#conv_cards - 0.998) * 0.3
                G.E_MANAGER:add_event(Event({
                    trigger = "after",
                    delay = 0.15,
                    func = function()
                        conv_cards[i]:flip();
                        play_sound("card1", percent);
                        conv_cards[i]:juice_up(0.3, 0.3);
                        return true
                    end,
                }))
            end
            delay(0.2)
            for i = 1, #conv_cards do
                G.E_MANAGER:add_event(Event({
                    trigger = "after",
                    delay = 0.1,
                    func = function()
                        conv_cards[i]:set_ability("m_gold")
                        return true
                    end,
                }))
            end
            for i = 1, #conv_cards do
                local percent = 0.85 + (i - 0.999) / (#conv_cards - 0.998) * 0.3
                G.E_MANAGER:add_event(Event({
                    trigger = "after",
                    delay = 0.15,
                    func = function()
                        conv_cards[i]:flip();
                        play_sound("tarot2", percent, 0.6);
                        conv_cards[i]:juice_up(0.3, 0.3);
                        return true
                    end,
                }))
            end

            return {
                remove = true,
             }
        end
    end,

    credits = {
        code = "GhostSalt",
     },
}
