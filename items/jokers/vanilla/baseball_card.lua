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
            eemult = 1.15,
        },
    },

    loc_vars = function(_, _, card)
        return {
            vars = {
                card.ability.extra.eemult,
            },
        }
    end,

    calculate = function(_, card, ctx)
        if (ctx.other_joker or ctx.joker_main) or ctx.forcetrigger then
            return { eemult = card.ability.extra.eemult }
        end
    end,
})
