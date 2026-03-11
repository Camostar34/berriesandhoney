SMODS.Joker {
    key = "commonrambley",
    name = "Rambley Railway",
      pronouns = "he_him",
    atlas = "jokers",
    pos = { x = 0, y = 0 },
    pools = { rambley = true, smsn_berry_themed = true, },
    config = { extra = { } },
    rarity = 1,
    cost = 4,
    blueprint_compat = false,
       unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        if not card.fake_card then info_queue[#info_queue + 1] = G.P_CENTERS.c_smsn_rambleberry end
        return { vars = {} }
    end,

    calculate = function(self, card, context)
       
        if context.joker_main and next(context.poker_hands["Straight"]) and
            #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
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
                            key = 'c_smsn_rambleberry',
                        }
                        G.GAME.consumeable_buffer = 0
                        return true
                    end)
                }))
                return {
                    message = localize('k_plus_commonrambley'),
                    colour = G.C.SECONDARY_SET.Tarot,
                }
            end
        end
    end,

     credits = {
		character = "UniqueGeese / JakeNeutron"              -- you can also leave out fields if you wish
	}
}