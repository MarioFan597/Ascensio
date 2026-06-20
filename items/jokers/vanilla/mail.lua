SMODS.Joker({
    key = "mail",
    rarity = "cry_exotic",
    atlas = "v_atlas_2",

    pos = { x = 0, y = 3 }, -- todo: replace with next index, mariofan do this for me im lazy af
    soul_pos = { x = 2, y = 3, extra = { x = 1, y = 3 } },

    cost = 50,
    order = 1,

    config = { extra = { multiplier = 5 } },

    blueprint_compat = true,
    demicoloncompat = false,

    loc_vars = function(_, _, card)
        return {
            vars = {
                card.ability.extra.multiplier,
            },
        }
    end,

    calculate = function(_, card, ctx)
        if ctx.discard and not ctx.other_card.debuff then
            local base = ctx.other_card:get_id()

            if base > 10 and base < 14 then
                base = 10
            else
                if base == 14 then
                    base = 11
                end
            end

            local money = base * card.ability.extra.multiplier
            G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + money

            return {
                dollars = money,
                func = function()
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.GAME.dollar_buffer = 0
                            return true
                        end,
                    }))
                end,
            }
        end
    end,
})
