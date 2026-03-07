SMODS.Joker {
    key = "astro",
    name = "Astro",
    pronouns = "he_him",
    atlas = "jokers",
    pools = {
        guest = true,
     },
    pos = {
        x = 7,
        y = 0,
     },

    config = {
        extra = {
            chips_times = 2.5,
         },
    },
    rarity = 3,
    cost = 10,
    blueprint_compat = false,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = false,

    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.chips_times },
         }
    end,

    credits = {
        character = "Astro",
        idea = "Astro",
        code = "GhostSalt",
     },
}

-- Thanks, TOGA's Stuff!
local calcindiveffectref = SMODS.calculate_individual_effect
SMODS.calculate_individual_effect = function(effect, scored_card, key, amount, from_edition)
    local me_joker = (effect.juice_card and effect.juice_card.config.center.set == "Joker" and effect.juice_card) or
    (effect.message_card and effect.message_card.config.center.set == "Joker" and effect.message_card) or
    (scored_card and scored_card.config.center.set == "Joker" and scored_card)

    local me
    local chosen_astro
    if me_joker then
        for i, v in ipairs(G.jokers.cards) do if v == me_joker then me = i end end
        chosen_astro = (G.jokers.cards[me + 1] and G.jokers.cards[me + 1].config.center.key == "j_smsn_astro" and
                                 G.jokers.cards[me + 1]) or
                                 (G.jokers.cards[me - 1] and G.jokers.cards[me - 1].config.center.key == "j_smsn_astro" and
                                     G.jokers.cards[me - 1])
    end

    if me_joker and chosen_astro and key then
        if string.lower(key) == "mult" or string.lower(key) == "mult_mod" or string.lower(key) == "h_mult" then
            key = string.lower(key) == "h_mult" and "h_chips" or "chips"
            amount = amount * chosen_astro.ability.extra.chips_times
            effect.message = nil
        end
    end

    return calcindiveffectref(effect, scored_card, key, amount, from_edition)
end
