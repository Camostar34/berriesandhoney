SMODS.Joker {
    key = "mycom",
    name = "MYCOM MAIM MARIONETTE",
    pronouns = "she_they",
    atlas = "jokers",
    pos = { x = 1, y = 2 },

    config = { extra = { counter = 0, xmultbonus = 0.20 } },
    rarity = 3,
    cost = 3,
    blueprint_compat = false,
       unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.xmultbonus, (card.ability.extra.xmultbonus * card.ability.extra.counter) + 1} }
    end,

    calculate = function(self, card, context)
       
         if context.joker_main then
            return {

                xmult = (card.ability.extra.xmultbonus * card.ability.extra.counter) + 1,
            }
        end

       if context.before and not context.blueprint then
            if #context.scoring_hand < #context.full_hand then -- thanks for this, Sappy!
                card.ability.extra.counter = card.ability.extra.counter + 1
            return {

                message = tostring((card.ability.extra.xmultbonus * card.ability.extra.counter) + 1),
            }
            end
        end


         if context.discard and not context.blueprint and card.ability.extra.counter > 0 and context.other_card == context.full_hand[#context.full_hand] then
                        card.ability.extra.counter = 0
            return {

                message = localize('k_reset')
            }
        end

    end,
}