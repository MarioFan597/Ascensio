SMODS.Joker({
    key    = "scholar",
    rarity = "cry_exotic",
    atlas  = "v_atlas_2",

    -- todo: replace with next index, mariofan do this for me im lazy af
    pos      = { x = 0, y = 3 },
    soul_pos = { x = 2, y = 3, extra = { x = 1, y = 3 } },

    cost  = 50,
    order = 1,

    config = {
        extra = {
            xmult     = 2,
            xchips    = 3,
            increment = 1,
        },
    },

    blueprint_compat = true,
    demicoloncompat  = true,

    loc_vars = function(_, _, card)
        return {
            vars = {
                card.ability.extra.xmult,
                card.ability.extra.xchips,
                card.ability.extra.increment,
            },
        }
    end,

    calculate = function(_, card, ctx)
        if ctx.individual and ctx.cardarea == G.play and ctx.other_card:get_id() == 14 then
            local xmult, xchips = card.ability.extra.xmult, card.ability.extra.xchips

            SMODS.scale_card(card, {
                ref_table    = card.ability.extra,
                ref_value    = "xmult",
                scalar_value = "increment",
            })

            SMODS.scale_card(card, {
                ref_table    = card.ability.extra,
                ref_value    = "xchips",
                scalar_value = "increment",
            })

            return { xmult = xmult, xchips = xchips }
        end
    end,
})
