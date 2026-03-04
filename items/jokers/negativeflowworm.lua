SMODS.Joker {

    key = "negativeflowworm",
    name = "Flow Worm (Backlight)",
    pronouns = "any_all",
    atlas = "jokers",
    pos = {
        x = 5,
        y = 5,
     },
    pools = {
        bitsandbops = true,
        wip = true,
     },
    config = {
        extra = {
            rate = 7,
            current_card = 0,
         },
    },
    rarity = 2,
    unlocked = true,
    discovered = true,
    cost = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.e_negative
        info_queue[#info_queue + 1] = G.P_CENTERS.j_smsn_flowworm
        return {
            vars = { card.ability.extra.rate, card.ability.extra.rate - card.ability.extra.current_card },
         }
    end,

    calculate = function(self, card, context)
        if context.discard and not context.blueprint then
            card.ability.extra.current_card = card.ability.extra.current_card + 1
            if card.ability.extra.current_card >= card.ability.extra.rate then
                local v = context.other_card
                card.ability.extra.current_card = 0
                G.E_MANAGER:add_event(Event({
                    trigger = "after",
                    delay = 0.4,
                    func = function()
                        play_sound("tarot1")
                        card:juice_up()
                        return true
                    end,
                }))
                G.E_MANAGER:add_event(Event({
                    trigger = "after",
                    delay = 0.15,
                    func = function()
                        v:flip();
                        play_sound("card1");
                        v:juice_up(0.3, 0.3);
                        return true
                    end,
                }))
                delay(0.2)
                G.E_MANAGER:add_event(Event({
                    trigger = "after",
                    delay = 0.1,
                    func = function()
                        v:set_edition("e_negative", true, true);
                        return true
                    end,
                }))
                G.E_MANAGER:add_event(Event({
                    trigger = "after",
                    delay = 0.15,
                    func = function()
                        v:flip();
                        play_sound("tarot2", 1, 0.6);
                        v:juice_up(0.3, 0.3);
                        return true
                    end,
                }))
                return {
                    message = localize {
                        key = "e_negative",
                        set = "Edition",
                        type = "name_text",
                     },
                    colour = G.C.SECONDARY_SET.Edition,
                }
            end
        end

        if context.end_of_round and not context.individual and not context.repetition and not context.blueprint then
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = 0.15,
                func = function()
                    card:flip();
                    play_sound("card1");
                    card:juice_up(0.3, 0.3);
                    return true
                end,
            }))
            delay(0.2)
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = 0.1,
                func = function()
                    card:set_ability("j_smsn_flowworm");
                    return true
                end,
            }))
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = 0.15,
                func = function()
                    card:flip();
                    play_sound("tarot2", 1, 0.6);
                    card:juice_up(0.3, 0.3);
                    return true
                end,
            }))
        end
    end,

    credits = {
        code = "GhostSalt",
     },
}
