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
            card_requirement = {
                current = 0,
                requirement = 20,
            },
        },

        immutable = {
            cumulative_csl_gained = 0,
            oldcsl = 5,
        },
    },

    loc_vars = function(_, _, card)
        card.ability.extra.csl_gain = math.floor(card.ability.extra.csl_gain)

        return {
            vars = {
                card.ability.extra.csl_gain,
                card.ability.immutable.cumulative_csl_gained,
                card.ability.extra.card_requirement.requirement,
                card.ability.extra.card_requirement.current,
            },
        }
    end,

    add_to_deck = function(_, card, _)
        card.ability.immutable.oldcsl = G.GAME.starting_params.play_limit
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

        if context.individual and context.cardarea == G.play then
            if card.ability.extra.card_requirement.current < card.ability.extra.card_requirement.requirement then
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra.card_requirement,
                    ref_value = "current",
                    scalar_value = "gain",
                    scalar_table = { gain = 1 },

                    no_message = true,
                })
            else
                card.ability.extra.card_requirement.current = 0
                ease_selection_limit(card.ability.extra.csl_gain)

                SMODS.scale_card(card, {
                    ref_table = card.ability.immutable,
                    ref_value = "cumulative_csl_gained",
                    scalar_value = "csl_gain",
                    scalar_table = card.ability.extra,
                })
            end
        end
    end,

    remove_from_deck = function(_, card, _)
        set_selection_limit(card.ability.immutable.oldcsl)
    end,

    asc_credits = Ascensio.Credit({
        idea = { "OmegaLife", "Grahkon" },
        art = { "???" },
        code = { "OmegaLife" },
    }),
})
