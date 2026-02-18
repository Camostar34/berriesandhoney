SMODS.Joker {
   key = "cheese",
   name = "Cheese and Jeremy",
   pronouns = "he_him",
   atlas = "jokers",
   pools = { guest = true },
   pos = { x = 7, y = 4 },

   rarity = 2,
   cost = 3,
   blueprint_compat = false,
   unlocked = true,
   discovered = true,
   eternal_compat = true,
   perishable_compat = true,
   demicolon_compat = true,

   calculate = function(self, card, context)
      if context.before then
         local levels = 0
         for k, v in pairs(context.full_hand) do
            if SMODS.has_enhancement(v, "m_gold") then
               v.smsn_cheese_markedfordeath = true
               levels = levels + 1
            end
         end
         return { level_up = levels, message = localize('k_level_up_ex') }
      end

      if context.destroy_card and context.destroy_card.smsn_cheese_markedfordeath and not context.blueprint then return { remove = true } end
   end,
   credits = { character = "personthateatcheese" }
}
