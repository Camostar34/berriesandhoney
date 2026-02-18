SMODS.Joker {
    key = "boykisser",
    name = "Boykisser",
    pools = { shitpost = true },
    atlas = "jokers",
    pos = { x = 6, y = 8 },

    config = { extra = { bonus = 2 } },
    rarity = 2,
    cost = 5,
    blueprint_compat = false,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.bonus } }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and (context.other_card:get_id() == 11 or context.other_card:get_id() == 13) then
            context.other_card.ability.perma_mult = (context.other_card.ability.perma_mult or 0) + card.ability.extra.bonus
            return { message = localize('k_upgrade_ex'), colour = G.C.MULT }
        end
    end,
     credits = {
		code = "GhostSalt"              -- you can also leave out fields if you wish
	}
}
