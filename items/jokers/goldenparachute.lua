SMODS.Joker { 
    key = "goldenparachute",
    name = "Golden Parachute",
    pronouns = "she_her",
    atlas = "jokers",
    pos = { x = 1, y = 9 },
    soul_pos = { x = 2, y = 9 },
    config = { extra = { } },
    rarity = 3,
    unlocked = true,
    discovered = true,
    pools = {  },
    cost = 9,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)

        return { vars = {} }
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over and context.main_eval and not context.blueprint then
            
      
            local has_gold = false
            if G.hand and G.hand.cards then
                for i = 1, #G.hand.cards do
                    if SMODS.has_enhancement(G.hand.cards[i], 'm_gold') and not G.hand.cards[i].debuff then
                        has_gold = true
                        break
                    end
                end
            end

           
            if has_gold then
                
         
                if G.playing_cards then
                    for i = 1, #G.playing_cards do
                        if SMODS.has_enhancement(G.playing_cards[i], 'm_gold') then
                            G.playing_cards[i].debuff = true
                        end
                    end
                end
                
                G.E_MANAGER:add_event(Event({
                    func = function()
                        if G.playing_cards then
                            for i = #G.playing_cards, 1, -1 do
                                local c = G.playing_cards[i]
                                if SMODS.has_enhancement(c, 'm_gold') then
                                    c:start_dissolve()
                                end
                            end
                        end
                        
                        play_sound('glass1')
                        play_sound('coin1')
                        card:start_dissolve()
                        
                        return true
                    end
                }))
                
              
                return {
                    message = localize('k_saved_ex'),
                    saved = "Saved by Golden Parachute",
                    colour = G.C.MONEY
                }
            end
        end
    end,
}