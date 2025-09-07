SMODS.Joker({
    key = "ice_cream",
    rarity = "cry_exotic",
    atlas = "v_atlas_1",
    blueprint_compat = true,
    demicoloncompat = true,
    pos = { x = 6, y = 9 },
    soul_pos = { x = 8, y = 9, extra = { x = 7, y = 9 } },
    cost = 50,

    config = { extra = { chips = 1, gain = 0.005 }, immutable = { hands = 0 } },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.gain,
                card.ability.immutable.hands,
            },
        }
    end,

    add_to_deck = function(self, card, from_debuff)
        card.ability.immutable.hands = G.GAME.hands_played
    end,

    calculate = function(self, card, context)
        if context.joker_main and card.ability.extra.chips > 1 then
            return {
                Echip_mod = lenient_bignum(card.ability.extra.chips),
                message = localize({
                    type = "variable",
                    key = "a_powchips",
                    vars = { lenient_bignum(card.ability.extra.chips) },
                }),
            }
        end
        if context.after then
            card.ability.immutable.hands = G.GAME.hands_played + 1
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "chips",
                scalar_table = { hand_gain = (card.ability.extra.gain * card.ability.immutable.hands) },
                scalar_value = "hand_gain",
                no_message = true,
            })
            card_eval_status_text(card, "extra", nil, nil, nil, { message = localize("k_upgrade_ex"), colour = G.C.DARK_EDITION })
        end
    end,

    asc_credits = {
        idea = {
            "MarioFan597",
            "OmegaLife",
        },
        art = {
            "Tatteredlurker",
        },
        code = {
            "MarioFan597",
            "OmegaLife",
        },
    },
})
