SMODS.Joker({
    key = "ancient",
    rarity = "cry_exotic",
    atlas = "v_atlas_1",
    blueprint_compat = true,
    demicoloncompat = true,

    cost = 50,
    order = 23,

    pos = { x = 3, y = 15 },
    soul_pos = { x = 5, y = 15, extra = { x = 4, y = 15 } },

    config = {
        extra = {
            emult = 1,
            emult_gain = 0.005,
        },

        immutable = {
            suits = { "Spades", "Hearts", "Clubs", "Diamonds" },
            suit = "Spades",
        },
    },

    loc_vars = function(_, _, card)
        return {
            vars = {
                localize(card.ability.immutable.suit, "suits_singular"),
                card.ability.extra.emult,
                card.ability.extra.emult_gain,

                colours = {
                    G.C.SUITS[card.ability.immutable.suit],
                },
            },
        }
    end,

    calculate = function(_, card, context)
        if (context.individual and context.cardarea == G.play) or context.forcetrigger then
            if context.other_card:is_suit(card.ability.immutable.suit) or context.forcetrigger then
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = "emult",
                    scalar_value = "emult_gain",
                })

                return {
                    emult = card.ability.extra.emult,
                }
            end
        end

        if context.end_of_round and context.main_eval then
            card.ability.immutable.suit = pseudorandom_element(card.ability.immutable.suits, "vremade_ancient" .. G.GAME.round_resets.ante, {})
            return {
                message = localize("k_reset_ex"),
                colour = G.C.SUITS[card.ability.immutable.suit],
            }
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
