SMODS.Joker {
    key = "apiary",
    pronouns = "she_they",
    atlas = "jokers",
    pos = { x = 0, y = 0 },
    pools = {smsn_sticky = true},
    config = { extra = {multper = 2, current_mult = 0} },
    rarity = 1,
    cost = 5,
    blueprint_compat = true,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = false,

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.multper, card.ability.extra.current_mult} }
    end,

    update = function(self, card, dt)
        if G.playing_cards then
            smsn_apiary_gold_count = 0
            
            for smsn_i = 1, #G.playing_cards do
                if SMODS.has_enhancement(G.playing_cards[smsn_i], "m_gold") then
                    smsn_apiary_gold_count = smsn_apiary_gold_count + 1
                end
            end
            
            card.ability.extra.current_mult = smsn_apiary_gold_count * card.ability.extra.multper
        end
    end,

    calculate = function(self, card, context)
      
        if context.individual and context.cardarea == G.play then
            
            if card.ability.extra.current_mult > 0 then
                return {
                    mult = card.ability.extra.current_mult,
                    card = card
                }
            end
        end 
    end, 
}
