SMODS.Joker({
    key = "rocket",
    rarity = "cry_exotic",
    atlas = "v_atlas_2",
    blueprint_compat = true,
    demicoloncompat = true,

    pos = { x = 3, y = 0 },
    soul_pos = { x = 5, y = 0, extra = { x = 4, y = 0 } },

    cost = 50,
    order = 1,

    config = {
        extra = {
            money = 5,
            money_gain = 2,
            xchips_scalar = 0.1,
            xchips = 1,
        },

        immutable = {
            money = 5,
        },
    },

    loc_vars = function(_, _, card)
        return {
            vars = {
                card.ability.extra.money,
                card.ability.extra.money_gain,
                card.ability.extra.xchips_scalar,
                card.ability.extra.xchips,
            },
        }
    end,

    calculate = function(_, card, context)
        if (context.individual and context.cardarea == G.play) or context.forcetrigger then
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "money",
                scalar_value = "money_gain",
            })
        end

        if (context.end_of_round and context.main_eval) or context.forcetrigger then
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "xchips",
                scalar_value = "gain",
                scalar_table = { gain = G.GAME.dollars * card.ability.xchips_scalar },
            })
        end

        if context.joker_main or context.forcetrigger then
            return {
                xchips = card.ability.extra.xchips,
            }
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
