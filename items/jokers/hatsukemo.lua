SMODS.Joker { 

    key = "hatsukemo",
    name = "Hatsukemo-Kun",
    pronouns = "he_him",
    atlas = "jokers",
    pos = { x = 0, y = 14 },
    pools = { yuru = true, },
   config = { extra = { hands = 1, discards = 1 } },
    rarity = 1,
    unlocked = true,
    discovered = true,
    cost = 5,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = false,

    loc_vars = function(self, info_queue, card)
       return { vars = { card.ability.extra.hands, card.ability.extra.discards } }
    end,

    calculate = function(self, card, context)
        if context.setting_blind then
         
            if G.GAME.blind:get_type() == 'Small' then
                
                G.E_MANAGER:add_event(Event({func = function()
                    ease_hands_played(card.ability.extra.hands)
                    ease_discard(card.ability.extra.discards)
                    return true
                end}))

                return {
                    message = localize('k_active_ex'),
                    colour = G.C.CHIPS,
                    card = card
                }
            end
        end
    end,
     credits = {
		character = "NIxxxRA"            
	}

}
