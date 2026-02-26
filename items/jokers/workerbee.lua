SMODS.Joker {
    key = "workerbee",
   pronouns = "she_they",
    atlas = "jokers",
    pos = { x = 0, y = 0 },
    pools = { wip = true},
    config = { extra = {  } },
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

        if context.check_enhancement then

            if context.other_card:get_id() == 6 then
                return {
	        m_gold = true
                }
            end

        end
       

    end,
}