-- Special thanks to Cassknows for these shaders!

local redglaze_aux_img = love.graphics.newImage("Mods/berriesandhoney/assets/shaders/redglaze2x.png");
local blueglaze_aux_img = love.graphics.newImage("Mods/berriesandhoney/assets/shaders/blueglaze2x.png");
local yellowglaze_aux_img = love.graphics.newImage("Mods/berriesandhoney/assets/shaders/yellowglaze2x.png");
local brownglaze_aux_img = love.graphics.newImage("Mods/berriesandhoney/assets/shaders/brownglaze2x.png");
local orangeglaze_aux_img = love.graphics.newImage("Mods/berriesandhoney/assets/shaders/orangeglaze2x.png");

SMODS.Shader({
    key = "redglaze",
    path = "glazed.fs",
    send_vars = function(sprite, card)
        if not card.asdf then
            card.asdf = math.random()
        end

        return {
            aux_img = redglaze_aux_img,
            aux_num = card.asdf,
        }
    end,
})

SMODS.Shader({
    key = "blueglaze",
    path = "glazed.fs",
    send_vars = function(sprite, card)
        if not card.asdf then
            card.asdf = math.random()
        end

        return {
            aux_img = blueglaze_aux_img,
            aux_num = card.asdf,
        }
    end,
})


SMODS.Shader({
    key = "yellowglaze",
    path = "glazed.fs",
    send_vars = function(sprite, card)
        if not card.asdf then
            card.asdf = math.random()
        end

        return {
            aux_img = yellowglaze_aux_img,
            aux_num = card.asdf,
        }
    end,
})


SMODS.Shader({
    key = "brownglaze",
    path = "glazed.fs",
    send_vars = function(sprite, card)
        if not card.asdf then
            card.asdf = math.random()
        end

        return {
            aux_img = brownglaze_aux_img,
            aux_num = card.asdf,
        }
    end,
})

SMODS.Shader({
    key = "orangeglaze",
    path = "glazed.fs",
    send_vars = function(sprite, card)
        if not card.asdf then
            card.asdf = math.random()
        end

        return {
            aux_img = orangeglaze_aux_img,
            aux_num = card.asdf,
        }
    end,
})

SMODS.Edition{
  key    = "redglaze",
  shader = "redglaze",
  pools  = { Glaze = true },
  in_shop = false,
  weight  = 0,
  sound   = { sound = "polychrome1", per = 1.2, vol = 0.7 },

  config  = {
    extra = {
      multbonus = 3,
    },
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        self.config.extra.multbonus
      }
    }
  end,

  calculate = function(self, card, context)
    if (context.post_joker or context.main_scoring) and context.cardarea == G.play then
      return {
        xmult = (card and card.edition and card.edition.extra and card.edition.extra.multbonus)
             or self.config.extra.multbonus
      }
    end

    if context.after and context.cardarea == G.play and card then

         G.E_MANAGER:add_event(Event({
                            trigger = "immediate",
                            func = (function()
                            card:set_edition()
                            card:juice_up(0.8, 0.8)
                            
                        return true
                            end)
                        }))
      
    end
  end,
}


SMODS.Edition{
  key    = "blueglaze",
  shader = "blueglaze",
  pools  = { Glaze = true },
  in_shop = false,
  weight  = 0,
  sound   = { sound = "polychrome1", per = 1.2, vol = 0.7 },

  config  = {
    extra = {
      chipbonus = 2,
    },
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        self.config.extra.chipbonus
      }
    }
  end,

  calculate = function(self, card, context)
    if (context.post_joker or context.main_scoring) and context.cardarea == G.play then
      return {
        xchips = (card and card.edition and card.edition.extra and card.edition.extra.chipbonus)
             or self.config.extra.chipbonus
      }
    end

    if context.after and context.cardarea == G.play and card then

         G.E_MANAGER:add_event(Event({
                            trigger = "immediate",
                            func = (function()
                            card:set_edition()
                            card:juice_up(0.8, 0.8)
                            
                        return true
                            end)
                        }))
      
    end
  end,
}

SMODS.Edition{
  key    = "yellowglaze",
  shader = "yellowglaze",
  pools  = { Glaze = true },
  in_shop = false,
  weight  = 0,
  sound   = { sound = "polychrome1", per = 1.2, vol = 0.7 },

  config  = {
    extra = {
      dollarbonus = 5,
    },
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        self.config.extra.dollarbonus
      }
    }
  end,

  calculate = function(self, card, context)
    if (context.post_joker or context.main_scoring) and context.cardarea == G.play then
      return {
        dollars = (card and card.edition and card.edition.extra and card.edition.extra.dollarbonus)
             or self.config.extra.dollarbonus
      }
    end

    if context.after and context.cardarea == G.play and card then

         G.E_MANAGER:add_event(Event({
                            trigger = "immediate",
                            func = (function()
                            card:set_edition()
                            card:juice_up(0.8, 0.8)
                            
                        return true
                            end)
                        }))
      
    end
  end,
}

SMODS.Edition{
  key    = "brownglaze",
  shader = "brownglaze",
  pools  = { Glaze = true },
  in_shop = false,
  weight  = 0,
  sound   = { sound = "polychrome1", per = 1.2, vol = 0.7 },

  config  = { card_limit = 1,
    extra = {
      areasize = 1,
    },
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        self.config.extra.areasize
      }
    }
  end,

  calculate = function(self, card, context)

    if (context.after and context.cardarea == G.play) or context.discard then

         G.E_MANAGER:add_event(Event({
                            trigger = "immediate",
                            func = (function()
                            card:set_edition()
                            card:juice_up(0.8, 0.8)
                            
                        return true
                            end)
                        }))
      
    end
  end,
}

SMODS.Edition{
  key    = "orangeglaze",
  shader = "orangeglaze",
  pools  = { Glaze = true },
  in_shop = false,
  weight  = 0,
  sound   = { sound = "polychrome1", per = 1.2, vol = 0.7 },

  config  = { card_limit = 1,
    extra = {
      areasize = 1,
    },
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        self.config.extra.areasize
      }
    }
  end,

  calculate = function(self, card, context)

    if (context.after and context.cardarea == G.play) or context.discard then

         G.E_MANAGER:add_event(Event({
                            trigger = "immediate",
                            func = (function()
                            card:set_edition()
                            card:juice_up(0.8, 0.8)
                            
                        return true
                            end)
                        }))
      
    end
  end,
}
