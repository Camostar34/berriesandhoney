SMODS.Joker{
    key = 'rose', --joker key
     pronouns = "she_her",
    atlas = 'jokers',
    rarity = 2, --rarity: 1 = Common, 2 = Uncommon, 3 = Rare, 4 = Legendary
    --soul_pos = { x = 0, y = 0 },
    cost = 8, --cost
    unlocked = true, --where it is unlocked or not: if true, 
    discovered = true, --whether or not it starts discovered
    blueprint_compat = true, --can it be blueprinted/brainstormed/other
    eternal_compat = true, --can it be eternal
    pos = {x =3, y = 0},
    config = { extra = {
        AddMult = 0,
        tally = 0,
        bonus = 2,
    }
},
    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.extra.bonus, card.ability.extra.AddMult}}
    end,
    calculate = function(self,card,context)
        if context.joker_main then
            return {
                card = card,
                mult = card.ability.extra.AddMult
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