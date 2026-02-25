SMODS.Joker {
    key = "peoplepleaser",
    name = "People Pleaser",

    atlas = "jokers",
    pos = { x = 0, y = 10 },
    pools = { wip = true},
    config = { extra = {} },
    rarity = 1,
    cost = 5,
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
        if context.after and context.cardarea == G.play and not context.blueprint then
            local glazed_count = 0
            
            for k, v in ipairs(G.play.cards) do
              
                if v:is_face() and not v.debuff and not v.edition then
                    glazed_count = glazed_count + 1
                    
                  
                    smsn_apply_random_glaze(v)
                    
                    
                    v:juice_up(1, 0.5)
                end
            end

            
            if glazed_count > 0 then
                play_sound('tarot1') 
                return {
                    message = "Glazed!",
                    colour = G.C.ORANGE,
                    card = card
                }
            end
        end
    end
}