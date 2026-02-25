SMODS.Joker {
    key = "doubledipping",
    name = "Double Dipping",

    atlas = "jokers",
    pos = { x = 0, y = 11 },
    pools = { },
    config = { extra = {} },
    rarity = 1,
    cost = 4,
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
}