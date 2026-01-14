SMODS.Sound ({
    key = 'rollup',
    path = 'smsn_rollup.ogg',
    pitch = 1,
})

SMODS.Sound ({
    key = 'grow',
    path = 'smsn_katamarigrow.ogg',
    pitch = 1,
})

SMODS.Joker {
    key = "damacy",
    name = "Katamari",

    atlas = "jokers",
    pos = { x = 0, y = 1 },

    config = { extra = { reroll_need = 15, slots_toadd = 0, counter = 0, safe = true } },
    rarity = 3,
    cost = 3,
    blueprint_compat = false,
    eternal_compat = true,
       unlocked = true,
    discovered = true,
    perishable_compat = true,
    demicolon_compat = false,

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.reroll_need, card.ability.extra.counter,} }
    end,

    calculate = function(self, card, context)

       if context.buying_card then 
        card.ability.extra.safe = false
       end 
       
        if context.reroll_shop and card.ability.extra.safe and not context.blueprint then
            card.ability.extra.counter = card.ability.extra.counter + 1

            if card.ability.extra.counter == card.ability.extra.reroll_need then
                card.ability.extra.counter = 0 
                G.consumeables.config.card_limit = G.consumeables.config.card_limit + 1
                if G.jokers then
                    G.jokers.config.card_limit = G.jokers.config.card_limit + 1
                end
                card.ability.extra.slots_toadd = card.ability.extra.slots_toadd + 1

                return {
                message = "+1 Slots",
                sound = 'smsn_grow',
                }
            end
            return {
                message = tostring(card.ability.extra.counter),
                sound = 'smsn_rollup',
            }
        end

        if (context.reroll_shop and not card.ability.extra.safe) or (context.ending_shop) then 
            card.ability.extra.safe = true
        end 


    end,

      remove_from_deck = function(self, card, from_debuff)
        G.consumeables.config.card_limit = G.consumeables.config.card_limit - card.ability.extra.slots_toadd
        G.jokers.config.card_limit = G.jokers.config.card_limit - card.ability.extra.slots_toadd
    end,

    add_to_deck = function(self, card, from_debuff)
        if from_debuff then
        G.consumeables.config.card_limit = G.consumeables.config.card_limit - card.ability.extra.slots_toadd
        G.jokers.config.card_limit = G.jokers.config.card_limit - card.ability.extra.slots_toadd
        end
    end,

    credits = {
		art = "Astro"        
	}
}