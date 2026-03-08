SMODS.Joker {
    key = "hamtaro",
    name = "Hamtaro",
    pronouns = "he_him",
    atlas = "jokers",
    pos = {
        x = 2,
        y = 7,
     },
    pools = {
        hamtaro = true,
     },
    config = {
        extra = {
            money = 1,
         },
    },
    rarity = 1,
    cost = 6,
    blueprint_compat = false,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = false,

    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.money },
         }
    end,

    calculate = function(self, card, context) 
        if context.end_of_round and not context.individual and not context.repetition and not context.blueprint then
            card.ability.extra.no_of_cards = #G.hand.cards
        end
    end,
    calc_dollar_bonus = function(self, card)
        return card.ability.extra.money * card.ability.extra.no_of_cards
    end,
    credits = {
		code = "GhostSalt"             
	}
}
