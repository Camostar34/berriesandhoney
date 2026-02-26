SMODS.Joker {
    key = "calvana",
    name = "Calvana Family",
    pronouns = "they_them",
    atlas = "jokers",
    pos = {
        x = 0,
        y = 0,
     },
    pools = {
        oc = true, wip = true
     },
    rarity = 2,
    cost = 6,
    blueprint_compat = true,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play then

        end
    end,

    credits = {
        code = "GhostSalt",
     },
}
