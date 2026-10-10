SMODS.Joker({
    key    = "business",
    rarity = "cry_exotic",
    atlas  = "v_atlas_2",

    -- todo: replace with next index, mariofan do this for me im lazy af
    pos      = { x = 0, y = 3 },
    soul_pos = { x = 2, y = 3, extra = { x = 1, y = 3 } },

    cost  = 50,
    order = 1,

    config = {
        extra = {
            money  = 15,
            xmult  = 20,
            echips = 1.5,
        },
    },

    blueprint_compat = true,
    demicoloncompat  = true,

    loc_vars = function(_, _, card)
        return { vars = { card.ability.extra.money, card.ability.extra.xmult, card.ability.extra.echips } }
    end,

    calculate = function(_, card, ctx)
        if context.individual and context.cardarea == G.play and context.other_card:is_face() then
            local selected_effect, _ = pseudorandom_element({ "money", "xmult", "echips" }, "asc_business" .. G.SEED)
            return { [selected_effect] = card.ability.extra[selected_effect] }
        end
    end,
})
