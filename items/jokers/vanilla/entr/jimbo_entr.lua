SMODS.Joker({
    key = "jimbo_entr",
    rarity = "entr_entropic",
    atlas = "v_entr_atlas_1",
    blueprint_compat = true,
    demicoloncompat = true,
    pos = { x = 3, y = 0 },
    soul_pos = { x = 5, y = 0, extra = { x = 4, y = 0 } },
    cost = 150,

    config = {
        extra = {
            mult = 4,
        },
    },

    loc_vars = function(_, _, card)
        return {
            vars = { card.ability.extra.mult },
        }
    end,

    calculate = function(_, card, context)
        if context.joker_main then
            return { mult = card.ability.extra.mult }
        end
    end,

    add_to_deck = function(_, _)
        SMODS.set_scoring_calculation("exponent")
    end,

    remove_from_deck = function(_, _, _)
        SMODS.set_scoring_calculation("multiply")
    end,

    ascxentr_credits = {
        idea = {
            "OmegaLife",
        },
        art = {
            "Lil Mr. Slipstream",
        },
        code = {
            "OmegaLife",
        },
    },
})
