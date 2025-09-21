SMODS.Joker({
    key = "baseball_card",
    rarity = "cry_exotic",
    atlas = "v_atlas_1",
    blueprint_compat = true,
    demicoloncompat = true,

    cost = 50,
    order = 23,

    pos = { x = 9, y = 15 },
    soul_pos = { x = 11, y = 15, extra = { x = 10, y = 15 } },

    config = {
        extra = {
            xval = 1.5,
            xmult = 1,
            xmult_gain = 1,
        },
    },

    loc_vars = function(_, _, card)
        return {
            vars = {
                card.ability.extra.xval,
                card.ability.extra.xmult,
                card.ability.extra.xmult_gain,
            },
        }
    end,

    calculate = function(_, card, ctx)
        if (ctx.end_of_round and ctx.main_eval) or ctx.forcetrigger then
            local gain = 0
            for _, other_joker in ipairs(G.jokers.cards) do
                if (other_joker.config.center.rarity == 2) or ctx.forcetrigger then
                    gain = gain + 1
                end
            end

            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "xmult",
                scalar_value = "xmult_gain",

                operation = function(ref_table, ref_value, initial, change)
                    ref_table[ref_value] = initial + gain * change
                end,
            })
        end

        if (ctx.beat_boss and ctx.main_eval) or ctx.forcetrigger then
            for _, other_joker in ipairs(G.jokers.cards) do
                if (other_joker.config.center.rarity == 2) or ctx.forcetrigger then
                    Cryptid.manipulate(other_joker, card.ability.extra.xval)
                end
            end

            return {
                message = "Upgraded!",
            }
        end

        if ctx.joker_main then
            return { xmult = card.ability.extra.xmult }
        end
    end,

    asc_credits = Ascensio.Credit({
        idea = { "OmegaLife", "Grahkon" },
        art = { "???" },
        coding = { "OmegaLife" },
    }),
})
