SMODS.Joker {
    key = "gordon",
    name = "Gordon",
 pronouns = "he_him",
    atlas = "jokers",
    pos = { x = 4, y = 0 },
    pools = { guest = true, smsn_sticky = true },
    config = { extra = { multbonus = 2,} },
    rarity = 2,
    cost = 6,
    blueprint_compat = false,
       unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.multbonus} }
    end,

   calculate = function(self, card, context)
            if context.joker_main then
                
                card.ability.extra.hearts = 0
                card.ability.extra.spades = 0
                card.ability.extra.diamonds = 0
                card.ability.extra.clubs = 0
                    for i = 1, #context.scoring_hand do
                        if context.scoring_hand[i].ability.name ~= 'Wild Card' then
                            if context.scoring_hand[i]:is_suit('Hearts') then card.ability.extra.hearts = card.ability.extra.hearts + 1 end
                            if context.scoring_hand[i]:is_suit('Diamonds') then card.ability.extra.diamonds = card.ability.extra.diamonds + 1 end
                            if context.scoring_hand[i]:is_suit('Spades') then card.ability.extra.spades = card.ability.extra.spades + 1 end
                            if context.scoring_hand[i]:is_suit('Clubs') then card.ability.extra.clubs = card.ability.extra.clubs + 1 end
                        end
                    end
                    for i = 1, #context.scoring_hand do
                        if context.scoring_hand[i].ability.name == 'Wild Card' then
                            if context.scoring_hand[i]:is_suit('Spades') and card.ability.extra.hearts == 0 then card.ability.extra.spades = card.ability.extra.spades + 1
                            elseif context.scoring_hand[i]:is_suit('Diamonds') and card.ability.extra.diamonds == 0 then card.ability.extra.diamonds = card.ability.extra.diamonds + 1 end
                    end

                    
                    if card.ability.extra.hearts == 0 and card.ability.extra.clubs == 0 and card.ability.extra.diamonds > 0 and card.ability.extra.spades > 0 then
                        return {
                            card = card,
                            xmult = card.ability.extra.multbonus,
                        }
                    end
                    
            
        end
         end
        
    
end,
 credits = {
		character = "Kidma64 / Shinysilversins"              -- you can also leave out fields if you wish
	}
}