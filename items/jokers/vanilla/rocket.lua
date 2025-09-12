SMODS.Joker({
    key = "rocket",
    rarity = "cry_exotic",
    atlas = "v_atlas_2",
    blueprint_compat = true,
    demicoloncompat = true,

    pos = { x = 3, y = 0 },
    soul_pos = { x = 5, y = 0, extra = { x = 4, y = 0 } },

    cost = 50,
    order = 1,

    config = {
        extra = {
            manipulate = 5,
            manipulate_multiplier = 1.1,
            money = 20,
        },
    },

    loc_vars = function(_, _, card)
        return {
            vars = {
                card.ability.extra.manipulate,
                card.ability.extra.money,
                card.ability.extra.manipulate_multiplier,
            },
        }
    end,

    calculate = function(_, card, context)
        if (context.end_of_round and not context.repetition and not context.individual and not context.blueprint) or context.forcetrigger then
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then
                    SMODS.scale_card(card, {
                        ref_table = card.ability.extra,
                        ref_value = "money",
                        scalar_value = "manipulate",
                    })
                else
                    if not Card.no(G.jokers.cards[i], "immutable", true) then
                        Cryptid.with_deck_effects(G.jokers.cards[i], function(cards)
                            Cryptid.manipulate(cards, { value = card.ability.extra.manipulate, type = "+" })
                        end)
                    end
                end
            end
        end

        if (context.beat_boss and not context.repetition and not context.individual and not context.blueprint) or context.forcetrigger then
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "manipulate",
                scalar_value = "manipulate_multiplier",
                operation = "x",
            })
        end
    end,

    calc_dollar_bonus = function(_, card)
        return card.ability.extra.money
    end,

    asc_credits = {
        idea = {
            "OmegaLife",
        },
        art = {
            "Lil Mr. Slipstream",
        },
        code = {
            "OmegaLife",
        },
    },
})
