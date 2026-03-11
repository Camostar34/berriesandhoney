SMODS.ConsumableType {
    key = "berry",
    primary_colour = HEX("A5477B"),
    secondary_colour = HEX("CF70A5"),
    shop_rate = 0,
    can_stack = false,
    can_divide = false,
    select_card = "consumeables",
}

SMODS.current_mod.calculate = function(self, context)
    if context.berry_activate and context.berry_activate.ability.set == "berry" then
        G.GAME.last_used_berry = context.berry_activate.config.center.key
    end
end

SMODS.Consumable {
    key = "cherry",
    set = "berry",
    atlas = "berries",
    pos = {
        x = 2,
        y = 1,
    },
    config = {
        extra = {
            berries = 1,
        },
    },
    
    loc_vars = function(self, info_queue, card)
        local cherry_c = G.GAME.last_used_berry and G.P_CENTERS[G.GAME.last_used_berry] or nil
        local last_used_berry = cherry_c and localize {
            type = "name_text",
            key = cherry_c.key,
            set = cherry_c.set,
        } or localize("k_none")
        
        return {
            vars = { last_used_berry },
        }
    end,
    
    use = function(self, card, area, copier)
        if not G.GAME.last_used_berry then return end

        for i = 1, math.min(card.ability.extra.berries, G.consumeables.config.card_limit - #G.consumeables.cards) do
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = 0.4,
                func = function()
                    if G.consumeables.config.card_limit > #G.consumeables.cards then
                        play_sound("timpani")
                        
                       
                        SMODS.add_card({
                            key = G.GAME.last_used_berry,
                        })
                        
                       
                        
                        
                        card:juice_up(0.3, 0.5)
                    end
                    return true
                end,
            }))
        end
        delay(0.6)
    end,
    
    can_use = function(self, card)
        if not G.GAME.last_used_berry then return false end
        return G.consumeables and #G.consumeables.cards < G.consumeables.config.card_limit or
                   (card.area == G.consumeables)
    end,
}

SMODS.Consumable {
    key = "cranberries",
    set = "berry",

    atlas = "berries",
    pos = {
        x = 0,
        y = 0,
     },

    config = {
        extra = {
            berry_mult = 10,
            activity = "inactive",
            in_use = false,
         },
    },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return {
            vars = { card.ability.extra.berry_mult, card.ability.extra.activity },
         }
    end,

    keep_on_use = function(self, card) return true end,

    calculate = function(self, card, context)
        if context.initial_scoring_step and card.ability.extra.in_use then
            G.GAME.last_used_berry = card.config.center.key
            SMODS.calculate_context({
                berry_activate = card,
             })
            SMODS.destroy_cards(card)
            return {
                mult = card.ability.extra.berry_mult,
             }
        end

    end,

    can_use = function(self, card) return not card.ability.extra.in_use end,

    use = function(self, card, area)
        card.ability.extra.activity = "active!"
        card.ability.extra.in_use = true
        local eval = function(card) return not card.REMOVED and not G.RESET_JIGGLES end
        juice_card_until(card, eval, true)
    end,
}

SMODS.Consumable {
    key = "blueberries",
    set = "berry",

    atlas = "berries",
    pos = {
        x = 2,
        y = 0,
     },

    config = {
        extra = {
            berry_chips = 75,
            activity = "inactive",
            in_use = false,
         },
    },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return {
            vars = { card.ability.extra.berry_chips, card.ability.extra.activity },
         }
    end,

    keep_on_use = function(self, card) return true end,

    calculate = function(self, card, context)
        if context.initial_scoring_step and card.ability.extra.in_use then
            G.GAME.last_used_berry = card.config.center.key
            SMODS.calculate_context({
                berry_activate = card,
             })
            SMODS.destroy_cards(card)
            return {
                chips = card.ability.extra.berry_chips,
             }
        end

    end,

    can_use = function(self, card) return not card.ability.extra.in_use end,

    use = function(self, card, area)
        card.ability.extra.activity = "active!"
        card.ability.extra.in_use = true
        local eval = function(card) return not card.REMOVED and not G.RESET_JIGGLES end
        juice_card_until(card, eval, true)
    end,
}

SMODS.Consumable {
    key = "boysenberry",
    set = "berry",

    atlas = "berries",
    pos = {
        x = 3,
        y = 0,
     },

    config = {
        extra = {
            berry_chips = 50,
            berry_mult = 5,
            activity = "inactive",
            in_use = false,
         },
    },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return {
            vars = { card.ability.extra.berry_chips, card.ability.extra.berry_mult, card.ability.extra.activity },
         }
    end,

    keep_on_use = function(self, card) return true end,

    calculate = function(self, card, context)
        if context.initial_scoring_step and card.ability.extra.in_use then
            G.GAME.last_used_berry = card.config.center.key
            SMODS.calculate_context({
                berry_activate = card,
             })
            SMODS.destroy_cards(card)
            return {
                chips = card.ability.extra.berry_chips,
                mult = card.ability.extra.berry_mult,

             }
        end

    end,

    can_use = function(self, card) return not card.ability.extra.in_use end,

    use = function(self, card, area)
        card.ability.extra.activity = "active!"
        card.ability.extra.in_use = true
        local eval = function(card) return not card.REMOVED and not G.RESET_JIGGLES end
        juice_card_until(card, eval, true)
    end,
}

SMODS.Consumable {
    key = "grapes",
    set = "berry", 
    atlas = "berries",
    pos = {
        x = 0,
        y = 6,
    },
    config = {
        extra = {
            luck = 1,
            activity = "inactive",
            in_use = 0, 
        },
    },

    loc_vars = function(self, info_queue, card)
        return {
           
            vars = { card.ability.extra.luck, 3 - (card.ability.smsn_grapes_uses or 0), card.ability.extra.activity },
        }
    end,

    keep_on_use = function(self, card) return true end,

    calculate = function(self, card, context)
        if context.mod_probability and card.ability.extra.in_use > 0 then
            return {
                numerator = context.numerator + (card.ability.extra.luck * card.ability.extra.in_use)
            }
        end

        if context.after and card.ability.extra.in_use > 0 then
            card.ability.extra.in_use = 0
            card.ability.extra.activity = "inactive"

           
            if (card.ability.smsn_grapes_uses or 0) >= 3 then
                G.GAME.last_used_berry = card.config.center.key
                SMODS.calculate_context({
                    berry_activate = card,
                })
                SMODS.destroy_cards(card)
            end
        end
    end,

 
    can_use = function(self, card) return (card.ability.smsn_grapes_uses or 0) < 3 end,

    use = function(self, card, area)
        card.ability.extra.activity = "active!"
        card.ability.extra.in_use = card.ability.extra.in_use + 1
        
       
        card.ability.smsn_grapes_uses = (card.ability.smsn_grapes_uses or 0) + 1
        
        
        card.children.center:set_sprite_pos({ x = card.ability.smsn_grapes_uses, y = 6 })
        
        if card.ability.extra.in_use == 1 then
          
            juice_card_until(card, function(c) return c.ability.extra.in_use > 0 and not c.REMOVED and not G.RESET_JIGGLES end, true)
        end
    end,

    set_ability = function(self, card, initial, delay_sprites)
     
        card.ability.smsn_grapes_uses = card.ability.smsn_grapes_uses or 0
        
        if card.children.center then
            card.children.center:set_sprite_pos({ x = card.ability.smsn_grapes_uses, y = 6 })
        end
    end
}

SMODS.Consumable {
    key = "yew",
    set = "berry",
    atlas = "berries",
    pos = {
        x = 1,
        y = 2,
    },
    config = {
        extra = {
            activity = "inactive",
            in_use = false,
            top_hand = 'High Card' 
        },
    },

    loc_vars = function(self, info_queue, card)
    
        if G.GAME and G.GAME.hands then
            card.ability.extra.top_hand = 'High Card'
            for k, v in pairs(G.GAME.hands) do
                if v.played > G.GAME.hands[card.ability.extra.top_hand].played then
                    card.ability.extra.top_hand = k
                end
            end
        end

        return {
            vars = { card.ability.extra.activity, localize(card.ability.extra.top_hand, 'poker_hands') },
        }
    end,

    keep_on_use = function(self, card) return true end,

    calculate = function(self, card, context)
 
        if context.evaluate_poker_hand and card.ability.extra.in_use then
            return {
                replace_scoring_name = card.ability.extra.top_hand,
                replace_display_name = localize(card.ability.extra.top_hand, 'poker_hands'),
              
                replace_poker_hands = { 
                    [card.ability.extra.top_hand] = { context.full_hand } 
                }
            }
        end

       
        if context.after and card.ability.extra.in_use then
            G.GAME.last_used_berry = card.config.center.key
            SMODS.calculate_context({
                berry_activate = card,
            })
            SMODS.destroy_cards(card)
        end
    end,

    can_use = function(self, card) return not card.ability.extra.in_use end,

    use = function(self, card, area)
     
        if G.GAME and G.GAME.hands then
            card.ability.extra.top_hand = 'High Card'
            for k, v in pairs(G.GAME.hands) do
                if v.played > G.GAME.hands[card.ability.extra.top_hand].played then
                    card.ability.extra.top_hand = k
                end
            end
        end
        
        card.ability.extra.activity = "active!"
        card.ability.extra.in_use = true
        
       
        juice_card_until(card, function(c) return c.ability.extra.in_use and not c.REMOVED end, true)
    end,
}

SMODS.Consumable {
    key = "booberry", --BOOBS?!?!!??!!??!?!!?!?!!?!?!??!!!?!?!??!?!!?!?!>?!?!?!??!!?!?!?!!?!?!?!?!?!?!?!?!?!?!?!?!?!?!??! 
    set = "berry",

    atlas = "berries",
    pos = {
        x = 1,
        y = 4,
     },
     soul_pos = {
        x = 2,
        y = 4,
     },

    config = {
        extra = {
            berry_chips = 75,
            num = 1,
            odds = 2,
            activity = "inactive",
            in_use = false,
         },
    },

    loc_vars = function(self, info_queue, card)
        local num, denom = SMODS.get_probability_vars(card, card.ability.extra.num, card.ability.extra.odds, "booberry")
        return {
            vars = { card.ability.extra.berry_chips, num, denom, card.ability.extra.activity },
         }
    end,

    keep_on_use = function(self, card) return true end,

    calculate = function(self, card, context)
        if context.initial_scoring_step and card.ability.extra.in_use then
            G.GAME.last_used_berry = card.config.center.key
             SMODS.calculate_context({
                            berry_activate = card,
                         })
            if SMODS.pseudorandom_probability(card, "booberry", 1, card.ability.extra.odds) and #G.consumeables.cards +
                G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local new_card = SMODS.add_card({
                            set = "Spectral",
                            key_append = "booberry",
                         })
                        G.GAME.consumeable_buffer = 0
                        return true
                    end,
                }))
            end
            SMODS.destroy_cards(card)
            return {
                chips = card.ability.extra.berry_chips,
             }
        end
    end,

    can_use = function(self, card) return not card.ability.extra.in_use end,

    use = function(self, card, area)
        card.ability.extra.activity = "active!"
        card.ability.extra.in_use = true
        local eval = function(card) return not card.REMOVED and not G.RESET_JIGGLES end
        juice_card_until(card, eval, true)
    end,

    set_ability = function(self, card, initial, delay_sprites)
       if initial and not card.edition then
            card:set_edition({ negative = true }, true, true)
        end
    end,
    credits = {
		code = "GhostSalt"             
	}
}

SMODS.Consumable {
    key = "frankenberry",
    set = "berry",

    atlas = "berries",
    pos = {
        x = 3,
        y = 3,
     },
         soul_pos = {
        x = 0,
        y = 4,
     },


    config = {
        extra = {
            berry_mult = 10,
            num = 1,
            odds = 2,
            activity = "inactive",
            in_use = false,
         },
    },

    loc_vars = function(self, info_queue, card)
        local num, denom = SMODS.get_probability_vars(card, card.ability.extra.num, card.ability.extra.odds, "frankenberry")
        return {
            vars = { card.ability.extra.berry_mult, num, denom, card.ability.extra.activity },
         }
    end,

    keep_on_use = function(self, card) return true end,

    calculate = function(self, card, context)
        if context.initial_scoring_step and card.ability.extra.in_use then
            if SMODS.pseudorandom_probability(card, "frankenberry", 1, card.ability.extra.odds) and
                #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local new_card = SMODS.add_card({
                            set = "Spectral",
                            key_append = "frankenberry",
                         })
                        G.GAME.consumeable_buffer = 0
                        return true
                    end,
                }))
            end
            SMODS.destroy_cards(card)
            return {
                mult = card.ability.extra.berry_mult,
             }
        end
    end,

    can_use = function(self, card) return not card.ability.extra.in_use end,

    use = function(self, card, area)
        card.ability.extra.activity = "active!"
        card.ability.extra.in_use = true
        local eval = function(card) return not card.REMOVED and not G.RESET_JIGGLES end
        juice_card_until(card, eval, true)
    end,
    set_ability = function(self, card, initial, delay_sprites)
       if initial and not card.edition then
            card:set_edition({ negative = true }, true, true)
        end
    end,
    credits = {
		code = "GhostSalt"             
	}
}

SMODS.Consumable {
    key = "cuberry",
    set = "berry",
    atlas = "berries",
    pos = {
        x = 0,
        y = 3,
    },
    config = {
        extra = {
            retriggers = 3,
            activity = "inactive",
            in_use = false,
        },
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.retriggers, card.ability.extra.activity },
        }
    end,

    keep_on_use = function(self, card) return true end,

    calculate = function(self, card, context)
      
        if context.repetition and context.cardarea == G.play and card.ability.extra.in_use then
         
            for i = 1, math.min(card.ability.extra.retriggers, #context.scoring_hand) do
                if context.scoring_hand[i] == context.other_card then
                    return {
                        message = localize('k_again_ex'),
                        repetitions = 1,
                        card = card
                    }
                end
            end
        end

       
        if context.after and card.ability.extra.in_use then
            G.GAME.last_used_berry = card.config.center.key
            SMODS.calculate_context({
                berry_activate = card,
            })
            SMODS.destroy_cards(card)
        end
    end,

    can_use = function(self, card) return not card.ability.extra.in_use end,

    use = function(self, card, area)
        card.ability.extra.activity = "active!"
        card.ability.extra.in_use = true
        
      
        local eval = function(card) return not card.REMOVED and not G.RESET_JIGGLES end
        juice_card_until(card, eval, true)
    end,
}

SMODS.Consumable {
    key = "rambleberry",
    set = "berry",

    atlas = "berries",
    pos = {
        x = 0,
        y = 2,
     },

    config = {
        extra = {
            berry_chips = 150,
            berry_mult = 20,
            activity = "inactive",
            in_use = false,
         },
    },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return {
            vars = { card.ability.extra.berry_chips, card.ability.extra.berry_mult, card.ability.extra.activity },
         }
    end,

    keep_on_use = function(self, card) return true end,

    in_pool = function(self, args) return false end,

    calculate = function(self, card, context)
        if context.initial_scoring_step and card.ability.extra.in_use then
            G.GAME.last_used_berry = card.config.center.key
            SMODS.calculate_context({
                berry_activate = card,
             })
            SMODS.destroy_cards(card)
            return {
                chips = card.ability.extra.berry_chips,
                mult = card.ability.extra.berry_mult,

             }
        end

    end,

    can_use = function(self, card) return not card.ability.extra.in_use end,

    use = function(self, card, area)
        card.ability.extra.activity = "active!"
        card.ability.extra.in_use = true
        local eval = function(card) return not card.REMOVED and not G.RESET_JIGGLES end
        juice_card_until(card, eval, true)
    end,
}

SMODS.Consumable {
    key = "raspberry",
    set = "berry",

    atlas = "berries",
    pos = {
        x = 1,
        y = 0,
     },

    config = {
        extra = {
            berry_xmult = 1.5,
            activity = "inactive",
            in_use = false,
         },
    },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return {
            vars = { card.ability.extra.berry_xmult, card.ability.extra.activity },
         }
    end,

    keep_on_use = function(self, card) return true end,

    calculate = function(self, card, context)
        if context.initial_scoring_step and card.ability.extra.in_use then
            G.GAME.last_used_berry = card.config.center.key
            SMODS.calculate_context({
                berry_activate = card,
             })
            SMODS.destroy_cards(card)
            return {
                Xmult_mod = card.ability.extra.berry_xmult,
             }
        end

    end,

    can_use = function(self, card) return not card.ability.extra.in_use end,

    use = function(self, card, area)
        card.ability.extra.activity = "active!"
        card.ability.extra.in_use = true
        local eval = function(card) return not card.REMOVED and not G.RESET_JIGGLES end
        juice_card_until(card, eval, true)
    end,
}

SMODS.Consumable {
    key = "strawberry",
    set = "berry",

    atlas = "berries",
    pos = {
        x = 3,
        y = 1,
     },

    config = {
        extra = {
            berry_mult = 10,
            berry_xmult = 1.25,
            activity = "inactive",
            in_use = false,
         },
    },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return {
            vars = { card.ability.extra.berry_mult, card.ability.extra.berry_xmult, card.ability.extra.activity },
         }
    end,

    keep_on_use = function(self, card) return true end,

    calculate = function(self, card, context)
        if context.initial_scoring_step and card.ability.extra.in_use then
            G.GAME.last_used_berry = card.config.center.key
            SMODS.calculate_context({
                berry_activate = card,
             })
            G.GAME.strawberries_used = (G.GAME.strawberries_used or 0) + 1
            SMODS.destroy_cards(card)
            return {
                mult = card.ability.extra.berry_mult,
                Xmult_mod = card.ability.extra.berry_xmult,
             }
        end

    end,

    can_use = function(self, card) return not card.ability.extra.in_use end,

    use = function(self, card, area)
        card.ability.extra.activity = "active!"
        card.ability.extra.in_use = true
        local eval = function(card) return not card.REMOVED and not G.RESET_JIGGLES end
        juice_card_until(card, eval, true)
    end,
}

SMODS.Consumable {
    key = "huckleberry",
    set = "berry",

    atlas = "berries",
    pos = {
        x = 1,
        y = 3,
     },

    config = {
        extra = {
            berry_xchips = 1.5,
            activity = "inactive",
            in_use = false,
         },
    },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return {
            vars = { card.ability.extra.berry_xchips, card.ability.extra.activity },
         }
    end,

    keep_on_use = function(self, card) return true end,

    calculate = function(self, card, context)
        if context.initial_scoring_step and card.ability.extra.in_use then
            G.GAME.last_used_berry = card.config.center.key
            SMODS.calculate_context({
                berry_activate = card,
             })
           
            SMODS.destroy_cards(card)
            return {
                xchips = card.ability.extra.berry_xchips,
             }
        end

    end,

    can_use = function(self, card) return not card.ability.extra.in_use end,

    use = function(self, card, area)
        card.ability.extra.activity = "active!"
        card.ability.extra.in_use = true
        local eval = function(card) return not card.REMOVED and not G.RESET_JIGGLES end
        juice_card_until(card, eval, true)
    end,
}

SMODS.Consumable {
    key = "haskaps",
    set = "berry",

    atlas = "berries",
    pos = {
        x = 2,
        y = 2,
     },

    config = {
        extra = {
            berry_xchips = 1.5,
            berry_chips = 75,
            activity = "inactive",
            in_use = false,
         },
    },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return {
            vars = { card.ability.extra.berry_chips, card.ability.extra.berry_xchips, card.ability.extra.activity },
         }
    end,

    keep_on_use = function(self, card) return true end,

    calculate = function(self, card, context)
        if context.initial_scoring_step and card.ability.extra.in_use then
            G.GAME.last_used_berry = card.config.center.key
            SMODS.calculate_context({
                berry_activate = card,
             })
            SMODS.destroy_cards(card)
            return {
                chips = card.ability.extra.berry_chips,
                xchips = card.ability.extra.berry_xchips,
             }
        end

    end,

    can_use = function(self, card) return not card.ability.extra.in_use end,

    use = function(self, card, area)
        card.ability.extra.activity = "active!"
        card.ability.extra.in_use = true
        local eval = function(card) return not card.REMOVED and not G.RESET_JIGGLES end
        juice_card_until(card, eval, true)
    end,
}

SMODS.Consumable {
    key = "concord",
    set = "berry",

    atlas = "berries",
    pos = {
        x = 3,
        y = 2,
     },

    config = {
        extra = {
            berry_xchips = 1.5,
            berry_xmult = 1.5,
            activity = "inactive",
            in_use = false,
         },
    },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return {
            vars = { card.ability.extra.berry_xchips, card.ability.extra.berry_xmult, card.ability.extra.activity },
         }
    end,

    keep_on_use = function(self, card) return true end,

    calculate = function(self, card, context)
        if context.initial_scoring_step and card.ability.extra.in_use then
            G.GAME.last_used_berry = card.config.center.key
            SMODS.calculate_context({
                berry_activate = card,
             })
            SMODS.destroy_cards(card)
            return {
                xchips = card.ability.extra.berry_xchips,
                xmult = card.ability.extra.berry_xmult,
                
             }
        end

    end,

    can_use = function(self, card) return not card.ability.extra.in_use end,

    use = function(self, card, area)
        card.ability.extra.activity = "active!"
        card.ability.extra.in_use = true
        local eval = function(card) return not card.REMOVED and not G.RESET_JIGGLES end
        juice_card_until(card, eval, true)
    end,
}

SMODS.Consumable {
    key = "cloudberry",
    set = "berry",

    atlas = "berries",
    pos = {
        x = 0,
        y = 1,
     },

    config = {
        extra = {
            berry_money = 5,
            activity = "inactive",
            in_use = false,
         },
    },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return {
            vars = { card.ability.extra.berry_money, card.ability.extra.activity },
         }
    end,

    keep_on_use = function(self, card) return true end,

    calc_dollar_bonus = function(self, card)
        if card.ability.extra.in_use then
            G.GAME.last_used_berry = card.config.center.key
            SMODS.calculate_context({
                berry_activate = card,
             })
            SMODS.destroy_cards(card)
            return card.ability.extra.berry_money
        end
    end,

    can_use = function(self, card) return not card.ability.extra.in_use end,

    use = function(self, card, area)
        card.ability.extra.activity = "active!"
        card.ability.extra.in_use = true
        local eval = function(card) return not card.REMOVED and not G.RESET_JIGGLES end
        juice_card_until(card, eval, true)
    end,
}

SMODS.Consumable {
    key = "blackberry",
    set = "berry",
    atlas = "berries",
    pos = {
        x = 1,
        y = 1,
    },
    config = {
        extra = {
            draw_cards = 3,
            activity = "inactive",
            in_use = false,
        },
    },

    loc_vars = function(self, info_queue, card)
     
        return {
            vars = { card.ability.extra.draw_cards, card.ability.extra.activity },
        }
    end,

  
    can_use = function(self, card) 
        return G.STATE == G.STATES.SELECTING_HAND 
    end,

    use = function(self, card, area)
        G.GAME.last_used_berry = card.config.center.key
        SMODS.calculate_context({
                berry_activate = card,
             })
        local hand_space = math.min(#G.deck.cards, card.ability.extra.draw_cards)
        for i = 1, hand_space do 
            draw_card(G.deck, G.hand, i * 100 / hand_space, "up", true) 
        end
    end,
}

SMODS.Consumable {
    key = "crepes",
    set = "berry",
    atlas = "berries",
    pos = {
        x = 1,
        y = 5,
    },
    config = {
        extra = {
            free = 1,
            activity = "inactive",
            in_use = 0,
        },
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.free, card.ability.extra.activity },
        }
    end,

    keep_on_use = function(self, card) 
        if G.shop then return false end
        return true 
    end,

    can_use = function(self, card) return true end,

    use = function(self, card, area)
        G.GAME.last_used_berry = card.config.center.key
        card.ability.extra.in_use = card.ability.extra.in_use + 1

        if G.shop then
            SMODS.calculate_context({ berry_activate = card })
            
     
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.GAME.current_round.free_rerolls = G.GAME.current_round.free_rerolls + (card.ability.extra.free * card.ability.extra.in_use)
                    calculate_reroll_cost(true)
                    return true
                end
            }))
            
          
            return
        end


        card.ability.extra.activity = "active!"
        if card.ability.extra.in_use == 1 then
            juice_card_until(card, function(c) return c.ability.extra.in_use > 0 and not c.REMOVED end, true)
        end
    end,
}


local uidef_shop_ref = G.UIDEF.shop
G.UIDEF.shop = function()
    local shop_ui = uidef_shop_ref()
    
    if G.consumeables and G.consumeables.cards then
        for i = #G.consumeables.cards, 1, -1 do
            if G.consumeables.cards[i].config.center.key == 'c_smsn_crepes' and G.consumeables.cards[i].ability.extra.in_use > 0 then
           
                G.GAME.current_round.free_rerolls = G.GAME.current_round.free_rerolls + (G.consumeables.cards[i].ability.extra.free * G.consumeables.cards[i].ability.extra.in_use)
                
                
                G.GAME.last_used_berry = G.consumeables.cards[i].config.center.key
                
                SMODS.calculate_context({ berry_activate = G.consumeables.cards[i] })
                G.consumeables.cards[i]:start_dissolve()
            end
        end
    end
    
    calculate_reroll_cost(true)
    
    return shop_ui
end

SMODS.Consumable {
    key = "picnicbasket",
    set = "berry",
    atlas = "berries",
    pos = {
        x = 2, 
        y = 5,
    },
    config = {
        extra = {
            jokers = 1,
        },
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.jokers },
        }
    end,
    
    can_use = function(self, card)
      
        return G.jokers and #G.jokers.cards < G.jokers.config.card_limit
    end,
    
    use = function(self, card, area, copier)
        G.GAME.last_used_berry = card.config.center.key
        SMODS.calculate_context({ berry_activate = card })
        
        for i = 1, math.min(card.ability.extra.jokers, G.jokers.config.card_limit - #G.jokers.cards) do
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = 0.4,
                func = function()
                    if G.jokers.config.card_limit > #G.jokers.cards then
                        play_sound("timpani")
                        
                        local new_joker = create_card('Food', G.jokers, nil, nil, nil, nil, nil, 'picnicbasket')
                        new_joker:add_to_deck()
                        G.jokers:emplace(new_joker)
                        
                        card:juice_up(0.3, 0.5)
                    end
                    return true
                end,
            }))
        end
        delay(0.6)
    end,
}

SMODS.Consumable {
    key = "fruitsalad",
    set = "berry",
    atlas = "berries",
    pos = {
        x = 3,
        y = 5,
     },
    config = {
        extra = {
            berries = 2,
         },
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.berries },
         }
    end,
    use = function(self, card, area, copier)
        G.GAME.last_used_berry = card.config.center.key
        SMODS.calculate_context({
                berry_activate = card,
             })
        for i = 1, math.min(card.ability.extra.berries, G.consumeables.config.card_limit - #G.consumeables.cards) do
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = 0.4,
                func = function()
                    if G.consumeables.config.card_limit > #G.consumeables.cards then
                        play_sound("timpani")
                        SMODS.add_card({
                            set = "berry",
                         })
                        card:juice_up(0.3, 0.5)
                    end
                    return true
                end,
            }))
        end
        delay(0.6)
    end,
    can_use = function(self, card)
        return G.consumeables and #G.consumeables.cards < G.consumeables.config.card_limit or
                   (card.area == G.consumeables)
    end,
}


SMODS.Consumable {
    key = "donut",
    set = "berry",
    atlas = "berries",
    pos = {
        x = 3,
        y = 4,
    },
    config = {
        extra = {
            multiply = 3,
            activity = "inactive",
            in_use = false,
        },
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.multiply, card.ability.extra.activity },
        }
    end,

    keep_on_use = function(self, card) return true end,

    calculate = function(self, card, context)
        if context.initial_scoring_step and card.ability.extra.in_use then
            G.GAME.last_used_berry = card.config.center.key
            SMODS.calculate_context({
                berry_activate = card,
            })
            SMODS.destroy_cards(card)
            
           
            return {
                chips = G.GAME.hands[context.scoring_name].l_chips * card.ability.extra.multiply,
                mult = G.GAME.hands[context.scoring_name].l_mult * card.ability.extra.multiply,
            }
        end
    end,

    can_use = function(self, card) return not card.ability.extra.in_use end,

    use = function(self, card, area)
        card.ability.extra.activity = "active!"
        card.ability.extra.in_use = true
        
        
        local eval = function(card) return not card.REMOVED and not G.RESET_JIGGLES end
        juice_card_until(card, eval, true)
    end,
}

SMODS.Consumable {
    key = "riceball",
    set = "berry",
    atlas = "berries",
    pos = {
        x = 0,
        y = 5,
    },
    config = {
        extra = {
            activity = "inactive",
            in_use = false,
        },
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.activity },
        }
    end,

    keep_on_use = function(self, card) return true end,

    calculate = function(self, card, context)
        if context.initial_scoring_step and card.ability.extra.in_use then
            G.GAME.last_used_berry = card.config.center.key
            SMODS.calculate_context({
                berry_activate = card,
            })
            
            
            SMODS.destroy_cards(card)

          
            if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                
               
                local planet_key = 'c_pluto' -- Fallback just in case
                for _, v in pairs(G.P_CENTER_POOLS.Planet) do
                    if v.config.hand_type == context.scoring_name then
                        planet_key = v.key
                        break
                    end
                end

                -- Spawn the Planet
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local planet = create_card('Planet', G.consumeables, nil, nil, nil, nil, planet_key, 'riceball')
                        planet:add_to_deck()
                        G.consumeables:emplace(planet)
                        G.GAME.consumeable_buffer = 0
                        return true
                    end
                }))
                
           
                return {
                    message = localize('k_plus_planet'),
                    colour = G.C.SECONDARY_SET.Planet
                }
            end
        end
    end,

    can_use = function(self, card) return not card.ability.extra.in_use end,

    use = function(self, card, area)
        card.ability.extra.activity = "active!"
        card.ability.extra.in_use = true
        local eval = function(card) return not card.REMOVED and not G.RESET_JIGGLES end
        juice_card_until(card, eval, true)
    end,
}

SMODS.Consumable {
    key = "miraclefruit",
    set = "berry",
    atlas = "berries",
    pos = {
        x = 0, 
        y = 7,
    },
    config = {
        extra = {
            activity = "inactive",
            in_use = false,
        },
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.activity },
        }
    end,

    keep_on_use = function(self, card) return true end,

    calculate = function(self, card, context)
        
        if context.before and card.ability.extra.in_use then
            for i = 1, #G.play.cards do
                if G.play.cards[i].debuff then
                    G.play.cards[i].debuff = false
                    G.play.cards[i]:juice_up(0.3, 0.3)
                end
            end
        end

       
        if context.after and card.ability.extra.in_use then
            G.GAME.last_used_berry = card.config.center.key
            SMODS.calculate_context({
                berry_activate = card,
            })
            SMODS.destroy_cards(card)
        end
    end,

    can_use = function(self, card) return not card.ability.extra.in_use end,

    use = function(self, card, area)
        card.ability.extra.activity = "active!"
        card.ability.extra.in_use = true
        
       
        local eval = function(card) return not card.REMOVED and not G.RESET_JIGGLES end
        juice_card_until(card, eval, true)
    end,
}