SMODS.Joker { 
    key = "emmy",
    name = "Emmy Bunderbatch",
    pronouns = "she_her",
    atlas = "jokers",
    pos = { x = 0, y = 0 },
    pools = { oc = true, smsn_berry_themed = true, },
    config = { extra = { 
        mult_gain = 3,
    chip_gain = 14,
    counter = 0 } },
    rarity = 2,
    cost = 6,
    blueprint_compat = true,
       unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.mult_gain,card.ability.extra.chip_gain, card.ability.extra.mult_gain * card.ability.extra.counter, card.ability.extra.chip_gain * card.ability.extra.counter} }
    end,

    calculate = function(self, card, context)
       if context.berry_activate and not context.blueprint then
        card.ability.extra.counter = card.ability.extra.counter + 1
        return {
            message = "Upgrade!"
        }
       end

       if context.joker_main then 
        return
        {
            chips = card.ability.extra.chip_gain * card.ability.extra.counter,
            mult = card.ability.extra.mult_gain * card.ability.extra.counter,
        }
       end 


    end,
}