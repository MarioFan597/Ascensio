SMODS.Joker({
    key = "madness",
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
            xmult = 1,
            xmult_gain = 2,
        },
    },

    loc_vars = function(_, _, card)
        return {
            vars = {
                card.ability.extra.xmult,
                card.ability.extra.xmult_gain,
            },
        }
    end,

    calculate = function(_, card, context)
        if context.setting_blind and not context.blueprint then
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "xmult",
                scalar_value = "xmult_gain",
            })

            if not context.blind.boss then
                local destructable_jokers = {}

                for _, jkr in ipairs(G.jokers.cards) do
                    if jkr ~= card and SMODS.is_eternal(jkr, card) and not jkr.getting_sliced then
                        destructable_jokers[#destructable_jokers + 1] = jkr
                    end
                end

                ---@type Card|nil
                local joker_to_destroy = pseudorandom_element(destructable_jokers, "the madness of man knows no bound", {})

                if joker_to_destroy then
                    joker_to_destroy.getting_sliced = true

                    SMODS.scale_card(card, {
                        ref_table = card.ability.extra,
                        ref_value = "xmult_gain",
                        scalar_value = "gain",
                        scalar_table = { gain = joker_to_destroy.sell_cost },
                    })

                    G.E_MANAGER:add_event(Event({
                        func = function()
                            (context.blueprint_card or card):juice_up(0.8, 0.8)
                            joker_to_destroy:start_dissolve({ G.C.RED }, nil, 1.6)
                            return true
                        end,
                    }))
                end
            end
        end

        if context.joker_main then
            return { xmult = card.ability.extra.xmult }
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
