SMODS.Joker({
    key = "burnt",
    rarity = "cry_exotic",
    atlas = "v_atlas_2",

    pos = { x = 0, y = 3 }, -- todo: replace with next index, mariofan do this for me im lazy af
    soul_pos = { x = 2, y = 3, extra = { x = 1, y = 3 } },

    cost = 50,
    order = 1,

    blueprint_compat = true,
    demicoloncompat = true,

    calculate = function(_, card, ctx)
        if (ctx.pre_discard and not ctx.hook) or ctx.forcetrigger then
            local text, _ = G.FUNCS.get_poker_hand_info(G.hand.highlighted)

            return {
                level_up = G.GAME.current_round.discards_left,
                level_up_hand = text,
            }
        end

        if ctx.blind then
            local discard = 1e308

            for _, hand_info in pairs(G.GAME.hands) do
                discard = min(hand_info.level, discard)
            end

            ease_discard(discard)
        end
    end,
})
