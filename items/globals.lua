function SMODS.current_mod.calculate(self, context)
      if context.end_of_round and context.beat_boss and not context.main_eval and not context.game_over then

        for _, card in ipairs(SMODS.find_card("j_smsn_bash", true)) do 
            SMODS.debuff_card(card, false, 'smsn_bash')
            card:juice_up(0.3, 0.4)
        end
    end
           
end



function smsn_apply_random_glaze(card)

    local valid_glazes = {
        "e_smsn_redglaze",
        "e_smsn_blueglaze",
        "e_smsn_yellowglaze",
        "e_smsn_brownglaze",
        "e_smsn_orangeglaze"
    }

   
    local selected_key = pseudorandom_element(valid_glazes, pseudoseed('smsn_glaze'))
    card:set_edition(selected_key, true, true)
end


local drpd_ref = G.FUNCS.draw_from_play_to_discard

G.FUNCS.draw_from_play_to_discard = function(e)

    local peanut_active = next(SMODS.find_card('j_smsn_peanutbutter'))
    local samson_active = next(SMODS.find_card('j_smsn_samson'))
    
   
    local play_count = #G.play.cards
    local it = 1
    
    for k, v in ipairs(G.play.cards) do
        if not v.shattered and not v.destroyed then
            local return_to_hand = false
            
      
            if peanut_active then 
                return_to_hand = true 
            end

           
            if samson_active and SMODS.has_enhancement(v, 'm_gold') then 
                return_to_hand = true 
            end

        
            if v.edition and v.edition.key == 'e_smsn_orangeglaze' then
                return_to_hand = true
            end

           
            if return_to_hand then
              
                draw_card(G.play, G.hand, it*100/play_count, 'up', true, v)
            else
               
                draw_card(G.play, G.discard, it*100/play_count, 'down', false, v)
            end
            it = it + 1
        end
    end
end