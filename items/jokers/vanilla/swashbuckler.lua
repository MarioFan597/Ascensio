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
            multiplier = 0.5,
            multiplier_gain = 0.1,
        },
    },

    loc_vars = function(_, _, card)
        local neg = card.ability.extra.negative

        return {
            vars = {
                card.ability.extra.xmult,
                card.ability.extra.multiplier,
                card.ability.extra.multiplier_gain,
            },
        }
    end,

    calculate = function(_, card, context)
        if context.joker_main and card.ability.extra.xmult > 1 then
            return { xmult = card.ability.extra.xmult }
        end

        if context.buying_card and context.card.ability.set == "Joker" then
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "multiplier",
                scalar_value = "multiplier_gain",
            })
        end

        if (context.end_of_round and context.main_eval and not context.blueprint) or context.forcetrigger then
            local asset = 0

            for _, joker in ipairs(G.jokers.cards) do
                asset = asset + joker.sell_cost
            end

            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "xmult",
                scalar_value = "multiplier",

                operation = function(ref_table, ref_value, initial, change)
                    ref_table[ref_value] = initial + change * asset
                end,
            })
        end
    end,

    asc_credits = Ascensio.Credit({
        idea = { "OmegaLife", "Grahkon" },
        art = { "???" },
        code = { "OmegaLife" },
    }),
})
