
local function sort_pipingbag(a, b)
    local target_suit = G.GAME.current_round.smsn_pipingbag_suit and G.GAME.current_round.smsn_pipingbag_suit.suit or 'Spades'
    

    local val_a = a:is_suit(target_suit) and 2 or 1
    local val_b = b:is_suit(target_suit) and 2 or 1
    
    if val_a ~= val_b then
        return val_a < val_b
    end
    
    return false
end

local ref_shuffle = CardArea.shuffle
function CardArea:shuffle(seed, seed_mod)

    ref_shuffle(self, seed, seed_mod)


    if self == G.deck and next(SMODS.find_card("j_smsn_pipingbag")) then
        table.sort(self.cards, sort_pipingbag)
        self:align_cards()
    end
end 

SMODS.Joker {
    key = "pipingbag",
    name = "Piping Bag",
    pronouns = "he_him",
    atlas = "jokers",
    pos = { x = 3, y = 7 },
    pools = { },
    rarity = 2,
    cost = 4,
    blueprint_compat = false,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = false,

    loc_vars = function(self, info_queue, card)
        local target_suit = G.GAME.current_round.smsn_pipingbag_suit and G.GAME.current_round.smsn_pipingbag_suit.suit or 'Spades'
        
        return { 
            vars = { 
                localize(target_suit, 'suits_singular'), 
                colours = { G.C.SUITS[target_suit] or G.C.UI.TEXT_LIGHT } 
            } 
        }
    end,

    calculate = function(self, card, context)

    end,
}

local function reset_smsn_pipingbag_suit()
    G.GAME.current_round.smsn_pipingbag_suit = { suit = 'Spades' }
    
    local valid_cards = {}
    if G.playing_cards then
        for _, playing_card in ipairs(G.playing_cards) do
            if not SMODS.has_no_suit(playing_card) then
                valid_cards[#valid_cards + 1] = playing_card
            end
        end
    end
    
    local chosen_card = pseudorandom_element(valid_cards, 'smsn_pipingbag' .. (G.GAME.round_resets and G.GAME.round_resets.ante or 1))
    
    if chosen_card then
        G.GAME.current_round.smsn_pipingbag_suit.suit = chosen_card.base.suit
    end
end

local smods_reset_game_globals_ref = SMODS.current_mod.reset_game_globals
function SMODS.current_mod.reset_game_globals(run_start)
    if smods_reset_game_globals_ref then smods_reset_game_globals_ref(run_start) end
    reset_smsn_pipingbag_suit()
end

