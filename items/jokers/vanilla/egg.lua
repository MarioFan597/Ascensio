SMODS.Joker({
    key = "egg",
    rarity = "cry_exotic",
    atlas = "v_atlas_1",

    blueprint_compat = true,
    demicoloncompat = true,

    pos = { x = 9, y = 9 },
    soul_pos = { x = 11, y = 9, extra = { x = 10, y = 9 } },

    cost = 0,
    order = 1,

    config = {
        extra = {
            x_sell_gain = 1.25,
            xmult = 1,
        },
    },

    loc_vars = function(_, _, card)
        return {
            vars = {
                card.ability.extra.x_sell_gain,
                card.ability.extra.xmult,
            },
        }
    end,

    add_to_deck = function(_, card, _)
        card.ability.extra_value = to_big(10)
        card:set_cost()
    end,

    calculate = function(_, card, context)
        if context.joker_main or context.forcetrigger then
            return {
                message = localize({
                    type = "variable",
                    key = "a_xmult",
                    vars = {
                        card.ability.extra.xmult,
                    },
                }),
                Xmult_mod = card.ability.extra.xmult,
                colour = G.C.MULT,
            }
        end

        if context.setting_blind and not context.blueprint then
            card.ability.extra.xmult = (card.ability.extra.xmult + card.ability.extra_value:log10()):ceil()

            return {
                message = localize("k_upgrade_ex"),
                colour = G.C.MULT,
            }
        end

        if context.end_of_round and context.main_eval and not (context.game_over or context.blueprint) then
            card.ability.extra_value = card.ability.extra_value:mul(card.ability.extra.x_sell_gain):ceil()
            SMODS.scale_card(card, {
                ref_table = card.ability,
                ref_value = "extra_value",
                scalar_table = {
                    sell_value_gain = (card.ability.extra_value:mul(card.ability.extra.x_sell_gain):ceil()),
                },
                scalar_value = "gain",
                message_colour = G.C.MONEY,
            })
            card:set_cost()

            return {
                message = localize("k_val_up"),
                colour = G.C.MONEY,
            }
        end
    end,

    asc_credits = {
        idea = {
            "Rhelvetican",
        },
        art = {
            "Tatteredlurker",
        },
        code = {
            "Rhelvetican",
        },
    },
})
