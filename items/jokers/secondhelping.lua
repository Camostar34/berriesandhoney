SMODS.Joker {
    key = "secondhelping",
    name = "Second Helping",

    atlas = "jokers",
    pos = {
        x = 3,
        y = 5,
     },
    pools = {
    
     },
    config = {
        extra = {
            odds = 2,
         },
    },
    rarity = 1,
    cost = 3,
    blueprint_compat = false,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        local num, denom = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, "secondhelping")
        return {
            vars = { num, denom },
         }
    end,

    calculate = function(self, card, context)
        if context.retrigger_joker_check and context.other_card.config.center.set == 'berry' and
            SMODS.pseudorandom_probability(card, "secondhelping", 1, card.ability.extra.odds) then
            return {
                repetitions = 1,
             }
        end
    end,
}
