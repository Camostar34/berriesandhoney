SMODS.Joker {
    key = "sytoroonson",
    name = "Sytoroonson",
    pools = { oc = true, },
    atlas = "jokers",
    pos = { x = 0, y = 0 },

    config = { extra = { } },
    rarity = 1,
    cost = 3,
    blueprint_compat = true,
       unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

set_ability = function(self, card, initial, delay_sprites)
        local valid_cards = {}
        if G.playing_cards then
            for k, v in ipairs(G.playing_cards) do
                -- Gather all cards that actually have a rank
                if not SMODS.has_no_rank(v) then
                    valid_cards[#valid_cards+1] = v
                end
            end
        end
        if #valid_cards > 0 then
            
            local chosen_card = pseudorandom_element(valid_cards, pseudoseed('syt_init'))
            card.ability.extra.target_rank = chosen_card.base.value
            card.ability.extra.target_id = chosen_card.base.id
        end
    end,

    loc_vars = function(self, info_queue, card)
        
        return { 
            vars = { localize(card.ability.extra.target_rank, 'ranks') },
            colours = { G.C.SUITS.Hearts } 
        }
    end,

    calculate = function(self, card, context)
        
     
        if context.end_of_round and context.cardarea == G.jokers and not context.blueprint then
            local valid_cards = {}
            for k, v in ipairs(G.playing_cards) do
                if not SMODS.has_no_rank(v) then
                    valid_cards[#valid_cards+1] = v
                end
            end
            
            if #valid_cards > 0 then
              
                local chosen_card = pseudorandom_element(valid_cards, pseudoseed('syt_round' .. G.GAME.round_resets.ante))
                card.ability.extra.target_rank = chosen_card.base.value
                card.ability.extra.target_id = chosen_card.base.id
                
                return {
                    message = localize('k_reset'),
                    colour = G.C.ORANGE
                }
            end
        end

     
        if context.repetition and context.cardarea == G.play then
            
            
            local has_target = false
            for _, scoring_card in ipairs(context.scoring_hand) do
                if scoring_card:get_id() == card.ability.extra.target_id and scoring_card:is_suit('Hearts') then
                    has_target = true
                    break
                end
            end

            if has_target then
                return {
                    message = localize('k_again_ex'),
                    repetitions = 1,
                    card = card
                }
            end
        end

    end,
}