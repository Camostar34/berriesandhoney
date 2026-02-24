SMODS.Joker {
    key = "chantilly",
    name = "Chantilly Cake",
   pronouns = "she_her",
    atlas = "jokers",
    pos = { x = 2, y = 6 },
    pools = { },
    config = { extra = {  } },
    rarity = 2,
    cost = 8,
    blueprint_compat = true,
       unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = false,

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,

   calculate = function(self, card, context)
    
        if context.joker_main then
            local unique_types = {}
            local count = 0
            
            -- Iterate through all held consumables
            for _, v in ipairs(G.consumeables.cards) do
                if v.ability and v.ability.set and not unique_types[v.ability.set] then
                    unique_types[v.ability.set] = true
                    count = count + 1
                end
            end

            -- Ensure we don't multiply by 0 or 1 if unnecessary
            if count > 1 then
                return {
                    xmult = count
                }
            end
        end
    end,
}
