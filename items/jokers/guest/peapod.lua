SMODS.Joker {
    key = "peapod",
    name = "Pea Pod",
    pronouns = "he_him",
    atlas = "jokers",
    pos = {
        x = 2,
        y = 0,
     },
    pools = {
        guest = true,
     },
    config = {
        extra = {
            added_chips = 15,
            current_chips = 0,
         },
    },
    rarity = 1,
    cost = 5,
    blueprint_compat = true,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = false,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.added_chips, card.ability.extra.current_chips },
         }
    end,

    calculate = function(self, card, context)
        if context.joker_main and card.ability.extra.current_chips > 0 then
            return {
                chips = card.ability.extra.current_chips,
             }
        end

        if context.setting_blind and not context.blueprint and not card.getting_sliced then
            local destructable_consumables = {}
            for i = 1, #G.consumeables.cards do
                if not G.consumeables.cards[i].getting_sliced and
                    not G.consumeables.cards[i].ability.eternal then
                    destructable_consumables[#destructable_consumables + 1] = G.consumeables.cards[i]
                end
            end
            local destructable_consumable = next(destructable_consumables) and
                                                pseudorandom_element(destructable_consumables, pseudoseed("peapod"))

            if destructable_consumable then
                destructable_consumable.getting_sliced = true
                card.ability.extra.current_chips = card.ability.extra.current_chips + card.ability.extra.added_chips
                G.E_MANAGER:add_event(Event({
                    func = function()
                        card:juice_up(0.8, 0.8)
                        destructable_consumable:start_dissolve({ G.C.RED }, nil, 1.6)
                        return true
                    end,
                }))
                return {
                    message = localize("k_smsn_yoink_ex")
                }
            end
        end
    end,
    credits = {
        character = "Maridaka",
     },
}
