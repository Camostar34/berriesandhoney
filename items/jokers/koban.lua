SMODS.Joker { 
    key = "koban",
    name = "Koban",
    pronouns = "she_her",
    atlas = "jokers",
    pos = { x = 5, y = 6 },
    pools = {},
    config = { extra = { req = 2, bonus = 1 } },
    rarity = 1,
    cost = 3,
    blueprint_compat = false,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = false,

    loc_vars = function(self, info_queue, card)
        local num, denom = SMODS.get_probability_vars(card, card.ability.extra.bonus, 1, 'smsn_koban_ui')
        
        local gold_count = 0
        if G.hand and G.hand.cards then
            for i = 1, #G.hand.cards do
                if SMODS.has_enhancement(G.hand.cards[i], 'm_gold') and not G.hand.cards[i].debuff then
                    gold_count = gold_count + 1
                end
            end
        end
        
        local current_bonus = math.floor(gold_count / card.ability.extra.req) * num

        return { vars = { card.ability.extra.req, num, current_bonus } }
    end,

    calculate = function(self, card, context)
        
        if context.mod_probability and not context.blueprint then
            
            if context.identifier == 'smsn_koban_ui' then return end
            
            local gold_count = 0
            
            if G.hand and G.hand.cards then
                for i = 1, #G.hand.cards do
                    if SMODS.has_enhancement(G.hand.cards[i], 'm_gold') and not G.hand.cards[i].debuff then
                        gold_count = gold_count + 1
                    end
                end
            end
            
            local bonus = math.floor(gold_count / card.ability.extra.req) * card.ability.extra.bonus

            if bonus > 0 then
                return {
                    numerator = context.numerator + bonus
                }
            end
        end

    end,
}