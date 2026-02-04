SMODS.Joker {
    key = "astro",
    name = "Astro",
 pronouns = "he_him",
    atlas = "jokers",
    pools = { guest = true, wip = true  },
    pos = { x = 7, y = 0 },

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
		character = "Astro",              -- you can also leave out fields if you wish
        idea = "Astro"
	}
}