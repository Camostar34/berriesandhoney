--BOUNTIFUL
CardSleeves.Sleeve({ 
    name = "Bountiful Sleeve",
    key  = "organicsleeve",
    pos  = { x = 5, y = 0 }, 
    atlas = "smsnsleeve",
    unlocked = true,
    
    config = {
        consumable_slot = 2,
        joker_slot = -1,
    },

    loc_vars = function(self)
        if self.get_current_deck_key() == "b_smsn_organic" then
            chosen_key = self.key .. "_alt"
            chosen_vars = {}
        else
            chosen_key = self.key
            chosen_vars = { self.config.consumable_slot, math.abs(self.config.joker_slot) }
        end
        return { key = chosen_key, vars = chosen_vars }
    end,

    apply = function(self)
        if self.get_current_deck_key() ~= "b_smsn_organic" then
            if G and G.GAME and G.GAME.starting_params then
                G.GAME.starting_params.consumable_slots = (G.GAME.starting_params.consumable_slots or 0) + (self.config.consumable_slot or 0)
                G.GAME.starting_params.joker_slots = (G.GAME.starting_params.joker_slots or 0) + (self.config.joker_slot or 0)
            end
            
            if G and G.GAME and G.GAME.modifiers then
                G.GAME.modifiers.smsn_berry_boost = true
            end
        else
           
            G.E_MANAGER:add_event(Event({
                func = function()
                    SMODS.add_card{
                        set              = 'Joker',
                        area             = G.jokers,
                        skip_materialize = true,
                        key              = "j_smsn_berrypicking", 
                        no_edition       = true,
                    }
                    SMODS.add_card{
                        set              = 'Spectral',
                        area             = G.consumeables,
                        skip_materialize = true,
                        key              = "c_smsn_retinalbloom",
                        no_edition       = true,
                    }
                    return true
                end
            }))
        end
    end
})


CardSleeves.Sleeve({
    name = "Sticky Sleeve",
    key = "stickysleeve",
    pos = { x = 0, y = 0 }, -- Adjust to match your atlas!
    atlas = "smsnsleeve",
    unlocked = true,
    
    config = {
        consumables = { 'c_devil' },
        penalty = 1,
    },

    loc_vars = function(self, info_queue)
        if self.get_current_deck_key() == "b_smsn_sticky" then
            chosen_key = self.key .. "_alt"
            chosen_vars = {}
        else
            chosen_key = self.key
            chosen_vars = { self.config.penalty }
            
            if info_queue then
                info_queue[#info_queue + 1] = G.P_CENTERS.c_devil
            end
        end
        return { key = chosen_key, vars = chosen_vars }
    end,

    apply = function(self)
        if self.get_current_deck_key() ~= "b_smsn_sticky" then
            if G and G.GAME and G.GAME.modifiers then
                G.GAME.modifiers.smsn_gold_boost = true
            end
            
            G.E_MANAGER:add_event(Event({
                func = function()
                    SMODS.add_card{
                        set              = 'Consumable',
                        area             = G.consumeables,
                        skip_materialize = true,
                        key              = "c_devil",
                        no_edition       = true,
                    }
                    return true
                end
            }))
        else
           
            G.E_MANAGER:add_event(Event({
                func = function()
                    SMODS.add_card{
                        set              = 'Joker',
                        area             = G.jokers,
                        skip_materialize = true,
                        key              = "j_smsn_honeyjar", 
                        no_edition       = true,
                    }
                    return true
                end
            }))
        end
    end,

    calculate = function(self, back, context)
        if context.pre_discard and self.get_current_deck_key() ~= "b_smsn_sticky" then
            ease_dollars(-self.config.penalty)
        end
    end
})

-- FROSTED
CardSleeves.Sleeve({
    name = "Frosted Sleeve",
    key = "frostedsleeve",
    pos = { x = 3, y = 0 },
    atlas = "smsnsleeve",
    unlocked = true,
    
    config = {
        consumables = { 'c_smsn_page_of_sweets' }, 
        jokers = { 'j_smsn_cookiejar' }
    },

    loc_vars = function(self)
        if self.get_current_deck_key() == "b_smsn_frosted" then
            chosen_key = self.key .. "_alt"
        else
            chosen_key = self.key
        end
        return { key = chosen_key, vars = {} }
    end,

    apply = function(self)
        if self.get_current_deck_key() ~= "b_smsn_frosted" then
           
            G.E_MANAGER:add_event(Event({
                func = function()
                    SMODS.add_card{
                        set              = 'Joker',
                        area             = G.jokers,
                        skip_materialize = true,
                        key              = "j_smsn_cookiejar",
                        no_edition       = true,
                    }
                    SMODS.add_card{
                        set              = 'Consumable',
                        area             = G.consumeables,
                        skip_materialize = true,
                        key              = "c_smsn_page_of_sweets",
                        no_edition       = true,
                    }
                    return true
                end
            }))
        else
           
            if G and G.GAME and G.GAME.modifiers then
                G.GAME.modifiers.smsn_frosted_combo = true
            end
        end
    end,

    calculate = function(self, back, context)
        if context.playing_card_added and context.cards and self.get_current_deck_key() == "b_smsn_frosted" then
            for _, _card in pairs(context.cards) do
              
                if _card.config and _card.config.center and _card.config.center.key == 'm_smsn_cookie' then
                 
                    smsn_apply_random_glaze(_card)
                end
            end
        end
    end
})

--GINGHAM
CardSleeves.Sleeve({ 
    name = "Gingham Sleeve",
    key  = "picnicsleeve",
    pos  = { x = 1, y = 0 },
    atlas = "smsnsleeve",
    unlocked = true,

    config = {
        consume    = 2,  
        joker_slot = 1, 
    },

    loc_vars = function(self)
        if self.get_current_deck_key() == "b_smsn_picnic" then
            chosen_key = self.key .. "_alt"
            chosen_vars = {}
        else
            chosen_key = self.key
            chosen_vars = { self.config.consume, self.config.joker_slot }
        end
        return { key = chosen_key, vars = chosen_vars }
    end,

    apply = function(self)
        if self.get_current_deck_key() ~= "b_smsn_picnic" then
          
            if G and G.GAME and G.GAME.starting_params then
                G.GAME.starting_params.consumable_slots = (G.GAME.starting_params.consumable_slots or 0) + (self.config.consume or 0)
                G.GAME.starting_params.joker_slots      = (G.GAME.starting_params.joker_slots      or 0) - (self.config.joker_slot or 0)
            end
            
            G.E_MANAGER:add_event(Event({
                func = function()
                    SMODS.add_card{
                        set              = 'Joker',
                        area             = G.jokers,
                        skip_materialize = true,
                        key              = "j_smsn_ginghamjoker",
                        no_edition       = true,
                    }
                    return true
                end
            }))
        else
            G.E_MANAGER:add_event(Event({
                func = function()
                    for _, card in ipairs(G.playing_cards) do
                        if card.base.suit == 'Hearts' then
                            card:set_ability(G.P_CENTERS.m_smsn_gingham)
                        end
                    end
                    return true
                end
            }))
        end
    end
})

--DEFUNCT
CardSleeves.Sleeve({ 
  name     = "Defunct Sleeve",
  key      = "defunctsleeve",
  pos      = { x = 2, y = 0 },
  atlas    = "smsnsleeve",
  unlocked = true,
  
  loc_vars = function(self)
    if self.get_current_deck_key() == "b_smsn_defunct" then
      chosen_key = self.key .. "_alt"
      -- ALT: We inject the voucher into the config here!
      self.config = { voucher = 'v_magic_trick' }
      chosen_vars = { localize { type = 'name_text', key = self.config.voucher, set = 'Voucher' } }
    else
      chosen_key = self.key
      -- NORMAL: Empty config, no voucher!
      self.config = {}
      chosen_vars = {}
    end
    return { key = chosen_key, vars = chosen_vars }
  end,

  apply = function(self)
    -- This calls Larswijn's native function, which automatically and safely redeems whatever is in self.config!
    CardSleeves.Sleeve.apply(self)

    if self.get_current_deck_key() ~= "b_smsn_defunct" then
      -- NORMAL SLEEVE specific logic
      if G and G.GAME and G.GAME.starting_params then
        G.GAME.starting_params.no_faces = true
      end

      G.E_MANAGER:add_event(Event({
        func = function()
          SMODS.add_card{
            set              = 'Joker',
            area             = G.jokers,
            skip_materialize = true,
            key              = "j_smsn_commonrambley", -- Spawning the proper Rambley!
            no_edition       = true,
          }
          return true
        end
      }))
    else
      -- UPGRADED SLEEVE specific logic
      if G and G.GAME and G.GAME.modifiers then
        G.GAME.modifiers.smsn_defunct_combo = true
      end
      -- We don't need any voucher logic here at all, because CardSleeves.Sleeve.apply(self) already handled it!
    end
  end,

  calculate = function(self, back, context)
    if context.playing_card_added and context.cards then
      for _, _card in pairs(context.cards) do
        if _card:is_face() then
          if self.get_current_deck_key() == "b_smsn_defunct" then
            _card:set_edition({polychrome = true}, true, true)
          else
            _card:set_edition({holo = true}, true, true)
          end
        end
      end
    end
  end,
})



-- CUDDLY
CardSleeves.Sleeve({
    name = "Cuddly Sleeve",
    key = "cuddlysleeve",
    pos = { x = 4, y = 0 }, 
    atlas = "smsnsleeve",
    unlocked = true,
    config = {},

    loc_vars = function(self)
        if self.get_current_deck_key() == "b_smsn_cuddly" then
            chosen_key = self.key .. "_alt"
        else
            chosen_key = self.key
        end
        return {
            key = chosen_key,
            vars = {}
        }
    end,

    apply = function(self, back)
        if self.get_current_deck_key() ~= "b_smsn_cuddly" then
        
            G.E_MANAGER:add_event(Event({
                func = function()
                    guest_pool = {}
                    for k, v in pairs(G.P_CENTERS) do
                        if v.pools and v.pools.guest and string.match(k, "smsn_") then
                            guest_pool[#guest_pool + 1] = k
                        end
                    end

                    chosen_guest = 'j_joker'
                    if #guest_pool > 0 then
                        chosen_guest = pseudorandom_element(guest_pool, pseudoseed('cuddly_sleeve_spawn'))
                    end

                    card = create_card('Joker', G.jokers, nil, nil, nil, nil, chosen_guest, 'cuddly_spawn')
                    card:set_edition({ holo = true }, true, true)
                    card:add_to_deck()
                    G.jokers:emplace(card)
                    
                    return true
                end
            }))
        else
    
            if G and G.GAME and G.GAME.modifiers then
                G.GAME.modifiers.smsn_cuddly_boost = true
            end
        end
    end
})

