SMODS.Joker({
    key = "undefined",
    config = { extra = { power = 2 } },
    rarity = "cry_exotic",
    atlas = "v_atlas_1",
    blueprint_compat = true,
    demicoloncompat = true,
    pos = { x = 9, y = 0 },
    soul_pos = { x = 11, y = 0, extra = { x = 10, y = 0 } },
    cost = 50,
    order = 131,
    loc_vars = function(_, _, card)
        ---@cast card.ability table<string, any>
        return { vars = { card and lenient_bignum(card.ability.extra.power) } }
    end,
    calculate = function(_, card, context) end,
    asc_credits = {
        idea = {
            "Rhelvetican",
        },
        art = {
            "MarioFan597",
        },
        code = {
            "Rhelvetican",
        },
    },
})
