SMODS.Joker {
    key = "uncommonrambley",
    name = "Rambley RFRSHR",
    pronouns = "he_him",
    atlas = "jokers",
    pos = { x = 0, y = 0 },
    pools = { rambley = true, wip = true},
    config = { extra = { } },
    rarity = 2,
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