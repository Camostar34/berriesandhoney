SMODS.Joker {
    key = "angel",
    name = "Angel",
 pronouns = "he_him",
    atlas = "jokers",
    pos = { x = 6, y = 0 },

    config = { extra = { evil_xmult = 0, addxmult = 0.5, } },
    rarity = 1,
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
		character = "FunnyToonDerg"              -- you can also leave out fields if you wish
	}
}