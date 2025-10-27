SMODS.Joker({
    key = "krusty",
    order = 4,
    pos = { x = 0, y = 4 },
    soul_pos = { x = 2, y = 4, extra = { x = 1, y = 4 } },
    rarity = "cry_exotic",
    cost = 50,
    blueprint_compat = true,
    atlas = "c_atlas_1",

    config = {
        extra = {
            xmult = 1,
            gain = 1,
            gain_gain = 1,
        },
    },

    loc_vars = function(_, _, card)
        return {
            vars = {
                card.ability.extra.xmult,
                card.ability.extra.gain,
                card.ability.extra.gain_gain,
            },
        }
    end,

    calculate = function(self, card, context)
        if (context.individual and context.cardarea == G.play) or context.forcetrigger then
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "xmult",
                scalar_value = "gain",
            })
        end

        if (context.beat_boss and context.main_eval) or context.forcetrigger then
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "gain",
                scalar_value = "gain_gain",
            })
        end

        if context.joker_main or context.forcetrigger then
            return { xmult = card.ability.extra.xmult }
        end
    end,

    asc_credits = {
        idea = {
            "Rhelvetican",
        },
        art = {
            "???",
        },
        code = {
            "Rhelvetican",
        },
    },
})
