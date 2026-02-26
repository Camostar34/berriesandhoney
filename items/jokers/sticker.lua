SMODS.Joker {
    key = "sticker",
    name = "Scented Sticker",
    pronouns = "it_its",
    atlas = "jokers",
    pos = { x = 1, y = 4 },
    pools = {},
    config = { extra = {} },
    rarity = 2,
    cost = 8,
    blueprint_compat = false,
       unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = false,

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,

   calculate = function(self, card, context)
        
        if context.repetition and context.cardarea == G.play then
            
            if context.other_card and context.other_card.seal then
                
                
                local berry_count = 0
                for k, v in ipairs(G.consumeables.cards) do
                    if v.ability.set == 'Berry' then
                        berry_count = berry_count + 1
                    end
                end

        
                if berry_count > 0 then
                    return {
                        repetitions = berry_count,
                        card = card
                    }
                end
            end
        end
    end,
}
