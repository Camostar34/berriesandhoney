SMODS.Joker {
    key = "allberries",
    name = "Oops! All Berries!",
       pronouns = "he_him",
    atlas = "jokers",
    pos = { x = 3, y = 4 },
   pools = {smsn_berry_themed = true,},
    config = { extra = { } },
    rarity = 1,
    cost = 4,
    blueprint_compat = false,
       unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = false,

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,

    calculate = function(self, card, context)
       

    end,
    credits = {
		art = "Candycanearter07"        
	}
}



local ref_get_pack = get_pack

function get_pack(_key, _type)

    if SMODS.find_card("j_smsn_allberries")[1] then
        

        if G.shop_booster and #G.shop_booster.cards == 0 then
            return G.P_CENTERS["p_smsn_berrypack"]
        end
    end

  
    return ref_get_pack(_key, _type)
end