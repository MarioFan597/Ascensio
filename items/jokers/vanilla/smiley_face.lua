SMODS.Joker({
    key = "smiley_face",
    rarity = "cry_exotic",
    atlas = "v_atlas_1",
    blueprint_compat = true,
    demicoloncompat = true,
    pos = { x = 0, y = 9 },
    soul_pos = { x = 2, y = 9, extra = { x = 1, y = 9 } },
    cost = 50,
    order = 1,

    config = {
        extra = {
            xmult = 3,
            immutable = {
                max_rep = 40,
                redo = 0,
            },
        },
    },

    loc_vars = function(_, _, card)
        return {
            vars = {
                lenient_bignum(card.ability.extra.xmult),
                lenient_bignum(card.ability.extra.immutable.max_rep),
            },
        }
    end,
    calculate = function(_, card, context)
        if context.repetition and context.cardarea == G.play and context.other_card:is_face() then
            card.ability.extra.immutable.redo = card.ability.extra.immutable.redo + 1
            if card.ability.extra.immutable.redo > 1 then
                return {
                    message = localize("k_again_ex"),
                    repetitions = to_number(math.min(card.ability.extra.immutable.max_rep, card.ability.extra.immutable.redo - 1)),
                }
            end
        end

        if
            context.after and not context.blueprint --and card.ability.extra.mult ~= 1
        then
            card.ability.extra.immutable.redo = 0
        end

        if context.individual and context.cardarea == G.play then
            if context.other_card:is_face() then
                for _, scored_card in pairs(context.scoring_hand) do
                    if scored_card == context.other_card then
                        return {
                            message = localize({
                                type = "variable",
                                key = "a_xmult",
                                vars = { number_format(card.ability.extra.xmult) },
                            }),
                            Xmult_mod = card.ability.extra.xmult,
                            colour = G.C.MULT,
                        }
                    end
                end
            end
        end
    end,
    asc_credits = {
        idea = {
            "UTNerd24",
            "MarioFan597",
            "Lil. Mr. Slipstream",
        },
        art = {
            "UTNerd24",
        },
        code = {
            "MarioFan597",
        },
    },
})
