SMODS.Joker {
    key = "crazyglazer",
    name = "Crazy Glazer",

    atlas = "jokers",
    pos = { x = 6, y = 10 },
    pools = { },
    config = { extra = {odds = 4} },
    rarity = 2,
    cost = 6,
    blueprint_compat = false,
       unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = false,

  loc_vars = function(self, info_queue, card)
          local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'smsn_crazyglazer')
        return { vars = {numerator, denominator} }
    end,

    calculate = function(self, card, context)
      
        if context.smsn_card_drawn and not context.blueprint then
            local drawn_card = context.drawn_card
            
           
            if drawn_card and not drawn_card.edition then
                
               
                if SMODS.pseudorandom_probability(card, 'smsn_crazyglazer', 1, card.ability.extra.odds) then
                    
                   
                   smsn_apply_random_glaze(drawn_card)
                    
                    
                    return {
                        message = "Glazed!",
                        colour = G.C.DARK_EDITION,
                        card = drawn_card
                    }
                end
            end
        end
    end,
}


local draw_card_ref = draw_card
function draw_card(from, to, percent, dir, sort, card, delay, mute, stay_flipped, vol, dissolve_colours)
    
    draw_card_ref(from, to, percent, dir, sort, card, delay, mute, stay_flipped, vol, dissolve_colours)

   
   if to == G.hand and card and G.GAME.blind and G.GAME.blind.in_blind then
        SMODS.calculate_context({
            smsn_card_drawn = true, 
            drawn_card = card      
        })
    end
end