SMODS.Joker {
    key = "americanbrunch",
    name = "American Brunch",
    pronouns = "she_her",
    atlas = "jokers",
    pos = { x = 3, y = 12 },
    pools = { smsn_berry_themed = true, },
    config = { extra = { berrybonus = 2 } },
    rarity = 2,
    cost = 6,
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
     
        if context.joker_main then
            local suit_count = 0
            
            
            for k, _ in pairs(SMODS.Suits) do
               
                for i = 1, #context.full_hand do
                    if context.full_hand[i]:is_suit(k) then
                        suit_count = suit_count + 1
                        break 
                    end
                end
            end

           
            if suit_count >= 3 then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        for i = 1, card.ability.extra.berrybonus do
                           
                            if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                                
                                
                                local berry = create_card('berry', G.consumeables, nil, nil, nil, nil, nil, 'americanbrunch')
                                berry:add_to_deck()
                                G.consumeables:emplace(berry)
                                
                                G.GAME.consumeable_buffer = 0
                            end
                        end
                        return true
                    end
                }))
                
                
                return {
                    message = "Brunch Served!",
                    colour = G.C.PURPLE,
                    card = card
                }
            end
        end
    end,
    
    credits = {
		art = "Gud"        
	}
}