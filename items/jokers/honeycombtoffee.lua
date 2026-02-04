SMODS.Joker {
    key = "honeycombtoffee",
    name = "Honeycomb Toffee",
    pronouns = "she_they",
    atlas = "jokers",
    pos = { x = 4, y = 2 },
    pools = { wip = true},
    config = { extra = { } },
    rarity = 2,
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
       
        if context.check_enhancement and context.other_card.config.center == G.P_CENTERS.m_gold then
    return {
        m_glass = true,
    }
    end

    if context.mod_probability and context.trigger_obj and not context.blueprint then
        if SMODS.has_enhancement(context.trigger_obj, "m_glass") and SMODS.has_enhancement(context.trigger_obj, "m_gold") then
            return { numerator = context.numerator * 2 }
        end
    end

    end,
    credits = {
		code = "Candycanearter07"        
	}
}

-- Thank you for all your help, Sappy!

-- god damnit why is this so hard

SMODS.Enhancement:take_ownership("gold",
    {
        loc_vars = function(self, info_queue, card)
            
            if next(SMODS.find_card("j_smsn_honeycombtoffee")) and card and not card.fake_card then
                local fake_glass = G.P_CENTERS.m_glass:create_fake_card()
                local v = {}
                v[1] = fake_glass.ability.Xmult
                local num, den = SMODS.get_probability_vars(card, 1, fake_glass.ability.extra, "glass")
                v[2] = num
                v[3] = den
                info_queue[#info_queue + 1] = {
                    set = "Enhanced",
                    key = "m_glass",
                    vars = v,
                    config = v,
                }
            end

        
            local dollar = self.config.h_dollars   

            if card and card.ability and card.ability.h_dollars then
                dollar = card.ability.h_dollars
            end
   

            return {
                vars = { SMODS.signed_dollars(dollar) },
                key  = "m_gold",
            }
        end,
    },
    true
)
