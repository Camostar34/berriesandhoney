SMODS.Joker {
    key = "uncommonrambley",
    name = "Rambley RFRSHR",
    pronouns = "he_him",
    atlas = "jokers",
    pos = {
        x = 0,
        y = 0,
     },
    pools = {
        rambley = true,
     },
    config = {
        extra = {
            money = 5,
            smsn_can_rambley = true,
         },
    },
    rarity = 2,
    cost = 5,
    blueprint_compat = false,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.c_smsn_rambleberry
        return {
            vars = {
                card.ability.extra.money,
                card.ability.extra.smsn_can_rambley and localize("k_rambleactive") or localize("k_rambleinactive"),
            },
        }
    end,

    calculate = function(self, card, context)
        if context.smsn_rambley_spend and context.rambley_card == card and card.ability.extra.smsn_can_rambley and not context.blueprint and
            #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            ease_dollars(-card.ability.extra.money)
            card.ability.extra.smsn_can_rambley = false
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            G.E_MANAGER:add_event(Event({
                trigger = "before",
                delay = 0.0,
                func = (function()
                    SMODS.add_card {
                        key = "c_smsn_rambleberry",
                        key_append = "uncommonrambley",
                     }
                    G.GAME.consumeable_buffer = 0
                    return true
                end),
            }))
            return {
                message = localize("k_plus_uncommonrambley"),
                colour = G.C.PURPLE,
             }
        end

        if context.end_of_round and not context.individual and not context.repetition and not context.blueprint and
            G.GAME.last_blind and G.GAME.last_blind.boss then
            card.ability.extra.smsn_can_rambley = true
            return {
                message = localize("k_reset"),
                colour = G.C.GREEN,
             }
        end
    end,
    credits = {
        character = "UniqueGeese / JakeNeutron",
     },
}

local sell_use_ref = G.UIDEF.use_and_sell_buttons
function G.UIDEF.use_and_sell_buttons(card)
    if not card or not card.config or not card.config.center or card.config.center.key ~= "j_smsn_uncommonrambley" then
        return sell_use_ref(card)
    end

    local sell = {
        n = G.UIT.C,
        config = {
            align = "cr",
         },
        nodes = {
            {
                n = G.UIT.C,
                config = {
                    ref_table = card,
                    align = "cr",
                    padding = 0.1,
                    r = 0.08,
                    minw = 1.25,
                    hover = true,
                    shadow = true,
                    colour = G.C.UI.BACKGROUND_INACTIVE,
                    one_press = true,
                    button = "sell_card",
                    func = "can_sell_card",
                },
                nodes = {
                    {
                        n = G.UIT.B,
                        config = {
                            w = 0.1,
                            h = 0.6,
                         },
                    }, {
                        n = G.UIT.C,
                        config = {
                            align = "tm",
                         },
                        nodes = {
                            {
                                n = G.UIT.R,
                                config = {
                                    align = "cm",
                                    maxw = 1.25,
                                 },
                                nodes = {
                                    {
                                        n = G.UIT.T,
                                        config = {
                                            text = localize("b_sell"),
                                            colour = G.C.UI.TEXT_LIGHT,
                                            scale = 0.4,
                                            shadow = true,
                                        },
                                    },
                                },
                            }, {
                                n = G.UIT.R,
                                config = {
                                    align = "cm",
                                 },
                                nodes = {
                                    {
                                        n = G.UIT.T,
                                        config = {
                                            text = localize("$"),
                                            colour = G.C.WHITE,
                                            scale = 0.4,
                                            shadow = true,
                                         },
                                    }, {
                                        n = G.UIT.T,
                                        config = {
                                            ref_table = card,
                                            ref_value = "sell_cost_label",
                                            colour = G.C.WHITE,
                                            scale = 0.55,
                                            shadow = true,
                                        },
                                    },
                                },
                            },
                        },
                    },
                },
            },
        },
    }

    local rambley_use = {
        n = G.UIT.C,
        config = {
            align = "cr",
         },
        nodes = {
            {
                n = G.UIT.C,
                config = {
                    ref_table = card,
                    align = "cr",
                    padding = 0.1,
                    r = 0.08,
                    minw = 1.25,
                    hover = true,
                    shadow = true,
                    colour = G.C.UI.BACKGROUND_INACTIVE,
                    one_press = true,
                    button = "smsn_use_rambley",
                    func = "smsn_can_use_rambley",
                },
                nodes = {
                    {
                        n = G.UIT.B,
                        config = {
                            w = 0.1,
                            h = 0.6,
                         },
                    }, {
                        n = G.UIT.C,
                        config = {
                            align = "tm",
                         },
                        nodes = {
                            {
                                n = G.UIT.R,
                                config = {
                                    align = "cm",
                                    maxw = 1.25,
                                 },
                                nodes = {
                                    {
                                        n = G.UIT.T,
                                        config = {
                                            text = localize("b_use"),
                                            colour = G.C.UI.TEXT_LIGHT,
                                            scale = 0.4,
                                            shadow = true,
                                        },
                                    },
                                },
                            }, {
                                n = G.UIT.R,
                                config = {
                                    align = "cm",
                                 },
                                nodes = {
                                    {
                                        n = G.UIT.T,
                                        config = {
                                            text = localize("$"),
                                            colour = G.C.WHITE,
                                            scale = 0.4,
                                            shadow = true,
                                         },
                                    }, {
                                        n = G.UIT.T,
                                        config = {
                                            ref_table = card.ability.extra,
                                            ref_value = "money",
                                            colour = G.C.WHITE,
                                            scale = 0.55,
                                            shadow = true,
                                        },
                                    },
                                },
                            },
                        },
                    },
                },
            },
        },
    }
    return {
        n = G.UIT.ROOT,
        config = {
            padding = 0,
            colour = G.C.CLEAR,
         },
        nodes = {
            {
                n = G.UIT.C,
                config = {
                    padding = 0.15,
                    align = "cl",
                 },
                nodes = {
                    {
                        n = G.UIT.R,
                        config = {
                            align = "cl",
                         },
                        nodes = { sell },
                    }, {
                        n = G.UIT.R,
                        config = {
                            align = "cl",
                         },
                        nodes = { rambley_use },
                    },
                },
            },
        },
    }
end

G.FUNCS.smsn_use_rambley = function(e)
    SMODS.calculate_context({
        smsn_rambley_spend = true,
        rambley_card = e.config.ref_table,
     })
end

G.FUNCS.smsn_can_use_rambley = function(e)

    if not ((G.play and #G.play.cards > 0) or (G.CONTROLLER.locked) or (G.GAME.STOP_USE and G.GAME.STOP_USE > 0)) and
        G.GAME.dollars - G.GAME.bankrupt_at >= e.config.ref_table.ability.extra.money and
        e.config.ref_table.ability.extra.smsn_can_rambley then
        e.config.colour = G.C.GOLD
        e.config.button = "smsn_use_rambley"
    else
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        e.config.button = nil
    end
end
