


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
        
        for _, card in ipairs(hand) do
            -- Condensed into a single check to avoid unnecessary local variables
            if card.config.center.key == 'm_gold' or 
               (next(SMODS.find_card('j_smsn_meltingpot')) and (card.seal == 'Gold' or (card.edition and card.edition.key == 'e_smsn_orangeglaze'))) then
                
                table.insert(valid_cards, card)
            end
        end

        -- THE FIX: Check for Four Fingers. If found, require 4. Otherwise, 5.
        if #valid_cards >= (next(SMODS.find_card('j_four_fingers')) and 4 or 5) then
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



SMODS.current_mod.process_loc_text = function()
     G.localization.descriptions.Joker.j_four_fingers.text[#G.localization.descriptions.Joker.j_four_fingers.text + 1] = ""

    G.localization.descriptions.Joker.j_four_fingers.text[#G.localization.descriptions.Joker.j_four_fingers.text + 1] = "Allows {C:attention}Honeypots{} to be"
    
   
    G.localization.descriptions.Joker.j_four_fingers.text[#G.localization.descriptions.Joker.j_four_fingers.text + 1] = "made with {C:attention}4{} Gold cards"
end