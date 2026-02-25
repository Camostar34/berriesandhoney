SMODS.Joker {
    key = "cherrybomb",
    name = "Cherry Bomb",
    atlas = "jokers",
    pos = {
        x = 4,
        y = 9,
     },
    pools = {},
    config = {
        extra = {
            xmult = 3,
            odds = 2,
         },
    },
    rarity = 2,
    unlocked = true,
    discovered = true,
    cost = 6,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        local num, denom = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, "cherrybomb")
        return {
            vars = { card.ability.extra.xmult, num, denom },
         }
    end,

    calculate = function(self, card, context)
        if context.before and SMODS.pseudorandom_probability(card, "cherrybomb", 1, card.ability.extra.odds) then
            card.ability.extra.due = true
        end
        if context.joker_main and not card.ability.extra.destroyed then
            return {
                xmult = card.ability.extra.xmult,
             }
        end

        if context.destroy_card and context.cardarea == G.play and card.ability.extra.due and not context.blueprint then
            return {
                remove = true,
             }
        end

        if context.destroy_card and card.ability.extra.due and not card.ability.extra.is_destroyed and not context.blueprint then
            card.ability.extra.is_destroyed = true
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound("smsn_cherrybomb", 1, 0.8)
                    card:start_dissolve()
                    return true
                end,
            }))
            return {
                message = localize("k_smsn_kaboom_ex"),
                colour = G.C.RED,
             }
        end
    end,
}

SMODS.Sound({
  key = "cherrybomb",
  path = "smsn_cherrybomb.ogg",
  replace = true
})