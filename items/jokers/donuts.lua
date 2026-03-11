SMODS.Joker {
    key = "donuts",
    name = "Box of Donuts",

    atlas = "jokers",
    pos = {
        x = 5,
        y = 10,
     },
    config = {
        extra = {
            uses = 6,
         },
    },
    rarity = 2,
    cost = 5,
    blueprint_compat = false,
    unlocked = true,
    discovered = true,
    eternal_compat = false,
    perishable_compat = true,
    demicolon_compat = false,
    pools = {
    Food = true
  },

    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.uses },
         }
    end,

    calculate = function(self, card, context)
        if context.after then
            card.ability.extra.uses = card.ability.extra.uses - 1
            if card.ability.extra.uses <= 0 then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        card:start_dissolve()
                        return true
                    end,
                }))
                return {
                    message = localize("k_eaten_ex"),
                    colour = G.C.RED,
                 }
            else
                return {
                    message = card.ability.extra.uses .. "",
                 }
            end
        end
    end,

     credits = {
		code = "GhostSalt"             
	}
}
