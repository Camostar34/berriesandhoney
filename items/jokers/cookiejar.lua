SMODS.Joker {
    key = "cookiejar",
    name = "Cookie Jar",

    atlas = "jokers",
    pos = { x = 1, y = 11 },
pools = { Food = true},
    config = { extra = {rounds = 5} },
    rarity = 2,
    cost = 6,
    blueprint_compat = true,
       unlocked = true,
    discovered = true,
    eternal_compat = false,
    perishable_compat = false,
    demicolon_compat = false,

    loc_vars = function(self, info_queue, card)
      
        info_queue[#info_queue + 1] = G.P_CENTERS.m_smsn_cookie 
        return {
            vars = { card.ability.extra.rounds }
        }
    end,
    calculate = function(self, card, context)
       
        if context.first_hand_drawn and not context.blueprint then
            
           
            local _card = SMODS.create_card({
                set = "Base",
                area = G.discard 
            })
            
          
            G.playing_card = (G.playing_card and G.playing_card + 1) or 1
            _card.playing_card = G.playing_card
            table.insert(G.playing_cards, _card)

          
            G.E_MANAGER:add_event(Event({
               func = function()
                    _card:set_ability("m_smsn_cookie")
                    G.hand:emplace(_card)
                    _card:start_materialize()
                    G.GAME.blind:debuff_card(_card)
                    G.hand:sort()
                    if context.blueprint_card then
                        context.blueprint_card:juice_up()
                    else
                        card:juice_up()
                    end
                    SMODS.calculate_context({
                        playing_card_added = true,
                        cards = { _card },
                     })
                    save_run()
                    return true
                end,
            }))

            if not context.blueprint then
            card.ability.extra.rounds = card.ability.extra.rounds - 1
            end

            if card.ability.extra.rounds <= 0 and not context.blueprint then 
                 if card.ability.extra.uses <= 0 then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        card:start_dissolve()
                        return true
                    end,
                }))
                return {
                    message = localize("k_eaten_ex"),
                    colour = G.C.RED,
                 }
            else
                return {
                    message = card.ability.extra.rounds,
                 }
            end
        end
    end
end

    credits = {
        code = "GhostSalt" -- Crediting GhostSalt as this code is just repurposed Cough Drops code
     },
}