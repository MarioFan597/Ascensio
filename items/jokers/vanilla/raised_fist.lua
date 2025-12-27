SMODS.Joker({
    key = "raised_fist",
    rarity = "cry_exotic",
    atlas = "v_atlas_2",

    blueprint_compat = true,
    demicoloncompat = true,

    pos = { x = 6, y = 0 },
    soul_pos = { x = 8, y = 0, extra = { x = 7, y = 0 } },

    cost = 50,
    order = 1,

    config = {
        extra = {
            scalar = 2,
            xmult = 1,
        },
    },

    loc_vars = function(_, _, card)
        return {
            vars = {
                card.ability.extra.scalar,
                card.ability.extra.xmult,
            },
        }
    end,

    calculate = function(_, card, context)
        if (context.individual and context.cardarea == G.hand and not context.end_of_round) or context.forcetrigger then
            local id, mult, this_card = 999, 999, nil
            for _, card in ipairs(G.hand.cards) do
                if id > card.base.id and not SMODS.has_no_rank(card) then
                    id = card.base.id
                    mult = card.base.nominal
                    this_card = card
                end
            end

            if (context.other_card == this_card) or context.forcetrigger then
                if context.other_card.debuff and not context.forcetrigger then
                    return {
                        message = localize("k_debuffed"),
                        colour = G.C.RED,
                    }
                else
                    SMODS.scale_card(card, {
                        ref_table = card.ability.extra,
                        ref_value = "xmult",
                        scalar_value = "gain",
                        scalar_table = { gain = mult * card.ability.extra.scalar },
                    })
                end
            end
        end

        if context.joker_main or context.forcetrigger then
            return { xmult = card.ability.extra.xmult }
        end
    end,

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
