SMODS.Back({
    key = "sticky",
    name = "Sticky Deck",
    atlas = "backs",
    pos = { x = 1, y = 0 },
    
    config = {
        consumables = { 'c_devil' },
        penalty = 1,
        hand_size = 0 
    },
    
   loc_vars = function(self, info_queue, back)
    
        if info_queue then
            info_queue[#info_queue + 1] = G.P_CENTERS.c_devil
        end
        return { vars = { self.config.penalty, self.config.hand_size} }
    end,
    
    apply = function(self)
        G.GAME.modifiers.smsn_gold_boost = true
    end,

    calculate = function(self, back, context)
        if context.pre_discard then
            ease_dollars(-self.config.penalty)
        end
    end
})

-- creates a pool of gold / honey / bee themed jokers.
if not SMODS.ObjectTypes.smsn_sticky then
    SMODS.ObjectType {
        key = 'smsn_sticky',
        default = 'j_golden_ticket',
        cards = {},
        inject = function(self)
            SMODS.ObjectType.inject(self)
            
          
            for k, _ in pairs({
                j_golden = true, 
                j_golden_ticket = true, 
                j_midas_mask = true
            }) do
                if G.P_CENTERS[k] then
                    self:inject_card(G.P_CENTERS[k])
                end
            end
            
            -- hardcode for crossmod jokers that fit the theme of sticky deck
            for _, key in ipairs({
                'j_phanta_fanta',
                'j_pwx_honey',
                'j_nflame_cstar',
                'j_paperback_golden_egg',
                'j_paperback_golden_apple',
                'j_paperback_chocolate_coins',
                'j_paperback_deviled_egg',
                'j_paperback_champagne',
                'j_entr_gold_bar',
                'j_bf_abomihoney',
                'j_artb_gold_plating',
                'j_ccc_goldenstrawberry',
                'j_ccc_wingedgoldenstrawberry',
                'j_cry_goldjoker',
                'j_mf_goldencarrot',
                'j_mf_marigold',
                'j_ortalab_fools_gold',
                'j_SEMBY_berry_golden',
                

            }) do
                if G.P_CENTERS[key] then
                    self:inject_card(G.P_CENTERS[key])
                end
            end

            -- prefixes for certain themed mods like Beelatro
            for k, center in pairs(G.P_CENTERS) do
                for _, prefix in ipairs({
                    'j_bee_' 
                }) do

                    if string.sub(k, 1, string.len(prefix)) == prefix then
                        self:inject_card(center)
                    end
                end
            end
            
        end
    }
end