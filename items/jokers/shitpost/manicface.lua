SMODS.Joker {
    key = "manicface",
    name = "Manic Face",
    pools = {
        shitpost = true,
     },
    atlas = "jokers",
    pos = {
        x = 3,
        y = 6,
     },
    soul_pos = {
        x = 4,
        y = 6,
     },
    config = {
        extra = {
            money = 1,
            xmult = 1.5,
            xchips = 1.25,
            mult = 10,
            chips = 50,
         },
    },
    rarity = 2,
    cost = 7,
    blueprint_compat = false,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.money, card.ability.extra.xmult, card.ability.extra.xchips, card.ability.extra.mult,
                card.ability.extra.chips,
            },
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:is_face() then
            local possible_effects = {
                {
                    dollars = card.ability.extra.money,
                 }, {
                    xmult = card.ability.extra.xmult,
                 }, {
                    xchips = card.ability.extra.xchips,
                 }, {
                    mult = card.ability.extra.mult,
                 }, {
                    chips = card.ability.extra.chips,
                 },
            }
            return possible_effects[pseudorandom("manicface", 1, 5)]
        end
    end,

    credits = {
        code = "GhostSalt",
     },
}

local funny_str = "!\"#$%&'()+-*,./\\:;<=>?[]^_~"
local font_cache = {}

SMODS.DynaTextEffect {
    key = "glitching",
    func = function(dynatext, index, letter)

        if not letter.normal_letter then letter.normal_letter = letter.letter end

        local st = pseudorandom("skip_" .. index, 1, #funny_str)
        local rnd = string.sub(funny_str, st, st)

        local font_id = dynatext.font.key or dynatext.font.file

        font_cache[font_id] = font_cache[font_id] or {}

        if not font_cache[font_id][rnd] then
            font_cache[font_id][rnd] = love.graphics.newText(dynatext.font.FONT, rnd)
        end

        letter.letter = font_cache[font_id][rnd]
    end,
}
