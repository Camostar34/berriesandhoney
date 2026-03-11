SMODS.Back({
    key = "cuddly",
    name = "Cuddly Deck",
    atlas = "backs",
    pos = { x = 7, y = 0 }, 
    config = {},
    
    loc_vars = function(self, info_queue, back)
        if info_queue then
            info_queue[#info_queue + 1] = G.P_CENTERS.e_holo
        end
        return { vars = {} }
    end,

    apply = function(self)
        G.E_MANAGER:add_event(Event({
            func = function()
                local guest_pool = {}
                for k, v in pairs(G.P_CENTERS) do
                   
                    if v.pools and v.pools.guest and string.match(k, "smsn_") then
                        guest_pool[#guest_pool + 1] = k
                    end
                end

                local chosen_guest = 'j_joker'
                if #guest_pool > 0 then
                    chosen_guest = pseudorandom_element(guest_pool, pseudoseed('cuddly_guest'))
                end

                local card = create_card('Joker', G.jokers, nil, nil, nil, nil, chosen_guest, 'cuddly_spawn')
                
                card:set_edition({ holo = true }, true, true)
                card:add_to_deck()
                G.jokers:emplace(card)
                
                return true
            end
        }))
    end
})