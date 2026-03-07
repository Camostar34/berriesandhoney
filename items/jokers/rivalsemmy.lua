SMODS.Joker {
    key = "rivalsemmy",
    name = "ROA Emmy",
    pools = {
        oc = true,
     },
    atlas = "jokers",
    pos = {
        x = 0,
        y = 0,
     },

    rarity = 3,
    cost = 9,
    blueprint_compat = false,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    add_to_deck = function(self, card, from_debuff) smsn_multiply_all_berry_values(2) end,
    remove_from_deck = function(self, card, from_debuff) smsn_multiply_all_berry_values(1 / 2) end,

    credits = {
        code = "GhostSalt",
     },
}

function smsn_multiply_all_berry_values(mult)
    for i = 1, #G.consumeables.cards do
        G.consumeables.cards[i].ability.extra = smsn_multiply_berry_values(G.consumeables.cards[i].ability.extra, mult)
    end
    for _, v in pairs(G.P_CENTERS) do
        if v.set == "Berry" then v.config.extra = smsn_multiply_berry_values(v.config.extra, mult) end
    end
end

function smsn_multiply_berry_values(berry, mult) -- We shouldn't recurse down nested tables, in case a Berry wants to keep track of playing cards, or such.
    local new_berry = berry
    for k, v in pairs(new_berry) do if type(v) == "number" then new_berry[k] = new_berry[k] * mult end end
    return new_berry
end
