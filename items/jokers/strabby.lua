SMODS.Joker {
    key = "strabby",
    name = "Strabby",

    atlas = "jokers",
    pos = {
        x = 3,
        y = 8,
     },
    pools = {
        bugsnax = true, smsn_berry_themed = true,
     },
    config = {
        extra = {
            added_xmult = 0.5,
            current_xmult = 1,
            odds = 5,
         },
    },
    rarity = 3,
    cost = 8,
    blueprint_compat = true,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = false,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        local num, denom = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, "strabby")
        return {
            vars = { card.ability.extra.added_xmult, num, denom, card.ability.extra.current_xmult },
         }
    end,

    calculate = function(self, card, context)
        if context.joker_main and card.ability.extra.current_xmult > 1 then
            return {
                xmult = card.ability.extra.current_xmult,
             }
        end

        if context.berry_activate and not context.blueprint then
            card.ability.extra.current_xmult = card.ability.extra.current_xmult + card.ability.extra.added_xmult

            if SMODS.pseudorandom_probability(card, "strabby", 1, card.ability.extra.odds) then
                local candidates = {}
                for _, v in ipairs(G.jokers.cards) do
                    if not v.eternal and v ~= card then candidates[#candidates + 1] = v end
                end

                if not next(candidates) then
                    card:start_dissolve()
                    return
                end

                pseudorandom_element(candidates, pseudoseed("strabbydestroy")):start_dissolve()
            end

            return {
                message = localize("k_upgrade_ex"),
             }
        end
    end,
}
