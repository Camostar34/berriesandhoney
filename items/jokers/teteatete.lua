SMODS.Joker {
    key = "teteatete",
    name = "Tete a Tete",
    atlas = "jokers",
    pos = { x = 0, y = 0 },
    pools = {  },
    config = { extra = {  } },
    rarity = 1,
    cost = 3,
    blueprint_compat = false,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = false,

    loc_vars = function(self, info_queue, card)
        return { vars = {  } }
    end,

    calculate = function(self, card, context)
        
        if context.evaluate_poker_hand and not context.blueprint then
            
  
            local faces = {}
            for i = 1, #context.full_hand do
                if context.full_hand[i]:is_face() then
                    faces[#faces + 1] = context.full_hand[i]
                end
            end

            if #faces >= 2 then
                table.sort(faces, function(a, b) return a.base.id > b.base.id end)
                
                -- 2. BUILD THE PIECES
                local face_pairs = {}
                if #faces >= 2 then table.insert(face_pairs, {faces[1], faces[2]}) end
                if #faces >= 4 then table.insert(face_pairs, {faces[3], faces[4]}) end 
                
                local other_pairs = {}
                if context.poker_hands['Pair'] then
                    for _, p in ipairs(context.poker_hands['Pair']) do
                        if not p[1]:is_face() then table.insert(other_pairs, p) end
                    end
                end
                
                local other_threes = {}
                if context.poker_hands['Three of a Kind'] then
                    for _, t in ipairs(context.poker_hands['Three of a Kind']) do
                        if not t[1]:is_face() then table.insert(other_threes, t) end
                    end
                end

                local new_poker_hands = context.poker_hands
                local best_new_hand = nil
                local best_new_scoring_cards = nil


                if #other_threes > 0 and #face_pairs > 0 then
                    if not new_poker_hands['Full House'] then new_poker_hands['Full House'] = {} end
                    local fh_cards = {other_threes[1][1], other_threes[1][2], other_threes[1][3], face_pairs[1][1], face_pairs[1][2]}
                    table.insert(new_poker_hands['Full House'], 1, fh_cards)
                    best_new_hand = "Full House"
                    best_new_scoring_cards = fh_cards
                end

                if not best_new_hand then
                    local two_pair_cards = nil
                    if #face_pairs >= 2 then
                        two_pair_cards = {face_pairs[1][1], face_pairs[1][2], face_pairs[2][1], face_pairs[2][2]}
                    elseif #face_pairs == 1 and #other_pairs > 0 then
                        two_pair_cards = {face_pairs[1][1], face_pairs[1][2], other_pairs[1][1], other_pairs[1][2]}
                    end

                    if two_pair_cards then
                        if not new_poker_hands['Two Pair'] then new_poker_hands['Two Pair'] = {} end
                        table.insert(new_poker_hands['Two Pair'], 1, two_pair_cards)
                        best_new_hand = "Two Pair"
                        best_new_scoring_cards = two_pair_cards
                    end
                end

             
                if not best_new_hand and #face_pairs > 0 then
                    if not new_poker_hands['Pair'] then new_poker_hands['Pair'] = {} end
                    table.insert(new_poker_hands['Pair'], 1, face_pairs[1])
                    best_new_hand = "Pair"
                    best_new_scoring_cards = face_pairs[1]
                end

           
                if best_new_hand then
                    local hand_ranks = {
                        ["High Card"] = 1, ["Pair"] = 2, ["Two Pair"] = 3, 
                        ["Three of a Kind"] = 4, ["Straight"] = 5, ["Flush"] = 6, 
                        ["Full House"] = 7, ["Four of a Kind"] = 8, ["Straight Flush"] = 9
                    }
                    
                    local current_rank = hand_ranks[context.scoring_name] or 1
                    local new_rank = hand_ranks[best_new_hand] or 1
                    
                    local should_override = false
                    
               
                    if new_rank > current_rank then
                        should_override = true
                        
                   
                    elseif new_rank == current_rank and best_new_hand == "Pair" then
                        local current_pair_id = (context.scoring_hand and context.scoring_hand[1]) and context.scoring_hand[1].base.id or 0
                        if faces[1].base.id > current_pair_id then
                            should_override = true
                        end
                    end
                    
                    if should_override then
                        if context.scoring_hand then
                        
                            while #context.scoring_hand > 0 do table.remove(context.scoring_hand) end
                            for i = 1, #best_new_scoring_cards do
                                context.scoring_hand[#context.scoring_hand + 1] = best_new_scoring_cards[i]
                            end
                        end

                        return {
                            replace_poker_hands = new_poker_hands,
                            replace_scoring_name = best_new_hand
                        }
                    else
                        return { replace_poker_hands = new_poker_hands }
                    end
                end
            end
        end
    end,
}