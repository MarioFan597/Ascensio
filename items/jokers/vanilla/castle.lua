SMODS.Joker({
    key = "castle",
    rarity = "cry_exotic",
    atlas = "v_atlas_2",
    blueprint_compat = true,
    demicoloncompat = true,

    pos = { x = 0, y = 0 },
    soul_pos = { x = 2, y = 0, extra = { x = 1, y = 0 } },

    cost = 50,
    order = 1,

    config = {
        extra = {
            echips = 1,
            emult = 1,
            echips_gain = 0.01,
            emult_gain = 0.01,
        },
    },

    loc_vars = function(_, _, card)
        return {
            vars = {
                card.ability.extra.echips_gain,
                card.ability.extra.echips,
                card.ability.extra.emult_gain,
                card.ability.extra.emult,
            },
        }
    end,

    calculate = function(_, card, context)
        if (context.discard and not context.blueprint and not context.other_card.debuff) or context.forcetrigger then
            if (context.other_card:is_suit("Spades") or context.other_card:is_suit("Clubs")) or context.forcetrigger then
                local msg = SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = "echips",
                    scalar_value = "echips_gain",
                })

                if not context.forcetrigger then
                    return msg
                end
            end

            if (context.other_card:is_suit("Hearts") or context.other_card:is_suit("Diamonds")) or context.forcetrigger then
                local msg = SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = "emult",
                    scalar_value = "emult_gain",
                })

                if not context.forcetrigger then
                    return msg
                end
            end
        end

        if context.joker_main or context.forcetrigger then
            return {
                echips = card.ability.extra.echips,
                emult = card.ability.extra.emult,
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
