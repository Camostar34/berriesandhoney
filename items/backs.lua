SMODS.Back({
    key = "sticky",
    name = "Sticky Deck",
    config = { penalty = 1, hand_size = -1  },
    atlas = "backs",
    pos = { x = 1, y = 0 },
    loc_vars = function(self, info_queue, back)
        return { vars = { self.config.penalty, self.config.hand_size} }
    end,
    apply = function(self)
        G.GAME.starting_params.hand_size =
          (G.GAME.starting_params.hand_size or 0) + (self.config.hand_size or 0)
            G.E_MANAGER:add_event(Event({
                func = function()
                    SMODS.add_card({set = 'Joker', area = G.jokers, skip_materialize = true, key = "j_smsn_beehive", no_edition = true})
                    SMODS.add_card({set = 'Joker', area = G.jokers, skip_materialize = true, key = "j_smsn_honeyjar", no_edition = true})
                return true end
            }))
        end,

        calculate = function(self, back, context)
            if context.pre_discard and #G.hand.highlighted >= 3 then
                return {
                    dollars = self.config.penalty * -1, 
                }
            
            end
        end
    
})


SMODS.Back({
    key = "picnic",
    name = "Gingham Deck",
config = { consumable_slot = 2, joker_slot = -1  },
    atlas = "backs",
    pos = { x = 0, y = 0 },
    loc_vars = function(self, info_queue, back)
        return { vars = { self.config.consumable_slot , self.config.joker_slot} }
    end,


    
})

SMODS.Back({
    key = "defunct",
    name = "Defunct Deck",

    atlas = "backs",
    pos = { x = 2, y = 0 },

     apply = function(self, back)
        G.GAME.starting_params.no_faces = true
        G.E_MANAGER:add_event(Event({
                func = function()
                    SMODS.add_card({set = 'Joker', area = G.jokers, skip_materialize = true, key = "j_smsn_legendaryrambley", no_edition = true})
                return true end
            }))
    end,

     calculate = function(self, back, context)
        if context.playing_card_added then
           if context.playing_card_added then
                for _, _card in pairs(context.cards) do
                    if _card:is_face() then
                        _card:set_edition("e_holo", false, false)
                    end
                end
            end

        end
    end
})
