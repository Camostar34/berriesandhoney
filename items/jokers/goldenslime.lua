SMODS.Joker {
    key = "goldenslime",
    name = "Golden Slime",
    pronouns = "she_they",
    atlas = "jokers",
    pos = {
        x = 1,
        y = 10,
     },
    pools = {
        slimerancher = true,
        smsn_sticky = true,
     },
    config = {
        extra = {
            money = 10,
            odds = 2,
         },
    },
    rarity = 2,
    cost = 6,
    blueprint_compat = true,
    unlocked = true,
    discovered = true,
    eternal_compat = false,
    perishable_compat = true,
    demicolon_compat = false,

    loc_vars = function(self, info_queue, card)
        local num, denom = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, "goldenslime")
        return {
            vars = { card.ability.extra.money, num, denom },
         }
    end,

    calculate = function(self, card, context)
        if context.using_consumeable then
            return {
                dollars = card.ability.extra.money,
             }
        end

        if context.end_of_round and not context.individual and not context.repetition and not context.blueprint and
            SMODS.pseudorandom_probability(card, "goldenslime", 1, card.ability.extra.odds) then
            card:start_dissolve()
            return {
                message = localize("k_smsn_disappeared_ex"),
                colour = G.C.RED,
             }
        end
    end,
    credits = {
		code = "GhostSalt"             
	}
}
