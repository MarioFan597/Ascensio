SMODS.Joker({
    key = "credit_card",
    config = { extra = { debt = 5000, chips = 1, gain = 0.002 } },
    rarity = "cry_exotic",
    atlas = "v_atlas_1",
    blueprint_compat = true,
    demicoloncompat = true,
    pos = { x = 3, y = 3 },
    soul_pos = { x = 5, y = 3, extra = { x = 4, y = 3 } },
    cost = 50,
    order = 20,
    loc_vars = function(_, _, card)
        return {
            vars = {
                card.ability.extra.debt,
                card.ability.extra.chips,
                card.ability.extra.gain,
            },
        }
    end,

    add_to_deck = function(_, card, _)
        G.GAME.bankrupt_at = G.GAME.bankrupt_at - lenient_bignum(card.ability.extra.debt)
    end,

    remove_from_deck = function(_, _, _)
        G.GAME.bankrupt_at = 0
    end,

    calculate = function(self, card, context)
        if context.joker_main or context.forcetrigger then
            if card.ability.extra.chips > Number.bigOne then
                return {
                    Xchip_mod = lenient_bignum(card.ability.extra.chips),
                    message = localize({
                        type = "variable",
                        key = "a_xchips",
                        vars = { lenient_bignum(card.ability.extra.chips) },
                    }),
                }
            end
        end
        if (context.ending_shop and not context.individual and not context.repetition and not (context.blueprint_card or card.getting_sliced)) or context.forcetrigger then
            local debt = Number.toBig(G.GAME.dollars)
            if debt < Number.bigZero then
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = "chips",
                    scalar_table = { debt_gain = (lenient_bignum(card.ability.extra.gain) * (-1 * debt)) },
                    scalar_value = "debt_gain",
                    message_key = "a_xchips",
                    message_colour = G.C.CHIPS,
                })
            end
        end
    end,
    asc_credits = {
        idea = {
            "UTNerd24",
            "MarioFan597",
        },
        art = {
            "Tatteredlurker",
        },
        code = {
            "MarioFan597",
        },
    },
})
