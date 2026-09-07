---Opens the Berries tray
function G.FUNCS.smsn_openTray(e)
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        blockable = false,
        func = (function()
            ease_value(G.smsn_TRAY.alignment.offset, 'x', -G.smsn_TRAY.T.w + 1.5)
            ease_value(G.smsn_TRAYAREA.alignment.offset, 'x', -0.5)
            return true
        end)
    }))
    G.FUNCS.smsn_toggleTray = G.FUNCS.smsn_closeTray
end

G.FUNCS.smsn_toggleTray = G.FUNCS.smsn_openTray
---Closes the Berries tray
function G.FUNCS.smsn_closeTray(e)
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        blockable = false,
        func = (function()
            ease_value(G.smsn_TRAY.alignment.offset, 'x', G.smsn_TRAY.T.w - 1.5)
            ease_value(G.smsn_TRAYAREA.alignment.offset, 'x', 0.5)
            return true
        end)
    }))
    G.FUNCS.smsn_toggleTray = G.FUNCS.smsn_openTray
end

function create_UIBox_HUD_smsn_tray()
    return {
        n = G.UIT.ROOT,
        config = { colour = G.C.CLEAR, align = 'cm' },
        nodes = { {
            n = G.UIT.R,
            config = { align = 'cm' },
            nodes = { {
                n = G.UIT.C,
                config = { align = 'cm' },
                nodes = { {
                    n = G.UIT.R,
                    config = { id = 'smsn_tray_toggle', align = 'cm', minh = 2.5, minw = 0.5, hover = true, button = 'smsn_toggleTray', shadow = true },
                    nodes = { {
                        n = G.UIT.C,
                        config = { align = 'cm' },
                        nodes = { { n = G.UIT.O, config = { object = Sprite(0, 0, 0.56, 2.8, G.ASSET_ATLAS['smsn_traybutton'], { x = 0, y = 0 }) } } }
                    } }
                } }
            }, {
                n = G.UIT.C,
                config = { align = 'cm', colour = G.C.WHITE, outline = 1, outline_colour = G.C.JOKER_GREY, minw = 5 * 1.35, minh = 3 },
                nodes = { { n = G.UIT.O, config = { object = Sprite(0, 0, 4.8 * 1.35, 2.8, G.ASSET_ATLAS['smsn_traytex'], { x = 0, y = 0 }) } } },
            } }
        } }
    }
end

function init_trayArea()
    G.smsn_tray = CardArea(0, 0, 4.8 * 1.2, 2.8,
        { card_limit = 5, type = 'joker', highlight_limit = 1, bg_colour = G.C.CLEAR, no_card_count = true })
    return {
        n = G.UIT.ROOT,
        config = { colour = G.C.CLEAR, align = 'cm' },
        nodes = { {
            n = G.UIT.R,
            config = { align = 'cm' },
            nodes = { {
                n = G.UIT.C,
                config = { align = 'bm', minw = 4.8 * 1.2, minh = 2.3 },
                nodes = { { n = G.UIT.R, config = { minh = 0.35 } }, { n = G.UIT.R, config = { align = 'cm' }, nodes = { { n = G.UIT.O, config = { object = G.smsn_tray } } } },
                    { n = G.UIT.R, config = { minh = 0.15 } }, {
                    n = G.UIT.R,
                    config = { align = 'cr' },
                    nodes = {
                        { n = G.UIT.B, config = { w = 0.1, h = 0.3 } },
                        { n = G.UIT.T, config = { ref_table = G.smsn_tray.config, ref_value = 'card_count', scale = 0.3, colour = G.C.WHITE } },
                        { n = G.UIT.T, config = { text = '/', scale = 0.3, colour = G.C.WHITE } },
                        { n = G.UIT.T, config = { ref_table = G.smsn_tray.config.card_limits, ref_value = 'display_slots', scale = 0.3, colour = G.C.WHITE } },
                        { n = G.UIT.B, config = { w = 0.1, h = 0.3 } } }
                } },
            } }
        } }
    }
end

local game_start_ref = Game.start_run
function Game:start_run(args)
    game_start_ref(self, args)
    G.smsn_TRAY = UIBox {
        definition = create_UIBox_HUD_smsn_tray(),
        config = { align = ('cli'), offset = { x = G.ROOM.T.w * 20.625 / 20, y = 0 }, major = G.ROOM_ATTACH, instance_type = 'DROPDOWN' } }
    G.smsn_TRAYAREA = UIBox {
        definition = init_trayArea(),
        config = { align = ('cli'), offset = { x = 1.275, y = 0 }, major = G.smsn_TRAY, instance_type = 'DROPDOWN' } }
end

local cae = CardArea.emplace
function CardArea:emplace(card, ...)
    if self == G.consumeables and card.ability.set == 'smsn_Berry' then
        cae(card, G.smsn_tray, ...)
        return
    end
    return cae(self, card, ...)
end
