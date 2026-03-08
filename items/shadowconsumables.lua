SMODS.Atlas({
	key = "shadowitems",
	path = "shadow_items.png",
	px = 69,
	py = 95
})


-- LUCKY COIN
SMODS.Consumable {
    set = 'Tarot', key = 'luckycoin', name = 'Lucky Coin',
    pos = {x=2, y=0}, atlas = 'shadowitems', cost = 3, in_pool = false,
    config = {extra = {odds = 2, money = 7}},
    
    loc_vars = function(self, info_queue, card)
        local num, den = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'smsn_lucky_coin')
        return {vars = { num, den, card.ability.extra.money}}
    end,
    
    can_use = function(self, card) return true end,
    
    use = function(self, card, area, copier)
        if SMODS.pseudorandom_probability(card, 'smsn_lucky_coin', 1, card.ability.extra.odds) then
            ease_dollars(card.ability.extra.money)
            card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_safe_ex'), colour = G.C.MONEY})
        else
           
            card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_nope_ex'), colour = G.C.TAROT})
        end
    end
}

-- BOOK
SMODS.Consumable {
    set = 'Tarot', key = 'book', name = 'Book',
    pos = {x=1, y=0}, atlas = 'shadowitems', cost = 3, in_pool = false,
    can_use = function(self, card) return true end,
    use = function(self, card, area, copier)
        ease_discard(1)
    end
}

SMODS.Consumable {
    set = 'Tarot', key = 'shark', name = 'Shark',
    pos = {x=0, y=0}, atlas = 'shadowitems', cost = 3, in_pool = false,
    
    can_use = function(self, card) return G.hand and #G.hand.highlighted == 1 and #G.hand.cards > 1 end,
    
    use = function(self, card, area, copier)
       
        local valid_targets = {}
        for i = 1, #G.hand.cards do
            if G.hand.cards[i] ~= G.hand.highlighted[1] then
                valid_targets[#valid_targets+1] = G.hand.cards[i]
            end
        end

        G.hand.highlighted[1]:start_dissolve()

        
        local copy = copy_card(pseudorandom_element(valid_targets, pseudoseed('shark')), nil, nil, nil, true)
        
 
        copy.ability.perma_bonus = (copy.ability.perma_bonus or 0) + copy.base.nominal
        
       
        for _, stat in ipairs({'bonus', 'mult', 'h_chips', 'h_mult', 'p_dollars', 'h_dollars', 'repetitions'}) do
            -- Funnel base enhancement into perma
            if copy.ability[stat] and copy.ability[stat] > 0 then
                copy.ability['perma_'..stat] = (copy.ability['perma_'..stat] or 0) + copy.ability[stat]
            end
        
            if copy.ability['perma_'..stat] and copy.ability['perma_'..stat] > 0 then
                copy.ability['perma_'..stat] = copy.ability['perma_'..stat] * 2
            end
        end

       
        for _, stat in ipairs({'x_chips', 'x_mult', 'h_x_chips', 'h_x_mult'}) do
           
            if copy.ability[stat] and copy.ability[stat] > 1 then
                copy.ability['perma_'..stat] = (copy.ability['perma_'..stat] or 1) * copy.ability[stat]
            end
          
            if copy.ability['perma_'..stat] and copy.ability['perma_'..stat] > 1 then
                copy.ability['perma_'..stat] = copy.ability['perma_'..stat] * 2
            end
        end

       
        copy:add_to_deck()
        G.deck.config.card_limit = G.deck.config.card_limit + 1
        table.insert(G.playing_cards, copy)
        
       
        G.hand:emplace(copy)
    end
}


SMODS.Consumable {
    set = 'Tarot', key = 'feather', name = 'Feather',
    pos = {x=3, y=0}, atlas = 'shadowitems', cost = 3, in_pool = false,
    can_use = function(self, card) return true end,
    use = function(self, card, area, copier)
 
        G.GAME.feather_active = (G.GAME.feather_active or 0) + 1
        G.GAME.probabilities.normal = G.GAME.probabilities.normal * 3
        card_eval_status_text(card, 'extra', nil, nil, nil, {message = "Tripled!", colour = G.C.GREEN})
    end
}


local original_end_round = end_round
function end_round()
    if G.GAME.feather_active and G.GAME.feather_active > 0 then

        G.GAME.probabilities.normal = G.GAME.probabilities.normal / (3 ^ G.GAME.feather_active)
        G.GAME.feather_active = 0
    end
    original_end_round()
end






-- MEGALODON
SMODS.Consumable {
    set = 'Spectral', key = 'megalodon', name = 'Megalodon',
    pos = {x=5, y=0}, atlas = 'shadowitems', cost = 4, in_pool = false,
    
    can_use = function(self, card) return G.hand and #G.hand.cards > 0 end,
    
    use = function(self, card, area, copier)
        
        local chosen_face = pseudorandom_element({'Jack', 'Queen', 'King'}, pseudoseed('megalodon'))

        G.E_MANAGER:add_event(Event({
            trigger = 'after', delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))

      
        for i = 1, #G.hand.cards do
            G.E_MANAGER:add_event(Event({
                trigger = 'after', delay = 0.15,
                func = function()
                    G.hand.cards[i]:flip()
                    play_sound('card1', 1.15 - (i - 0.999) / (#G.hand.cards - 0.998) * 0.3)
                    G.hand.cards[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        delay(0.2)

       
        for i = 1, #G.hand.cards do
            G.E_MANAGER:add_event(Event({
                trigger = 'after', delay = 0.1,
                func = function()
                    SMODS.change_base(G.hand.cards[i], nil, chosen_face)
                    return true
                end
            }))
        end

        
        for i = 1, #G.hand.cards do
            G.E_MANAGER:add_event(Event({
                trigger = 'after', delay = 0.15,
                func = function()
                    G.hand.cards[i]:flip()
                    play_sound('tarot2', 0.85 + (i - 0.999) / (#G.hand.cards - 0.998) * 0.3, 0.6)
                    G.hand.cards[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end


        G.E_MANAGER:add_event(Event({
            trigger = 'after', delay = 0.2,
            func = function()
                
                G.GAME.round_resets.discards = G.GAME.round_resets.discards - 1
                ease_discard(-1)
                return true
            end
        }))
        delay(0.5)
    end
}

-- YHARON
SMODS.Consumable {
    set = 'Spectral', key = 'yharon', name = 'Yharon',
    pos = {x=4, y=0}, atlas = 'shadowitems', cost = 4, in_pool = false,
    
    can_use = function(self, card) return G.hand and #G.hand.cards > 0 end,
    
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after', delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))

      
        for i = 1, #G.hand.cards do
            G.E_MANAGER:add_event(Event({
                trigger = 'after', delay = 0.15,
                func = function()
                    G.hand.cards[i]:flip()
                    play_sound('card1', 1.15 - (i - 0.999) / (#G.hand.cards - 0.998) * 0.3)
                    G.hand.cards[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        delay(0.2)

     
        for i = 1, #G.hand.cards do
            G.E_MANAGER:add_event(Event({
                trigger = 'after', delay = 0.1,
                func = function()
                    -- Base chips
                    G.hand.cards[i].ability.perma_bonus = (G.hand.cards[i].ability.perma_bonus or 0) + G.hand.cards[i].base.nominal
                
                    for _, stat in ipairs({'bonus', 'h_chips'}) do
                        if G.hand.cards[i].ability[stat] and G.hand.cards[i].ability[stat] > 0 then
                            G.hand.cards[i].ability['perma_'..stat] = (G.hand.cards[i].ability['perma_'..stat] or 0) + G.hand.cards[i].ability[stat]
                        end
                        if G.hand.cards[i].ability['perma_'..stat] and G.hand.cards[i].ability['perma_'..stat] > 0 then
                            G.hand.cards[i].ability['perma_'..stat] = G.hand.cards[i].ability['perma_'..stat] * 2
                        end
                    end

                   
                    for _, stat in ipairs({'x_chips', 'h_x_chips'}) do
                        if G.hand.cards[i].ability[stat] and G.hand.cards[i].ability[stat] > 1 then
                            G.hand.cards[i].ability['perma_'..stat] = (G.hand.cards[i].ability['perma_'..stat] or 1) * G.hand.cards[i].ability[stat]
                        end
                        if G.hand.cards[i].ability['perma_'..stat] and G.hand.cards[i].ability['perma_'..stat] > 1 then
                            G.hand.cards[i].ability['perma_'..stat] = G.hand.cards[i].ability['perma_'..stat] * 2
                        end
                    end
                    return true
                end
            }))
        end

        for i = 1, #G.hand.cards do
            G.E_MANAGER:add_event(Event({
                trigger = 'after', delay = 0.15,
                func = function()
                    G.hand.cards[i]:flip()
                    play_sound('tarot2', 0.85 + (i - 0.999) / (#G.hand.cards - 0.998) * 0.3, 0.6)
                    G.hand.cards[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end

        G.E_MANAGER:add_event(Event({
            trigger = 'after', delay = 0.2,
            func = function()
                G.GAME.starting_params.hand_size = G.GAME.starting_params.hand_size - 2
                G.hand:change_size(-2)
                return true
            end
        }))
        delay(0.5)
    end
}