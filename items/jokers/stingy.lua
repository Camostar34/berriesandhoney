SMODS.Joker {
    key = "stingy",
    atlas = "jokers",
    pos = { x = 3, y = 11 },
    pools = { },
    config = { extra = { bonus = 100 } },
    rarity = 1,
    cost = 4,
    blueprint_compat = false,
       unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = false,

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.bonus} }
    end,

          in_pool = function(self, args)
    return G.GAME.hands["smsn_honeypot"].played > 0
    end,

    calculate = function(self, card, context)
       if context.joker_main and context.poker_hands ~= nil and next(context.poker_hands['smsn_honeypot']) then
				return { chips = card.ability.extra.bonus }
			
        end

    end,
}