SMODS.Sound({ key = "capu_hello1", path = "capu_hello1.ogg" })
SMODS.Sound({ key = "capu_hello2", path = "capu_hello2.ogg" })
SMODS.Sound({ key = "capu_hello3", path = "capu_hello3.ogg" })
SMODS.Sound({ key = "capu_hello4", path = "capu_hello4.ogg" })
SMODS.Sound({ key = "capu_capu", path = "capu_capu.ogg" })
SMODS.Sound({ key = "capu_ya", path = "capu_ya.ogg" })

SMODS.Joker { 
    key = "cappuchino",
    name = "Cappuchino",
    pronouns = "he_him",
    atlas = "jokers",
    pos = { x = 5, y = 13 },
    pools = { yuru = true, shitpost = true },
    config = { extra = { x_mult = 3, dollars = 2 } },
    rarity = 2,
    unlocked = true,
    discovered = true,
    cost = 6,
    blueprint_compat = true, 
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.x_mult, card.ability.extra.dollars } }
    end,

    add_to_deck = function(self, card, from_debuff)
        card:say_quip(({"capu_hello1", "capu_hello2", "capu_hello3", "capu_hello4"})[math.random(1, 4)])
        card.ability.extra.timer = math.random() * 30 + 30
    end,

    update = function(self, card, dt)
        if card.area == G.jokers then
            card.ability.extra.timer = card.ability.extra.timer - dt
            
            if card.ability.extra.timer <= 0 then
                card:say_quip(({"capu_hello1", "capu_hello2", "capu_hello3", "capu_hello4", "capu_capu"})[math.random(1, 5)])
               
                card.ability.extra.timer = math.random() * 30 + 30
            end
        end
    end,

    calculate = function(self, card, context)
       
        if context.joker_main then
            return {
                xmult = card.ability.extra.x_mult
            }
        end

        
        if context.after and not context.blueprint then
            card:say_quip(pseudorandom_element({"capu_ya", "capu_capu"}, pseudoseed("cappu_drain")))
            return {
                dollars = -card.ability.extra.dollars,
                colour = G.C.RED,
                card = card
            }
        end
    end
}




local original_card_draw = Card.draw
function Card:draw(layer)
    original_card_draw(self, layer)
    if self.children.speech_bubble then
        self.children.speech_bubble:draw()
    end
end


function G.UIDEF.custom_speech_bubble(input_key)

    G.shared_text_nodes = {}
    localize{type = "quips", key = input_key, nodes = G.shared_text_nodes}
    
    G.shared_row_nodes = {}
    for k, v in ipairs(G.shared_text_nodes) do
        table.insert(G.shared_row_nodes, {n=G.UIT.R, config={align = "cl"}, nodes=v})
    end

    -- Building the UI Box
    return {n=G.UIT.ROOT, config = {align = "cm", minh = 1, r = 0.3, padding = 0.07, minw = 1, colour = G.C.JOKER_GREY, shadow = true}, nodes={
        {n=G.UIT.C, config={align = "cm", minh = 1, r = 0.2, padding = 0.1, minw = 1, colour = G.C.WHITE}, nodes={
            {n=G.UIT.C, config={align = "cm", minh = 1, r = 0.2, padding = 0.03, minw = 1, colour = G.C.WHITE}, nodes=G.shared_row_nodes}
        }}
    }}
end


function Card:say_quip(input_key)
    if self.children.speech_bubble then 
        self.children.speech_bubble:remove() 
    end
    
    self.config.speech_bubble_align = {
        align = (self.T.x + self.T.w/2 > G.ROOM.T.w/2) and "cl" or "cr", 
        offset = {x = (self.T.x + self.T.w/2 > G.ROOM.T.w/2) and -0.1 or 0.1, y = 0}, 
        parent = self
    }

    self.children.speech_bubble = UIBox{
        definition = G.UIDEF.custom_speech_bubble(input_key),
        config = self.config.speech_bubble_align
    }
    
    self.children.speech_bubble:set_role{role_type = "Minor", xy_bond = "Strong", r_bond = "Weak", major = self}
    self.children.speech_bubble.T.z = 10
    
    self:juice_up()

   
    play_sound("smsn_" .. input_key)

    
    local raw_text = (G.localization.misc.quips and G.localization.misc.quips[input_key]) and G.localization.misc.quips[input_key][1] or ""
    
   
    local hold_time = 2 + (string.len(raw_text) * 0.25)

    
    G.E_MANAGER:add_event(Event({trigger = "after", delay = hold_time, blockable = false, blocking = false, func = function()
        if self.children.speech_bubble then 
            self.children.speech_bubble:remove()
            self.children.speech_bubble = nil 
        end
        return true 
    end}))
end

