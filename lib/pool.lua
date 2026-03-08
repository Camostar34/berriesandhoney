-- very heavy referenced from Candy's code. 

-- Store custom colors here so the game doesn't crash on load!
local custom_colors = {
    custom_pink = {230/255, 77/255, 155/255, 1}
}

local pools = {
    oc                  = { color = "diamonds" },
    guest               = { color = "dark_edition" },
    shitpost            = { color = "red" },
    bugsnax             = { color = "blue" }, 
    bitsandbops         = { color = "spades" }, 
    sesamestreet        = { color = "green" }, 
    hamtaro             = { color = "attention" }, 
    schoolastic         = { color = "hearts" }, 
    rambley             = { color = "legendary" }, 
    starburst           = { color = "edition" },
    warioware           = { color = "default" },
    slimerancher        = { color = "red" },
    ykw                 = { color = "spades" },
    dr                  = { color = "custom_pink" },
    yuru                = { color = "tarot" },
    wip                 = { color = "red" },
}

for rkey, p in pairs(pools) do
    if not G.P_CENTER_POOLS[rkey] then
        p.key = rkey
        p.cards = {}
        SMODS.ObjectType(p)
    end
end

local scmb = SMODS.create_mod_badges
function SMODS.create_mod_badges(obj, badges)
    for key, p in pairs(pools) do
        if obj and obj.pools and obj.pools[key] then
            -- Safely checks your custom_colors table first, then falls back to G.ARGS
            badges[#badges+1] = create_badge(localize("k_" .. key), custom_colors[p.color] or G.ARGS.LOC_COLOURS[p.color])
        end
    end

    return scmb(obj, badges)
end