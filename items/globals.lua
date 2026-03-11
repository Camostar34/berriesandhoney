function SMODS.current_mod.calculate(self, context)
    if context.end_of_round and context.beat_boss and not context.main_eval and not context.game_over then

        for _, card in ipairs(SMODS.find_card("j_smsn_bash", true)) do
            SMODS.debuff_card(card, false, "smsn_bash")
            card:juice_up(0.3, 0.4)
        end
    end

end

local smsn_valid_glazes = {
    "e_smsn_redglaze", "e_smsn_blueglaze", "e_smsn_yellowglaze", "e_smsn_brownglaze", "e_smsn_orangeglaze", "e_smsn_candyglaze"
}

function smsn_apply_random_glaze(card)
    local selected_key = pseudorandom_element(smsn_valid_glazes, pseudoseed("smsn_glaze"))
    card:set_edition(selected_key, true, true)
end

function smsn_apply_different_glaze(card)
    if not (card.edition and G.P_CENTERS[card.edition.key] and G.P_CENTERS[card.edition.key].pools and
        G.P_CENTERS[card.edition.key].pools.Glaze) then return smsn_apply_random_glaze(card) end

    local valid_glazes_temp = {}
    for _, v in ipairs(smsn_valid_glazes) do
        if v ~= card.edition.key then valid_glazes_temp[#valid_glazes_temp + 1] = v end
    end

    local selected_key = pseudorandom_element(valid_glazes_temp, pseudoseed("smsn_glaze"))
    card:set_edition(selected_key, true, true)
end

local drpd_ref = G.FUNCS.draw_from_play_to_discard

G.FUNCS.draw_from_play_to_discard = function(e)

    local peanut_active = next(SMODS.find_card("j_smsn_peanutbutter"))
    local samson_active = next(SMODS.find_card("j_smsn_samson"))

    local play_count = #G.play.cards
    local it = 1

    for k, v in ipairs(G.play.cards) do
        if not v.shattered and not v.destroyed then
            local return_to_hand = false

            if peanut_active then return_to_hand = true end

            if samson_active and SMODS.has_enhancement(v, "m_gold") then return_to_hand = true end

            if v.edition and v.edition.key == "e_smsn_orangeglaze" then return_to_hand = true end

            if return_to_hand then

                draw_card(G.play, G.hand, it * 100 / play_count, "up", true, v)
            else

                draw_card(G.play, G.discard, it * 100 / play_count, "down", false, v)
            end
            it = it + 1
        end
    end
end

function smsn_add_gold_cards(cards, juice_card)
    local _cards = {}
    for i = 1, cards do
        _cards[i] = SMODS.create_card {
            set = "Base",
            area = G.discard,
         }
        G.playing_card = (G.playing_card and G.playing_card + 1) or 1
        _cards[i].playing_card = G.playing_card
        table.insert(G.playing_cards, _cards[i])

        G.E_MANAGER:add_event(Event({
            trigger = "before",
            delay = 0.3,
            func = function()
                juice_card:juice_up()
                G.GAME.blind:debuff_card(_cards[i])
                _cards[i]:set_ability("m_gold")
                _cards[i]:start_materialize({ G.C.SECONDARY_SET.Enhanced })
                G.play:emplace(_cards[i])
                return true
            end,
        }))
    end
    for i = 1, cards do
        G.E_MANAGER:add_event(Event({
            trigger = "before",
            delay = 0.3,
            func = function()
                draw_card(G.play, G.deck, 90, "up", nil, _cards[i])
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.deck.config.card_limit = G.deck.config.card_limit + 1
                        return true
                    end,
                }))
                SMODS.calculate_context({
                    playing_card_added = true,
                    cards = { _cards[i] },
                 })
                save_run()
                return true
            end,
        }))
    end
end


-- food joker stuff, credit to Paperback

if not SMODS.ObjectTypes.Food then
    SMODS.ObjectType {
        key = 'Food',
        default = 'j_egg',
        cards = {},
        inject = function(self)
            SMODS.ObjectType.inject(self)
            
            for k, _ in pairs({
                j_gros_michel = true, j_egg = true, j_ice_cream = true, 
                j_cavendish = true, j_turtle_bean = true, j_diet_cola = true, 
                j_popcorn = true, j_ramen = true, j_selzer = true
            }) do
                self:inject_card(G.P_CENTERS[k])
            end
        end
    }
end