SMODS.Joker { 
    key = "cinnamoroll",
    name = "Cinnamoroll",
    pronouns = "he_him",
    atlas = "jokers",
    pos = { x = 6, y = 13 },
    pools = { yuru = true },
    config = { extra = { rerolls = 6, max = 6 } },
    rarity = 3,
    unlocked = true,
    discovered = true,
    cost = 9,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = false,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {set = 'Tag', key = 'tag_polychrome'}
        return { vars = { card.ability.extra.rerolls, card.ability.extra.max } }
    end,

    calculate = function(self, card, context)
        if context.reroll_shop then
            
           
            if context.blueprint then
              
                if card.ability.extra.rerolls == 1 or card.ability.extra.rerolls == 0 then
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            add_tag(Tag('tag_polychrome'))
                            play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                            play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
                            return true
                        end
                    }))
                    return {
                        message = localize('k_smsn_tag'),
                        colour = G.C.DARK_EDITION,
                        card = card
                    }
                end

          
            else
                card.ability.extra.rerolls = card.ability.extra.rerolls - 1
                
                if card.ability.extra.rerolls <= 0 then
                    
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            add_tag(Tag('tag_polychrome'))
                            play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                            play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
                            
                           
                            card.ability.extra.rerolls = card.ability.extra.max
                            return true
                        end
                    }))
                    
                    return {
                        message = localize('k_smsn_tag'),
                        colour = G.C.DARK_EDITION,
                        card = card
                    }
                else
                    return {
                       message = tostring(card.ability.extra.rerolls),
                       colour = G.C.BLUE
                    }
                end
            end
        end
    end
}