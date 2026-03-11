SMODS.Joker { 

    key = "chamoille",
    name = "Honey Chamoille Tea",
     enhancement_gate = 'm_gold',
    pronouns = "she_her",
    atlas = "jokers",
    pos = { x = 2, y = 8 },
    pools = {smsn_sticky = true, },
    config = { extra = { } },
    rarity = 2,
    unlocked = true,
    discovered = true,
    cost = 6,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,

    calculate = function(self, card, context)
       
        if context.debuff_card and (SMODS.has_enhancement(context.debuff_card, 'm_gold')) then
            return {
                prevent_debuff = true
            }
            end

    end,
}
