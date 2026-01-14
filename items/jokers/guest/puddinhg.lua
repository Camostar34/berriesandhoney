SMODS.Joker {
    key = "puddinhg",
    name = "Puddinhg",
    pronouns = "he_him",
    atlas = "jokers",
    pos = { x = 7, y = 1 },

    config = { extra = { payout = 3,} },
    rarity = 2,
    cost = 3,
    blueprint_compat = false,
       unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        local strawberries_used = (G.GAME.strawberries_used) or 0
        return { vars = {card.ability.extra.payout, card.ability.extra.payout * strawberries_used} }
    end,

    calc_dollar_bonus = function(self, card)
        return G.GAME.strawberries_used * card.ability.extra.payout or nil
    end,
    credits = {
		character = "puddinhgexists"              -- you can also leave out fields if you wish
	}
       
}