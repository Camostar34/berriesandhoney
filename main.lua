
local files = {
      "lib/atlas",
      "items/jokers",
         "items/guestjokers",
      "items/item",
	  "items/backs",
     "items/berries",
     "items/seals",
     "items/boosters",
     "items/globals"
      -- "items/edition",
}
SMODS.current_mod.optional_features = function()
    return { quantum_enhancements = true,
    	
}
end

if CardSleeves then
    assert(SMODS.load_file("crossmod/sleeves.lua"))()
end

local crossmodfiles = {
   "nflame",
}

for i, v in pairs(files) do
    assert(SMODS.load_file(v..".lua"))()
end

for i, v in pairs(crossmodfiles) do
 if next(SMODS.find_mod(v)) then
     assert(SMODS.load_file("crossmod/" .. v .. ".lua"))()
 end
end
