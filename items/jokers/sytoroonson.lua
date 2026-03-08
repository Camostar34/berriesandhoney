SMODS.Joker {
    key = "sytoroonson",
    name = "Sytoroonson",
    pools = { oc = true },
    atlas = "jokers",
    pos = { x = 0, y = 0 },
    config = { extra = { } },
    rarity = 2,
    cost = 7,
    blueprint_compat = true, 
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
      
        local target = G.GAME.current_round.smsn_sytoroonson or { rank = 'Ace', id = 14 }
        
        return { 
            vars = { localize(target.rank, 'ranks') },
            colours = { G.C.SUITS.Hearts } 
        }
    end,

    calculate = function(self, card, context)
      
        if context.repetition and context.cardarea == G.play then
            
            local target = G.GAME.current_round.smsn_sytoroonson or { rank = 'Ace', id = 14 }
            local has_target = false
            
           
            for _, scoring_card in ipairs(context.scoring_hand) do
                if scoring_card:get_id() == target.id and scoring_card:is_suit('Hearts') then
                    has_target = true
                    break
                end
            end

           
            if has_target then
                return {
                    repetitions = 1,
                    card = card
                }
            end
        end
    end,
}


local function reset_smsn_sytoroonson()
    -- Safety default
    G.GAME.current_round.smsn_sytoroonson = { rank = 'Ace', id = 14 }
    
    local valid_cards = {}
    if G.playing_cards then
        for _, playing_card in ipairs(G.playing_cards) do
            -- Filter out stone cards/no-rank cards
            if not SMODS.has_no_rank(playing_card) then
                valid_cards[#valid_cards + 1] = playing_card
            end
        end
    end
    
    local chosen = pseudorandom_element(valid_cards, 'smsn_sytoroonson' .. (G.GAME.round_resets and G.GAME.round_resets.ante or 1))
    
    if chosen then
        G.GAME.current_round.smsn_sytoroonson.rank = chosen.base.value
        G.GAME.current_round.smsn_sytoroonson.id = chosen.base.id
    end
end


local smods_reset_game_globals_ref = SMODS.current_mod.reset_game_globals
function SMODS.current_mod.reset_game_globals(run_start)
    if smods_reset_game_globals_ref then smods_reset_game_globals_ref(run_start) end
    reset_smsn_sytoroonson()
end