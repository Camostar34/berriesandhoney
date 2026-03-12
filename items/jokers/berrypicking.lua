SMODS.Joker { 
    key = "berrypicking",
    name = "Berry Picking",
    pronouns = "she_her",
    atlas = "jokers",
    pos = { x = 7, y = 8 },
    config = { extra = { plus = 1 } },
    rarity = 1,
    unlocked = true,
    discovered = true,
    cost = 4,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,
    pools = {smsn_berry_themed = true,},
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.plus } }
    end,

    add_to_deck = function(self, card, from_debuff)
        smsn_modify_berry_packs(card.ability.extra.plus)
    end,

    remove_from_deck = function(self, card, from_debuff)
        smsn_modify_berry_packs(-card.ability.extra.plus)
    end,

    calculate = function(self, card, context)
      
    end
}

function smsn_modify_berry_packs(amt)
   
    for _, v in pairs(G.P_CENTERS) do
        if v.kind == 'berry' and v.set == 'Booster' then
            v.config.extra = v.config.extra + amt
            v.config.choose = v.config.choose + amt
        end
    end
    
 
    if G.shop_booster and G.shop_booster.cards then
        for i = 1, #G.shop_booster.cards do
            if G.shop_booster.cards[i].config.center.kind == 'berry' then
                G.shop_booster.cards[i].ability.extra = G.shop_booster.cards[i].ability.extra + amt
                G.shop_booster.cards[i].ability.choose = G.shop_booster.cards[i].ability.choose + amt
            end
        end
    end
end