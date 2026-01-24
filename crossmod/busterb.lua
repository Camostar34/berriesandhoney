
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
            bank  = nil,
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
            "Scored {C:attention}Gold Cards{} and {C:attention}Gold Seals{}",
            "give {X:money,C:white}^#1#{} dollars and Mult",
            "{C:attention}Gold Cards{} held in hand count in scoring"
        }
    },
    loc_vars = function(self, info_queue, card)
		return { vars = { 
            card.ability.extra.bonus, 
            colours = {HEX('fd913e'), SMODS.Gradients["busterb_eechipsgradient"]}} }
    end,
    calculate = function(self, card, context)

            if context.card_added and context.card.config.center.key == "j_smsn_secrectsamson" then
                G.jokers:change_size((-G.jokers.config.card_limit) + math.min(G.jokers.config.card_limit + card.ability.extra.jokerslot, card.ability.immutable.slotlimit))
                end
      
       if context.individual
        and context.cardarea == G.play and context.other_card and (SMODS.has_enhancement(context.other_card, 'm_gold') or context.other_card.seal == "Gold") then

            local bonus = card.ability.extra.bonus or 1
            local bank  = card.ability.extra.bank

            -- first trigger: start from current dollars
            if not bank or bank <= 0 then
                bank = G.GAME.dollars or 0
            end
            if bank <= 0 then
                return
            end

            local new_bank = bank ^ bonus
            local delta    = math.floor(new_bank - bank)

            card.ability.extra.bank = new_bank

            if delta <= 0 then
                return
            end

            return {
                dollars = delta,
                emult   = bonus,
            }
        end

        if context.modify_scoring_hand and SMODS.has_enhancement(context.other_card, 'm_gold') then
            return {
                add_to_hand = true
            }
        end

        
    end,
       
}

