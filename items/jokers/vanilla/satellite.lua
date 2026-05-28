SMODS.Joker({
    key = "satellite",
    rarity = "cry_exotic",
    atlas = "v_atlas_2",

    pos = { x = 0, y = 3 }, -- todo: replace with next index, mariofan do this for me im lazy af
    soul_pos = { x = 2, y = 3, extra = { x = 1, y = 3 } },

    cost = 50,
    order = 1,

    config = { extra = { money = 20 } },

    blueprint_compat = true,
    demicoloncompat = true,

    loc_vars = function(_, _, card)
        local planet_used = 0

        for _, v in pairs(G.GAME.consumeable_usage) do
            if v.set == "Planet" then
                planet_used = planet_used + v.count
            end
        end

        return {
            vars = {
                card.ability.extra.money,
                card.ability.extra.money * planet_used,
            },
        }
    end,

    calculate = function(_, card, ctx)
        if ctx.using_consumeable and ctx.consumeable.set == "Planet" then
            return SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "money",
                scalar_value = "gain",
                scalar_table = { gain = 0 },
            })
        end
    end,

    calc_dollar_bonus = function(_, card)
        local planet_used = 0

        for _, v in pairs(G.GAME.consumeable_usage) do
            if v.set == "Planet" then
                planet_used = planet_used + v.count
            end
        end

        return planet_used * card.ability.extra.money
    end,
})
