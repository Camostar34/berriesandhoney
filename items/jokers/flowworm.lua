SMODS.Joker {
    key = "flowworm",
    name = "Flow Worm",
    pronouns = "any_all",
    atlas = "jokers",
    pos = { x = 4, y = 5 },
    pools = { bitsandbops = true },
    config = { extra = { rate = 7, odds = 7, current_card = 0 } },
    rarity = 2,
    unlocked = true,
    discovered = true,
    cost = 7,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
    local num, denom = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, "flowworm")
        return { vars = { card.ability.extra.rate, math.max(card.ability.extra.rate - card.ability.extra.current_card, 1), num, denom } }
    end,

    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            for _, v in ipairs(context.scoring_hand) do
                card.ability.extra.current_card = card.ability.extra.current_card + 1
                if card.ability.extra.current_card >= card.ability.extra.rate then
                    v.smsn_flowworm_retrigger = true
                    card.ability.extra.current_card = 0
                end
            end
        end

        if context.repetition and context.other_card.smsn_flowworm_retrigger then
            context.other_card.smsn_flowworm_retrigger = false
            return { repetitions = 1 }
        end

        if context.end_of_round and not context.individual and not context.repetition and not context.blueprint and card.ability.extra.rate > 1 and SMODS.pseudorandom_probability(card, "flowworm", 1, card.ability.extra.odds) then
            card.ability.extra.rate = math.max(card.ability.extra.rate - 1, 1)
            return { message = localize("k_upgrade_ex") }
        end
    end,

    credits = {
		code = "GhostSalt"             
	}
}
