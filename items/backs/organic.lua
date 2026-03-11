SMODS.Back({
    key = "organic",
    name = "Organic Deck",
    atlas = "backs",
    pos = { x = 6, y = 0 }, 
    
    config = {
        consumable_slot = 2,
        joker_slot = -1,
    },

    loc_vars = function(self, info_queue, back)
        return { vars = { self.config.consumable_slot, math.abs(self.config.joker_slot), } }
    end,

    apply = function(self)
    
        G.GAME.modifiers.smsn_berry_boost = true
    end
})




if not SMODS.ObjectTypes.smsn_berry_themed then
    SMODS.ObjectType {
        key = 'smsn_berry_themed',
        default = 'j_smsn_uncrustable',
        cards = {},
        inject = function(self)
            SMODS.ObjectType.inject(self)
            
            for _, k in ipairs({
                'j_ccc_strawberry',
                'j_ccc_wingedstrawberry',
                'j_ccc_strawberrypie',
                'j_ccc_moonberry',
                'j_SEMBY_berry_blue',
                'j_SEMBY_berry_golden',
                'j_SEMBY_berry_shimmer',
                'j_SEMBY_berry_straw',
                'j_entr_miracle_berry',
                'j_rcb_blueberries',
                'j_entr_elderberries',
                'j_entr_strawberry_pie',
                'j_paperback_tanghulu',





            }) do
                if G.P_CENTERS[k] then
                    self:inject_card(G.P_CENTERS[k])
                end
            end
        end
    }
end