SMODS.Joker {
    key = "mouse",
    name = "Mouse Joker",

    atlas = "jokers",
    pos = {
        x = 1,
        y = 5,
     },
    display_size = {
        w = 71 * 0.7,
        h = 95 * 0.7,
     },
    rarity = 2,
    cost = 7,
    blueprint_compat = true,
    unlocked = true,
    discovered = true,
     enhancement_gate = 'm_gold',
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,
      pools = {smsn_sticky = true, },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_gold
        return {}
    end,

    calculate = function(self, card, context)
        if context.discard and #context.full_hand == 1 and SMODS.has_enhancement(context.other_card, "m_gold") then
            local _card = context.other_card
            local money = (_card.ability.h_dollars or 0) * 2
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = 0.15,
                func = function()
                    _card:flip()
                    play_sound("card1", 1.5)
                    _card:juice_up(0.3, 0.3)
                    card:juice_up()
                    return true
                end,
            }))
            delay(0.2)
            G.E_MANAGER:add_event(Event({
                trigger = "immediate",
                func = (function()
                    _card:set_ability('c_base', nil, true)
                    return true
                end),
            }))
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = 0.15,
                func = function()
                    _card:flip()
                    play_sound("tarot2", 1.3, 0.6)
                    _card:juice_up(0.3, 0.3)
                    card:juice_up()
                    ease_dollars(money)
                    return true
                end,
            }))
        end
    end,
    enhancement_gate = "m_gold",
     credits = {
		code = "GhostSalt"             
	}
}
