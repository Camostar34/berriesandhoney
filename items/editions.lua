-- Special thanks to Cassknows for these shaders!
SMODS.Atlas({
    key = "redglaze_tex",
    path = "redglaze2x.png",
    px = 71,
    py = 95,
 })
SMODS.Atlas({
    key = "blueglaze_tex",
    path = "blueglaze2x.png",
    px = 71,
    py = 95,
 })
SMODS.Atlas({
    key = "yellowglaze_tex",
    path = "yellowglaze2x.png",
    px = 71,
    py = 95,
 })
SMODS.Atlas({
    key = "brownglaze_tex",
    path = "brownglaze2x.png",
    px = 71,
    py = 95,
 })
SMODS.Atlas({
    key = "orangeglaze_tex",
    path = "orangeglaze2x.png",
    px = 71,
    py = 95,
 })

SMODS.Shader({
    key = "redglaze",
    path = "glazed.fs",
    send_vars = function(sprite, card)
        if not card.asdf then card.asdf = math.random() end

        return {
            aux_img = G.ASSET_ATLAS["smsn_redglaze_tex"].image,
            aux_num = card.asdf,
         }
    end,
})

SMODS.Shader({
    key = "blueglaze",
    path = "glazed.fs",
    send_vars = function(sprite, card)
        if not card.asdf then card.asdf = math.random() end

        return {
            aux_img = G.ASSET_ATLAS["smsn_blueglaze_tex"].image,
            aux_num = card.asdf,
         }
    end,
})

SMODS.Shader({
    key = "yellowglaze",
    path = "glazed.fs",
    send_vars = function(sprite, card)
        if not card.asdf then card.asdf = math.random() end

        return {
            aux_img = G.ASSET_ATLAS["smsn_yellowglaze_tex"].image,
            aux_num = card.asdf,
         }
    end,
})

SMODS.Shader({
    key = "brownglaze",
    path = "glazed.fs",
    send_vars = function(sprite, card)
        if not card.asdf then card.asdf = math.random() end

        return {
            aux_img = G.ASSET_ATLAS["smsn_brownglaze_tex"].image,
            aux_num = card.asdf,
         }
    end,
})

SMODS.Shader({
    key = "orangeglaze",
    path = "glazed.fs",
    send_vars = function(sprite, card)
        if not card.asdf then card.asdf = math.random() end

        return {
            aux_img = G.ASSET_ATLAS["smsn_orangeglaze_tex"].image,
            aux_num = card.asdf,
         }
    end,
})

smsn_remove_glazed = function(card)
    if not card then return end
    if card.smsn_preserve_glaze then
        card.smsn_preserve_glaze = false
        return
    elseif not next(SMODS.find_card("j_smsn_donuts")) and not next(SMODS.find_card("j_smsn_buttercream")) then

        G.E_MANAGER:add_event(Event({
            trigger = "after",
            delay = 0.15,
            func = function()
                card:flip()
                play_sound("card1")
                card:juice_up(0.3, 0.3)
                return true
            end,
        }))
        delay(0.2)
        G.E_MANAGER:add_event(Event({
            trigger = "immediate",
            func = (function()
                card:set_edition(nil, nil, true)
                return true
            end),
        }))
        G.E_MANAGER:add_event(Event({
            trigger = "after",
            delay = 0.15,
            func = function()
                card:flip()
                play_sound("tarot2", 1, 0.6)
                card:juice_up(0.3, 0.3)
                return true
            end,
        }))
    end
end

smsn_change_glaze = function(card)
    if card and card.edition and G.P_CENTERS[card.edition.key] and G.P_CENTERS[card.edition.key].pools and
        G.P_CENTERS[card.edition.key].pools.Glaze and next(SMODS.find_card("j_smsn_buttercream")) then
        G.E_MANAGER:add_event(Event({
            trigger = "after",
            delay = 0.15,
            func = function()
                card:flip()
                play_sound("card1")
                card:juice_up(0.3, 0.3)
                return true
            end,
        }))
        delay(0.2)
        G.E_MANAGER:add_event(Event({
            trigger = "immediate",
            func = (function()
                smsn_apply_different_glaze(card)
                return true
            end),
        }))
        G.E_MANAGER:add_event(Event({
            trigger = "after",
            delay = 0.15,
            func = function()
                card:flip()
                play_sound("tarot2", 1, 0.6)
                card:juice_up(0.3, 0.3)
                return true
            end,
        }))
    end
end

SMODS.Edition {
    key = "redglaze",
    shader = "redglaze",
    pools = {
        Glaze = true,
     },
    in_shop = false,
    weight = 0,
    sound = {
        sound = "polychrome1",
        per = 1.2,
        vol = 0.7,
     },

    config = {
        extra = {
            multbonus = 3,
         },
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = { self.config.extra.multbonus },
         }
    end,

    calculate = function(self, card, context)
        if (context.post_joker or context.main_scoring) and context.cardarea == G.play then
            return {
                xmult = (card and card.edition and card.edition.extra and card.edition.extra.multbonus) or
                    self.config.extra.multbonus,
            }
        end

        if context.final_scoring_step and context.cardarea == G.play then
            smsn_remove_glazed(card);
            smsn_change_glaze(card);
        end
    end,
}

SMODS.Edition {
    key = "blueglaze",
    shader = "blueglaze",
    pools = {
        Glaze = true,
     },
    in_shop = false,
    weight = 0,
    sound = {
        sound = "polychrome1",
        per = 1.2,
        vol = 0.7,
     },

    config = {
        extra = {
            chipbonus = 2,
         },
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = { self.config.extra.chipbonus },
         }
    end,

    calculate = function(self, card, context)
        if (context.post_joker or context.main_scoring) and context.cardarea == G.play then
            return {
                xchips = (card and card.edition and card.edition.extra and card.edition.extra.chipbonus) or
                    self.config.extra.chipbonus,
            }
        end

        if context.final_scoring_step and context.cardarea == G.play and card then
            smsn_remove_glazed(card);
            smsn_change_glaze(card);
        end
    end,
}

SMODS.Edition {
    key = "yellowglaze",
    shader = "yellowglaze",
    pools = {
        Glaze = true,
     },
    in_shop = false,
    weight = 0,
    sound = {
        sound = "polychrome1",
        per = 1.2,
        vol = 0.7,
     },

    config = {
        extra = {
            dollarbonus = 5,
         },
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = { self.config.extra.dollarbonus },
         }
    end,

    calculate = function(self, card, context)
        if (context.post_joker or context.main_scoring) and context.cardarea == G.play then
            return {
                dollars = (card and card.edition and card.edition.extra and card.edition.extra.dollarbonus) or
                    self.config.extra.dollarbonus,
            }
        end

        if context.final_scoring_step and context.cardarea == G.play and card then
            smsn_remove_glazed(card);
            smsn_change_glaze(card);
        end
    end,
}

SMODS.Edition {
    key = "brownglaze",
    shader = "brownglaze",
    pools = {
        Glaze = true,
     },
    in_shop = false,
    weight = 0,
    sound = {
        sound = "polychrome1",
        per = 1.2,
        vol = 0.7,
     },

    config = {
        card_limit = 1,
        extra = {
            areasize = 1,
         },
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = { self.config.extra.areasize },
         }
    end,

    calculate = function(self, card, context)

        if (context.final_scoring_step and context.cardarea == G.play) or
            (context.discard and context.other_card == card) then
            smsn_remove_glazed(card);
            smsn_change_glaze(card);
        end
    end,
}

SMODS.Edition {
    key = "orangeglaze",
    shader = "orangeglaze",
    pools = {
        Glaze = true,
     },
    in_shop = false,
    weight = 0,
    sound = {
        sound = "polychrome1",
        per = 1.2,
        vol = 0.7,
     },

    config = {
        card_limit = 1,
        extra = {
            areasize = 1,
         },
    },

    loc_vars = function(self, info_queue, card) return {} end,

    calculate = function(self, card, context)
        if context.final_scoring_step and context.cardarea == G.play and card then
            smsn_remove_glazed(card);
            smsn_change_glaze(card);
        end
    end,
}
