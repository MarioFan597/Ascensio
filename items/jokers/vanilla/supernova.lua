SMODS.Joker({
    key = "supernova",

    rarity = "cry_exotic",
    atlas = "v_atlas_1",
    blueprint_compat = true,
    demicoloncompat = true,
    pos = { x = 0, y = 13 },
    soul_pos = { x = 2, y = 13, extra = { x = 1, y = 13 } },
    cost = 50,
    order = 255,

    config = {
        extra = {
            xmult = 0,
        },
    },

    loc_vars = function(_, _, card)
        return {
            vars = {
                card.ability.extra.xmult,
            },
        }
    end,

    calculate = function(_, card, context)
        if context.before and context.main_eval and not context.blueprint then
            card.ability.extra.xmult = Number.add(card.ability.extra.xmult, G.GAME.hands[context.scoring_name].played)
            card_eval_status_text(card, "extra", nil, nil, nil, {
                message = localize("k_upgrade_ex"),
                colour = G.C.DARK_EDITION,
            })
        end

        if context.joker_main or context.forcetrigger then
            return {
                xmult = card.ability.extra.xmult,
            }
        end
    end,

    asc_credits = {
        idea = {
            "OmegaLife",
        },
        art = {
            "Tatteredlurker",
        },
        code = {
            "OmegaLife",
        },
    },
})
