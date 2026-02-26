SMODS.Joker {
    key = "keepyapping",
    name = "Keep Yapping Your Mouth, Buddy",
    pronouns = "any_all",
    atlas = "jokers",
    pos = {
        x = 0,
        y = 0,
     },
    pools = {
        shitpost = true
     },
    config = {
        extra = {
            multper = 1
         },
    },
    rarity = 2,
    unlocked = true,
    discovered = true,
    cost = 5,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.multper },
         }
    end,

    calculate = function(self, card, context)
        if context.joker_main and G.GAME.blind and G.GAME.blind:get_type() == "Boss" and G.GAME.blind.loc_debuff_lines and #G.GAME.blind.loc_debuff_text > 0 then
            return { mult = card.ability.extra.multper * #G.GAME.blind.loc_debuff_text }
        end
    end,

    credits = {
        code = "GhostSalt",
     },
}
