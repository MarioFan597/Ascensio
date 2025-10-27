SMODS.Joker({
    key = "hiker",
    rarity = "cry_exotic",
    atlas = "v_atlas_1",
    blueprint_compat = true,
    demicoloncompat = true,

    cost = 50,
    order = 23,

    pos = { x = 6, y = 15 },
    soul_pos = { x = 8, y = 15, extra = { x = 7, y = 15 } },

    calculate = function(_, _, context)
        if context.before and context.main_eval then
            local full_rank = 0
            for _, card in ipairs(context.scoring_hand) do
                full_rank = full_rank + card:get_id()
            end

            for _, card in ipairs(context.scoring_hand) do
                card.ability.perma_x_chips = (card.ability.perma_x_chips or 0) + full_rank
            end
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
