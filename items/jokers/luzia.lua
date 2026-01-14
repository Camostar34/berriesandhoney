SMODS.Joker { 
    key = "luzia",
    name = "Luzia",
    pronouns = "she_her",
    atlas = "jokers",
    pos = { x = 0, y = 0 },

    config = { extra = { lights = 26, darks = 26, mult_to_add = 0,  bonus = 3,} },
    rarity = 1,
    cost = 3,
    blueprint_compat = false,
    eternal_compat = true,
       unlocked = true,
    discovered = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.lights, card.ability.extra.darks, card.ability.extra.mult_to_add, card.ability.extra.bonus,} }
    end,

    calculate = function(self, card, context)
       if context.joker_main then
            return {
                card = card,
                mult = card.ability.extra.mult_to_add,
            }
        end

    end,

        update = function(self, card)
    
   
            if G.playing_cards ~= nil then
                card.ability.extra.lights = 0
                card.ability.extra.darks = 0

               for _, v in pairs(G.playing_cards) do
                if (v:is_suit("Hearts") or v:is_suit("Diamonds")) then
                    card.ability.extra.lights = card.ability.extra.lights + 1
                end

                if (v:is_suit("Spades") or v:is_suit("Clubs")) then
                    card.ability.extra.darks = card.ability.extra.darks + 1
                end

                end

                

                card.ability.extra.mult_to_add = (card.ability.extra.darks * card.ability.extra.bonus - card.ability.extra.lights * card.ability.extra.bonus)
            end

            if card.ability.extra.mult_to_add < 0 then
                card.ability.extra.mult_to_add = 0
            end
    
    
end,
}