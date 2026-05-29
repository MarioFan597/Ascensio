SMODS.Joker({
    key = "delayed_grat",
    rarity = "cry_exotic",
    atlas = "v_atlas_2",

    pos = { x = 0, y = 3 }, -- todo: replace with next index, mariofan do this for me im lazy af
    soul_pos = { x = 2, y = 3, extra = { x = 1, y = 3 } },

    cost = 50,
    order = 1,

    config = { extra = { emult_scalar = 0.1, discard = 0, dollars = 2 } },

    blueprint_compat = true,
    demicoloncompat = true,

    loc_vars = function(_, _, card)
        return {
            vars = {
                card.ability.extra.discard,
                card.ability.extra.emult_scalar,
                (G.GAME and G.GAME.current_round) and 1 + (G.GAME.current_round.discards_left * card.ability.extra.emult_scalar) or 1,
                card.ability.extra.dollars,
            },
        }
    end,

    calculate = function(_, card, ctx)
        if (ctx.blind_defeated and G.GAME.current_round.discards_left > 0) or ctx.forcetrigger then
            card.ability.extra.discard = 0
            return SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "discard",
                scalar_value = "gain",
                scalar_table = { gain = G.GAME.current_round.discards_left },
            })
        end

        if ctx.blind then
            ease_discard(card.ability.extra.discard)
        end

        if ctx.joker_main then
            return { Emult_mod = 1 + (G.GAME.current_round.discards_left * card.ability.extra.emult_scalar) }
        end
    end,

    calc_dollar_bonus = function(_, card)
        return G.GAME.current_round.discards_used == 0 and G.GAME.current_round.discards_left > 0 and G.GAME.current_round.discards_left * card.ability.extra.dollars or nil
    end,
})
