SMODS.Joker {
    key = "memory",
    name = "Memory of Apprenticeship",
    pronouns = "she_they",
    atlas = "jokers",
    pos = { x = 0, y = 12 },
    pools = { },
    config = { extra = { faceneed = 2, has_triggered = false } },
    rarity = 1,
    cost = 6,
    blueprint_compat = false,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        
        local current_loc_key = self.key 
        
        
        if card.ability.extra.has_triggered then
            current_loc_key = "j_smsn_memory_active"
        end
        
        return { key = current_loc_key, vars = {card.ability.extra.faceneed} }
    end,

    calculate = function(self, card, context)
        if context.discard and context.other_card == context.full_hand[#context.full_hand] then
            local face_cards = 0
            for _, discarded_card in ipairs(context.full_hand) do
                if discarded_card:is_face() then face_cards = face_cards + 1 end
            end
            
            if face_cards >= card.ability.extra.faceneed then
            
                card.ability.extra.has_triggered = true
                
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                G.E_MANAGER:add_event(Event({
                    func = (function()
                        SMODS.add_card {
                            set = 'berry',
                            edition = "e_negative"
                        }
                        G.GAME.consumeable_buffer = 0
                        return true
                    end)
                }))
                return {
                    message = localize('k_plus_berry'),
                    colour = G.C.SECONDARY_SET.Tarot,
                }
            end
        end
    end
}

SMODS.DynaTextEffect {
    key = "shaking",
    func = function(dynatext, index, letter)
     
        local intensity = 5 
        

        letter.offset.x = (love.math.random() * 2 - 1) * intensity
        letter.offset.y = (love.math.random() * 2 - 1) * intensity
    end
}