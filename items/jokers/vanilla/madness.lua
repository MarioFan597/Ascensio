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
            xmult = to_big(10),
            xmult_gain = to_big(5),
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
        if (context.setting_blind and not context.blueprint) or context.forcetrigger then
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "xmult",
                scalar_value = "xmult_gain",
            })

            if context.forcetrigger then
                local sum = to_big(0)
                for _, joker in ipairs(G.jokers.cards) do
                    sum = sum + Big:ensureBig(joker.sell_cost)
                end

                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = "xmult_gain",
                    scalar_value = "gain",
                    scalar_table = { gain = sum:log10() + 1 },

                    operation = "x",
                })
            else
                local destructable_jokers = {}
                for i = 1, #G.jokers.cards do
                    if G.jokers.cards[i] ~= card and not SMODS.is_eternal(G.jokers.cards[i], card) and not G.jokers.cards[i].getting_sliced then
                        destructable_jokers[#destructable_jokers + 1] = G.jokers.cards[i]
                    end
                end
                local joker_to_destroy = pseudorandom_element(destructable_jokers, "I can calculate the movement of stars, but not the madness of men. - Isaac Newton", {})

                if joker_to_destroy then
                    joker_to_destroy.getting_sliced = true
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            SMODS.scale_card(card, {
                                ref_table = card.ability.extra,
                                ref_value = "xmult_gain",
                                scalar_value = "gain",
                                scalar_table = { gain = Big:ensureBig(joker_to_destroy.sell_cost):log10() + 1 },

                                operation = "x",
                            });

                            (context.blueprint_card or card):juice_up(0.8, 0.8)
                            joker_to_destroy:start_dissolve({ G.C.RED }, nil, 1.6)

                            return true
                        end,
                    }))
                end
            end
        end

        if context.joker_main or context.forcetrigger then
            return { xmult = card.ability.extra.xmult }
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
