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
        -- Trigger in the 'after' context (End of hand evaluation)
        if context.after and not context.blueprint then
            
            -- CONDITION 1: Check if it is the FIRST hand of the round
            -- hands_played is 0-indexed here (0 = 1st hand, 1 = 2nd hand)
            if G.GAME.current_round.hands_played == 0 then
                 
                 -- CONDITION 2: Find an unscored card
                 local target_card = nil
                 
                 -- Loop through all played cards
                 for _, played_card in ipairs(context.full_hand) do
                     local is_scored = false
                     -- Check if this card is in the scoring list
                     for _, scored_card in ipairs(context.scoring_hand) do
                         if played_card == scored_card then 
                             is_scored = true
                             break 
                         end
                     end
                     
                     -- If we found a card that DIDN'T score, mark it for death
                     if not is_scored then
                         target_card = played_card
                         break -- We only need to destroy "an" (one) unscored card
                     end
                 end

                 -- EXECUTE: If we found a valid target
                 if target_card then
                     -- 1. Visuals
                     card:juice_up()
                     target_card:start_dissolve() -- Standard "Destroy" animation
                     
                     -- 2. Add Berries (Initialize if nil)
                     G.GAME.berries = (G.GAME.berries or 0) + card.ability.extra.berrybonus
                     
                     -- 3. Notification
                     return {
                         message = "Brunch!",
                         colour = G.C.RED -- Assuming Berries are red?
                     }
                 end
            end
        end
    end,
    
}