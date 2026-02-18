SMODS.Joker {
    key = "berryboy",
    name = "Berryboy Joker",
    pronouns = "he_him",
    atlas = "jokers",
    pos = { x = 3, y = 1 },
    pools = { shitpost = true },
    config = { extra = {} },
    rarity = 1,
    cost = 3,
    blueprint_compat = false,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.c_death
        info_queue[#info_queue + 1] = G.P_CENTERS.c_hanged_man
        return {}
    end,

    calculate = function(self, card, context)
        if context.selling_card and context.card.config.center.set == "Berry" and #G.consumeables.cards + G.GAME.consumeable_buffer <= G.consumeables.config.card_limit then
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1

            local chosen_message = '+1 Death'
            local chosen_card = 'c_death'
            if pseudorandom('berryboy', 1, 2) == 1 then
                chosen_card = 'c_hanged_man'
                chosen_message = '+1 Hanged Man'
            end

            G.E_MANAGER:add_event(Event({
                func = function()
                    local new_card = create_card("Tarot", G.consumables, nil, nil, nil, nil, chosen_card, 'berryboy')
                    new_card:add_to_deck()
                    G.consumeables:emplace(new_card)
                    G.GAME.consumeable_buffer = 0
                    new_card:juice_up(0.3, 0.5)
                    return true
                end
            }))
            return { message = chosen_message, colour = G.C.PURPLE }
        end
    end,
     credits = {
		code = "GhostSalt"              -- you can also leave out fields if you wish
	}
}
