SMODS.Joker {
    key = "apiary",
   pronouns = "she_they",
    atlas = "jokers",
    pos = { x = 0, y = 0 },
    pools = { },
    config = { extra = { } },
    rarity = 1,
    cost = 4,
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
        
        if context.smsn_card_drawn and not context.blueprint then
            
            if SMODS.has_enhancement(context.drawn_card, "m_gold") and not context.drawn_card.debuff then
                
                G.E_MANAGER:add_event(Event({
                    func = function()
                        -- MEAD BARREL CHECK
                        local mult = next(SMODS.find_card('j_smsn_meadbarrel')) and 2 or 1
                        local final_payout = context.drawn_card.ability.h_dollars * mult
                        
                        ease_dollars(final_payout)
                        
                        card_eval_status_text(context.drawn_card, 'extra', nil, nil, nil, {
                            message = localize('$') .. final_payout,
                            colour = G.C.MONEY
                        })
                        
                        context.drawn_card:juice_up()
                        card:juice_up()
                        play_sound('coin1')
                        
                        return true
                    end -- 1. Closes the function()
                }))

            end -- 2. Closes the Gold Card check
        end -- 3. Closes the Drawn Card check
        
    end, -- 4. Closes the calculate function
} -- 5. Closes the SMODS.Joker table




local eval_card_ref = eval_card

function eval_card(card, context)
    -- 1. Check if this is a Gold Card in hand at the end of the round
    local is_gold_end = context.end_of_round and context.cardarea == G.hand and SMODS.has_enhancement(card, "m_gold")
    
    local stored_dollars = 3 -- Fallback
    
    -- 2. THE PRE-HIJACK
    if is_gold_end then
        stored_dollars = card.ability.h_dollars or 3
        
        if next(SMODS.find_card('j_smsn_apiary')) then
            -- Tell the engine the card is worth $0
            card.ability.h_dollars = 0 
        elseif next(SMODS.find_card('j_smsn_meadbarrel')) then
            -- Tell the engine the card is naturally worth DOUBLE
            card.ability.h_dollars = stored_dollars * 2
        end
    end

    -- 3. THE CALCULATION
    -- We pack the results into a table to safely capture EVERY return value Steamodded generates
    local ret = {eval_card_ref(card, context)}

    -- 4. THE CLEANUP
    if is_gold_end then
        -- Restore the card's true value
        card.ability.h_dollars = stored_dollars
        
        -- If Apiary zeroed it out, we scrub the return table so you don't get a blank "+$0" popup
        if next(SMODS.find_card('j_smsn_apiary')) and type(ret[1]) == 'table' then
            ret[1].h_dollars = nil
            ret[1].message = nil
        end
    end

    -- 5. RETURN
    -- unpack safely hands all the unmodified Steamodded tables back to the game engine
    return unpack(ret) 
end