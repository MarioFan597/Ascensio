SMODS.Joker({
    key = "vampire",
    rarity = "cry_exotic",
    atlas = "v_atlas_2",

    blueprint_compat = true,
    demicoloncompat = true,

    pos = { x = 3, y = 1 },
    soul_pos = { x = 5, y = 1, extra = { x = 4, y = 1 } },

    cost = 50,
    order = 1,

    config = {
        extra = {
            eemult = 1,
            eemult_gain = 0.005,
            eemult_lost = 0.02,
        },
    },

    loc_vars = function(_, _, card)
        return {
            vars = {
                card.ability.extra.eemult,
                card.ability.extra.eemult_gain,
                card.ability.extra.eemult_lost,
            },
        }
    end,

    calculate = function(_, card, context)
        if (context.before and not context.blueprint) or context.forcetrigger then
            local scalar = 0

            for _, scored in ipairs(context.scoring_hand) do
                if next(SMODS.get_enhancements(scored)) and not scored.debuff and not scored.vampired then
                    scalar = scalar + 1
                    scored.vampired = true
                    scored:set_ability("c_base", nil, true)

                    G.E_MANAGER:add_event(Event({
                        func = function()
                            scored:juice_up()
                            scored.vampired = nil
                            return true
                        end,
                    }))
                end
            end

            if scalar == 0 and not context.forcetrigger then
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = "eemult",
                    scalar_value = "eemult_lost",
                    operation = "-",

                    scaling_message = {
                        message = "I DEMAND BLOOD!",
                        colour = G.C.RED,
                    },
                })

                card.ability.extra.eemult = math.max(card.ability.extra.eemult, 1)
            else
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = "eemult",
                    scalar_value = "gain",
                    scalar_table = { gain = scalar * card.ability.extra.eemult_gain },
                })
            end
        end

        if context.joker_main or context.forcetrigger then
            return { eemult = card.ability.extra.eemult }
        end
    end,

    asc_credits = {
        idea = {
            "OmegaLife",
        },
        art = {
            "Lil Mr. Slipstream",
        },
        code = {
            "OmegaLife",
        },
    },
})
