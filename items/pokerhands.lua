


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
        { 'H_Q', true, enhancement = 'm_gold' },
        { 'D_2', true, enhancement = 'm_gold' },
        { 'C_7', true, enhancement = 'm_gold' },
        { 'H_J', true, enhancement = 'm_gold' },
    },

    evaluate = function(parts, hand)

        local valid_cards = {}
        
        for i, card in ipairs(hand) do
            local is_valid = false

            if card.config.center.key == 'm_gold' then
                is_valid = true
            end

            if next(SMODS.find_card('j_smsn_meltingpot')) then
               
                if card.seal == 'Gold' then 
                    is_valid = true 
                end
                
                if card.edition and card.edition.key == 'e_smsn_orangeglaze' then 
                    is_valid = true 
                end
            end


            if is_valid then
                table.insert(valid_cards, card)
            end
        end


        if #valid_cards >= 5 then
            return { valid_cards }
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
