SMODS.Joker {
    key = "robotface",
    name = "Robot Face",

    atlas = "jokers",
    pos = { x = 0, y = 2 },

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