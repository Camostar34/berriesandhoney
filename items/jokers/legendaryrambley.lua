SMODS.Joker {
    key = "legendaryrambley",
    name = "Rambley The Raccoon",
    pronouns = "he_him",
    pools = {
        rambley = true, smsn_berry_themed = true,
     },
    atlas = "jokers",
    pos = {
        x = 3,
        y = 3,
     },
    soul_pos = {
        x = 4,
        y = 3,
     },
    config = {
        extra = {
            money = 5,
            smsn_can_rambley = true,
            odds = 4,
            added_balance = 5,
            current_balance = 5,
         },
    },
    rarity = 4,
    cost = 20,
    blueprint_compat = false,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.c_smsn_rambleberry
        info_queue[#info_queue + 1] = G.P_CENTERS.j_smsn_commonrambley
        info_queue[#info_queue + 1] = G.P_CENTERS.j_smsn_uncommonrambley
        info_queue[#info_queue + 1] = G.P_CENTERS.j_smsn_rarerambley
        info_queue[#info_queue + 1] = G.P_CENTERS.j_smsn_rambleydumpy
        return {
            vars = { card.ability.extra.current_balance, card.ability.extra.added_balance },
         }
    end,

    calculate = function(self, card, context)
        -- Rambley Railroad
        if context.joker_main then
            local final_return = {
                smsn_balance_percent = card.ability.extra.current_balance * 0.01,
             }
            if next(context.poker_hands["Straight"]) and #G.consumeables.cards + G.GAME.consumeable_buffer <
                G.consumeables.config.card_limit then
                local face_check = false
                for i = 1, #context.scoring_hand do
                    if context.scoring_hand[i]:is_face() then
                        face_check = true
                        break
                    end
                end
                if face_check then
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = (function()
                            SMODS.add_card {
                                key = "c_smsn_rambleberry",
                             }
                            G.GAME.consumeable_buffer = 0
                            return true
                        end),
                    }))
                    final_return.message = localize("k_plus_legendaryrambley")
                    final_return.colour = G.C.SECONDARY_SET.Tarot
                end
            end

            return final_return
        end

        -- Rambleberry RDRSHR
        if context.smsn_rambley_spend and context.rambley_card == card and card.ability.extra.smsn_can_rambley and
            not context.blueprint and #G.consumeables.cards + G.GAME.consumeable_buffer <
            G.consumeables.config.card_limit then
            ease_dollars(-card.ability.extra.money)
            card.ability.extra.smsn_can_rambley = false
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            G.E_MANAGER:add_event(Event({
                trigger = "before",
                delay = 0.0,
                func = (function()
                    SMODS.add_card {
                        key = "c_smsn_rambleberry",
                        key_append = "legendaryuncommonrambley",
                     }
                    G.GAME.consumeable_buffer = 0
                    return true
                end),
            }))
            return {
                message = localize("k_plus_legendaryrambley"),
                colour = G.C.SECONDARY_SET.Tarot,
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

        -- Retro Rambley
        if context.open_booster and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            G.E_MANAGER:add_event(Event({
                trigger = "before",
                delay = 0.0,
                func = (function()
                    SMODS.add_card {
                        key = "c_smsn_rambleberry",
                        key_append = "legendaryrarerambley",
                     }
                    G.GAME.consumeable_buffer = 0
                    return true
                end),
            }))
            return {
                message = localize("k_plus_legendaryrambley"),
                colour = G.C.SECONDARY_SET.Tarot,
             }
        end

        -- Rambley Dumpy
        if context.setting_blind and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit and
            SMODS.pseudorandom_probability(card, "legendaryrambleydumpy", 1, card.ability.extra.odds) then
            G.GAME.joker_buffer = G.GAME.joker_buffer + 1
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound("timpani")
                    SMODS.add_card {
                        key = "j_egg",
                        key_append = "legendaryrambleydumpy",
                     }
                    G.GAME.joker_buffer = 0
                    card:juice_up()
                    return true
                end,
            }))
        end

        if context.first_hand_drawn and #G.consumeables.cards + G.GAME.consumeable_buffer <
            G.consumeables.config.card_limit then
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            G.E_MANAGER:add_event(Event({
                func = (function()
                    SMODS.add_card {
                        key = "c_smsn_rambleberry",
                        key_append = "legendaryrambleydumpyberry",
                     }
                    G.GAME.consumeable_buffer = 0
                    return true
                end),
            }))
            return {
                message = localize("k_plus_legendaryrambley"),
                colour = G.C.SECONDARY_SET.Tarot,
             }

        end

        if context.end_of_round and context.game_over and context.main_eval and not context.blueprint then

            G.E_MANAGER:add_event(Event({
                func = function()
                    G.hand_text_area.blind_chips:juice_up()
                    G.hand_text_area.game_chips:juice_up()
                    play_sound("tarot1")
                    card:start_dissolve()
                    return true
                end,
            }))
            return {
                message = localize("k_saved_ex"),
                saved = "Saved by Rambley the Raccoon",
                colour = G.C.RED,
             }
        end

        -- bespoke ability
        if context.using_consumeable and context.consumeable.config.center.key == "c_smsn_rambleberry" and not context.blueprint and card.ability.extra.current_balance < 100 then
            card.ability.extra.current_balance = math.min(card.ability.extra.current_balance + card.ability.extra.added_balance, 100)
            return {
                message = localize("k_upgrade_ex"),
             }
        end
    end,
    credits = {
        character = "UniqueGeese / JakeNeutron",
        code = "GhostSalt",
     },
}

-- Thanks, All In Jest!
table.insert(SMODS.calculation_keys, "smsn_balance_percent")
if SMODS.other_calculation_keys then table.insert(SMODS.other_calculation_keys, "smsn_balance_percent") end

local smsn_balance_mixed = false
local smsn_original_smods_calculate_individual_effect = SMODS.calculate_individual_effect
SMODS.calculate_individual_effect = function(effect, scored_card, key, amount, from_edition)
    if key == "smsn_balance_percent" then
        if amount > 1 then amount = 1 end
        if effect.card and effect.card ~= scored_card then juice_card(effect.card) end
        new_hand_chips, new_mult = smsn_calculate_balance_percent_values(hand_chips, mult, amount)

        SMODS.Scoring_Parameters.chips:modify(new_hand_chips - hand_chips)
        SMODS.Scoring_Parameters.mult:modify(new_mult - mult)

        local text = (amount * 100) .. "%"

        G.E_MANAGER:add_event(Event({
            trigger = "immediate",
            func = (function()
                ease_colour(G.C.UI_CHIPS, mix_colours({ 0.8, 0.45, 0.85, 1 }, G.C.UI_CHIPS, amount))
                ease_colour(G.C.UI_MULT, mix_colours({ 0.8, 0.45, 0.85, 1 }, G.C.UI_MULT, amount))
                if not smsn_balance_mixed then
                    smsn_balance_mixed = true
                    G.E_MANAGER:add_event(Event({
                        trigger = "after",
                        blockable = false,
                        blocking = false,
                        delay = 6.3,
                        func = (function()
                            if G.STATE ~= 2 then
                                ease_colour(G.C.UI_CHIPS, G.C.BLUE, 2)
                                ease_colour(G.C.UI_MULT, G.C.RED, 2)
                                smsn_balance_mixed = false
                                return true
                            end
                        end),
                    }))
                end
                return true
            end),
        }))

        if not effect.remove_default_message then
            if from_edition then
                card_eval_status_text(scored_card, "jokers", nil, percent, nil, {
                    message = text,
                    colour = { 0.8, 0.45, 0.85, 1 },
                    sound = "gong",
                    edition = true,
                })
            else
                card_eval_status_text(effect.message_card or effect.juice_card or scored_card or effect.card or
                                          effect.focus, "extra", nil, percent, nil, {
                    message = text,
                    colour = { 0.8, 0.45, 0.85, 1 },
                    sound = "gong",
                    edition = true,
                })
            end
        end

        return true
    end

    return smsn_original_smods_calculate_individual_effect(effect, scored_card, key, amount, from_edition)
end

function smsn_calculate_balance_percent_values(input_hand_chips, input_mult, percent)
    local chip_mod = percent * input_hand_chips
    local mult_mod = percent * input_mult
    local avg = (chip_mod + mult_mod) / 2
    local new_hand_chips = input_hand_chips + (avg - chip_mod)
    local new_mult = input_mult + (avg - mult_mod)

    return new_hand_chips, new_mult
end
