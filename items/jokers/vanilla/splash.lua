SMODS.Joker({
    key = "splash",
    rarity = "cry_exotic",
    atlas = "v_atlas_2",

    blueprint_compat = true,
    demicoloncompat = true,

    pos = { x = 6, y = 1 },
    soul_pos = { x = 8, y = 1, extra = { x = 7, y = 1 } },

    cost = 50,
    order = 1,

    config = {
        extra = {
            csl_gain = 1,
        },

        immutable = {
            cumulative_csl_gained = 0,
        },
    },

    loc_vars = function(_, _, card)
        card.ability.extra.csl_gain = math.floor(card.ability.extra.csl_gain)

        return {
            vars = {
                card.ability.extra.csl_gain,
                card.ability.immutable.cumulative_csl_gained,
            },
        }
    end,

    add_to_deck = function(_, card, _)
        local csl_gain = card.ability.extra.csl_gain

        ease_selection_limit(csl_gain)

        SMODS.scale_card(card, {
            ref_table = card.ability.immutable,
            ref_value = "cumulative_csl_gained",
            scalar_value = "gain",
            scalar_table = { gain = csl_gain },
        })
    end,

    calculate = function(_, card, context)
        if context.modify_scoring_hand and not context.blueprint then
            return {
                add_to_hand = true,
            }
        end

        if context.beat_boss and context.main_eval then
            local csl_gain = card.ability.extra.csl_gain

            ease_selection_limit(csl_gain)

            SMODS.scale_card(card, {
                ref_table = card.ability.immutable,
                ref_value = "cumulative_csl_gained",
                scalar_value = "gain",
                scalar_table = { gain = csl_gain },
            })
        end

        if context.individual and context.cardarea == G.play then
            local xmult = math.max(#(context.scoring_hand or {}), 1)
            return { xmult = xmult }
        end
    end,

    remove_from_deck = function(_, card, _)
        ease_selection_limit(-card.ability.immutable.cumulative_csl_gained)

        return {
            message = "Dried Up!",
            colour = G.C.RED,
        }
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
