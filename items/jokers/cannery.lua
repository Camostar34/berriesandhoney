SMODS.Joker {
    key = "cannery",
    name = "Cannery",
    pools = {smsn_berry_themed = true,},
    atlas = "jokers",
    pos = {
        x = 1,
        y = 7,
     },
    config = {
        extra = {
            odds = 5,
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
        local num, denom = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, "cannery")
        return {
            vars = { num, denom },
         }
    end,

    calculate = function(self, card, context)
        if context.discard and not context.other_card.debuff and
            SMODS.pseudorandom_probability(card, "cannery", 1, card.ability.extra.odds) and not context.other_card.seal then
            local conv_card = context.other_card
            
            G.E_MANAGER:add_event(Event({
                trigger = "before",
                delay = 0.2,
                func = function()
                    play_sound('tarot1')
                    card:juice_up()
                    return true
                end,
            }))

            G.E_MANAGER:add_event(Event({
                trigger = "before",
                delay = 0.4,
                func = function()
                    conv_card:set_seal("smsn_freshness", nil, true)
                    return true
                end,
            }))
        end
    end,
    credits = {
        art = "Candycanearter07",
        code = "GhostSalt"
     },
}
