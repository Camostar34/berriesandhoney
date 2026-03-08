SMODS.Joker {
    key = "sparklingmead",
   pronouns = "she_they",
    atlas = "jokers",
    pos = { x = 0, y = 0 },
    pools = { },
    config = { extra = { loss = 6 } },
    rarity = 2,
    cost = 6,
    blueprint_compat = false,
       unlocked = true,
        enhancement_gate = 'm_gold',
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = false,

loc_vars = function(self, info_queue, card)
  
        return { vars = { card.ability.extra.loss } }
    end,

    calculate = function(self, card, context)

        if context.individual and context.end_of_round and context.cardarea == G.hand and not context.blueprint then
            if SMODS.has_enhancement(context.other_card, 'm_gold') then
                
                G.E_MANAGER:add_event(Event({
                    func = function()
                        tag_pool = {}
                        for k, v in pairs(G.P_TAGS) do
                            tag_pool[#tag_pool+1] = k
                        end
                        
                        random_tag_key = pseudorandom_element(tag_pool, pseudoseed('mead_tag'))
                        add_tag(Tag(random_tag_key))
                        
                        play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                        play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
                        return true
                    end
                }))
                
                return {
                    dollars = -card.ability.extra.loss,
                    colour = G.C.RED,
                }
            end
        end
    end,
     credits = {
        idea = "Candycanearter07",
     },
}