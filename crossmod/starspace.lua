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
       
        if context.joker_main and context.poker_hands["star_flash"] and next(context.poker_hands["star_flash"]) then
            
            local has_queen = false
            for _, played_card in ipairs(context.full_hand) do
                if played_card:get_id() == 12 then
                    has_queen = true
                end
            end

            if has_queen then
                return {
                    mult = card.ability.extra.mult,
                    dollars = card.ability.extra.money
                }
            end
        end
    end,
}

SMODS.Joker { 
    key = "kuchinohanabi",
    name = "Kuchinohanabi",
    pronouns = "they_them",
    atlas = "crossmodjokers",
    pos = { x = 5, y = 0 },
    config = { extra = { reward = 12, kuchinohanabi_valid = true} },
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
        if context.setting_blind and not context.blueprint then
            card.ability.extra.kuchinohanabi_valid = true
        end
 
        
        if context.before and not context.blueprint then
            if not context.poker_hands["star_flash"] or not next(context.poker_hands["star_flash"]) then
                card.ability.extra.kuchinohanabi_valid = false
            end
        end
    end,

    
    calc_dollar_bonus = function(self, card)
      
        if card.ability.extra.kuchinohanabi_valid and G.GAME.current_round.hands_played > 0 then
            return card.ability.extra.reward
        end
    end
}

SMODS.Joker { 
    key = "grenade",
    name = "Flash Grenade",
    pronouns = "she_it",
    atlas = "crossmodjokers",
    pos = { x = 0, y = 1 },
    config = { extra = {can_use = true, flash_replaced = false, top_hand = 'High Card'} },
    rarity = 2,
    unlocked = true,
    discovered = true,
    cost = 5,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)

        return { vars = {card.ability.extra.can_use} }
    end,

    calculate = function(self, card, context)
        
   
        if context.setting_blind and not context.blueprint then
      
            if card.ability.extra.can_use == false then
                card.ability.extra.can_use = true
                card.ability.extra.flash_replaced = false
                return {
                    message = localize('k_active_ex'),
                    colour = G.C.FILTER
                }
            end
            
    
            card.ability.extra.can_use = true
            card.ability.extra.flash_replaced = false
        end

        if context.evaluate_poker_hand then
            if card.ability.extra.can_use == true and context.poker_hands["star_flash"] and next(context.poker_hands["star_flash"]) then
                
                card.ability.extra.top_hand = 'High Card'
                if G.GAME and G.GAME.hands then
                    for k, v in pairs(G.GAME.hands) do
                        if v.played > G.GAME.hands[card.ability.extra.top_hand].played then
                            card.ability.extra.top_hand = k
                        end
                    end
                end
                
                card.ability.extra.flash_replaced = true
                
                return {
                    replace_scoring_name = card.ability.extra.top_hand,
                    replace_display_name = localize(card.ability.extra.top_hand, 'poker_hands'),
                    replace_poker_hands = { 
                        [card.ability.extra.top_hand] = context.poker_hands["star_flash"] 
                    }
                }
            else
                card.ability.extra.flash_replaced = false
            end
        end

        if context.before and not context.blueprint then
            if card.ability.extra.flash_replaced and card.ability.extra.can_use == true then
                card.ability.extra.can_use = false
                card.ability.extra.flash_replaced = false
                return {
                    message = "Boom!",
                    colour = G.C.FILTER
                }
            end
        end

    end,
}



SMODS.Joker {
  key = "tasteful",
  atlas = "jokers",
  pos = { x = 5, y = 11 },
  config = { extra = {
    handsize = 4,
    type = "smsn_honeypot",
    triggered = false,
    easter_egg = false,
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

    
    set_sprites = function(self, card, front)
       
        if pseudorandom('smsn_easter_egg') < 0.1 then
             
            card.children.center:set_sprite_pos({x = 6, y = 11}) 
        end
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
