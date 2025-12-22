--atlas
SMODS.Atlas {
    key = "smsnsleeve",
    path = "sleeves.png",
    px = 73,
    py = 95
}

CardSleeves.Sleeve({ -- Covetous Sleeve
    name = "Sticky Sleeve",
    key = "stickysleeve",
    loc_txt = {
        name = "Sticky Sleeve",
        text = {
        "Start with a",
        "{C:attention,T:j_picubed_shoppingtrolley}#1#{},",
        "{C:attention,T:j_picubed_preorderbonus}#2#{},",
        "and {C:attention,T:v_seed_money}#3#{}",
        },
    },
    pos = { x = 0, y = 0 },
    atlas = "smsnsleeve",
    unlocked = true,
    loc_vars = function(self)
        local key, vars
        if self.get_current_deck_key() == "b_smsn_sticky" then
            key = self.key .. "_alt"
            vars = { 
                localize { type = 'name_text', set = 'Joker', key = 'j_picubed_shoppingtrolley' },
                localize { type = 'name_text', set = 'Joker', key = 'j_picubed_preorderbonus' },
                localize { type = 'name_text', set = 'Voucher', key = 'v_seed_money' },
                localize { type = 'name_text', set = 'Voucher', key = 'v_money_tree' },
            }
        else
            key = self.key
            vars = { 
                localize { type = 'name_text', set = 'Joker', key = 'j_picubed_shoppingtrolley' },
                localize { type = 'name_text', set = 'Joker', key = 'j_picubed_preorderbonus' },
                localize { type = 'name_text', set = 'Voucher', key = 'v_seed_money' },
            }
        end
        return { key = key, vars = vars }
    end,
    apply = function(self)
        if self.get_current_deck_key() == "b_smsn_sticky" then
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.GAME.used_vouchers['v_money_tree'] = true
                    G.GAME.interest_cap = 100
                    SMODS.add_card({set = 'Joker', area = G.jokers, skip_materialize = true, key = "j_picubed_shoppingtrolley", no_edition = true})
                    SMODS.add_card({set = 'Joker', area = G.jokers, skip_materialize = true, key = "j_picubed_shoppingtrolley", no_edition = true})
                    return true 
                end
            }))
        else
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.GAME.used_vouchers['v_seed_money'] = true
                    G.GAME.interest_cap = 50
                    SMODS.add_card({set = 'Joker', area = G.jokers, skip_materialize = true, key = "j_picubed_shoppingtrolley", no_edition = true})
                    SMODS.add_card({set = 'Joker', area = G.jokers, skip_materialize = true, key = "j_picubed_preorderbonus", no_edition = true})
                    return true 
                end
            }))
        end
    end
})

CardSleeves.Sleeve({ -- my epic sleeve by pi_cubed
    name = "Gingham Sleeve",
    key = "picnicsleeve",
    loc_txt = {
        name = "Gingham Sleeve",
        text = {
            "{C:tarot}pi_cubed's Jokers{}' {C:attention}Jokers{}",
            "are {C:attention}3x{} more likely to appear,",
            "Start with an extra {C:money}$#1#",
        },
    },
    pos = { x = 1, y = 0 },
    atlas = "smsnsleeve",
    unlocked = true,
    loc_vars = function(self)
        local key, vars
        if self.get_current_deck_key() == "b_smsn_picnic" then
            key = self.key .. "_alt"
            vars = { 
                11,
                localize { type = 'name_text', set = 'Joker', key = 'j_picubed_inkjetprinter' }
            }
        else
            key = self.key
            vars = { 
                6
            }
        end
        return { key = key, vars = vars }
    end,
    apply = function(self)
        if self.get_current_deck_key() == "b_smsn_picnic" then
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.GAME.dollars = G.GAME.dollars + 5
                    SMODS.add_card({set = 'Joker', area = G.jokers, skip_materialize = true, key = "j_picubed_inkjetprinter", no_edition = true})
                    return true 
                end
            }))
        else
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.GAME.dollars = G.GAME.dollars + 6
                    return true 
                end
            }))
        end
    end
})

-- relies on additional functions present in lovely/myepicdeck.toml

CardSleeves.Sleeve({ -- Medusa Sleeve
    name = "Defunct Sleeve",
    key = "defunctsleeve",
    loc_txt = {
        name = "Defunct Sleeve",
        text = {
            "Start with 8 {C:attention,T:m_stone}Stone cards{}",
            "instead of Kings and Queens",
        },
    },
    pos = { x = 2, y = 0 },
    atlas = "smsnsleeve",
    unlocked = true,
    loc_vars = function(self)
        local key
        if self.get_current_deck_key() == "b_smsn_defunct" then
            key = self.key .. "_alt"
        else
            key = self.key
        end
        return { key = key }
    end,
    apply = function(self)
        if self.get_current_deck_key() == "b_smsn_defunct" then
            G.E_MANAGER:add_event(Event({
            func = function()
                for k, v in pairs(G.playing_cards) do
                    if v:get_id() == 2 or v:get_id() == 3 then
                        v:set_ability('m_stone', nil, true)
                    end
                end
                return true
            end
        }))
        else
            G.E_MANAGER:add_event(Event({
                func = function()
                    for k, v in pairs(G.playing_cards) do
                        if v:get_id() == 13 or v:get_id() == 12 then
                            v:set_ability('m_stone', nil, true)
                        end
                    end
                    return true
                end
            }))
        end
    end
})
