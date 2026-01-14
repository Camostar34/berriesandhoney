SMODS.Joker {
    key = "shadow",
    name = "Shadow Wizard",
 pronouns = "he_him",
    atlas = "jokers",
    pos = { x = 0, y = 0 },

    config = { extra = { odds = 15,} },
    rarity = 1,
    cost = 3,
    blueprint_compat = false,
       unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.odds} }
    end,

    calculate = function(self, card, context)
       

    end,
     credits = {
		art = "octaandfnaf",              -- you can also leave out fields if you wish
        idea = "octaandfnaf"
	}
}
