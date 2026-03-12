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
            chips_times = 6,
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

    if G.jokers and G.jokers.cards and key and (string.lower(key) == "mult" or string.lower(key) == "mult_mod" or string.lower(key) == "h_mult") then
        
        
        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i] == effect.juice_card or G.jokers.cards[i] == effect.message_card or G.jokers.cards[i] == scored_card then
                
               
                if (G.jokers.cards[i - 1] and G.jokers.cards[i - 1].config.center.key == "j_smsn_astro") or 
                   (G.jokers.cards[i + 1] and G.jokers.cards[i + 1].config.center.key == "j_smsn_astro") then
                    
                    
                    key = string.lower(key) == "h_mult" and "h_chips" or "chips"
                    amount = amount * (G.jokers.cards[i - 1] and G.jokers.cards[i - 1].config.center.key == "j_smsn_astro" and G.jokers.cards[i - 1].ability.extra.chips_times or G.jokers.cards[i + 1].ability.extra.chips_times)
                    effect.message = nil
                end
                break
            end
        end
    end

    return calcindiveffectref(effect, scored_card, key, amount, from_edition)
end