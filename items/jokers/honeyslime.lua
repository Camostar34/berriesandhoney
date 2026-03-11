SMODS.Joker {
    key = "honeyslime",
    name = "Honey Slime",
    pronouns = "she_they",
    atlas = "jokers",
    pos = {
        x = 3,
        y = 10,
     },
    pools = {
        slimerancher = true,
        smsn_sticky = true,
        smsn_berry_themed = true,
     },
    config = {
        extra = {
            odds = 3,
         },
    },
    rarity = 2,
    cost = 6,
    blueprint_compat = false,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = false,

    loc_vars = function(self, info_queue, card)
        local num, denom = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, "honeyslime")
        return {
            vars = { num, denom },
         }
    end,

    calculate = function(self, card, context)
        if context.berry_activate and
            SMODS.pseudorandom_probability(card, "honeyslime", 1, card.ability.extra.odds) then
            local eligible = {}
            for _, v in ipairs(G.hand.cards) do if not v.seal then eligible[#eligible + 1] = v end end
            local conv_card = pseudorandom_element(eligible, pseudoseed("honeyslimecard"))
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound("tarot1")
                    card:juice_up()
                    card_eval_status_text(card, "extra", nil, nil, nil, {
                        message = localize("gold_seal", "labels"),
                        colour = G.C.GOLD,
                        card = card,
                    })
                    return true
                end,
            }))

            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = 0.1,
                func = function()
                    conv_card:set_seal("Gold", nil, true)
                    return true
                end,
            }))
        end
    end,

    credits = {
        code = "GhostSalt",
     },
}
