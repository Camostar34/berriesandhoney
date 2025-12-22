to_big = to_big or function(x) return x end



SMODS.Joker { --Samson

    key = "samson",
    name = "Samson",

    atlas = "jokers",
    pos = { x = 0, y = 0 },

    config = { extra = { } },
    rarity = 1,
    unlocked = true,
    discovered = true,
    cost = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,

    calculate = function(self, card, context)
       
 -- Samson himself does nothing, the stupid idiot. A lovely patch is doing all the work. 
    end,
}



SMODS.Joker { 
    key = "bash",
    name = "Bashkelox",

    atlas = "jokers",
    pos = { x = 0, y = 0 },

    config = { extra = { 
        blind_reduce = 0.1, 
        odds = 2, 
    debuffed = true} },
    rarity = 1,
    cost = 3,
    blueprint_compat = true,
       unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
          local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'bashkelox')
        return { vars = {1 - card.ability.extra.blind_reduce,numerator, denominator} }
    end,

    calculate = function(self, card, context)

       if context.first_hand_drawn then
        G.GAME.blind.chips = math.floor(G.GAME.blind.chips - G.GAME.blind.chips * card.ability.extra.blind_reduce)
        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
        G.hand_text_area.blind_chips:juice_up()
        return {
            message = "Reduced!"
        }
       end

       if context.end_of_round and not context.beat_boss and context.game_over == false and context.main_eval and not context.blueprint then
            if SMODS.pseudorandom_probability(card, 'bashkelox', 1, card.ability.extra.odds) then
                SMODS.debuff_card(card, true, 'smsn_bash')
                return {
                    message = "Debuffed!"
                }
            else
                return {
                    message = localize('k_safe_ex')
                }
            end
        end


      
    end,


}




SMODS.Joker { 
    key = "hercule",
    name = "Hercule",

    atlas = "jokers",
    pos = { x = 0, y = 0 },

    config = { extra = { cards_draw = 1, hand_played = false,} },
    rarity = 1,
    cost = 3,
       unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.cards_draw} }
    end,

    calculate = function(self, card, context)
       
        if context.hand_drawn and card.ability.extra.hand_played == false then
          
            card.ability.extra.hand_played = true
            return {
                card = card,
            }
        end

        if context.discard or context.before then
          SMODS.draw_cards(card.ability.extra.cards_draw)
        end


    end,
}

SMODS.Joker { 
    key = "emmy",
    name = "Emmy Bunderbatch",

    atlas = "jokers",
    pos = { x = 0, y = 0 },

    config = { extra = { 
        mult_gain = 3,
    chip_gain = 14,
    counter = 0 } },
    rarity = 1,
    cost = 3,
    blueprint_compat = false,
       unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.mult_gain,card.ability.extra.chip_gain, card.ability.extra.mult_gain * card.ability.extra.counter, card.ability.extra.chip_gain * card.ability.extra.counter} }
    end,

    calculate = function(self, card, context)
       if context.berry_activate then
        card.ability.extra.counter = card.ability.extra.counter + 1
        return {
            message = "Upgrade!"
        }
       end

       if context.joker_main then 
        return
        {
            chips = card.ability.extra.chip_gain * card.ability.extra.counter,
            mult = card.ability.extra.mult_gain * card.ability.extra.counter,
        }
       end 


    end,
}

SMODS.Joker { 
    key = "denali",
    name = "Denali",

  atlas = "jokers",
    pos = { x = 0, y = 0 },

    config = { extra = { lights = 26, darks = 26, mult_to_add = 0,  bonus = 3,} },
    rarity = 1,
    cost = 3,
    blueprint_compat = false,
    eternal_compat = true,
       unlocked = true,
    discovered = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.lights, card.ability.extra.darks, card.ability.extra.mult_to_add, card.ability.extra.bonus,} }
    end,

    calculate = function(self, card, context)
       if context.joker_main then
            return {
                card = card,
                mult = card.ability.extra.mult_to_add,
            }
        end

    end,

        update = function(self, card)
    
   
            if G.playing_cards ~= nil then
                card.ability.extra.lights = 0
                card.ability.extra.darks = 0

               for _, v in pairs(G.playing_cards) do
                if (v:is_suit("Hearts") or v:is_suit("Diamonds")) then
                    card.ability.extra.lights = card.ability.extra.lights + 1
                end

                if (v:is_suit("Spades") or v:is_suit("Clubs")) then
                    card.ability.extra.darks = card.ability.extra.darks + 1
                end

                end

                

                card.ability.extra.mult_to_add = (card.ability.extra.lights * card.ability.extra.bonus - card.ability.extra.darks * card.ability.extra.bonus) 
            end

            if card.ability.extra.mult_to_add < 0 then
                card.ability.extra.mult_to_add = 0
            end
    
    
end,
}

SMODS.Joker { 
    key = "luzia",
    name = "Luzia",

    atlas = "jokers",
    pos = { x = 0, y = 0 },

    config = { extra = { lights = 26, darks = 26, mult_to_add = 0,  bonus = 3,} },
    rarity = 1,
    cost = 3,
    blueprint_compat = false,
    eternal_compat = true,
       unlocked = true,
    discovered = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.lights, card.ability.extra.darks, card.ability.extra.mult_to_add, card.ability.extra.bonus,} }
    end,

    calculate = function(self, card, context)
       if context.joker_main then
            return {
                card = card,
                mult = card.ability.extra.mult_to_add,
            }
        end

    end,

        update = function(self, card)
    
   
            if G.playing_cards ~= nil then
                card.ability.extra.lights = 0
                card.ability.extra.darks = 0

               for _, v in pairs(G.playing_cards) do
                if (v:is_suit("Hearts") or v:is_suit("Diamonds")) then
                    card.ability.extra.lights = card.ability.extra.lights + 1
                end

                if (v:is_suit("Spades") or v:is_suit("Clubs")) then
                    card.ability.extra.darks = card.ability.extra.darks + 1
                end

                end

                

                card.ability.extra.mult_to_add = (card.ability.extra.darks * card.ability.extra.bonus - card.ability.extra.lights * card.ability.extra.bonus)
            end

            if card.ability.extra.mult_to_add < 0 then
                card.ability.extra.mult_to_add = 0
            end
    
    
end,
}

SMODS.Joker {
    key = "gardener",
    name = "Gardener",

    atlas = "jokers",
    pos = { x = 0, y = 0 },

    config = { extra = { every = 3, handsplayed = 0} },
    rarity = 1,
    cost = 3,
    blueprint_compat = false,
       unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.every, card.ability.extra.handsplayed} }
    end,

    calculate = function(self, card, context)

              if context.joker_main then
                card.ability.extra.handsplayed = (card.ability.extra.handsplayed + 1)
                    if card.ability.extra.handsplayed == card.ability.extra.every then
                        G.E_MANAGER:add_event(Event({
                    trigger = "immediate",
                    func = (function()
                            SMODS.add_card({set = 'Berry'})
                            play_sound('polychrome1', 1.2 + math.random() * 0.1, 0.8)
                            card:juice_up(0.3, 0.4)
                            card.ability.extra.handsplayed = 0
                        return true
                    end)
                }))
                    end
                return {
                    message = tostring(card.ability.extra.handsplayed)
                }
              end 

    end,
}



SMODS.Joker { --ROA Samson
    key = "rivalssamson",
    name = "ROA Samson",

    atlas = "jokers",
    pos = { x = 1, y = 0 },

    config = { extra = { miniboss = 4000, time_limit = 3, reward = 25,} },
    rarity = 3,
    cost = 3,
    blueprint_compat = false,
       unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,
    

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.miniboss, card.ability.extra.time_limit,card.ability.extra.reward,} }
    end,

    calculate = function(self, card, context)
       

    end,
}

SMODS.Joker { 
    key = "rivalshercule",
    name = "ROA Hercule",

    atlas = "jokers",
    pos = { x = 0, y = 0 },

    config = { extra = { miniboss = 1000, time_limit = 3,} },
    rarity = 1,
    cost = 3,
    blueprint_compat = false,
       unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.miniboss, card.ability.extra.time_limit,} }
    end,

    calculate = function(self, card, context)
       

    end,
}

SMODS.Joker { 
    key = "honeyjar",
    name = "Honey Jar",

    atlas = "jokers",
    pos = { x = 0, y = 0 },

    config = { extra = { 
        odds = 1, } },
    rarity = 1,
    cost = 3,
    blueprint_compat = false,
       unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = false,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
         local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'smsn_honeyjar')
        return { vars = {numerator, denominator} }
    end,

   calculate = function(self, card, context)
            
            if context.before and SMODS.pseudorandom_probability(card, 'smsn_honeyjar', 1, card.ability.extra.odds) then


                if context.scoring_hand then
                    for i = 1, #context.scoring_hand do
                        if context.scoring_hand[i].config.center ~= G.P_CENTERS.m_gold then
                            context.scoring_hand[i]:set_ability(G.P_CENTERS.m_gold, nil, true)
                            G.E_MANAGER:add_event(Event({trigger = 'before', delay = 0.3,
                                func = (function()
                                    context.scoring_hand[i]:juice_up(0.3, 0.3)
                                    play_sound('tarot1', 0.9 + math.random() * 0.1, 0.8)
                                    return true
                                end)
                            }))

                        end
                    end
                
                end
                        
                    
            end

            if context.after and context.cardarea == G.jokers then
                card.ability.extra.odds = card.ability.extra.odds + 1
                return { message = "+1" }
            end

    end

}

SMODS.Joker {
    key = "fruitjelly",
    name = "Mixed Fruit Jelly",

    atlas = "jokers",
    pos = { x = 0, y = 0 },

    config = { extra = { multiply = 2 , bonus_chips = 0, bonus_mult = 0, bonus_xmult = 1, stored_xchips = 0,  } },
    rarity = 1,
    cost = 3,
    blueprint_compat = false,
       unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.multiply , math.floor(card.ability.extra.bonus_chips * card.ability.extra.multiply), math.floor(card.ability.extra.bonus_mult * card.ability.extra.multiply), math.floor(card.ability.extra.bonus_xmult * card.ability.extra.multiply)} }
    end,

    calculate = function(self, card, context)
       
    if context.selling_card and context.card.ability.set == 'Berry' then

        if context.card.ability.extra.berry_chips or context.card.ability.extra.berry_mult or context.card.ability.extra.berry_xmult then

            if context.card.ability.extra.berry_mult then
                card.ability.extra.bonus_mult = context.card.ability.extra.berry_mult
            end

             if context.card.ability.extra.berry_chips then
                card.ability.extra.bonus_chips = context.card.ability.extra.berry_chips
            end

             if context.card.ability.extra.berry_xmult then
                card.ability.extra.bonus_xmult = context.card.ability.extra.berry_xmult
            end
            return 
            {
                message = "Copied!"
            }
        end
    end

    if context.berry_activate then
        SMODS.destroy_cards(card, nil, nil, true)
        return
        {
            message = "Shattered!"
        }
    end

     if context.joker_main then

            if card.ability.extra.bonus_chips then
            return {
                chips = math.floor(card.ability.extra.bonus_chips * card.ability.extra.multiply),
                mult = math.floor(card.ability.extra.bonus_mult * card.ability.extra.multiply),
                xmult = math.floor(card.ability.extra.bonus_xmult * card.ability.extra.multiply),
            }
            end
    
        end

    end,
}

SMODS.Joker {
    key = "pepperjelly",
    name = "Ghost Pepper Jelly",

    atlas = "jokers",
    pos = { x = 0, y = 0 },

    config = { extra = { } },
    rarity = 1,
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

SMODS.Joker {
    key = "mintjams",
    name = "Mint Jams",

    atlas = "jokers",
    pos = { x = 0, y = 0 },

    config = { extra = {odds = 2 } },
    rarity = 1,
    cost = 3,
    blueprint_compat = false,
       unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
         local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'smsn_mintjams')
        return { vars = {numerator, denominator} }
    end,

calculate = function(self, card, context)
  if context.individual and context.cardarea == G.play and context.other_card  then
    local c = context.other_card

    -- enhancements: treat nil or empty table as "no enhancements"
    local enh = SMODS.get_enhancements and SMODS.get_enhancements(c) or nil
    local has_enh = enh and next(enh) ~= nil

    local has_seal = c.seal ~= nil
    local has_edition = c.edition ~= nil

    -- Only trigger on completely plain cards
    if (not has_enh) and (not has_seal) and (not has_edition) then
      if SMODS.pseudorandom_probability(card, 'smsn_mintjams', 1, card.ability.extra.odds) and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
        G.GAME.consumeable_buffer = (G.GAME.consumeable_buffer or 0) + 1

        G.E_MANAGER:add_event(Event({
          func = function()
            local berry = SMODS.add_card{
              set = 'Berry',
              area = G.consumeables,
            }
            G.GAME.consumeable_buffer = 0
            berry:juice_up(0.3, 0.4)
            return true
          end
        }))

        return {
        message_card = card,
          message = localize('k_plus_commonrambley'),
          colour = G.C.SECONDARY_SET.Tarot,
        }
      end
    end
  end
end,
}


SMODS.Joker {
    key = "honeycombtoffee",
    name = "Honeycomb Toffee",

    atlas = "jokers",
    pos = { x = 0, y = 0 },

    config = { extra = { } },
    rarity = 1,
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
       
        if context.check_enhancement and context.other_card.config.center == G.P_CENTERS.m_gold then
    return {
        m_glass = true,
    }
    end

    if context.mod_probability and context.trigger_obj and not context.blueprint then
        if SMODS.has_enhancement(context.trigger_obj, "m_glass") and SMODS.has_enhancement(context.trigger_obj, "m_gold") then
            return { numerator = context.numerator * 2 }
        end
    end

    end,
}

-- god damnit why is this so hard
SMODS.Enhancement:take_ownership("gold",
    {
        loc_vars = function(self, info_queue, card)
            if next(SMODS.find_card("j_smsn_honeycombtoffee")) then
                local fake_glass = G.P_CENTERS.m_glass:create_fake_card()
                local v = {}
                v[1] = fake_glass.ability.Xmult
                local num, den = SMODS.get_probability_vars(card, 1, fake_glass.ability.extra, "glass")
                v[2] = num
                v[3] = den
                info_queue[#info_queue + 1] = { set = "Enhanced", key = "m_glass", vars = v, config = v }
            end
            local dollar = card.config.h_dollars or card.config.center.config.h_dollars
            return { vars = {SMODS.signed_dollars(dollar)}, key = "m_gold" }
        end
    },
    true
)

SMODS.Joker {
    key = "hothoney",
    name = "Hot Honey",

    atlas = "jokers",
    pos = { x = 0, y = 0 },

    config = { extra = { xmultbonus = 2, penalty = 1, } },
    rarity = 1,
    cost = 3,
    blueprint_compat = false,
       unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = false,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.xmultbonus, card.ability.extra.penalty,} }
    end,

    calculate = function(self, card, context)
            if context.individual and context.cardarea == G.play and SMODS.has_enhancement(context.other_card, 'm_gold') then
                    
                    return {
                        xmult = card.ability.extra.xmultbonus,
                        dollars = card.ability.extra.penalty * -1,
                        
                    }
                
            end
    end



  
}

SMODS.Joker {
    key = "piggybank",
    name = "Piggy Bank",

    atlas = "jokers",
    pos = { x = 0, y = 0 },

    config = { extra = { reward = 15 } },
    rarity = 1,
    cost = 3,
    blueprint_compat = false,
       unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.reward} }
    end,

    calculate = function(self, card, context)
       
       if context.remove_playing_cards then
            for _, removed_card in ipairs(context.removed) do
                if SMODS.has_enhancement(removed_card, 'm_gold') then  
                    G.E_MANAGER:add_event(Event({
                    trigger = "immediate",
                    func = (function()
                            SMODS.calculate_effect({ dollars = card.ability.extra.reward }, card)
                        return true
                    end)
                }))
                end
            end
           
           

        end
    end,
}

SMODS.Joker {
    key = "beehive",
    name = "Beehive",

    atlas = "jokers",
    pos = { x = 0, y = 0 },

    config = { extra = { bonus = 1, } },
    rarity = 1,
    cost = 3,
    blueprint_compat = false,
       unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.bonus} }
    end,

    calculate = function(self, card, context)
       if context.end_of_round and context.individual and context.cardarea == G.hand then
            if SMODS.has_enhancement(context.other_card, 'm_gold') then
                   
            context.other_card.ability.h_dollars = context.other_card.ability.h_dollars + card.ability.extra.bonus
            return {
                message = "Upgrade!",
                colour = G.C.MONEY
            }
        end
    end

    end,
}

SMODS.Joker {
    key = "fluffernutter",
    name = "Fluffernutter Sandwich",

    atlas = "jokers",
    pos = { x = 0, y = 0 },

    config = { extra = { } },
    rarity = 1,
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
       

    end,
}


SMODS.Joker {
    key = "marmalade",
    name = "Marmalade Sandwich",

    atlas = "jokers",
    pos = { x = 0, y = 0 },

    config = { extra = { } },
    rarity = 1,
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
       
        if context.end_of_round and context.cardarea == G.jokers then

        end

    end,
}

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
    pos = { x = 0, y = 3 },

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

    
}

SMODS.Joker {
    key = "commonrambley",
    name = "Rambley Railway",

    atlas = "jokers",
    pos = { x = 0, y = 0 },

    config = { extra = { } },
    rarity = 1,
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
       
        if context.joker_main and next(context.poker_hands["Straight"]) and
            #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            local face_check = false
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i]:is_face() then
                    face_check = true
                    break
                end
            end
            if face_check then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                G.E_MANAGER:add_event(Event({
                    func = (function()
                        SMODS.add_card {
                            key = 'c_smsn_rambleberry',
                        }
                        G.GAME.consumeable_buffer = 0
                        return true
                    end)
                }))
                return {
                    message = localize('k_plus_commonrambley'),
                    colour = G.C.SECONDARY_SET.Tarot,
                }
            end
        end
    end,
}



SMODS.Joker {
    key = "uncommonrambley",
    name = "Rambley RFRSHR",

    atlas = "jokers",
    pos = { x = 0, y = 0 },

    config = { extra = { } },
    rarity = 1,
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
       

    end,
}

SMODS.Joker {
    key = "rarerambley",
    name = "Retro Rambley",

    atlas = "jokers",
    pos = { x = 0, y = 0 },

    config = { extra = { } },
    rarity = 1,
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
       

    end,
}

SMODS.Joker {
    key = "legendaryrambley",
    name = "Rambley The Raccoon",

    atlas = "jokers",
    pos = { x = 0, y = 0 },

    config = { extra = { } },
    rarity = 1,
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
       

    end,
}

SMODS.Joker {
    key = "rambleydumpy",
    name = "Rambley Dumpy",

    atlas = "jokers",
    pos = { x = 0, y = 0 },

    config = { extra = { } },
    rarity = 1,
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
       
         if context.first_hand_drawn and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                         G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                G.E_MANAGER:add_event(Event({
                    func = (function()
                        SMODS.add_card {
                            key = 'c_smsn_rambleberry',
                        }
                        G.GAME.consumeable_buffer = 0
                        return true
                    end)
                }))
                return {
                    message = localize('k_plus_commonrambley'),
                    colour = G.C.SECONDARY_SET.Tarot,
                }
            
         end

        if context.end_of_round and context.game_over and context.main_eval then
                    
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                G.hand_text_area.blind_chips:juice_up()
                                G.hand_text_area.game_chips:juice_up()
                                play_sound('tarot1')
                                card:start_dissolve()
                                return true
                            end
                        }))
                        return {
                            message = localize('k_saved_ex'),
                            saved =  "Saved by Rambley Dumpy",
                            colour = G.C.RED
                        }
                    
                end

            end,
}

SMODS.Joker {
    key = "littlelad",
    name = "Little Lad",

    atlas = "jokers",
    pos = { x = 0, y = 0 },

    config = { extra = { bonus_chips = 0, bonus_mult = 0, bonus_xmult = 1,} },
    rarity = 1,
    cost = 3,
    blueprint_compat = false,
       unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.bonus_chips, card.ability.extra.bonus_mult, card.ability.extra.bonus_xmult} }
    end,

    calculate = function(self, card, context)
       
    if context.berry_activate then
        if context.berry_activate.ability.extra.berry_chips or context.berry_activate.ability.extra.berry_mult or context.berry_activate.ability.extra.berry_xmult then

            if context.berry_activate.ability.extra.berry_mult then
                card.ability.extra.bonus_mult = card.ability.extra.bonus_mult + context.berry_activate.ability.extra.berry_mult
            end

             if context.berry_activate.ability.extra.berry_chips then
                card.ability.extra.bonus_chips = card.ability.extra.bonus_chips + context.berry_activate.ability.extra.berry_chips
            end

             if context.berry_activate.ability.extra.berry_xmult then
                card.ability.extra.bonus_xmult = card.ability.extra.berry_xmult + context.berry_activate.ability.extra.berry_xmult
            end

            return
            {
                message = "yippie!"
            }
        end
    end

        if context.joker_main then
            return {
                chips = card.ability.extra.bonus_chips,
                mult = card.ability.extra.bonus_mult,
                xmult = card.ability.extra.bonus_xmult,
            }
        end

    end,

}

SMODS.Joker {
    key = "paddington",
    name = "Paddington Bear",

    atlas = "jokers",
    pos = { x = 0, y = 0 },

    config = { extra = { } },
    rarity = 1,
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
       

    end,
}

SMODS.Joker {
    key = "femtanyl",
    name = "KATAMARI",

    atlas = "jokers",
    pos = { x = 0, y = 0 },

    config = { extra = { addxmult = 0.1, } },
    rarity = 1,
    cost = 3,
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
}

SMODS.Joker {
    key = "mycom",
    name = "MYCOM MAIM MARIONETTE",

    atlas = "jokers",
    pos = { x = 0, y = 0 },

    config = { extra = { counter = 0, xmultbonus = 0.25 } },
    rarity = 1,
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

        if context.after then
            card.ability.extra.counter = card.ability.extra.counter + 1
            return {

                message = tostring((card.ability.extra.xmultbonus * card.ability.extra.counter) + 1),
            }
        end

         if context.discard and not context.blueprint and card.ability.extra.counter > 0 and context.other_card == context.full_hand[#context.full_hand] then
                        card.ability.extra.counter = 0
            return {

                message = localize('k_reset')
            }
        end

    end,
}

SMODS.Joker {
    key = "stomachbook",
    name = "GOODNIGHT HYPNOPOMP",

    atlas = "jokers",
    pos = { x = 0, y = 0 },

    config = { extra = { evil_xmult = 0, addxmult = 0.5, } },
    rarity = 1,
    cost = 4,
    blueprint_compat = false,
       unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = false,

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,

    calculate = function(self, card, context)
       

    end,
}

SMODS.Joker {
    key = "robotface",
    name = "Robot Face",

    atlas = "jokers",
    pos = { x = 0, y = 0 },

    config = { extra = { odds = 4,} },
    rarity = 1,
    cost = 4,
    blueprint_compat = false,
       unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = false,

    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'caravanpalace')
         info_queue[#info_queue+1] = G.P_CENTERS.m_steel
        return { vars = { numerator, denominator } }
       
    end,

   calculate = function(self, card, context)
  -- Trigger per scoring card
  if context.individual and context.cardarea == G.play and context.other_card then
    if context.other_card:is_face()
      and SMODS.pseudorandom_probability(card, 'caravanpalace', 1, card.ability.extra.odds) then
      
      local other_card = context.other_card 

      return {
        func = function()
          G.E_MANAGER:add_event(Event({
            func = function()
              if other_card and not other_card.REMOVED then
                other_card:set_ability(G.P_CENTERS.m_steel, true)  
                other_card:juice_up(0.3, 0.4)
                card:juice_up(0.3, 0.4)
                play_sound('tarot1', 0.9 + math.random()*0.1, 0.8)
                
              end
              return true
            end
          }))
        end
      }
    end
  end
end,
}

