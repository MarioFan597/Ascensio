SMODS.Joker({
    key = "baseball_card",
    rarity = "cry_exotic",
    atlas = "v_atlas_1",
    blueprint_compat = true,
    demicoloncompat = true,

    cost = 50,
    order = 23,

    pos = { x = 3, y = 14 },
    soul_pos = { x = 5, y = 14, extra = { x = 4, y = 14 } },

    config = {
        extra = {
            xmult = 10,
            gain = 1,
        },
    },

    loc_vars = function(_, _, card)
        return {
            vars = {
                card.ability.extra.xmult,
                card.ability.extra.gain,
            },
        }
    end,

    calculate = function(_, card, ctx)
        if ctx.other_joker or ctx.forcetrigger then
            return { xmult = card.ability.extra.xmult }
        end

        if ctx.end_of_round and ctx.main_eval then
            local scale_amount = 0

            for _, joker in ipairs(G.jokers.cards) do
                if joker.config.center.rarity == 2 or joker.config.center.rarity == "Uncommon" then
                    scale_amount = scale_amount + 1
                end
            end

            return SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "xmult",
                scalar_value = "gain",
                scalar_table = { gain = card.ability.extra.gain * scale_amount },
            })
        end
    end,

    asc_credits = {
        idea = {
            "OmegaLife",
        },
        art = {
            "???",
        },
        coding = {
            "OmegaLife",
        },
    },
})
