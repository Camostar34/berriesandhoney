SMODS.Joker {
    key = "coughdrops",
    name = "Honey Cough Drops",

    atlas = "jokers",
    pos = {
        x = 7,
        y = 6,
     },
    pools = {
        Food = true,
     },
    config = {
        extra = {
            money = 25,
         },
    },
    rarity = 2,
    cost = 5,
    blueprint_compat = true,
    unlocked = true,
    discovered = true,
    eternal_compat = false,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_gold
        return {
            vars = { card.ability.extra.money },
         }
    end,

    calculate = function(self, card, context)
        if context.first_hand_drawn then
            local _card = SMODS.create_card {
                set = "Base",
                area = G.discard,
             }
            G.playing_card = (G.playing_card and G.playing_card + 1) or 1
            _card.playing_card = G.playing_card
            table.insert(G.playing_cards, _card)

            G.E_MANAGER:add_event(Event({
                func = function()
                    _card:set_ability("m_gold")
                    G.hand:emplace(_card)
                    _card:start_materialize()
                    G.GAME.blind:debuff_card(_card)
                    G.hand:sort()
                    if context.blueprint_card then
                        context.blueprint_card:juice_up()
                    else
                        card:juice_up()
                    end
                    SMODS.calculate_context({
                        playing_card_added = true,
                        cards = { _card },
                     })
                    save_run()
                    return true
                end,
            }))

            if G.GAME.dollars > card.ability.extra.money then
                card:start_dissolve()
                card_eval_status_text(card, "extra", nil, nil, nil, {
                    message = localize("k_eaten_ex"),
                    colour = G.C.FILTER,
                    card = card,
                })
            end

            return nil, true
        end
    end,
}
