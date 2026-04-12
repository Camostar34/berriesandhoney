SMODS.Joker {
    key = "gardener",
    name = "Gardener",
    pronouns = "any_all",
    atlas = "jokers",
    pos = { x = 2, y = 1 },
    pools = {smsn_berry_themed = true,},
    config = { extra = { every = 3, handsplayed = 0} },
    rarity = 1,
    cost = 5,
    blueprint_compat = false,
       unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.every, card.ability.extra.handsplayed} }
    end,

    calculate = function(self, card, context)

              if context.joker_main then
                card.ability.extra.handsplayed = (card.ability.extra.handsplayed + 1)
                    if card.ability.extra.handsplayed == card.ability.extra.every then
                        G.E_MANAGER:add_event(Event({
                    trigger = "immediate",
                    func = (function()
                            SMSN_create_random_berry("gardener")
                            play_sound('polychrome1', 1.2 + math.random() * 0.1, 0.8)
                            card:juice_up(0.3, 0.4)
                            card.ability.extra.handsplayed = 0
                        return true
                    end)
                }))
                    end
                return {
                    message = tostring(card.ability.extra.handsplayed)
                }
              end 

    end,
}