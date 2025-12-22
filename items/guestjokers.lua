to_big = to_big or function(x) return x end

-- GUEST JOKERS 



SMODS.Joker {
    key = "peapod",
    name = "Pea Pod",

    atlas = "jokers",
    pos = { x = 2, y = 0 },

    config = { extra = { chip_bonus = 15, stolen_goods = 0, chips_to_give = 0,} },
    rarity = 1,
    cost = 3,
    blueprint_compat = false,
       unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.chip_bonus, card.ability.extra.chips_to_give} }
    end,

    calculate = function(self, card, context)
       

    end,
}

SMODS.Joker {
    key = "cass",
    name = "Texas Hold 'Em",

    atlas = "jokers",
    pos = { x = 0, y = 0 },

    config = { extra = { evil_xmult = 0, addxmult = 0.5, } },
    rarity = 1,
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
       

    end,
}


SMODS.Joker {
    key = "puddinhg",
    name = "Puddinhg",

    atlas = "jokers",
    pos = { x = 0, y = 0 },

    config = { extra = { payout = 3,} },
    rarity = 1,
    cost = 3,
    blueprint_compat = false,
       unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        local strawberries_used = (G.GAME.strawberries_used) or 0
        return { vars = {card.ability.extra.payout, card.ability.extra.payout * strawberries_used} }
    end,

    calc_dollar_bonus = function(self, card)
        return G.GAME.strawberries_used * card.ability.extra.payout or nil
    end,
       
}

SMODS.Joker {
    key = "gordon",
    name = "Gordon",

    atlas = "jokers",
    pos = { x = 0, y = 0 },

    config = { extra = { multbonus = 2,} },
    rarity = 1,
    cost = 3,
    blueprint_compat = false,
       unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.multbonus} }
    end,

   calculate = function(self, card, context)
            if context.joker_main then
                
                card.ability.extra.hearts = 0
                card.ability.extra.spades = 0
                card.ability.extra.diamonds = 0
                card.ability.extra.clubs = 0
                    for i = 1, #context.scoring_hand do
                        if context.scoring_hand[i].ability.name ~= 'Wild Card' then
                            if context.scoring_hand[i]:is_suit('Hearts') then card.ability.extra.hearts = card.ability.extra.hearts + 1 end
                            if context.scoring_hand[i]:is_suit('Diamonds') then card.ability.extra.diamonds = card.ability.extra.diamonds + 1 end
                            if context.scoring_hand[i]:is_suit('Spades') then card.ability.extra.spades = card.ability.extra.spades + 1 end
                            if context.scoring_hand[i]:is_suit('Clubs') then card.ability.extra.clubs = card.ability.extra.clubs + 1 end
                        end
                    end
                    for i = 1, #context.scoring_hand do
                        if context.scoring_hand[i].ability.name == 'Wild Card' then
                            if context.scoring_hand[i]:is_suit('Spades') and card.ability.extra.hearts == 0 then card.ability.extra.spades = card.ability.extra.spades + 1
                            elseif context.scoring_hand[i]:is_suit('Diamonds') and card.ability.extra.diamonds == 0 then card.ability.extra.diamonds = card.ability.extra.diamonds + 1 end
                    end

                    
                    if card.ability.extra.hearts == 0 and card.ability.extra.clubs == 0 and card.ability.extra.diamonds > 0 and card.ability.extra.spades > 0 then
                        return {
                            card = card,
                            xmult = card.ability.extra.multbonus,
                        }
                    end
                    
            
        end
         end
        
    
end,
}


SMODS.Joker {
    key = "astro",
    name = "Astro",

    atlas = "jokers",
    pos = { x = 0, y = 0 },

    config = { extra = { } },
    rarity = 1,
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
       

    end,
}


SMODS.Joker {
    key = "shadow",
    name = "Shadow Wizard",

    atlas = "jokers",
    pos = { x = 0, y = 0 },

    config = { extra = { odds = 15,} },
    rarity = 1,
    cost = 3,
    blueprint_compat = false,
       unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.odds} }
    end,

    calculate = function(self, card, context)
       

    end,
}



SMODS.Joker{
    key = 'rose', --joker key
    atlas = 'jokers',
    rarity = 2, --rarity: 1 = Common, 2 = Uncommon, 3 = Rare, 4 = Legendary
    --soul_pos = { x = 0, y = 0 },
    cost = 8, --cost
    unlocked = true, --where it is unlocked or not: if true, 
    discovered = true, --whether or not it starts discovered
    blueprint_compat = true, --can it be blueprinted/brainstormed/other
    eternal_compat = true, --can it be eternal
    pos = {x =0, y = 0},
    config = { extra = {
        AddMult = 0,
        tally = 0,
        bonus = 2
    }
},
    loc_vars = function(self,info_queue,center)
        return {vars = {center.ability.extra.AddMult}}
    end,
    calculate = function(self,card,context)
        if context.joker_main then
            return {
                card = card,
                mult_mod = card.ability.extra.AddMult,
                message = '+' .. card.ability.extra.AddMult .. ' Mult',
                colour = G.C.MULT
            }
        end


  


    end,

    update = function(self, card)
    
   
            if G.playing_cards ~= nil then
                card.ability.extra.tally = 0

                for k, v in pairs(G.playing_cards) do
                    if v:is_face() or v:get_id() == 11 or v:get_id() == 12 or v:get_id() == 13 then 
                        card.ability.extra.tally = card.ability.extra.tally + 1 
                        if card.added_to_deck then
                        v:set_debuff(true)
                        end
                    end
                end

                

                card.ability.extra.AddMult = (card.ability.extra.tally * card.ability.extra.bonus)
            end
    
    
end,
}

SMODS.Joker {
    key = "pedro",
    name = "Pedro Pave",

    atlas = "jokers",
    pos = { x = 0, y = 0 },

    config = { extra = { evil_xmult = 0, addxmult = 0.5, } },
    rarity = 1,
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
       

    end,
}

SMODS.Joker {
    key = "angel",
    name = "Angel",

    atlas = "jokers",
    pos = { x = 0, y = 0 },

    config = { extra = { evil_xmult = 0, addxmult = 0.5, } },
    rarity = 1,
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
       

    end,
}

SMODS.Joker {
    key = "cozy",
    name = "Cozy Fluffer Snugglepaws",

    atlas = "jokers",
    pos = { x = 0, y = 0 },

    config = { extra = { evil_xmult = 0, addxmult = 0.5, } },
    rarity = 1,
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
       

    end,
}
