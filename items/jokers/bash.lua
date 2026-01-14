SMODS.Joker { 
    key = "bash",
    name = "Bashkelox",
    pronouns = "he_him",
    atlas = "jokers",
    pos = { x = 0, y = 0 },

    config = { extra = { 
        blind_reduce = 0.2, 
        odds = 2, 
    debuffed = true} },
    rarity = 1,
    cost = 3,
    blueprint_compat = true,
       unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
          local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'bashkelox')
        return { vars = {1 - card.ability.extra.blind_reduce,numerator, denominator} }
    end,

    calculate = function(self, card, context)

       if context.first_hand_drawn then
        G.GAME.blind.chips = math.floor(G.GAME.blind.chips - G.GAME.blind.chips * card.ability.extra.blind_reduce)
        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
        G.hand_text_area.blind_chips:juice_up()
        return {
            message = "Reduced!"
        }
       end

       if context.end_of_round and not context.beat_boss and context.game_over == false and context.main_eval and not context.blueprint then
            if SMODS.pseudorandom_probability(card, 'bashkelox', 1, card.ability.extra.odds) then
                SMODS.debuff_card(card, true, 'smsn_bash')
                return {
                    message = "Debuffed!"
                }
            else
                return {
                    message = localize('k_safe_ex')
                }
            end
        end


      
    end,


}