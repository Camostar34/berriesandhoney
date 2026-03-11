
SMODS.Consumable {
    key = 'retinalbloom',
    set = 'Spectral',
    atlas = 'spectrals',
    pos = { x = 0, y = 0 },
    config = { extra = { seal = 'smsn_freshness' }, max_highlighted = 1 },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_SEALS[card.ability.extra.seal]
        return { vars = { card.ability.max_highlighted } }
    end,
    use = function(self, card, area, copier)
        local conv_card = G.hand.highlighted[1]
        G.E_MANAGER:add_event(Event({
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function()
                conv_card:set_seal(card.ability.extra.seal, nil, true)
                return true
            end
        }))

        delay(0.5)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                G.hand:unhighlight_all()
                return true
            end
        }))
    end,
}

SMODS.Consumable {
    key = 'cloying',
    set = 'Spectral',
    atlas = 'spectrals',
    pos = { x = 1, y = 0 },
    config = { extra = {} },
    
    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,

    
    in_pool = function(self, args)
        if not G.playing_cards then return false end
        
        for _, v in ipairs(G.playing_cards) do
            if v.edition then
                for k, is_active in pairs(v.edition) do
                    if type(k) == 'string' and is_active then
                       
                        local center = G.P_CENTERS["e_" .. k] or G.P_CENTERS[k]
                        if center and center.pools and center.pools.Glaze then
                            return true
                        end
                    end
                end
            end
        end
        return false
    end,
    
    can_use = function(self, card)
        return true 
    end,
    
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                for _, v in ipairs(G.playing_cards) do
                    if v.edition then
                        local is_glazed = false
                        
                       
                        for k, is_active in pairs(v.edition) do
                            if type(k) == 'string' and is_active then
                                local center = G.P_CENTERS["e_" .. k] or G.P_CENTERS[k]
                                if center and center.pools and center.pools.Glaze then
                                    is_glazed = true
                                    break
                                end
                            end
                        end

                      
                        if is_glazed then
                            v:set_edition({
                                [pseudorandom_element({'foil', 'holo', 'polychrome'}, pseudoseed('cloying'))] = true
                            }, true, true)
                            
                            v:juice_up(0.3, 0.3)
                        end
                    end
                end
                return true
            end
        }))
    end,
}

SMODS.Consumable {
    key = 'picnic',
    set = 'Tarot',
    pos = { x = 1, y = 0 },
    atlas = "tarots", 
    config = { max_highlighted = 2, mod_conv = 'm_smsn_gingham' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    -- The config field already handles the functionality so it doesn't need to be implemented
    -- The following is how the implementation would be
    --[[
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        for i = 1, #G.hand.highlighted do
            local percent = 1.15 - (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.highlighted[i]:flip()
                    play_sound('card1', percent)
                    G.hand.highlighted[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        delay(0.2)
        for i = 1, #G.hand.highlighted do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    G.hand.highlighted[i]:set_ability(card.ability.mod_conv)
                    return true
                end
            }))
        end
        for i = 1, #G.hand.highlighted do
            local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.highlighted[i]:flip()
                    play_sound('tarot2', percent, 0.6)
                    G.hand.highlighted[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                G.hand:unhighlight_all()
                return true
            end
        }))
        delay(0.5)
    end,
    can_use = function(self, card)
        return G.hand and #G.hand.highlighted > 0 and #G.hand.highlighted <= card.ability.max_highlighted
    end
    --]]
}

SMODS.Consumable {
    key = 'snack',
    set = 'Tarot',
    pos = { x = 2, y = 0 },
    atlas = "tarots", 
    config = { max_highlighted = 2, mod_conv = 'm_smsn_cookie' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    -- The config field already handles the functionality so it doesn't need to be implemented
    -- The following is how the implementation would be
    --[[
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        for i = 1, #G.hand.highlighted do
            local percent = 1.15 - (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.highlighted[i]:flip()
                    play_sound('card1', percent)
                    G.hand.highlighted[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        delay(0.2)
        for i = 1, #G.hand.highlighted do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    G.hand.highlighted[i]:set_ability(card.ability.mod_conv)
                    return true
                end
            }))
        end
        for i = 1, #G.hand.highlighted do
            local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.highlighted[i]:flip()
                    play_sound('tarot2', percent, 0.6)
                    G.hand.highlighted[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                G.hand:unhighlight_all()
                return true
            end
        }))
        delay(0.5)
    end,
    can_use = function(self, card)
        return G.hand and #G.hand.highlighted > 0 and #G.hand.highlighted <= card.ability.max_highlighted
    end
    --]]
}

SMODS.Consumable {
    key = 'page_of_sweets',
    set = 'Tarot', 
    pos = { x = 0, y = 0 },
    atlas = "tarots", 

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,

    use = function(self, card, area, copier)
        local eligible_cards = {}
        for i = 1, #G.hand.cards do
            if not G.hand.cards[i].edition then
                table.insert(eligible_cards, G.hand.cards[i])
            end
        end


        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))

        for i = 1, #eligible_cards do
            local percent = 1.15 - (i - 0.999) / (#eligible_cards - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    eligible_cards[i]:flip()
                    play_sound('card1', percent)
                    eligible_cards[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        
        delay(0.2)

        for i = 1, #eligible_cards do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    smsn_apply_random_glaze(eligible_cards[i])
                    return true
                end
            }))
        end

        for i = 1, #eligible_cards do
            local percent = 0.85 + (i - 0.999) / (#eligible_cards - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    eligible_cards[i]:flip()
                    play_sound('tarot2', percent, 0.6)
                    eligible_cards[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        
        delay(0.5)
    end,

    can_use = function(self, card)
        if not G.hand then return false end
        for i = 1, #G.hand.cards do
            if not G.hand.cards[i].edition then 
                return true 
            end
        end
        return false
    end
}



local pastry_tarots = {
    { key = 'shortcake', glaze_key = 'smsn_redglaze', pos = { x = 0, y = 1 } },
    { key = 'loaf',      glaze_key = 'smsn_yellowglaze', pos = { x = 1, y = 1 } },
    { key = 'muffin',    glaze_key = 'smsn_blueglaze',  pos = { x = 2, y = 1 } },
    { key = 'stack',     glaze_key = 'smsn_brownglaze',      pos = { x = 0, y = 2 } },
    { key = 'phyllo',    glaze_key = 'smsn_orangeglaze',      pos = { x = 1, y = 2 } },
    { key = 'tart',      glaze_key = 'smsn_candyglaze',       pos = { x = 2, y = 2 } }
}

for _, pastry in ipairs(pastry_tarots) do
    SMODS.Consumable {
        key = pastry.key,
        set = 'Tarot',
        pos = pastry.pos,
        atlas = "tarots", 
        config = { max_highlighted = 3, extra = { glaze = pastry.glaze_key } },
        
        loc_vars = function(self, info_queue, card)
            info_queue[#info_queue + 1] = G.P_CENTERS['e_' .. card.ability.extra.glaze]
            return { vars = { card.ability.max_highlighted } }
        end,

        can_use = function(self, card)
            return G.hand and #G.hand.highlighted > 0 and #G.hand.highlighted <= card.ability.max_highlighted
        end,

        use = function(self, card, area, copier)
            G.E_MANAGER:add_event(Event({
                trigger = 'after', delay = 0.4,
                func = function()
                    play_sound('tarot1')
                    card:juice_up(0.3, 0.5)
                    return true
                end
            }))

            for i = 1, #G.hand.highlighted do
                local percent = 1.15 - (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after', delay = 0.15,
                    func = function()
                        G.hand.highlighted[i]:flip()
                        play_sound('card1', percent)
                        G.hand.highlighted[i]:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end
            
            delay(0.2)

            for i = 1, #G.hand.highlighted do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after', delay = 0.1,
                    func = function()
                        G.hand.highlighted[i]:set_edition({ [card.ability.extra.glaze] = true }, true, true)
                        return true
                    end
                }))
            end

            for i = 1, #G.hand.highlighted do
                local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after', delay = 0.15,
                    func = function()
                        G.hand.highlighted[i]:flip()
                        play_sound('tarot2', percent, 0.6)
                        G.hand.highlighted[i]:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end
            
            G.E_MANAGER:add_event(Event({
                trigger = 'after', delay = 0.2,
                func = function()
                    G.hand:unhighlight_all()
                    return true
                end
            }))
            
            delay(0.5)
        end
    }
end




