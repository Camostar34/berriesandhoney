SMODS.Joker {
    key = "manicface",
    name = "Manic Face",
    pools = { shitpost = true, wip = true },
    atlas = "jokers",
    pos = { x = 3, y = 6 },
 soul_pos = { x = 4, y = 6 },
    config = { extra = { } },
    rarity = 1,
    cost = 3,
    blueprint_compat = false,
       unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,

    calculate = function(self, card, context)
       
        if context.end_of_round and context.cardarea == G.jokers then

        end

    end,
}


local funny_str = "!\"#$%&'()+-*,./\\:;<=>?[]^_~"
local font_cache = {}

SMODS.DynaTextEffect { 
    key = "glitching",
    func = function(dynatext, index, letter)
       
        if not letter.normal_letter then
            letter.normal_letter = letter.letter
        end
        
    
        local st = pseudorandom('skip_'..index, 1, #funny_str)
        local rnd = string.sub(funny_str, st, st) 
        
 
        local font_id = dynatext.font.key or dynatext.font.file
        
      
        font_cache[font_id] = font_cache[font_id] or {}
        
        if not font_cache[font_id][rnd] then
            font_cache[font_id][rnd] = love.graphics.newText(dynatext.font.FONT, rnd)
        end
        
       
        letter.letter = font_cache[font_id][rnd]
  end
}