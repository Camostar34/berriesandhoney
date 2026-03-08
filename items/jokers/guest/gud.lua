SMODS.Joker {
    key = "gud",
    name = "Chester",
 pronouns = "he_they",
    atlas = "jokers",
    pos = { x = 0, y = 0 },
   pools = { guest = true, wip = true  },
    config = { extra = { evil_xchips = 1.5, } },
    rarity = 3,
    cost = 8,
    blueprint_compat = false,
       unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.evil_xchips} }
    end,

   calculate = function(self, card, context)

        if context.individual and context.cardarea == G.play and context.other_card:is_face() then
            return {
                x_chips = card.ability.extra.evil_xchips,
                card = context.other_card
            }
        end

        if context.destroying_card and context.destroying_card:is_face() then
            return {remove = true}
        end
    end,
     credits = {
		character = "Gud"            
	}
}