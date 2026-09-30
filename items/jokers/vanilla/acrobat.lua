SMODS.Joker({
    key    = "acrobat",
    rarity = "cry_exotic",
    atlas  = "v_atlas_2",

    pos      = { x = 0, y = 3 }, -- todo: replace with next index, mariofan do this for me im lazy af
    soul_pos = { x = 2, y = 3, extra = { x = 1, y = 3 } },

    cost  = 50,
    order = 1,

    config = { extra = { emult = 1, emult_gain = 0.25, multiplier = 2 } },

    blueprint_compat = true,
    demicoloncompat  = true,

    loc_vars = function(_, _, card)
        return { vars = table.get(card.ability.extra, { "emult", "emult_gain", "multiplier" }) or {} }
    end,

    calculate = function(_, card, ctx)
        if ctx.before then
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "emult",
                scalar_value = "emult_gain",
            })
        end

        if ctx.setting_blind then
            card.ability.extra.emult = 1

            return { message = localize("k_reset"), colour = G.C.RED }
        end

        if ctx.joker_main or ctx.forcetrigger then
            if G.GAME.current_round.hands_left == 0 or ctx.forcetrigger then
                return { emult = card.ability.extra.emult * card.ability.extra.multiplier }
            end

            return { emult = card.ability.extra.emult }
        end
    end,

    asc_credits = {
        idea = { "Rhelvetican" },
        code = { "Rhelvetican" },
    },
})
