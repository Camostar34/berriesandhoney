SMODS.Joker {

    key = "thegoteam",
    name = "Thunder, Lightning, Strike!!",
     pronouns = "he_him",
    atlas = "crossmodjokers",
    pos = { x = 6, y = 0 },
    config = { extra = { mult = 20, money = 4} },
    rarity = 1,
    unlocked = true,
    discovered = true,
    cost = 5,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.mult, card.ability.extra.money} }
    end,

    calculate = function(self, card, context)
       

    end,
}

SMODS.Joker { 

    key = "kuchinohanabi",
    name = "Kuchinohanabi",
     pronouns = "they_them",
    atlas = "crossmodjokers",
    pos = { x = 5, y = 0 },
    config = { extra = { reward = 12} },
    rarity = 2,
    unlocked = true,
    discovered = true,
    cost = 5,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.reward} }
    end,

    calculate = function(self, card, context)
       

    end,
}

SMODS.Joker { 

    key = "gushers",
    name = "Gushers",

    atlas = "crossmodjokers",
    pos = { x = 0, y = 0 },
    config = { extra = { } },
    rarity = 2,
    unlocked = true,
    discovered = true,
    cost = 5,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,

    calculate = function(self, card, context)
       

    end,
}

SMODS.Joker { 

    key = "grenade",
    name = "Flash Grenade",
     pronouns = "she_it",
    atlas = "crossmodjokers",
    pos = { x = 8, y = 0 },
    config = { extra = {xchips = 1.25} },
    rarity = 2,
    unlocked = true,
    discovered = true,
    cost = 5,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.xchips} }
    end,

    calculate = function(self, card, context)
       

    end,
}



SMODS.Joker {
  key = "tasteful",
  atlas = "jokers",
  pos = { x = 0, y = 0 },
  config = { extra = {
    handsize = 5,
    type = "smsn_honeypot",
    triggered = false
  } },
  rarity = 2,
  cost = 6,
  blueprint_compat = false,
  eternal_compat = true,
  perishable_compat = true,
  
  loc_vars = function(self, info_queue, card)
    return { vars = {
      card.ability.extra.handsize,
      localize(card.ability.extra.type, "poker_hands")
    } }
  end,

            in_pool = function(self, args)
    return G.GAME.hands["smsn_honeypot"].played > 0
    end,


  calculate = function(self, card, context)
    -- tasteful giveth
    if context.joker_main and not context.blueprint and not card.ability.extra.triggered then
      if next(context.poker_hands[card.ability.extra.type]) then
        G.hand:change_size(card.ability.extra.handsize)
        card.ability.extra.triggered = true
        return {
          message = localize { type = "variable", key = "a_handsize", vars = { card.ability.extra.handsize } }
        }
      end
    end

    -- tasteful giveth away
    if context.end_of_round and context.cardarea == G.jokers and card.ability.extra.triggered then
      G.hand:change_size(-card.ability.extra.handsize)
      card.ability.extra.triggered = false
    end
  end
}
