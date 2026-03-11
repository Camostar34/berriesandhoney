SMODS.Joker {
    key = "rarerambley",
    name = "Retro Rambley",
    pronouns = "he_him",
    atlas = "jokers",
    pos = {
        x = 4,
        y = 1,
     },
    soul_pos = {
        x = 5,
        y = 1,
     },
    pools = {
        rambley = true, smsn_berry_themed = true,
     },
    rarity = 3,
    cost = 8,
    blueprint_compat = true,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        if not card.fake_card then info_queue[#info_queue + 1] = G.P_CENTERS.c_smsn_rambleberry end
        return {
            vars = {},
         }
    end,

    calculate = function(self, card, context)
        if context.open_booster and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            G.E_MANAGER:add_event(Event({
                trigger = "before",
                delay = 0.0,
                func = (function()
                    SMODS.add_card {
                        key = "c_smsn_rambleberry",
                        key_append = "rarerambley",
                     }
                    G.GAME.consumeable_buffer = 0
                    return true
                end),
            }))
            return {
                message = localize("k_plus_rarerambley"),
                colour = G.C.SECONDARY_SET.Tarot,
             }
        end
    end,
    credits = {
        character = "UniqueGeese / JakeNeutron",
        code = "GhostSalt"
     },
}
