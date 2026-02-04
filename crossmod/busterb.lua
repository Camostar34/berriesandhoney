--Art and Code by Camostar34, teehee! Special thanks to FirstTry for letting me be a guest joker in his mod and guiding me with the art direction. 

to_big = to_big or function(x) return x end
SMODS.Atlas({
    key = "secretsamson",
    path = "secretsamson-Sheet.png",
    px = 71,
    py = 95
})




SMODS.Joker{
    key = "secrectsamson",
    atlas = "secretsamson",
    rarity = "busterb_Secret",
    pools = { ["Secret"] = true, ["bustjokers"] = true },
    pos = { x = 0, y = 0 },
    soul_pos = { x = 0, y = 2, new = { x = 0, y = 1 } },
    cost = 1e100,
    discovered = true,
    unlocked = true,
    blueprint_compat = true,
    eternal_compat = true,

    config = {
        extra = {
            bonus = 1.2,
            bank  = 0,
            -- jokerslot = ?  -- if you actually use this, define it here
        },
        immutable = {
            slotlimit = 100
        }
    },

    loc_txt = {
        name = {
            "{V:1,s:2}Samson{}",
            "The Blissful Bugbear",
        },
        text = {
            "Scored and held {C:attention}Gold Cards{} and {C:attention}Gold Seals{}",
            "give {X:money,C:white}^#1#{} dollars and Mult",
           
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.bonus,
                colours = { HEX("fd913e"), SMODS.Gradients["busterb_eechipsgradient"] }
            }
        }
    end,

    calculate = function(self, card, context)
        -- When Samson is added, double money 
        if context.card_added
           and context.card
           and context.card.config
           and context.card.config.center
           and context.card.config.center.key == "j_smsn_secrectsamson"
        then
            return { dollars = to_big(G.GAME.dollars)}
        end

        local bonus = card.ability.extra.bonus or 1
        local bank  = card.ability.extra.bank

        if (not to_big(bank) or to_big(bank) <= to_big(0)) and G.GAME and to_big(G.GAME.dollars) then
            bank = to_big(G.GAME.dollars)
        end
        if not to_big(bank) or to_big(bank) <=  to_big(0) then
            return
        end


        if context.individual
           and not context.blueprint
           and context.cardarea == G.play 
           and context.other_card
           and (SMODS.has_enhancement(context.other_card, "m_gold")
                or context.other_card.seal == "Gold")
        then
            local new_bank = bank ^ bonus
            local delta    = math.floor(new_bank - bank)

            if to_big(delta) <= to_big(0) then
                return
            end

            card.ability.extra.bank = new_bank

            return {
                dollars = delta,
                emult   = bonus,
            }
        end
if context.individual
           and not context.blueprint
           and context.cardarea == G.hand
           and context.other_card and not context.end_of_round
           and (SMODS.has_enhancement(context.other_card, "m_gold")
                or context.other_card.seal == "Gold")
        then
            local new_bank = bank ^ bonus
            local delta    = math.floor(new_bank - bank)

            if to_big(delta) <=  to_big(0) then
                return
            end

            card.ability.extra.bank = new_bank

            return {
                dollars = delta,
                emult   = bonus,
            }
        end

    end,
}
