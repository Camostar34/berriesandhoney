SMODS.Joker {
    key = "mintjams",
    name = "Mint Jams",
       pronouns = "he_they",
    atlas = "jokers",
    pos = { x = 6, y = 1 },

    config = { extra = {odds = 4 } },
    rarity = 2,
    cost = 3,
    blueprint_compat = false,
       unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
         local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'smsn_mintjams')
        return { vars = {numerator, denominator} }
    end,

calculate = function(self, card, context)
  if context.individual and context.cardarea == G.play and context.other_card  then
    local c = context.other_card

    -- enhancements: treat nil or empty table as "no enhancements"
    local enh = SMODS.get_enhancements and SMODS.get_enhancements(c) or nil
    local has_enh = enh and next(enh) ~= nil

    local has_seal = c.seal ~= nil
    local has_edition = c.edition ~= nil

    -- Only trigger on completely plain cards
    if (not has_enh) and (not has_seal) and (not has_edition) then
      if SMODS.pseudorandom_probability(card, 'smsn_mintjams', 1, card.ability.extra.odds) and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
        G.GAME.consumeable_buffer = (G.GAME.consumeable_buffer or 0) + 1

        G.E_MANAGER:add_event(Event({
          func = function()
            local berry = SMODS.add_card{
              set = 'Berry',
              area = G.consumeables,
            }
            G.GAME.consumeable_buffer = 0
            berry:juice_up(0.3, 0.4)
            return true
          end
        }))

        return {
        message_card = card,
          message = localize('k_plus_commonrambley'),
          colour = G.C.SECONDARY_SET.Tarot,
        }
      end
    end
  end
end,
}