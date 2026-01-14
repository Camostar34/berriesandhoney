SMODS.Joker {
    key = "peapod",
    name = "Pea Pod",
     pronouns = "he_him",
    atlas = "jokers",
    pos = { x = 2, y = 0 },

    config = { extra = { chip_bonus = 15, stolen_goods = 0, chips_to_give = 0,} },
    rarity = 1,
    cost = 3,
    blueprint_compat = false,
       unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.chip_bonus, card.ability.extra.chips_to_give} }
    end,

    calculate = function(self, card, context)
       

    end,
     credits = {
		character = "Maridaka"              -- you can also leave out fields if you wish
	}
}