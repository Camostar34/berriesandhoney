SMODS.Joker {
    key = "bambi",
    name = "BAMBI",
    pronouns = "she_they",
    atlas = "jokers",
    pos = { x = 0, y = 0 },
    pools = { },

    config = { extra = { rot_active = false } },
    rarity = 2, 
    cost = 6,
    blueprint_compat = false, 
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true, 
    demicolon_compat = false,

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,

    calculate = function(self, card, context)
        
       
        if context.using_consumeable and not context.blueprint then
           
            if context.consumeable.ability.set == 'Berry' and context.consumeable.edition and context.consumeable.edition.key == 'e_negative' then
                card.ability.extra.rot_active = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        card:juice_up(0.5, 0.5)
                        return true
                    end
                }))
            end
        end

   
        if context.destroying_card and not context.blueprint and card.ability.extra.rot_active then
        
            if context.destroying_card == context.scoring_hand[1] then
               
                card.ability.extra.rot_active = false
                return {
                    remove = true,
                    message = "Rot!",
                    colour = G.C.DARK_EDITION
                }
            end
        end
    end,
}