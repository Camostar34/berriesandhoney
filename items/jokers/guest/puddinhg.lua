SMODS.Joker {
    key = "puddinhg",
    name = "Puddinhg",
    pronouns = "he_him",
    atlas = "jokers",
    pos = { x = 7, y = 1 },
    pools = { guest = true, smsn_berry_themed = true,},
    config = { extra = { payout = 3,} },
    rarity = 2,
    cost = 6,
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
        if G.GAME.strawberries_used and G.GAME.strawberries_used > 0 then
            return G.GAME.strawberries_used * card.ability.extra.payout
        end
    end,
    credits = {
		character = "puddinhgexists"              -- you can also leave out fields if you wish
	}
       
}