SMODS.Back({
    key = "frosted",
    name = "Frosted Deck",
    config = {
        consumables = {
        'c_smsn_page_of_sweets'
    }, 
    jokers = {
      'j_smsn_cookiejar'
    }
    },
    atlas = "backs",
    pos = { x = 5, y = 0 },

    loc_vars = function(self, info_queue, back)

        return { vars = {  } }
    end,

    apply = function(self)
       
    end
})
