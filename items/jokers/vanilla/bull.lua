SMODS.Joker({
    key = "bull",
    rarity = "cry_exotic",
    atlas = "v_atlas_1",
    blueprint_compat = true,
    demicoloncompat = true,
    pos = { x = 3, y = 5 },
    soul_pos = { x = 5, y = 5, extra = { x = 4, y = 5 } },
    cost = 50,
    order = 1,

    loc_vars = function(_, _, card)
        card.ability.extra.chips = 1 + ((G.GAME.dollars or 0) * card.ability.extra.gain)

        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.gain,
            },
        }
    end,

    config = { extra = { echips = 1, gain = 0.01 } },

    calculate = function(_, card, context)
        if context.joker_main or context.forcetrigger then
            card.ability.extra.chips = 1 + ((G.GAME.dollars or 0) * card.ability.extra.gain)

            if card.ability.extra.chips > 1 then
                return {
                    Echip_mod = card.ability.extra.chips,
                    message = localize({
                        type = "variable",
                        key = "a_powchips",
                        vars = { card.ability.extra.chips },
                    }),
                }
            end
        end
    end,
    asc_credits = {
        idea = {
            "TheOfficialfem",
        },
        art = {
            "unexian",
            "MarioFan597",
        },
        code = {
            "MarioFan597",
        },
    },
})
