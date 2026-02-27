SMODS.Joker {
    key = "americanbrunch",
    name = "American Brunch",
    pronouns = "she_her",
    atlas = "jokers",
    pos = { x = 0, y = 0 },
    pools = { wip = true },
    config = { extra = { berrybonus = 2 } },
    rarity = 2,
    cost = 4,
    blueprint_compat = false,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = false,

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.berrybonus} }
    end,

    calculate = function(self, card, context)
        
        if context.after and not context.blueprint then
            
           
            if G.GAME.current_round.hands_played == 0 then
                 
                
                 local target_card = nil
                 
                 
                 for _, played_card in ipairs(context.full_hand) do
                     local is_scored = false
                    
                     for _, scored_card in ipairs(context.scoring_hand) do
                         if played_card == scored_card then 
                             is_scored = true
                             break 
                         end
                     end
                     
                     
                     if not is_scored then
                         target_card = played_card
                         break 
                     end
                 end

                 
                 if target_card then
                     -- 1. Visuals
                     card:juice_up()
                     target_card:start_dissolve() 
                     
                   
                     G.GAME.berries = (G.GAME.berries or 0) + card.ability.extra.berrybonus
                     
                   
                     return {
                         message = "Brunch!",
                     }
                 end
            end
        end
    end,
    
    credits = {
		art = "Gud"        
	}
}