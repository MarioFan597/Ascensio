SMODS.Joker({
    key = "rocket",

    rarity           = "cry_exotic",
    atlas            = "v_atlas_2",
    blueprint_compat = true,
    demicoloncompat  = true,

    pos      = { x = 3, y = 0 },
    soul_pos = { x = 5, y = 0, extra = { x = 4, y = 0 } },

    cost  = 50,
    order = 1,

    config = {
        extra = {
            immutable = { manipulate = 1 },
            money     = 10,
        },
    },

    loc_vars = function(_, _, card)
        return {
            vars = {
                card.ability.extra.immutable.manipulate,
                card.ability.extra.immutable.money,
            },
        }
    end,

    calculate = function(_, card, context)
        if (context.end_of_round and not context.repetition and not context.individual and not context.blueprint) or context.forcetrigger then
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then
                    SMODS.scale_card(card, {
                        ref_table = card.ability.extra.immutable,
                        ref_value = "money",
                        scalar_value = "manipulate",
                    })
                else
                    if not Card.no(G.jokers.cards[i], "immutable", true) then
                        Cryptid.with_deck_effects(G.jokers.cards[i], function(cards)
                            Cryptid.manipulate(cards, {
                                value = card.ability.extra.immutable.manipulate,
                                type = "+",
                            })
                        end)
                    end
                end
            end
        end
    end,

    calc_dollar_bonus = function(_, card) return card.ability.extra.money end,

    asc_credits = {
        idea = {
            "Rhelvetican",
        },
        art = {
            "Lil Mr. Slipstream",
        },
        code = {
            "Rhelvetican",
        },
    },
})
