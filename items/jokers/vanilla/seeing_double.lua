local math = require("math")
local flag = false

SMODS.Joker({
    key = "seeing_double",
    rarity = "cry_exotic",
    atlas = "v_atlas_2",

    pos = { x = 9, y = 2 }, -- todo: replace with next index, mariofan do this for me im lazy af
    soul_pos = { x = 11, y = 2, extra = { x = 10, y = 2 } },

    cost = 50,
    order = 1,

    config = { extra = { xmult = 1 } },

    blueprint_compat = false,
    demicoloncompat = true,

    loc_vars = function(_, _, card)
        return { vars = { card.ability.extra.xmult } }
    end,

    calculate = function(_, card, ctx)
        if ctx.main_eval and ctx.cardarea == G.play and #ctx.scoring_hand > 2 then
            local clubs, nclubs = 0, 0

            ---@cast ctx.scoring_hand Card[]
            for _, scored in ipairs(ctx.scoring_hand) do
                if scored:is_suit("Clubs") then
                    clubs = clubs + 1
                else
                    nclubs = nclubs + 1
                end
            end

            if clubs > 0 and nclubs > 0 and flag then
                flag = false
                return SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = "xmult",
                    scalar_value = "change",
                    scalar_table = { change = math.abs(clubs - nclubs) },
                })
            end
        end

        if ctx.joker_main then
            flag = true
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
