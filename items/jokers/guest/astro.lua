SMODS.Joker {
    key = "astro",
    name = "Astro",
    pronouns = "he_him",
    atlas = "jokers",
    pools = {
        guest = true,
        wip = true
     },
    pos = {
        x = 7,
        y = 0,
     },

    config = {
        extra = { chips_times = 2.5 },
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
        code = "GhostSalt"
    },
}

-- Thanks, TOGA's Stuff!
local calcindiveffectref = SMODS.calculate_individual_effect
SMODS.calculate_individual_effect = function(effect, scored_card, key, amount, from_edition)
    local astros = SMODS.find_card("j_smsn_astro")
    if scored_card.config.center.set == "Joker" and next(astros) and key then
        if string.lower(key) == "mult" or string.lower(key) == "mult_mod" then
            key = "chips"
            amount = amount * astros[#astros].ability.extra.chips_times
        end
    end

    return calcindiveffectref(effect, scored_card, key, amount, from_edition)
end
