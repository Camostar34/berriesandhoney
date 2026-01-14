SMODS.Joker {
    key = "pepperjelly",
    name = "Ghost Pepper Jelly",
       pronouns = "she_it",
    atlas = "jokers",
    pos = { x = 0, y = 4 },

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
        if context.selling_self and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then

            G.E_MANAGER:add_event(Event({
        trigger = 'before',
        delay = 0.0,
        func = (function()
          SMODS.add_card({set = "Berry", edition='e_negative', area = G.consumeables})
          SMODS.add_card({key = "c_smsn_retinalbloom", area = G.consumeables})
          return true
        end
        )
      }))
           
            return nil, true -- This is for Joker retrigger purposes
        end

    end,
}