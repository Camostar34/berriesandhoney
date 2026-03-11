SMODS.Joker {
    key = "doubledipping",
    name = "Double Dipping",

    atlas = "jokers",
    pos = { x = 0, y = 11 },
    pools = { },
    config = { extra = {} },
    rarity = 1,
    cost = 6,
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
        if context.repetition and context.cardarea == G.play then
                if context.other_card.edition then
                
                    local edition_obj = G.P_CENTERS[context.other_card.edition.key]
                    
                    if edition_obj.pools and edition_obj.pools.Glaze then
                        return {
            
                            repetitions = 1,
                            card = card
                        }
                    end
                end
        end
    end,
    in_pool = function(self, args)
        if not G.playing_cards then return false end
        
        for _, v in ipairs(G.playing_cards) do
            if v.edition then
                for k, is_active in pairs(v.edition) do
                    if type(k) == 'string' and is_active then
                       
                        local center = G.P_CENTERS["e_" .. k] or G.P_CENTERS[k]
                        if center and center.pools and center.pools.Glaze then
                            return true
                        end
                    end
                end
            end
        end
        return false
    end,
}