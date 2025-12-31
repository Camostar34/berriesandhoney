--atlas
SMODS.Atlas {
    key = "smsnsleeve",
    path = "sleeves.png",
    px = 73,
    py = 95
}

CardSleeves.Sleeve({
  name = "Sticky Sleeve",
  key  = "stickysleeve",
  pos  = { x = 0, y = 0 },
  atlas = "smsnsleeve",
  unlocked = true,

  config = {
    extrahandsize = -1,  -- -1 hand size
    penalty       = 1,   -- 1$ penalty
  },

  loc_vars = function(self)
    local key
    if self.get_current_deck_key() == "b_smsn_sticky" then
      key = self.key .. "_alt"
    else
      key = self.key
    end
    return {
      key  = key,
      vars = { self.config.penalty, self.config.extrahandsize },
    }
  end,

  apply = function(self)
    if self.get_current_deck_key() == "b_smsn_sticky" then
      G.E_MANAGER:add_event(Event({
        func = function()
          SMODS.add_card{
            set             = 'Joker',
            area            = G.jokers,
            skip_materialize = true,
            key             = "j_smsn_samson",
            no_edition      = true,
          }
          return true
        end
      }))
    else
      if G and G.GAME and G.GAME.starting_params then
        G.GAME.starting_params.hand_size =
          (G.GAME.starting_params.hand_size or 0) + (self.config.extrahandsize or 0)
      end

      G.E_MANAGER:add_event(Event({
        func = function()
          SMODS.add_card{
            set             = 'Joker',
            area            = G.jokers,
            skip_materialize = true,
            key             = "j_smsn_beehive",
            no_edition      = true,
          }
          SMODS.add_card{
            set             = 'Joker',
            area            = G.jokers,
            skip_materialize = true,
            key             = "j_smsn_honeyjar",
            no_edition      = true,
          }
          return true
        end
      }))
    end
  end,

  calculate = function(self, back, context)
    if context.pre_discard
       and #G.hand.highlighted >= 3
       and self.get_current_deck_key() ~= "b_smsn_sticky" then
      return {
        dollars = -(self.config.penalty or 0),
      }
    end

    if context.end_of_round
       and context.beat_boss
       and self.get_current_deck_key() == "b_smsn_sticky" then

      local honeyjar = SMODS.find_card("j_smsn_honeyjar", true)
      if honeyjar then
        for _, v in pairs(honeyjar) do
           v.ability.extra.odds = math.ceil(v.ability.extra.odds / 2)
          return {
            card = honeyjar,
            message = "Odds Up!"
          }
        end
      end
    end
  end,
})

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
    local key, vars
    if self.get_current_deck_key() == "b_smsn_picnic" then
      key = self.key .. "_alt"
      vars = {
      }
    else
      key = self.key
      vars = { 6 }
    end
    return { key = key, vars = vars, self.config.consume, self.config.joker_slot }
  end,

  apply = function(self)
    if self.get_current_deck_key() == "b_smsn_picnic" then
      G.E_MANAGER:add_event(Event({
        func = function()
          SMODS.add_card{
            set             = 'Spectral',
            area            = G.consumeables,
            skip_materialize = true,
            key             = "c_smsn_retinalbloom",
            no_edition      = true,
          }
          return true
        end
      }))
    end
    if self.get_current_deck_key() ~= "b_smsn_picnic" then
      if not (G and G.GAME and G.GAME.starting_params) then return end

      local sp = G.GAME.starting_params
      sp.consumable_slots = (sp.consumable_slots or 0) + (self.config.consume    or 0)
      sp.joker_slots      = (sp.joker_slots      or 0) - (self.config.joker_slot or 0)
    end
  end,
})



CardSleeves.Sleeve({ 
  name     = "Defunct Sleeve",
  key      = "defunctsleeve",
  pos      = { x = 2, y = 0 },
  atlas    = "smsnsleeve",
  unlocked = true,
 config = { voucher = 'v_magic_trick'},
  

  loc_vars = function(self)
    local key
    if self.get_current_deck_key() == "b_smsn_defunct" then
      key = self.key .. "_alt"
    else
      key = self.key
    end
    return { key = key,
    vars = { localize { type = 'name_text', key = self.config.voucher, set = 'Voucher' } }
        }
  end,

  apply = function(self, back)
    if self.get_current_deck_key() ~= "b_smsn_defunct" then
    
      if G and G.GAME and G.GAME.starting_params then
        G.GAME.starting_params.no_faces = true
      end

      G.E_MANAGER:add_event(Event({
        func = function()
          SMODS.add_card{
            set             = 'Joker',
            area            = G.jokers,
            skip_materialize = true,
            key             = "j_smsn_legendaryrambley",
            no_edition      = true,
          }
          return true
        end
      }))
    end


  if self.get_current_deck_key() == "b_smsn_defunct" then
    
        G.GAME.used_vouchers[self.config.voucher] = true
                G.GAME.starting_voucher_count = (G.GAME.starting_voucher_count or 0) + 1
                G.E_MANAGER:add_event(Event({ -- Adding back objects of any type from a deck MUST be done within an event
                    func = function()
                        back:apply_to_run(nil, G.P_CENTERS[self.config.voucher])
                        return true
                    end
                }))
            end
  end,

  calculate = function(self, back, context)
    if context.playing_card_added and context.cards then
      local using_defunct = (self.get_current_deck_key() == "b_smsn_defunct")

      for _, _card in pairs(context.cards) do
        if _card:is_face() then
          if using_defunct then
            _card:set_edition(G.P_CENTERS.e_polychrome, false, false)
          else
            _card:set_edition(G.P_CENTERS.e_holo, false, false)
          end
        end
      end
    end
  end,
})

