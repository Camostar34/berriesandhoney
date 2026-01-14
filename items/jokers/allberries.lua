SMODS.Joker {
    key = "allberries",
    name = "Oops! All Berries!",
       pronouns = "he_him",
    atlas = "jokers",
    pos = { x = 3, y = 4 },

    config = { extra = { } },
    rarity = 2,
    cost = 4,
    blueprint_compat = false,
       unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = false,

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,

    calculate = function(self, card, context)
       

    end,
    credits = {
		art = "Candycanearter07"        
	}
}
