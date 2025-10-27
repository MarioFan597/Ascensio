SMODS.Atlas({
    key = "trading_card",
    path = "jokers/vanilla/trading_card.png",
    px = 71,
    py = 95,
})

SMODS.Joker({
    key = "trading",
    rarity = "cry_exotic",
    atlas = "trading_card",
    blueprint_compat = true,
    demicoloncompat = true,

    cost = 50,
    order = 92,

    pos = { x = 0, y = 0 },
    soul_pos = { x = 0, y = 1, extra = { x = 1, y = 0 } },

    config = {
        extra = {
            echips = 1,
            emult = 1,
            money = 1,
        },
    },

    loc_vars = function(_, _, card)
        return {
            vars = {
                card.ability.extra.echips,
                card.ability.extra.emult,
                card.ability.extra.money,
            },
        }
    end,

    calculate = function(_, card, context)
        if context.first_hand_drawn then
            local eval = function()
                return G.GAME.current_round.discards_used == 0 and not G.RESET_JIGGLES
            end
            ---@diagnostic disable-next-line: undefined-global
            juice_card_until(card, eval, true)
        end

        if (context.discard and not context.blueprint and G.GAME.current_round.discards_used <= 0 and #context.full_hand == 1) or context.forcetrigger then
            local removed

            if context.forcetrigger then
                removed = G.deck.cards[1]
            else
                removed = context.full_hand[1]
            end

            if removed:is_suit("Spades") or context.forcetrigger then
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = "echips",
                    scalar_value = "gain",
                    scalar_table = { gain = (removed:get_id() / 10) },
                })
            end

            if removed:is_suit("Hearts") or context.forcetrigger then
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = "emult",
                    scalar_value = "gain",
                    scalar_table = { gain = (removed:get_id() / 10) },
                })
            end

            if removed:is_suit("Clubs") or context.forcetrigger then
                for _, held in ipairs(G.hand.cards) do
                    SMODS.scale_card(held, {
                        ref_table = held.ability,
                        ref_value = "perma_x_chips",
                        scalar_value = "gain",
                        scalar_table = { gain = removed:get_id() },
                    })
                end
            end

            if removed:is_suit("Diamonds") or context.forcetrigger then
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = "money",
                    scalar_value = "gain",
                    scalar_table = { gain = removed:get_id() },
                })
            end

            if not context.forcetrigger then
                SMODS.destroy_cards(removed)
            end
        end

        if context.joker_main then
            return {
                echips = card.ability.extra.echips,
                emult = card.ability.extra.emult,
            }
        end
    end,

    calc_dollar_bonus = function(_, card)
        return card.ability.extra.money
    end,

    ---@type CardAnimation
    animation = {
        macro = {
            type = "skim",
            soul_pos = {
                include = { { x1 = 0, x2 = 6, y1 = 1, y2 = 7 } },
                exclude = { { x1 = 2, x2 = 6, y1 = 7, y2 = 7 } },
            },
        },
    },

    asc_credits = {
        idea = {
            "Rhelvetican",
        },
        art = {
            "Tatteredlurker",
        },
        code = {
            "Rhelvetican",
        },
    },
})
