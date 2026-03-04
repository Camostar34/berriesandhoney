SMODS.Joker {
    key = "ginghamjoker",
    name = "Gingham Joker",

    atlas = "jokers",
    pos = { x = 7, y = 9 },
    pools = { },
    config = { extra = {} },
    rarity = 1,
    cost = 3,
    blueprint_compat = false,
       unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_wild
        return { vars = {card.ability.extra.bonus} }
    end,

    calculate = function(self, card, context)

      if context.debuff_card and (SMODS.has_enhancement(context.debuff_card, 'm_smsn_gingham')) then
            return {
                prevent_debuff = true
            }
    end

                  if context.check_enhancement and (SMODS.has_enhancement(context.other_card, 'm_smsn_gingham')) then
    return {
        m_wild = true,
    }
    end

    end,
}