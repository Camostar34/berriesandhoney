SMODS.Joker {
    key = "bumbling",
    atlas = "jokers",
    pos = { x = 2, y = 11 },
     pools = {smsn_sticky = true, },
    config = { extra = { bonus = 15 } },
    rarity = 1,
    cost = 4,
    blueprint_compat = true,
       unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.bonus} }
    end,

      in_pool = function(self, args)
    return G.GAME.hands["smsn_honeypot"].played > 0
    end,

    calculate = function(self, card, context)
       if context.joker_main and context.poker_hands ~= nil and next(context.poker_hands['smsn_honeypot']) then
				return { mult = card.ability.extra.bonus }
			
        end

    end,
}