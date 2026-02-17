


SMODS.PokerHand {
	key = "honeypot",
	chips = 120,
	mult = 12,
	l_chips = 35,
	l_mult = 3,
	visible = false,
	above_hand = "Four of a Kind",
	example = {
		{ 'S_A', true, enhancement = 'm_gold' },
		{ 'S_A', true, enhancement = 'm_gold' },
		{ 'S_A', true, enhancement = 'm_gold' },
		{ 'S_A', true, enhancement = 'm_gold' },
		{ 'S_A', true, enhancement = 'm_gold' },
	},

	evaluate = function(parts, hand)
		local golds = {}
		for i, card in ipairs(hand) do
			if card.ability.name == "Gold Card" then
				table.insert(golds, card)
			end
		end
		if #golds >= 5 then
			return { golds }
		else
			return {}
		end
	end
}


SMODS.Consumable {
	set = "Planet",
	key = "honeyhive",
	config = { hand_type = "smsn_honeypot", softlock = true },
	pos = { x = 0, y = 0 },
	atlas = "jokers",

	set_card_type_badge = function(self, card, badges)
		badges[1] = create_badge(localize('k_dwarf_planet'), get_type_colour(self or card.config, card), nil, 1.2)
	end,

	process_loc_text = function(self)
    G.localization.descriptions[self.set][self.key] = {
      text = G.localization.descriptions[self.set].c_mercury.text
    }
	end,

	generate_ui = 0
}
