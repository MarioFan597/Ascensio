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

---@param amount number|table?
local function ease_dollars_mult(amount)
    local one = to_big(1)
    amount = amount or 1

    if amount > one then
        local ui = G.HUD:get_UIE_by_ID("dollar_text_UI")
        local text = "X" .. localize("$")
        local col = G.C.MONEY

        ---@diagnostic disable-next-line: undefined-global
        inc_career_stat("c_dollars_earned", (amount - one) * G.GAME.dollars)

        G.GAME.dollars = G.GAME.dollars * amount
        ---@diagnostic disable-next-line: undefined-global
        check_and_set_high_score("most_money", G.GAME.dollars)
        check_for_unlock({ type = "money" })
        ui.config.object:update()
        G.HUD:recalculate()

        ---@diagnostic disable-next-line: undefined-global
        attention_text({
            text = text .. amount,
            scale = 0.8,
            hold = 0.7,
            cover = ui.parent,
            cover_colour = col,
            align = "cm",
        })

        play_sound("coin1")
    end
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
            xdollars = 0.1,
            xdollars_gain = 0.01,
        },
    },

    loc_vars = function(_, _, card)
        local nines = count_nines()

        return {
            vars = {
                card.ability.extra.xdollars,
                1 + card.ability.extra.xdollars * nines,
                card.ability.extra.xdollars_gain,
            },
        }
    end,

    calculate = function(_, card, ctx)
        if (ctx.end_of_round and ctx.main_eval) or ctx.forcetrigger then
            ease_dollars_mult(1 + card.ability.extra.xdollars * count_nines())
        end

        if (ctx.individual and ctx.cardarea == G.play) or ctx.forcetrigger then
            if ctx.other_card:get_id() == 9 then
                return SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = "xdollars",
                    scalar_value = "xdollars_gain",
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
