SMODS.Joker {
    key = "cassknows",
    name = "Cassknows",
    pronouns = "she_her",
    atlas = "jokers",
    pos = { x = 0, y = 0 },
    pools = { guest = true,  },
    config = { extra = { multiply = 1.5, } },
    rarity = 2,
    cost = 6,
    blueprint_compat = false,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = false,
    demicolon_compat = false,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.multiply } }
    end,

   
    add_to_deck = function(self, card, from_debuff) 
        smsn_multiply_all_glaze_values(card.ability.extra.multiply) 
    end,
    
 
    remove_from_deck = function(self, card, from_debuff) 
        smsn_multiply_all_glaze_values(1 / (card.ability.extra.multiply)) 
    end,

    calculate = function(self, card, context)
     
    end,
    
    credits = {
        character = "cassknows",       
        code = "GhostSalt"  --this is just a repurposed version of her ROA emmy code     
    }
}


function smsn_multiply_glaze_values(glaze_extra, mult)
    if not glaze_extra then return glaze_extra end
    for k, v in pairs(glaze_extra) do 
        if type(v) == "number" then 
            glaze_extra[k] = v * mult 
        end 
    end
    return glaze_extra
end

function smsn_multiply_all_glaze_values(mult)
    if G.playing_cards then
        for i = 1, #G.playing_cards do
            if G.playing_cards[i].edition and G.P_CENTERS[G.playing_cards[i].edition.key] and G.P_CENTERS[G.playing_cards[i].edition.key].pools and G.P_CENTERS[G.playing_cards[i].edition.key].pools.Glaze then
                G.playing_cards[i].edition.extra = smsn_multiply_glaze_values(G.playing_cards[i].edition.extra, mult)
            end
        end
    end
    
    for _, v in pairs(G.P_CENTERS) do
        if v.pools and v.pools.Glaze and v.config and v.config.extra then 
            v.config.extra = smsn_multiply_glaze_values(v.config.extra, mult) 
        end
    end
end