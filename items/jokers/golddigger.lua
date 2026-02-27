
local function reset_smsn_golddigger()
    G.GAME.current_round.smsn_golddigger = { rank = 'Ace', suit = 'Diamonds' }
    
    local valid_cards = {}
    if G.playing_cards then
        for _, playing_card in ipairs(G.playing_cards) do
            if not SMODS.has_no_suit(playing_card) and not SMODS.has_no_rank(playing_card) and playing_card:is_suit('Diamonds') then
                valid_cards[#valid_cards + 1] = playing_card
            end
        end
    end
    
    if #valid_cards > 0 then
        local chosen_card = pseudorandom_element(valid_cards, pseudoseed('smsn_golddigger' .. (G.GAME.round_resets.ante or 1)))
        
        G.GAME.current_round.smsn_golddigger.rank = chosen_card.base.value
        G.GAME.current_round.smsn_golddigger.suit = 'Diamonds'
        G.GAME.current_round.smsn_golddigger.id = chosen_card.base.id
    end
end

SMODS.Joker { 
    key = "golddigger",
    name = "Gold Digger",
    pronouns = "any_all",
    atlas = "jokers",
    pos = { x = 6, y = 5 },
    pools = { warioware = true },
    config = { extra = { reward = 8 } },
    rarity = 2,
    unlocked = true,
    discovered = true,
    cost = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    set_ability = function(self, card, initial, delay_sprites)

        if not G.GAME.current_round.smsn_golddigger then
            reset_smsn_golddigger()
        end
    end,

    loc_vars = function(self, info_queue, card)
        local target_card = G.GAME.current_round.smsn_golddigger or { rank = 'Ace', suit = 'Diamonds' }
        
        return { 
            vars = { 
                card.ability.extra.reward, 
                localize(target_card.rank, 'ranks'), 
                localize(target_card.suit, 'suits_plural') 
            },
            colours = { G.C.SUITS[target_card.suit] } 
        }
    end,
    
    calculate = function(self, card, context)

        if context.end_of_round and context.cardarea == G.jokers and not context.blueprint then
            reset_smsn_golddigger()
            
        end

        if context.individual and context.cardarea == G.play then
            local target_card = G.GAME.current_round.smsn_golddigger
            
            if target_card and context.other_card:get_id() == target_card.id and context.other_card:is_suit(target_card.suit) then
                return {
                    dollars = card.ability.extra.reward,
                    card = card
                }
            end
        end
    end,
}