function SMODS.current_mod.calculate(self, context)
      if context.end_of_round and context.beat_boss and not context.main_eval and not context.game_over then

        for _, card in ipairs(SMODS.find_card("j_smsn_bash", true)) do 
            SMODS.debuff_card(card, false, 'smsn_bash')
            card:juice_up(0.3, 0.4)
        end
    end
           
end