

SMODS.Joker {
    key = "twistedgarden",
    name = "Twisted Garden",
       pronouns = "it_its",
    atlas = "jokers",
    pos = { x = 0, y = 0 },
    pools = { },
    config = { extra = {} },
    rarity = 3,
    cost = 3,
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

        -- OUGGHHHH IM HOOKING IT!!! I CANT STOP HOOKING IT! NNGHHHHHH FUCK ITS EVERYWHERE

    end,
}

local emplace_ref = CardArea.emplace

function CardArea:emplace(card, location, stay_flipped)
   
    emplace_ref(self, card, location, stay_flipped)

    
    if self == G.consumeables then
        
        
        if card.ability.set == 'Berry' then
            
           
            if next(SMODS.find_card('j_smsn_twistedgarden')) then
                
               
                if not card.edition or not card.edition.negative then
                    card:set_edition({negative = true}, true)
                    card:juice_up(0.5, 0.5) 
                end
            end
        end
    end
end