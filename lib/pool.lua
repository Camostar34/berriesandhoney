
-- very heavy referenced from Candy's code. 

local pools = {
   
    oc        = { color = "diamonds" },
    guest        = { color = "dark_edition" },
    shitpost        = { color = "red" },
    bugsnax         = { color = "blue" }, 
    bitsandbops         = { color = "spades" }, 
    sesamestreet         = { color = "green" }, 
    hamtaro         = { color = "attention" }, 
    schoolastic         = { color = "hearts" }, 
    rambley         = { color = "legendary" }, 
    starburst       = {color = "edition"},
    warioware       = {color = "default"},
    slimerancher       = {color = "red"},
    ykw       = {color = "spades"},
    wip = {color = "red"},

}

for rkey, p in pairs(pools) do
    if not G.P_CENTER_POOLS[rkey] then
        local reg = p
        reg.key = rkey
        reg.cards = {}
        SMODS.ObjectType(p)
    end
end


local scmb = SMODS.create_mod_badges
function SMODS.create_mod_badges(obj, badges)
    for key, p in pairs(pools) do
        if obj and obj.pools and obj.pools[key] then
            badges[#badges+1] = create_badge(localize("k_" .. key), G.ARGS.LOC_COLOURS[p.color])
        end
    end

    return scmb(obj, badges)
end
