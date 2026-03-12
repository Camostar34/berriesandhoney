
SMODS.Sound({
    key = "music_berryboost", 
    path = "smsn_berrybooster.ogg",
    pitch = 1,
    sync = true,
    select_music_track = function()
        return (G.pack_cards and G.pack_cards.cards and G.pack_cards.cards[1] and 
                G.pack_cards.cards[1].ability.set == "berry") and 10 or false
    end
})
-- Music by MillieAmp! 


SMODS.Sound({
    key = "music_dimanche", 
    path = "smsn_dimanche.ogg",
    pitch = 1,
    sync = true,
    select_music_track = function() return G.STAGE == G.STAGES.MAIN_MENU end
})
