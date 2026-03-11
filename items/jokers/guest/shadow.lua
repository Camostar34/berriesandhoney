

SMODS.Joker {
    key = "shadow",
    name = "Shadow Wizard",
    pronouns = "he_him",
    atlas = "jokers",
    pos = { x = 1, y = 14 },
    pools = { guest = true },
    config = { extra = { } },
    rarity = 3,
    cost = 7,
    blueprint_compat = true, 
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card) return { vars = {} } end,

    calculate = function(self, card, context)
        if context.before and context.scoring_name == 'Three of a Kind' then
            
            if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                
                G.E_MANAGER:add_event(Event({
                    func = function()
                       
                        local card_key = ''
                        if pseudorandom('shadow_wizard') < 0.85 then
                            card_key = pseudorandom_element({'c_smsn_shark', 'c_smsn_luckycoin', 'c_smsn_feather', 'c_smsn_book'}, pseudoseed('sw_tarot'))
                        else
                            card_key = pseudorandom_element({'c_smsn_yharon', 'c_smsn_megalodon'}, pseudoseed('sw_spec'))
                        end

                        local new_card = create_card("Consumable", G.consumeables, nil, nil, nil, nil, card_key, "shadow")
                        new_card:add_to_deck()
                        G.consumeables:emplace(new_card)
                        G.GAME.consumeable_buffer = 0
                        return true
                    end
                }))
                
                return {
                    message = localize('k_plus_tarot'),
                    colour = G.C.PURPLE,
                    card = card
                }
            end
        end
    end,
    credits = {
        art = "octaandfnaf",
        character = "octaandfnaf"
    }
}