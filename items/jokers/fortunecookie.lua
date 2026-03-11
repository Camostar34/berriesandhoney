SMODS.Joker {
    key = "fortunecookie",
    name = "Fortune Cookie",
    atlas = "jokers",
    pos = {
        x = 1,
        y = 6,
     },
    pools = {
        Food = true,
        smsn_sticky = true,
     },
    config = {
        extra = {
            money = 6,
            decrease = 2,
         },
    },
    rarity = 1,
    unlocked = true,
    discovered = true,
    cost = 6,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.c_devil
        return {
            vars = { card.ability.extra.money, card.ability.extra.decrease },
         }
    end,

    calculate = function(self, card, context)
        if context.end_of_round and not context.individual and not context.repetition and not context.blueprint and card.ability.extra.money <= 0 then
            if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local new_card = create_card("Tarot", G.consumables, nil, nil, nil, nil, "c_devil",
                                                     "fortunecookie")
                        new_card:add_to_deck()
                        G.consumeables:emplace(new_card)
                        G.GAME.consumeable_buffer = 0
                        new_card:juice_up(0.3, 0.5)
                        return true
                    end,
                }))
            end
            card:start_dissolve()
            return {
                message = localize("k_eaten_ex"),
                colour = G.C.FILTER,
             }
        end
    end,
    calc_dollar_bonus = function(self, card)
        local bonus = card.ability.extra.money
        card.ability.extra.money = card.ability.extra.money - card.ability.extra.decrease
        return bonus
    end,
     credits = {
		code = "GhostSalt"             
	}
}
