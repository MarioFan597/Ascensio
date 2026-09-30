SMODS.Joker({
    key    = "flash",
    rarity = "cry_exotic",
    atlas  = "v_atlas_2",

    -- todo: replace with next index, mariofan do this for me im lazy af
    pos      = { x = 0, y = 3 },
    soul_pos = { x = 2, y = 3, extra = { x = 1, y = 3 } },

    cost  = 50,
    order = 1,

    config = { extra = { xmult = 1 } },

    blueprint_compat = true,
    demicoloncompat  = true,

    loc_vars = function(_, _, card)
        return { vars = { card.ability.extra.xmult } }
    end,

    calculate = function(_, card, ctx)
        if (ctx.reroll_shop and not ctx.blueprint) or ctx.forcetrigger then
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "xmult",
                scalar_value = "gain",
                scalar_table = { gain = math.max(G.GAME.current_round.reroll_cost, 1) },
            })
        end

        if ctx.joker_main then
            return { xmult = card.ability.extra.xmult }
        end
    end,
})
