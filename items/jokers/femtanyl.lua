SMODS.Joker {
    key = "femtanyl",
    name = "KATAMARI",
    pronouns = "she_her",
    atlas = "jokers",
    pos = { x = 4, y = 4 },

    config = { extra = { addxmult = 0.1, } },
    rarity = 3,
    cost = 10,
    blueprint_compat = false,
       unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.addxmult, (card.ability.extra.addxmult * G.GAME.round_scores.times_rerolled.amt) + 1} }
    end,

    calculate = function(self, card, context)
       
         if context.joker_main then
            return {

                xmult = (card.ability.extra.addxmult * G.GAME.round_scores.times_rerolled.amt) + 1
            }
        end

          if context.reroll_shop and not context.blueprint then
            return {

                message = "+ ".. card.ability.extra.addxmult .. "X",
                colour = G.C.MULT
            }
          end

    end,
        credits = {
		art = "lord-ruby"        
	}
}
