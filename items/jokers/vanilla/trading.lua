SMODS.Joker({
    key = "trading",
    config = { extra = { mult = 0, chips = nil } },
    rarity = "cry_exotic",
    atlas = "trading_card",
    blueprint_compat = true,
    demicoloncompat = true,
    pos = { x = 0, y = 0 },
    soul_pos = { x = 2, y = 0, extra = { x = 1, y = 0 } },
    cost = 50,
    order = 1,
    loc_vars = function(self, info_queue, card)
        return { vars = { card and lenient_bignum(card.ability.extra.mult) } }
    end,
    calculate = function(self, card, context)
        if context.joker_main or context.forcetrigger then
            if (card.ability.extra.mult > 0) or context.forcetrigger then
                return {
                    mult_mod = lenient_bignum(card.ability.extra.mult),
                    message = localize({
                        type = "variable",
                        key = "a_mult",
                        vars = { lenient_bignum(card.ability.extra.mult) },
                    }),
                }
            end
        end
    end,
    asc_credits = {
        idea = {
            "Inspector_B",
        },
        art = {
            "MarioFan597",
        },
        code = {
            "MarioFan597",
        },
    },
})
