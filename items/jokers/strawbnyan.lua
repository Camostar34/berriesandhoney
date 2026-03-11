SMODS.Joker {
    key = "strawbnyan",
    name = "Strawbnyan",
    pronouns = "she_her",
    atlas = "jokers",
    pos = {
        x = 6,
        y = 9,
     }, -- 69 HAHAHAHAHHAHAHAHAAHA!!!!!!!!!!!!!!!!!!!! -- hehe very funny :3 - ghostsalt
    pools = {
        ykw = true, smsn_berry_themed = true,
     },
    config = {
        extra = {
            percent = 10,
         },
    },
    rarity = 2,
    unlocked = true,
    discovered = true,
    cost = 5,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.percent },
         }
    end,

    calculate = function(self, card, context)
        if context.berry_activate then
            G.E_MANAGER:add_event(Event({
                before = 0.1,
                blocking = true,
                func = function()
                    card:juice_up()
                    play_sound("tarot2", 1.2, 0.6)
                    return true
                end,
            }))
            smsn_ease_blind_requirement(-math.ceil(G.GAME.blind.chips * (card.ability.extra.percent / 100)))
            G.E_MANAGER:add_event(Event({
                trigger = "immediate",
                func = function()
                    if G.GAME.chips - G.GAME.blind.chips >= 0 then
                        G.STATE = G.STATES.NEW_ROUND
                        G.STATE_COMPLETE = false
                    end
                    return true
                end,
            }))
        end
    end,

    credits = {
		code = "GhostSalt"             
	}
}

-- Thanks, Yeah! Mostly Artists from Cold Beans!
function smsn_ease_blind_requirement(mod_add)
    local original_chips = G.GAME.blind.original_chips and G.GAME.blind.original_chips > 0 and
                               G.GAME.blind.original_chips or G.GAME.blind.chips

    local current_mult = G.GAME.blind.chips / (original_chips / G.GAME.blind.mult) -- Takes into account previous ease_blind_requirement calls
    local final_chips = (original_chips / G.GAME.blind.mult) * current_mult + mod_add
    local chip_mod -- iterate over ~120 ticks
    if type(G.GAME.blind.chips) ~= "table" then
        chip_mod = math.ceil(math.abs(final_chips - G.GAME.blind.chips) / 120)
    else
        chip_mod = ((final_chips - G.GAME.blind.chips):abs() / 120):ceil()
    end
    local step = 0
    if G.GAME.blind.chips < final_chips then
        G.E_MANAGER:add_event(Event({
            trigger = "after",
            blocking = true,
            func = function()
                G.GAME.blind.chips = G.GAME.blind.chips + G.SETTINGS.GAMESPEED * chip_mod
                if G.GAME.blind.chips < final_chips then
                    G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                    if step % 5 == 0 then play_sound("chips1", 0.8 + (step * 0.005)) end
                    step = step + 1
                else
                    G.GAME.blind.chips = final_chips
                    G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                    G.GAME.blind:wiggle()
                    return true
                end
            end,
        }))
    else
        G.E_MANAGER:add_event(Event({
            trigger = "after",
            blocking = true,
            func = function()
                G.GAME.blind.chips = G.GAME.blind.chips - G.SETTINGS.GAMESPEED * chip_mod
                if G.GAME.blind.chips > final_chips then
                    G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                    if step % 5 == 0 then play_sound("chips1", 0.8 + (step * 0.005)) end
                    step = step - 1
                else
                    G.GAME.blind.chips = final_chips
                    G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                    G.GAME.blind:wiggle()
                    return true
                end
            end,
        }))
    end
end
