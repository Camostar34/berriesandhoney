-- Define global suit tables for cross-mod compatibility
LIGHT_SUITS = {
    Hearts = true,
    Diamonds = true,
    bunc_Fleurons = true,
    paperback_Stars = true
}

DARK_SUITS = {
    Spades = true,
    Clubs = true,
    bunc_Halberds = true,
    paperback_Crowns = true
}

SMODS.Joker { 
    key = "monokuma",
    name = "Monokuma",
    pronouns = "he_him",
    atlas = "jokers",
    pos = { x = 7, y = 13 },
    pools = { dr = true },
    config = { extra = { mult_gain = 4, current_mult = 0, from = "Dark", to = "Light"} },
    rarity = 2,
    unlocked = true,
    discovered = true,
    cost = 3,
    blueprint_compat = true, 
    eternal_compat = true,
    perishable_compat = false,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.mult_gain, card.ability.extra.current_mult, card.ability.extra.from, card.ability.extra.to} }
    end,

    calculate = function(self, card, context)
        
    
        if context.joker_main and card.ability.extra.current_mult > 0 then
            return {
                message = localize{type='variable',key='a_mult',vars={card.ability.extra.current_mult}},
                mult_mod = card.ability.extra.current_mult
            }
        end

   
        if context.ante_change and not context.blueprint then
            if card.ability.extra.from == "Dark" then
                card.ability.extra.from = "Light"
                card.ability.extra.to = "Dark"
            else
                card.ability.extra.from = "Dark"
                card.ability.extra.to = "Light"
            end
            
            return {
                message = "Upupupu!",
                colour = G.C.FILTER,
                card = card
            }
        end


        if context.change_suit and not context.blueprint then
            if card.ability.extra.from == "Dark" and DARK_SUITS[context.old_suit] and LIGHT_SUITS[context.new_suit] then
                
                card.ability.extra.current_mult = card.ability.extra.current_mult + card.ability.extra.mult_gain
                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.MULT,
                    card = card
                }
                
            elseif card.ability.extra.from == "Light" and LIGHT_SUITS[context.old_suit] and DARK_SUITS[context.new_suit] then
                
                card.ability.extra.current_mult = card.ability.extra.current_mult + card.ability.extra.mult_gain
                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.MULT,
                    card = card
                }
                
            end
        end
    end
}