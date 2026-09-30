SMODS.Joker({
    key = "runner",
    rarity = "cry_exotic",
    atlas = "v_atlas_2",

    pos = { x = 0, y = 3 }, -- todo: replace with next index, mariofan do this for me im lazy af
    soul_pos = { x = 2, y = 3, extra = { x = 1, y = 3 } },

    cost = 50,
    order = 1,

    config = { extra = { echip_gain = 0.15, echip = 1.0 } },

    blueprint_compat = true,
    demicoloncompat = true,

    loc_vars = function(_, _, card) return { vars = { card.ability.extra.echip_gain, card.ability.extra.echip } } end,

    calculate = function(_, card, ctx)
        if (ctx.before and not ctx.blueprint and next(ctx.poker_hands["Straight"])) or ctx.forcetrigger then
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "echip",
                scalar_value = "echip_gain",
            })
        end

        if ctx.joker_main then return { echip = card.ability.extra.echip } end
    end,

    asc_credits = {
        idea = { "Rhelvetican" },
        art = {},
        code = { "Rhelvetican" },
    },
})
