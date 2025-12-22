SMODS.ConsumableType {
    key = "Berry",
    primary_colour = HEX("A5477B"),
    secondary_colour = HEX("CF70A5"),
    shop_rate = 1.0,
    can_stack = false,
    can_divide = false,
    select_card = 'consumeables',
}

SMODS.current_mod.calculate = function(self, context)
  if context.berry_activate and context.berry_activate.ability.set == 'Berry' then G.GAME.last_used_berry = context.berry_activate.config.center.key end
end

SMODS.Consumable {
    key = 'cherry',
    set = 'Berry',
  atlas = "berries",
  pos = { x = 0, y = 0 },
    config = { extra = { berryname = "None" } },
    loc_vars = function(self, info_queue, card)

      local cherry_c = G.GAME.last_used_berry and G.P_CENTERS[G.GAME.last_used_berry] or nil
      local last_used_berry = cherry_c and localize { type = 'name_text', key = cherry_c.key, set = cherry_c.set } or
      localize('k_none')
        return { vars = { last_used_berry } }
    end,
    use = function(self, card, area, copier)
        for i = 1, math.min(card.ability.extra.berries, G.consumeables.config.card_limit - #G.consumeables.cards) do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    if G.consumeables.config.card_limit > #G.consumeables.cards then
                        play_sound('timpani')
                        SMODS.calculate_context({berry_activate = card})
                        SMODS.add_card({ key = G.GAME.last_used_berry })
                        card:juice_up(0.3, 0.5)
                    end
                    return true
                end
            }))
        end
        delay(0.6)
    end,
    can_use = function(self, card)
        return G.consumeables and #G.consumeables.cards < G.consumeables.config.card_limit or
            (card.area == G.consumeables)
    end
  }

SMODS.Consumable {
  key = "cranberries",
  set = "Berry",

  atlas = "berries",
  pos = { x = 0, y = 0 },

  config = {
    extra = {
      berry_mult = 10,
      activity = "inactive",
      in_use = false,
    }
  },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
    return { vars = { card.ability.extra.berry_mult, card.ability.extra.activity } }
  end,

  keep_on_use = function(self, card)
    return true
  end,

  calculate = function(self, card, context)
    if context.initial_scoring_step and card.ability.extra.in_use then
      SMODS.calculate_context({berry_activate = card})
      SMODS.destroy_cards(card)
      return { mult = card.ability.extra.berry_mult }
    end

  end,

    can_use = function(self, card)
    return not card.ability.extra.in_use
  end,

  use = function(self, card, area)
    card.ability.extra.activity = "active!"
    card.ability.extra.in_use = true
         local eval = function(card) return not card.REMOVED and not G.RESET_JIGGLES end
                juice_card_until(card, eval, true)
  end,
}

SMODS.Consumable {
  key = "blueberries",
  set = "Berry",

  atlas = "berries",
  pos = { x = 0, y = 0 },

  config = {
    extra = {
      berry_chips = 75,
      activity = "inactive",
      in_use = false,
    }
  },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
    return { vars = { card.ability.extra.berry_chips, card.ability.extra.activity } }
  end,

  keep_on_use = function(self, card)
    return true
  end,

  calculate = function(self, card, context)
    if context.initial_scoring_step and card.ability.extra.in_use then
      SMODS.calculate_context({berry_activate = card})
      SMODS.destroy_cards(card)
      return { chips = card.ability.extra.berry_chips }
    end

  end,

    can_use = function(self, card)
    return not card.ability.extra.in_use
  end,

  use = function(self, card, area)
    card.ability.extra.activity = "active!"
    card.ability.extra.in_use = true
         local eval = function(card) return not card.REMOVED and not G.RESET_JIGGLES end
                juice_card_until(card, eval, true)
  end,
}


SMODS.Consumable {
  key = "boysenberry",
  set = "Berry",

  atlas = "berries",
  pos = { x = 0, y = 0 },

  config = {
    extra = {
      berry_chips = 50,
      berry_mult = 5,
      activity = "inactive",
      in_use = false,
    }
  },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
    return { vars = {card.ability.extra.berry_chips, card.ability.extra.berry_mult, card.ability.extra.activity } }
  end,

  keep_on_use = function(self, card)
    return true
  end,

  calculate = function(self, card, context)
    if context.initial_scoring_step and card.ability.extra.in_use then
      SMODS.calculate_context({berry_activate = card})
      SMODS.destroy_cards(card)
      return { chips = card.ability.extra.berry_chips,
                mult = card.ability.extra.berry_mult
    
    }
    end

  end,

    can_use = function(self, card)
    return not card.ability.extra.in_use
  end,

  use = function(self, card, area)
    card.ability.extra.activity = "active!"
    card.ability.extra.in_use = true
         local eval = function(card) return not card.REMOVED and not G.RESET_JIGGLES end
                juice_card_until(card, eval, true)
  end,
}

SMODS.Consumable {
  key = "grapes",
  set = "Berry",

  atlas = "berries",
  pos = { x = 0, y = 0 },

  config = {
    extra = {
      luck = 1,
      can_be_used = 5,
      activity = "inactive",
      in_use = false,
    }
  },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
    return { vars = {card.ability.extra.luck, card.ability.extra.berry_mult, card.ability.extra.activity } }
  end,

  keep_on_use = function(self, card)
    return true
  end,

  calculate = function(self, card, context)
    if context.initial_scoring_step and card.ability.extra.in_use then
      SMODS.destroy_cards(card)
      return { chips = card.ability.extra.berry_chips,
                mult = card.ability.extra.berry_mult
    
    }
    end

  end,

    can_use = function(self, card)
    return not card.ability.extra.in_use
  end,

  use = function(self, card, area)
    card.ability.extra.activity = "active!"
    card.ability.extra.in_use = true
         local eval = function(card) return not card.REMOVED and not G.RESET_JIGGLES end
                juice_card_until(card, eval, true)
  end,
}

 SMODS.Consumable {
    key = 'yew',
    set = 'Berry',
     atlas = "berries",
  pos = { x = 0, y = 0 },
    config = { extra = { berries = 2 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.berries } }
    end,
    use = function(self, card, area, copier)
        for i = 1, math.min(card.ability.extra.berries, G.consumeables.config.card_limit - #G.consumeables.cards) do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    if G.consumeables.config.card_limit > #G.consumeables.cards then
                        play_sound('timpani')
                        SMODS.add_card({ set = 'Berry' })
                        card:juice_up(0.3, 0.5)
                    end
                    return true
                end
            }))
        end
        delay(0.6)
    end,
    can_use = function(self, card)
        return G.consumeables and #G.consumeables.cards < G.consumeables.config.card_limit or
            (card.area == G.consumeables)
    end
}



SMODS.Consumable {
  key = "cuberry",
  set = "Berry",

  atlas = "berries",
  pos = { x = 0, y = 0 },

  config = {
    extra = {
        retrigegrs = 3,
      activity = "inactive",
      in_use = false,
    }
  },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
    return { vars = { card.ability.extra.berry_money, card.ability.extra.activity } }
  end,

  keep_on_use = function(self, card)
    return true
  end,

    calc_dollar_bonus = function(self, card)
    if card.ability.extra.in_use then
        SMODS.destroy_cards(card)
        return card.ability.extra.berry_money
    end
    end,

    can_use = function(self, card)
    return not card.ability.extra.in_use
  end,

  use = function(self, card, area)
    card.ability.extra.activity = "active!"
    card.ability.extra.in_use = true
         local eval = function(card) return not card.REMOVED and not G.RESET_JIGGLES end
                juice_card_until(card, eval, true)
  end,
}

SMODS.Consumable {
  key = "rambleberry",
  set = "Berry",

  atlas = "berries",
  pos = { x = 0, y = 0 },

  config = {
    extra = {
      berry_chips = 150,
      berry_mult = 20,
      activity = "inactive",
      in_use = false,
    }
  },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
    return { vars = {card.ability.extra.berry_chips, card.ability.extra.berry_mult, card.ability.extra.activity } }
  end,

  keep_on_use = function(self, card)
    return true
  end,

  calculate = function(self, card, context)
    if context.initial_scoring_step and card.ability.extra.in_use then
      SMODS.calculate_context({berry_activate = card})
      SMODS.destroy_cards(card)
      return { chips = card.ability.extra.berry_chips,
                mult = card.ability.extra.berry_mult
    
    }
    end

  end,

    can_use = function(self, card)
    return not card.ability.extra.in_use
  end,

  use = function(self, card, area)
    card.ability.extra.activity = "active!"
    card.ability.extra.in_use = true
         local eval = function(card) return not card.REMOVED and not G.RESET_JIGGLES end
                juice_card_until(card, eval, true)
  end,
}

SMODS.Consumable {
  key = "raspberry",
  set = "Berry",

  atlas = "berries",
  pos = { x = 0, y = 0 },

  config = {
    extra = {
      berry_xmult = 1.5,
      activity = "inactive",
      in_use = false,
    }
  },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
    return { vars = { card.ability.extra.berry_xmult, card.ability.extra.activity } }
  end,

  keep_on_use = function(self, card)
    return true
  end,

  calculate = function(self, card, context)
    if context.initial_scoring_step and card.ability.extra.in_use then
      SMODS.calculate_context({berry_activate = card})
      SMODS.destroy_cards(card)
      return { Xmult_mod = card.ability.extra.berry_xmult }
    end

  end,

    can_use = function(self, card)
    return not card.ability.extra.in_use
  end,

  use = function(self, card, area)
    card.ability.extra.activity = "active!"
    card.ability.extra.in_use = true
         local eval = function(card) return not card.REMOVED and not G.RESET_JIGGLES end
                juice_card_until(card, eval, true)
  end,
}

SMODS.Consumable {
  key = "strawberry",
  set = "Berry",

  atlas = "berries",
  pos = { x = 0, y = 0 },

  config = {
    extra = {
        berry_mult = 10,
      berry_xmult = 1.25,
      activity = "inactive",
      in_use = false,
    }
  },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
    return { vars = { card.ability.extra.berry_mult, card.ability.extra.berry_xmult, card.ability.extra.activity } }
  end,

  keep_on_use = function(self, card)
    return true
  end,

  calculate = function(self, card, context)
    if context.initial_scoring_step and card.ability.extra.in_use then
      SMODS.calculate_context({berry_activate = card})
          G.GAME.strawberries_used = (G.GAME.strawberries_used or 0) + 1
      SMODS.destroy_cards(card)
      return {  mult = card.ability.extra.berry_mult,
        Xmult_mod = card.ability.extra.berry_xmult }
    end

  end,

    can_use = function(self, card)
    return not card.ability.extra.in_use
  end,

  use = function(self, card, area)
    card.ability.extra.activity = "active!"
    card.ability.extra.in_use = true
         local eval = function(card) return not card.REMOVED and not G.RESET_JIGGLES end
                juice_card_until(card, eval, true)
  end,
}


SMODS.Consumable {
  key = "cloudberry",
  set = "Berry",

  atlas = "berries",
  pos = { x = 0, y = 0 },

  config = {
    extra = {
        berry_money = 5,
      activity = "inactive",
      in_use = false,
    }
  },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
    return { vars = { card.ability.extra.berry_money, card.ability.extra.activity } }
  end,

  keep_on_use = function(self, card)
    return true
  end,

    calc_dollar_bonus = function(self, card)
    if card.ability.extra.in_use then
      SMODS.calculate_context({berry_activate = card})
        SMODS.destroy_cards(card)
        return card.ability.extra.berry_money
    end
    end,

    can_use = function(self, card)
    return not card.ability.extra.in_use
  end,

  use = function(self, card, area)
    card.ability.extra.activity = "active!"
    card.ability.extra.in_use = true
         local eval = function(card) return not card.REMOVED and not G.RESET_JIGGLES end
                juice_card_until(card, eval, true)
  end,
}





  SMODS.Consumable {
  key = "blackberry",
  set = "Berry",

  atlas = "berries",
  pos = { x = 0, y = 0 },

  config = {
    extra = {
        draw_cards = 3,
      activity = "inactive",
      in_use = false,
    }
  },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
    return { vars = { card.ability.extra.berry_mult, card.ability.extra.berry_xmult, card.ability.extra.activity } }
  end,

    can_use = function(self, card)
    return G.STATES.SELECTING_HAND
  end,

  use = function(self, card, area)
     local hand_space = math.min(#G.deck.cards, card.ability.extra.draw_mod)
                for i = 1, hand_space do
                    draw_card(G.deck, G.hand, i*100/hand_space, "up", true)
                end
  end,
}


SMODS.Consumable {
  key = "crepes",
  set = "Berry",

  atlas = "berries",
  pos = { x = 0, y = 0 },

  config = {
    extra = {
        berry_money = 5,
      activity = "inactive",
      in_use = false,
    }
  },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
    return { vars = { card.ability.extra.berry_money, card.ability.extra.activity } }
  end,

  keep_on_use = function(self, card)
    return true
  end,

    calc_dollar_bonus = function(self, card)
    if card.ability.extra.in_use then
        SMODS.destroy_cards(card)
        return card.ability.extra.berry_money
    end
    end,

    can_use = function(self, card)
    return not card.ability.extra.in_use
  end,

  use = function(self, card, area)
    card.ability.extra.activity = "active!"
    card.ability.extra.in_use = true
         local eval = function(card) return not card.REMOVED and not G.RESET_JIGGLES end
                juice_card_until(card, eval, true)
  end,
}


SMODS.Consumable {
    key = 'fruitsalad',
    set = 'Berry',
  atlas = "berries",
  pos = { x = 0, y = 0 },
    config = { extra = { berries = 2 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.berries } }
    end,
    use = function(self, card, area, copier)
        for i = 1, math.min(card.ability.extra.berries, G.consumeables.config.card_limit - #G.consumeables.cards) do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    if G.consumeables.config.card_limit > #G.consumeables.cards then
                        play_sound('timpani')
                        SMODS.add_card({ set = 'Berry' })
                        card:juice_up(0.3, 0.5)
                    end
                    return true
                end
            }))
        end
        delay(0.6)
    end,
    can_use = function(self, card)
        return G.consumeables and #G.consumeables.cards < G.consumeables.config.card_limit or
            (card.area == G.consumeables)
    end
}

SMODS.Consumable {
  key = "preserves",
  set = "Berry",

  atlas = "berries",
  pos = { x = 0, y = 0 },

  config = {
    extra = {
        life = 1,
      activity = "inactive",
      in_use = false,
    }
  },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
    return { vars = { card.ability.extra.life } }
  end,

    can_use = function(self, card)
    return G.STATES.SELECTING_HAND
  end,

  use = function(self, card, area)
     local hand_space = math.min(#G.deck.cards, card.ability.extra.draw_mod)
                for i = 1, hand_space do
                    draw_card(G.deck, G.hand, i*100/hand_space, "up", true)
                end
  end,
}

SMODS.Consumable {
  key = "donut",
  set = "Berry",

  atlas = "berries",
  pos = { x = 0, y = 0 },

  config = {
    extra = {
        mutliply = 3,
      activity = "inactive",
      in_use = false,
    }
  },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
    return { vars = { card.ability.extra.multiply, card.ability.extra.activity } }
  end,

  keep_on_use = function(self, card)
    return true
  end,

    calc_dollar_bonus = function(self, card)
    if card.ability.extra.in_use then
        SMODS.destroy_cards(card)
        return card.ability.extra.berry_money
    end
    end,

    can_use = function(self, card)
    return not card.ability.extra.in_use
  end,

  use = function(self, card, area)
    card.ability.extra.activity = "active!"
    card.ability.extra.in_use = true
         local eval = function(card) return not card.REMOVED and not G.RESET_JIGGLES end
                juice_card_until(card, eval, true)
  end,
}



SMODS.Consumable {
  key = "riceball",
  set = "Berry",

  atlas = "berries",
  pos = { x = 0, y = 0 },

  config = {
    extra = {
        berry_money = 5,
      activity = "inactive",
      in_use = false,
    }
  },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
    return { vars = { card.ability.extra.berry_money, card.ability.extra.activity } }
  end,

  keep_on_use = function(self, card)
    return true
  end,

    calc_dollar_bonus = function(self, card)
    if card.ability.extra.in_use then
        SMODS.destroy_cards(card)
        return card.ability.extra.berry_money
    end
    end,

    can_use = function(self, card)
    return not card.ability.extra.in_use
  end,

  use = function(self, card, area)
    card.ability.extra.activity = "active!"
    card.ability.extra.in_use = true
         local eval = function(card) return not card.REMOVED and not G.RESET_JIGGLES end
                juice_card_until(card, eval, true)
  end,
}

