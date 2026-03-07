SMODS.Joker {
    key = "meta",
    name = "Meta",
 pronouns = "she_her",
    atlas = "jokers",
    pos = { x = 0, y = 0 },
   pools = { guest = true, wip = true  },
    config = { extra = {  } },
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
		character = "MetaNite64"             
	}
}