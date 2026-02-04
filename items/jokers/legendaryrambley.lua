SMODS.Joker {
    key = "legendaryrambley",
    name = "Rambley The Raccoon",
    pronouns = "he_him",
    pools = { rambley = true, wip = true },
    atlas = "jokers",
    pos = { x = 3, y = 3 },
soul_pos = { x = 4, y = 3 },
    config = { extra = { } },
    rarity = 4,
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