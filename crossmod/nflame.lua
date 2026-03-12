SMODS.Joker { 
    key = "rabbicksappy",
    name = "Rabbick Sappy",
    atlas = "crossmodjokers",
     enhancement_gate = 'm_smsn_cookie',
    pos = { x = 2, y = 0 },
    config = { extra = { reps = 1 } },
    rarity = 2,
    unlocked = true,
    discovered = true,
    cost = 5,
    blueprint_compat = false, 
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        if info_queue and G.P_CENTERS.m_nflame_rules then
            info_queue[#info_queue + 1] = G.P_CENTERS.m_nflame_rules
        end
        return { vars = {} }
    end,

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play then
            
            if context.other_card and SMODS.has_enhancement(context.other_card, 'm_nflame_rules') then
                
                if context.other_card:is_suit('Clubs') then
                    return {
                        repetitions = card.ability.extra.reps,
                        card = card
                    }
                end
            end
        end
    end,
}

 SMODS.Joker { 

    key = "rabbicksappy",
    name = "Rabbick Sappy",

    atlas = "crossmodjokers",
    pos = { x = 2, y = 0 },
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
      
        if context.repetition and context.cardarea == G.play then
            
          
            if context.other_card and context.other_card.config.center.key == 'm_nflame_rules' then
                
              
                if context.other_card:is_suit('Clubs') then
                    return {
                        message = localize('k_again_ex'),
                        repetitions = card.ability.extra.reps,
                        card = card
                    }
                end
            end
        end
    end,
}

SMODS.Joker { 
    key = "jollysappy",
    name = "Jolly Sappy",
    atlas = "crossmodjokers",
    pos = { x = 4, y = 1 },
    config = { extra = { Xmult = 1.5, chips = 50 } },
    rarity = 3,
    unlocked = true,
    discovered = true,
    cost = 5,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.Xmult} }
    end,

   calculate = function(self, card, context)
        if context.joker_main then
            
            local held_hand_eval = evaluate_poker_hand(G.hand.cards)
            local held_pair_count = 0
            if held_hand_eval["Pair"] and next(held_hand_eval["Pair"]) then
                held_pair_count = #held_hand_eval["Pair"]
            end
            
            local played_pair_count = 0
            if context.poker_hands["Pair"] and next(context.poker_hands["Pair"]) then
                played_pair_count = #context.poker_hands["Pair"]
            end
            
           
            if held_pair_count > 0 or played_pair_count > 0 then
                
                
                local total_xmult = card.ability.extra.Xmult * held_pair_count
                
               
                local total_chips = card.ability.extra.chips * played_pair_count
                
                
                return {
                    xchips = held_pair_count > 0 and total_xmult or nil,
                    chips = played_pair_count > 0 and total_chips or nil
                }
            end
        end
    end,
}
--[[

SMODS.Joker { 

    key = "evilsappy",
    name = "Evil Sappy (Yappy)",

    atlas = "crossmodjokers",
    pos = { x = 1, y = 0 },
    config = { extra = { current = 1, gain = 0.25 } },
    rarity = 2,
    unlocked = true,
    discovered = true,
    cost = 5,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.current, card.ability.extra.gain} }
    end,

    calculate = function(self, card, context)
       

    end,
}

SMODS.Joker { 

    key = "nostalgicsappy",
    name = "Nostalgic Sappy",

    atlas = "crossmodjokers",
    pos = { x = 1, y = 1 },
    config = { extra = {} },
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

    key = "papersappy",
    name = "Paper Sappy",

    atlas = "crossmodjokers",
    pos = { x = 2, y = 1 },
    config = { extra = {rounds = 3, reduction = 25, current = 0,  } },
    rarity = 2,
    unlocked = true,
    discovered = true,
    cost = 5,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.rounds, card.ability.extra.reduction, card.ability.extra.current} }
    end,

    calculate = function(self, card, context)
       

    end,
}


} ]]-- 