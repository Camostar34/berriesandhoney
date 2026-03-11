SMODS.Joker {
    key = "ghost",
    name = "Ghost",
    pronouns = "she_her",
    atlas = "jokers",
    pos = {
        x = 7,
        y = 11,
     },
    pools = {
        guest = true,
        smsn_berry_themed = true,
     },
    rarity = 2,
    cost = 7,
    blueprint_compat = false,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.c_smsn_booberry
        info_queue[#info_queue + 1] = G.P_CENTERS.c_smsn_frankenberry
        return {}
    end,

    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            local candidates = {}
            for k, v in pairs(context.full_hand) do
                if not SMODS.in_scoring(v, context.scoring_hand) then candidates[#candidates + 1] = v end
            end

            if #candidates > 0 then
                pseudorandom_element(candidates, pseudoseed("smsnghost")).smsn_ghost_marked_for_death = true
            end
        end

        if context.destroy_card and context.destroy_card.smsn_ghost_marked_for_death and not context.blueprint then
            if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local chosen_message = "+1 Booberry"
                        local chosen_card = "c_smsn_booberry"
                        if pseudorandom("smsnghost", 1, 2) == 1 then
                            chosen_message = "+1 Frankenberry"
                            chosen_card = "c_smsn_frankenberry"
                        end
                        local new_card = create_card("smsn_Berry", G.consumables, nil, nil, nil, nil, chosen_card,
                                                     "smsnghost")
                        new_card:add_to_deck()
                        G.consumeables:emplace(new_card)
                        G.GAME.consumeable_buffer = 0
                        new_card:juice_up(0.3, 0.5)
                        card_eval_status_text(card, "extra", nil, nil, nil, {
                            message = chosen_message,
                            colour = G.C.RED,
                         })
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
        character = "GhostSalt",
        code = "GhostSalt"
     },
}
