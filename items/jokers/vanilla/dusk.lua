SMODS.Joker({
    key = "dusk",
    rarity = "cry_exotic",
    atlas = "v_atlas_2",

    pos = { x = 0, y = 3 }, -- todo: replace with next index, mariofan do this for me im lazy af
    soul_pos = { x = 2, y = 3, extra = { x = 1, y = 3 } },

    cost = 50,
    order = 1,

    config = { extra = { retrig_base = 2, hands = 0, joker_retrigger = 1 } },

    blueprint_compat = true,
    demicoloncompat = true,

    loc_vars = function(_, _, card)
        return {
            vars = {
                card.ability.extra.hands,
                card.ability.extra.retrig_base,
                (G.GAME and G.GAME.current_round) and math.pow(card.ability.extra.retrig_base, G.GAME.current_round.hands_played) or 0,
            },
        }
    end,

    calculate = function(_, card, ctx)
        if ctx.blind_defeated then
            card.ability.extra.hands = 0

            return SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "hands",
                scalar_value = "gain",
                scalar_table = { gain = G.GAME.current_round.hands_left },
            })
        end

        if ctx.blind or ctx.forcetrigger then
            return ease_hands_played(card.ability.extra.hands)
        end

        if ctx.repetition and ctx.cardarea == G.play then
            return {
                repetitions = math.pow(card.ability.extra.retrig_base, G.GAME.current_round.hands_played),
            }
        end
    end,
})
