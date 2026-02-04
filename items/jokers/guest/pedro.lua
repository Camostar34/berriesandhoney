SMODS.Joker {
    key = "pedro",
    name = "Pedro Pave",
 pronouns = "he_him",
    atlas = "jokers",
    pos = { x = 0, y = 0 },
   pools = { guest = true, wip = true  },
    config = { extra = { evil_xmult = 0, addxmult = 0.5, } },
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
		character = "Reaver of Souls"              -- you can also leave out fields if you wish
	}
}