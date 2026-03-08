SMODS.Joker {
    key = "meta",
    name = "Meta",
 pronouns = "she_her",
    atlas = "jokers",
    pos = { x = 0, y = 0 },
   pools = { guest = true, },
    config = { extra = {  } },
    rarity = 3,
    cost = 3,
    blueprint_compat = false,
       unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,

calculate = function(self, card, context)
        if context.remove_playing_cards and not context.blueprint then
            for _, removed_card in ipairs(context.removed) do
                
                if SMODS.has_enhancement(removed_card, "m_smsn_cookie") then
                    
                    if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                        
                        local max_plays = -1
                        local top_hand = 'High Card'
                        for k, v in pairs(G.GAME.hands) do
                            if v.played > max_plays then
                                max_plays = v.played
                                top_hand = k
                            end
                        end

            
                        local planet_key = 'c_pluto' 
                        for _, v in pairs(G.P_CENTER_POOLS.Planet) do
                            if v.config.hand_type == top_hand then
                                planet_key = v.key
                                break
                            end
                        end

                    
                        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                local planet = create_card('Planet', G.consumeables, nil, nil, nil, nil, planet_key, 'meta')
                                planet:add_to_deck()
                                G.consumeables:emplace(planet)
                                G.GAME.consumeable_buffer = 0
                                return true
                            end
                        }))
                        
        
                        card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_plus_planet'), colour = G.C.SECONDARY_SET.Planet})
                    end
                end
            end
        end
    end,
     credits = {
		character = "MetaNite64"             
	}
}