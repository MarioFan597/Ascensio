SMODS.Joker({
    key = "space",
    rarity = "cry_exotic",
    atlas = "v_atlas_1",

    blueprint_compat = true,
    demicoloncompat = true,

    pos = { x = 9, y = 12 },
    soul_pos = { x = 11, y = 12, extra = { x = 10, y = 12 } },

    cost = 0,
    order = 50,

    config = {
        extra = {
            level_gain = 1,
            gain = 1,
            antes = { req = 2, done = 0 },
            immutable = { hands = 0 },
        },
    },

    loc_vars = function(_, _, card)
        card.ability.extra.antes.done = math.min(card.ability.extra.antes.done, card.ability.extra.antes.req)

        return {
            vars = {
                card.ability.extra.level_gain,
                card.ability.extra.immutable.hands,
                card.ability.extra.antes.req,
                card.ability.extra.antes.done,
                card.ability.extra.gain,
            },
        }
    end,

    calculate = function(_, card, context)
        if context.before or context.forcetrigger then
            if not context.retrigger_joker then
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra.immutable,
                    ref_value = "hands",
                    scalar_value = "gain",

                    scalar_table = { gain = 1 },
                })
            end

            SMODS.calculate_effect({ message = localize("k_level_up_ex") }, context.blueprint_card or card)
            SMODS.smart_level_up_hand(context.blueprint_card or card, context.scoring_name, nil, card.ability.extra.immutable.hands * card.ability.extra.level_gain)
        end

        if context.beat_boss and context.main_eval and not context.forcetrigger then
            local message = ""
            if card.ability.extra.antes.done > card.ability.extra.antes.req then
                message = "Incremented!"
                card.ability.extra.antes.done = 0

                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = "level_gain",
                    scalar_value = "gain",
                })
            else
                message = "Reset!"
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra.antes,
                    ref_value = "done",
                    scalar_value = "gain",

                    scalar_table = { gain = 1 },

                    no_message = true,
                })
            end

            card.ability.extra.immutable.hands = 0

            return {
                message = message,
                colour = G.C.FILTER,
            }
        end
    end,

    asc_credits = {
        idea = {
            "Rhelvetican",
        },
        art = {
            "Lil Mr. Slipstream",
        },
        code = {
            "Rhelvetican",
        },
    },
})
