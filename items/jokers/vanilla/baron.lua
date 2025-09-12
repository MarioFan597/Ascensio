SMODS.Joker({
    key = "baron",
    rarity = "cry_exotic",
    atlas = "v_atlas_2",

    blueprint_compat = true,
    demicoloncompat = true,

    pos = { x = 0, y = 1 },
    soul_pos = { x = 2, y = 1, extra = { x = 1, y = 1 } },

    cost = 50,
    order = 1,

    config = {
        extra = {
            emult = 1,
            emult_gain = 0.02,
        },
    },

    loc_vars = function(_, _, card)
        return {
            vars = {
                card.ability.extra.emult,
                card.ability.extra.emult_gain,
            },
        }
    end,

    calculate = function(_, card, context)
        if (context.individual and context.cardarea == G.hand and not context.end_of_round and context.other_card:get_id() == 13) or context.forcetrigger then
            return { emult = card.ability.extra.emult }
        end

        if context.after or context.forcetrigger then
            local scalar = 0

            for _, cardx in ipairs(G.hand.cards) do
                if cardx:get_id() == 13 then
                    scalar = scalar + 1
                end
            end
            
            if scalar > 0 then
                return SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = "emult",
                    scalar_value = "gain",
                    scalar_table = { gain = card.ability.extra.emult_gain * scalar },
                })
            end
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
