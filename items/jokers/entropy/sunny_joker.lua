SMODS.Joker({
    key = "sunny_joker",
    config = { extra = { asc = 1, gain = 0.05 } },
    rarity = "cry_exotic",
    atlas = "e_atlas_1",
    blueprint_compat = true,
    demicoloncompat = true,
    pos = { x = 0, y = 0 },
    soul_pos = { x = 2, y = 0, extra = { x = 1, y = 0 } },
    cost = 50,
    order = 1,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                number_format(card.ability.extra.asc),
                number_format(card.ability.extra.gain),
            },
        }
    end,
    calculate = function(self, card, context)
        if (context.before and not context.blueprint) or context.forcetrigger then
            local asc = G.GAME.current_round.current_hand.cry_asc_num
            if asc ~= 0 then
                card.ability.extra.asc = card.ability.extra.asc + card.ability.extra.gain
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = "asc",
                    scalar_value = "gain",
                    no_message = true,
                })
                return {
                    extra = { focus = card, message = localize("k_upgrade_ex") },
                    card = card,
                    colour = G.C.GOLD,
                }
            end
        end
        if context.joker_main or context.forcetrigger then
            if card.ability.extra.asc > 1 then
                return {
                    exp_asc = lenient_bignum(card.ability.extra.asc),
                }
            end
        end
    end,
    ascxentr_credits = {
        idea = {
            "Glitchkat10",
        },
        art = {
            "Lil. Mr Slipstream",
        },
        code = {
            "MarioFan597",
        },
    },
})
