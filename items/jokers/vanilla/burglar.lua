local lost = 0.0

SMODS.Joker({
    key = "burglar",
    rarity = "cry_exotic",
    atlas = "v_atlas_2",

    pos = { x = 0, y = 3 }, -- todo: replace with next index, mariofan do this for me im lazy af
    soul_pos = { x = 2, y = 3, extra = { x = 1, y = 3 } },

    cost = 50,
    order = 1,

    config = { extra = { emult_multiplier = 0.2, hand_multiplier = 3 } },

    blueprint_compat = true,
    demicoloncompat = true,

    loc_vars = function(_, _, card)
        return { vars = { card.ability.extra.emult_multiplier, card.ability.extra.hand_multiplier, 1 + card.ability.extra.emult_multiplier * lost } }
    end,

    calculate = function(_, card, ctx)
        if ctx.setting_blind or ctx.forcetrigger then
            G.E_MANAGER:add_event(Event({
                func = function()
                    if G.GAME.current_round.discards_left >= 0 then
                        lost = G.GAME.current_round.discards_left
                        ease_discard(-lost, nil, true)
                    end

                    ease_hands_played(lost * card.ability.extra.hand_multiplier)

                    SMODS.calculate_effect({
                        message = localize({ type = "variable", key = "a_hands", vars = { card.ability.extra.hand_multiplier * lost } }),
                    }, ctx.card)

                    return true
                end,
            }))

            return nil, true
        end

        if ctx.joker_main or ctx.forcetrigger then return { emult = 1 + card.ability.extra.emult_multiplier * lost } end

        if ctx.blind_defeated then lost = 0 end
    end,

    asc_credits = {
        idea = { "Rhelvetican" },
        art = {},
        code = { "Rhelvetican" },
    },
})
