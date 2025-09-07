SMODS.Joker({
    key = "fibonacci",
    config = { extra = { mult = 1, start_mult = 1, start_previous = 1, immutable = { previous = 0, previous2 = 0 } } },
    rarity = "cry_exotic",
    atlas = "v_atlas_1",
    blueprint_compat = true,
    demicoloncompat = true,
    pos = { x = 6, y = 6 },
    soul_pos = { x = 8, y = 6, extra = { x = 7, y = 6 } },
    cost = 55,
    order = 31,
    loc_vars = function(self, info_queue, card)
        return { vars = { lenient_bignum(card.ability.extra.mult), lenient_bignum(card.ability.extra.start_mult) } }
    end,
    calculate = function(self, card, context)
        if (context.individual and context.cardarea == G.play) and not context.blueprint then
            local rank = context.other_card:get_id()
            if rank == 14 or rank == 2 or rank == 3 or rank == 5 or rank == 8 then
                if card.ability.extra.immutable.previous == 0 then
                    card.ability.extra.immutable.previous = card.ability.extra.start_previous
                end
                card.ability.extra.immutable.previous2 = card.ability.extra.immutable.previous
                card.ability.extra.immutable.previous = card.ability.extra.mult
                card.ability.extra.mult = (card.ability.extra.immutable.previous2 + card.ability.extra.immutable.previous)
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = "mult",
                    scalar_table = {
                        previous_results = ((card.ability.extra.immutable.previous2 + card.ability.extra.immutable.previous) - card.ability.extra.mult),
                    },
                    scalar_value = "previous_results",
                    no_message = true,
                })
                return {
                    message = localize({
                        type = "variable",
                        key = "a_xmult",
                        vars = { lenient_bignum(card.ability.extra.mult) },
                    }),
                    Xmult_mod = lenient_bignum(card.ability.extra.mult),
                    colour = G.C.MULT,
                }
            end
        end

        if context.forcetrigger then
            if card.ability.extra.immutable.previous == 0 then
                card.ability.extra.immutable.previous = card.ability.extra.start_previous
            end
            card.ability.extra.immutable.previous2 = card.ability.extra.immutable.previous
            card.ability.extra.immutable.previous = card.ability.extra.mult
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "mult",
                scalar_table = {
                    previous_results = ((card.ability.extra.immutable.previous2 + card.ability.extra.immutable.previous) - card.ability.extra.mult),
                },
                scalar_value = "previous_results",
                no_message = true,
            })
            return {
                message = localize({
                    type = "variable",
                    key = "a_xmult",
                    vars = { lenient_bignum(card.ability.extra.mult) },
                }),
                Xmult_mod = lenient_bignum(card.ability.extra.mult),
                colour = G.C.MULT,
            }
        end

        if (context.individual and context.cardarea == G.play) and context.blueprint then
            local rank = context.other_card:get_id()
            if rank == 14 or rank == 2 or rank == 3 or rank == 5 or rank == 8 then
                return {
                    message = localize({
                        type = "variable",
                        key = "a_xmult",
                        vars = { lenient_bignum(card.ability.extra.mult) },
                    }),
                    Xmult_mod = lenient_bignum(card.ability.extra.mult),
                    colour = G.C.MULT,
                }
            end
        end

        if
            context.after and not context.blueprint --and card.ability.extra.mult ~= 1
        then
            card.ability.extra.mult = card.ability.extra.start_mult
            card.ability.extra.immutable.previous = 0
            card.ability.extra.immutable.previous2 = 0
            --return {
            --card = self,
            --message = localize("k_reset"),
            --}
        end
    end,
    asc_credits = {
        idea = {
            "OmegaLife",
            "Tatteredlurker",
        },
        art = {
            "missingnumber",
        },
        code = {
            "MarioFan597",
        },
    },
})
