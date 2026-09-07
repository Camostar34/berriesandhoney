local joker_order = {
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
    "uncrustable",
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
    ----
    "cappuchino",
    "cinnamoroll",
    "gudetama",
    "hatsukemo",
    "monokuma",
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
    "guest/cozy",
    "guest/meta",

    ----
    "guest/rose",
    "guest/ruby",
    "guest/shadow",
    "guest/peapod",
    "guest/gud",

}

-- load all jokers
for i = 1, #joker_order do
    assert(SMODS.load_file("items/jokers/" .. joker_order[i] .. ".lua"))()
end

for _, file_name in ipairs({
    "organic",
    "sticky",
    "frosted",
    "picnic",
    "defunct",
    "rokuyo",
    "cuddly",
}) do
    SMODS.load_file("items/backs/" .. file_name .. ".lua")()
end

--used because there is no custom order SMODS function yet, please can someone add one
