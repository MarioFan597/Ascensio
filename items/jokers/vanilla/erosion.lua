---@return number
local function getCardsBelowFullDeck()
    return G.GAME.starting_deck_size - #(G.playing_cards or {})
end

SMODS.Joker({
    key = "erosion",
    rarity = "cry_exotic",
    atlas = "v_atlas_2",

    pos = { x = 0, y = 3 }, -- todo: replace with next index, mariofan do this for me im lazy af
    soul_pos = { x = 2, y = 3, extra = { x = 1, y = 3 } },

    cost = 50,
    order = 1,

    config = { extra = { xmult = 1, xmult_gain = 3 } },

    blueprint_compat = true,
    demicoloncompat = true,

    loc_vars = function(_, _, card) return { vars = { G.GAME.starting_deck_size, card.ability.extra.xmult_gain, card.ability.extra.xmult } } end,

    calculate = function(_, card, ctx)
        if ctx.end_of_round or ctx.forcetrigger then
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "xmult",
                scalar_value = "gain",
                scalar_table = { gain = math.max(0, getCardsBelowFullDeck() * card.ability.extra.xmult_gain) },
            })
        end

        if ctx.joker_main then return { xmult = card.ability.extra.xmult } end
    end,

    asc_credits = {
        idea = { "Rhelvetican" },
        art = {},
        code = { "Rhelvetican" },
    },
})
