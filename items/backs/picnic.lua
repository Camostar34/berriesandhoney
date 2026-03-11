SMODS.Back({
    key = "picnic",
    name = "Gingham Deck",
    config = { jokers = {
      'j_smsn_ginghamjoker'
    } },
    atlas = "backs",
    pos = { x = 0, y = 0 },
    loc_vars = function(self, info_queue, back)
        return { vars = { self.config.consumable_slot , self.config.joker_slot} }
    end,

    apply = function(self)
       
        G.E_MANAGER:add_event(Event({
            func = function()
                for _, card in ipairs(G.playing_cards) do
                    if card.base.suit == 'Diamonds' then
                      
                        card:set_ability(G.P_CENTERS.m_smsn_gingham)
                    end
                end
                return true
            end
        }))
    end
    
})