SMODS.Joker({
    key = "hack",
    rarity = "cry_exotic",
    atlas = "v_atlas_2",

    pos = { x = 0, y = 3 }, -- todo: replace with next index, mariofan do this for me im lazy af
    soul_pos = { x = 2, y = 3, extra = { x = 1, y = 3 } },

    cost = 50,
    order = 1,

    config = { extra = { xmult = 1 } },

    blueprint_compat = false,
    demicoloncompat = true,

    loc_vars = function(_, _, card)
        ---@cast card.ability table
        return { vars = { card.ability.extra.xmult } }
    end,

    calculate = function(_, card, ctx)
        if ctx.repetition and ctx.cardarea == G.play then
            if ctx.other_card then
                ---@cast ctx.other_card Card
                local id = ctx.other_card:get_id()

                if id < 6 then
                    return { repetitions = id }
                end
            end
        end

        if ctx.joker_main or ctx.forcetrigger then
            ---@cast card.ability table
            if ctx.scoring_hand then
                local val = 0

                ---@cast ctx.scoring_hand Card[]
                for _, other_card in ipairs(ctx.scoring_hand) do
                    if other_card:get_id() < 6 then
                        val = val + 1
                    end
                end

                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = "xmult",
                    scalar_value = "change",
                    scalar_table = { change = val },
                })
            end

            return { xmult = card.ability.extra.xmult }
        end
    end,

    asc_credits = {
        idea = {
            "Rhelvetican",
        },
        art = {
            "???",
        },
        code = {
            "Rhelvetican",
        },
    },
})
