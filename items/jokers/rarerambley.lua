
SMODS.Joker {
    key = "rarerambley",
    name = "Retro Rambley",
    pronouns = "he_him",
    atlas = "jokers",
    pos = { x = 4, y = 1 },
    soul_pos = { x = 5, y = 1 },

    config = { extra = { } },
    rarity = 3,
    cost = 3,
    blueprint_compat = false,
       unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,

    calculate = function(self, card, context)
       

    end,
    credits = {
		character = "UniqueGeese / JakeNeutron"              -- you can also leave out fields if you wish
	}
}