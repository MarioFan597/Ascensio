SMODS.Joker({
    key = "swashbuckler",
    rarity = "cry_exotic",
    atlas = "v_atlas_1",
    blueprint_compat = true,
    demicoloncompat = true,

    cost = 50,
    order = 23,

    pos = { x = 0, y = 15 },
    soul_pos = { x = 2, y = 15, extra = { x = 1, y = 15 } },

    config = {
        extra = {
            xmult = 1,
            multiplier = 0.25,
            inflation = 1,
        },
    },

    loc_vars = function(_, _, card)
        return {
            vars = {
                card.ability.extra.xmult,
                card.ability.extra.multiplier,
                card.ability.extra.inflation,
            },
        }
    end,

    calculate = function(_, card, context)
        if context.joker_main and card.ability.extra.xmult > 1 then
            return { xmult = card.ability.extra.xmult }
        end

        if (context.end_of_round and context.main_eval) or context.forcetrigger then
            local price_of_peace_or_something_i_dont_know = 0

            for _, joker in ipairs(G.jokers.cards) do
                price_of_peace_or_something_i_dont_know = price_of_peace_or_something_i_dont_know + joker.sell_cost
            end

            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "xmult",
                scalar_value = "gain",
                scalar_table = { gain = card.ability.extra.multiplier * price_of_peace_or_something_i_dont_know },
            })
        end

        if (context.beat_boss and context.main_eval and not context.blueprint) or context.forcetrigger then
            G.GAME.inflation = (G.GAME.inflation or 0) + card.ability.extra.inflation

            return {
                message = "Inflation!",
                colour = G.C.MONEY,
            }
        end
    end,

    asc_credits = Ascensio.Credit({
        idea = { "OmegaLife", "Grahkon" },
        art = { "???" },
        code = { "OmegaLife" },
    }),
})
