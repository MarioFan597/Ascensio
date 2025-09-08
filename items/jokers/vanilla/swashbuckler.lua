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
        },
    },

    loc_vars = function(_, _, card)
        return {
            vars = {
                card.ability.extra.xmult,
                card.ability.extra.multiplier,
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

            return SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "xmult",
                scalar_value = "gain",
                scalar_table = { gain = card.ability.extra.multiplier * price_of_peace_or_something_i_dont_know },
            })
        end
    end,

    asc_credits = {
        idea = {
            "OmegaLife",
        },
        art = {
            "???",
        },
        code = {
            "OmegaLife",
        },
    },
})
