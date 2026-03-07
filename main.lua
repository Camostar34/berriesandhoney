to_big = to_big or function(num)
    return num
end

local files = {
      "lib/atlas",
      "lib/pool",
      "items/item",
	  "items/backs",
     "items/berries",
     "items/seals",
     "items/boosters",
     "items/blinds",
     "items/globals",
        "items/centers",
      "items/editions",
      "items/pokerhands",
      "items/sounds"

}


--used because there is no custom order SMODS function yet, please can someone add one

joker_order = {
    ------- OC Jokers
	"samson",
    "bash",
    "hercule",
    "emmy",
    "sytoroonson",
    ---- Picnic Themed jokers 
    "tamago",
    "grilledcheese",
    "clubsandwich",
    "ruben",
    "fruitsando",
    -----
    "muffintray",
    "donuts",
    "pipingbag",
    "ginghamjoker",
    "cookiejar",
    ----
    "cookiemonster",
    "peanutbutter",
    "weightlossshake",
    "dieting",
    "bountifuljoker",
    -----
    "crazyglazer",
    "fireblanket",
    "peoplepleaser",
    "doubledipping",
    "frostingknife",
    ---- berry themed jokers --
    "gardener",
    "spooky",
    "berrypicking",
    "secondhelping",
    "memory",
    ----
    "cannery",
    "mintjams",
    "airfreshener",
    "sticker",
    "compost",
    ----
    "cherrybomb",
    "americanbrunch",
    "strawbnyan",
    "allberries",
    "twistedgarden",
    ----
    "razzby",
    "strawberrygirl",
    "strabby",
    "chantilly",
    "pepperjelly",
    ---- Rambleberry Jokers
    "commonrambley",
    "uncommonrambley",
    "rarerambley",
    "legendaryrambley",
    "shitpost/rambleydumpy",
    ---- honey themed jokers --
    "fortunecookie",
    "goldentooth",
    "piggybank",
    "coughdrops",
    "mouse",
    ----
    "honeycombtoffee",
    "chamoille",
    "hothoney",
    "honeybutterchips",
    "golddigger",
    ----
    "beehive",
    "koban",
    "honeyjar",
    "goldenparachute",
    "hunnabee",
    ----
    "honeyslime",
    "goldenoreo",
    "goldenslime",
    "workerbee",
    "beebear",
    ----
    "stingy",
    "bumbling",
    "colony",
    "meltingpot",
    "bearclaws",
    ----
    "meadbarrel",
    "sparklingmead",
    "apiary",
    "crystalized",
    "honeyqueen", 
    ---- Legendary / Retro Jokers
    "littlelad",
    "rivalshercule",
    "rivalssamson",
    "rivalsemmy",
    "paddington",
    ------- Misc / Kitchen sink jokers 
    "damacy",
    "femtanyl",
    "mycom",
    "bambi",
    "teteatete",
    ---
    "buttercream",
    "flowworm",
    "negativeflowworm",
    "hamtaro",
    "ricepudding",
    ---- These are the Other OC jokers. Too much on the first page will  make people think this is a self insert mod. 
	"denali",
    "luzia",
    "joylon",
    "calvana",
    "grouphug",
    ---- shitpost jokers
    "shitpost/boykisser",
    "shitpost/manicface",
    "shitpost/keepyapping",
     "shitpost/pooh",
     "shitpost/berryboy",
    -------


        ---- GUEST JOKERS --
    "guest/gordon",
    "guest/puddinhg",
    "guest/sappy",
    "guest/ghost",
    "guest/cassknows",
    ----
    "guest/astro",
    "guest/cheese",
    "guest/jadepenguin",
    "guest/pedro",
    "guest/cozy",
    
   
    ----
    "guest/rose",
    "guest/ruby",
    "guest/shadow",
    "guest/peapod",
    "guest/meta",

}

-- load all jokers
for i = 1, #joker_order do
	assert(SMODS.load_file("items/jokers/" .. joker_order[i] .. ".lua"))()
end


SMODS.current_mod.optional_features = function()
    return { quantum_enhancements = true,
    	
}
end

if CardSleeves then
    assert(SMODS.load_file("crossmod/sleeves.lua"))()
end

local crossmodfiles = {
   "nflame",
   "starspace",
   "busterb",

}


SMODS.current_mod.menu_cards = function()
    return {
        key = "j_smsn_samson",
        no_edition = true,
    }
end

for i, v in pairs(files) do
    assert(SMODS.load_file(v..".lua"))()
end

for i, v in pairs(crossmodfiles) do
 if next(SMODS.find_mod(v)) then
     assert(SMODS.load_file("crossmod/" .. v .. ".lua"))()
 end
end

local bnh = SMODS.current_mod.config
SMODS.current_mod.config_tab = function()
    return {
        n = G.UIT.ROOT,
        config = { align = "cm", padding = 0.1, colour = G.C.BLACK, r=0.1, emboss = 0.05 },
        nodes = {
            {
                n = G.UIT.R, config = { align = "cm", padding = 0 },
                nodes = {
                    { n = G.UIT.C, config = { align = "cm", padding = 0.05},
                      nodes = {
                          create_toggle{
                              label = "Shitpost Jokers in Pool",
                              active_colour = G.C.GREEN,
                              ref_table = bnh,
                              ref_value = "smsn_shitpostjokers"
                          }
                      }
                    },
                    
                }
            }
        }
    }
end



SMODS.Shader {
    key = "honey_swirl",
    path = "honey_swirl.fs"
}


SMSN_Colors = {
    honey_live = HEX('ffc800'),
    honey_base = HEX('ff7b00') 
}

local honey_palette = {
    HEX('ffc800'), -- #ffc800
    HEX('f7b212'), -- #f7b212
    HEX('ffaa00'), -- #ffaa00
    HEX('ffd000'), -- #ffd000
    HEX('ffb300')   -- #ffb300
}


local ref_update = Game.update
function Game:update(dt)
    ref_update(self, dt)
    if G.TIMERS and G.TIMERS.REAL then
        local time = G.TIMERS.REAL / 2.5 
        local total_colors = #honey_palette
        local index = math.floor(time) % total_colors + 1
        local next_index = (index % total_colors) + 1
        local mix = time - math.floor(time)
        for i = 1, 4 do
            SMSN_Colors.honey_live[i] = honey_palette[index][i] * (1 - mix) + honey_palette[next_index][i] * mix
        end
    end
end


local oldfunc = Game.main_menu
Game.main_menu = function(change_context)
    local ret = oldfunc(change_context)
    
    G.SPLASH_BACK:define_draw_steps({
        {
         
            shader = "smsn_honey_swirl", 
            send = {
                { name = "time", ref_table = G.TIMERS, ref_value = "REAL_SHADER" },
                { name = "vort_speed", val = 0.5 }, 
                { name = "colour_1", ref_table = SMSN_Colors, ref_value = "honey_live" },
                { name = "colour_2", ref_table = SMSN_Colors, ref_value = "honey_base" },
            },
        },
    })
    
    return ret
end


CreditLib = {}

function CreditLib.get_mod_creds(obj)
    local strings = {}

    if not obj.credits then return strings end

    for _, v in ipairs({ "art", "idea", "code", "character" }) do
        local field = obj.credits[v]
        if field then
            local authors = ""

            if type(field) == "string" then
                authors = field
            elseif type(field) == "table" and #field > 0 then
                authors = table.concat(field, ", ")
            end

            if authors ~= "" then
                local loc = localize({ type = "variable", key = "a_" .. v, vars = { authors } })
                if type(loc) == "table" and type(loc[1]) == "string" and loc[1] ~= "" then
                    strings[#strings + 1] = loc[1]
                end
            end
        end
    end

    return strings
end

function CreditLib.strings_to_dyntext(strings)
    local ct = {}
    for i = 1, #strings do
        ct[i] = { string = strings[i] }
    end
    return ct
end

function CreditLib.ensure_credits_available(obj)
    -- normalize into obj.credits.*
    if obj.credits then
        obj.credits.art       = obj.credits.art       or {}
        obj.credits.idea      = obj.credits.idea      or obj.credits.concept or {}
        obj.credits.code      = obj.credits.code      or {}
        obj.credits.character = obj.credits.character or {}
    elseif obj.credit then  -- 3xCredit compatibility
        obj.credits = {}
        obj.credits.art       = obj.credit.art       or {}
        obj.credits.idea      = obj.credit.idea      or obj.credit.concept or {}
        obj.credits.code      = obj.credit.code      or {}
        obj.credits.character = obj.credit.character or {}
    else
        -- nothing to normalize; leave obj.credits nil
        obj.credits = nil
    end
end

function CreditLib.add_credit_to_card(ref_table, index, credits)
    ref_table[index].credit = credits
end


local create_mod_badges_ref = SMODS.create_mod_badges
---@diagnostic disable-next-line: duplicate-set-field
function SMODS.create_mod_badges(obj, badges)
    create_mod_badges_ref(obj, badges)

    if not obj or (not obj.credits and not obj.credit) then
        return
    end

    local bg_color = HEX("FF0000")
    local text_color = G.C.WHITE

    if obj.original_mod then
        local mod = SMODS.Mods[obj.original_mod.id]
        if mod then
            bg_color = mod.badge_colour or bg_color
            text_color = mod.badge_text_colour or text_color
        end
    end

    CreditLib.ensure_credits_available(obj)

    if not obj.credits then
        return
    end

    local function calc_scale_fac(text)
        local size = 0.9
        local font = G.LANG.font
        local max_text_width = 2 - 2 * 0.05 - 4 * 0.03 * size - 2 * 0.03
        local calced_text_width = 0
        -- Math reproduced from DynaText:update_text
        for _, c in utf8.chars(text) do
            local tx = font.FONT:getWidth(c) * (0.33 * size) * G.TILESCALE * font.FONTSCALE
                    + 2.7 * 1 * G.TILESCALE * font.FONTSCALE
            calced_text_width = calced_text_width + tx / (G.TILESIZE * G.TILESCALE)
        end
        local scale_fac = calced_text_width > max_text_width and max_text_width / calced_text_width or 1
        return scale_fac
    end

    -- only build a badge if there are actual non-empty credit strings
    local strings = CreditLib.get_mod_creds(obj)
    if #strings == 0 then
        return
    end

    local scale_fac = {}
    local min_scale_fac = 1

    for i = 1, #strings do
        scale_fac[i] = calc_scale_fac(strings[i])
        min_scale_fac = math.min(min_scale_fac, scale_fac[i])
    end

    local ct = CreditLib.strings_to_dyntext(strings)

    local badge = {
        n = G.UIT.R,
        config = { align = "cm" },
        nodes = {
            {
                n = G.UIT.R,
                config = {
                    align = "cm",
                    colour = bg_color,
                    r = 0.1,
                    minw = 2 / min_scale_fac,
                    minh = 0.36,
                    emboss = 0.05,
                    padding = 0.03 * 0.9,
                },
                nodes = {
                    { n = G.UIT.B, config = { h = 0.1, w = 0.03 } },
                    {
                        n = G.UIT.O,
                        config = {
                            object = DynaText({
                                string  = ct,          -- guaranteed non-empty table
                                colours = { text_color },
                                silent  = true,
                                float   = true,
                                shadow  = true,
                                offset_y = -0.03,
                                spacing = 1,
                                scale   = 0.33 * 0.9,
                            }),
                        },
                    },
                    { n = G.UIT.B, config = { h = 0.1, w = 0.03 } },
                },
            },
        },
    }

    badges[#badges + 1] = badge
end

return CreditLib