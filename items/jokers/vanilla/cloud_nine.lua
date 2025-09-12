---@return number
local function count_nines()
    local nines = 0
    if G.playing_cards then
        for _, card in ipairs(G.playing_cards) do
            if card:get_id() == 9 then
                nines = nines + 1
            end
        end
    end

    return nines
end

SMODS.Joker({
    key = "cloud_nine",
    rarity = "cry_exotic",
    atlas = "v_atlas_1",
    blueprint_compat = true,
    demicoloncompat = true,

    cost = 50,
    order = 23,

    pos = { x = 9, y = 14 },
    soul_pos = { x = 11, y = 14, extra = { x = 10, y = 14 } },

    config = {
        extra = {
            xdollars = 1,
            xdollars_gain_gain = 0.01,
            xdollars_gain = 0.1,
        },
    },

    loc_vars = function(_, _, card)
        local nines = count_nines()

        return {
            vars = {
                card.ability.extra.xdollars_gain,
                card.ability.extra.xdollars + (card.ability.extra.xdollars_gain * nines),
                card.ability.extra.xdollars_gain_gain,
            },
        }
    end,

    calculate = function(_, card, ctx)
        if (ctx.end_of_round and ctx.main_eval) or ctx.forcetrigger then
            local nines = count_nines()
            ease_dollars_mult(card.ability.extra.xdollars + card.ability.extra.xdollars_gain * nines)
            return { message = "X" .. lenient_bignum(card.ability.extra.xdollars + card.ability.extra.xdollars_gain * nines), colour = G.C.MONEY }
        end

        if (ctx.individual and ctx.cardarea == G.play) or ctx.forcetrigger then
            if ctx.other_card:get_id() == 9 then
                return SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = "xdollars_gain",
                    scalar_value = "xdollars_gain_gain",
                })
            end
        end
    end,

    asc_credits = {
        idea = {
            "OmegaLife",
        },
        art = {
            "Tatteredlurker",
        },
        coding = {
            "OmegaLife",
        },
    },
})
