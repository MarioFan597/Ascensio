SMODS.Joker({
    key = "idols",
    rarity = "cry_exotic",
    atlas = "v_atlas_1",
    blueprint_compat = true,
    demicoloncompat = true,

    cost = 50,
    order = 23,

    pos = { x = 9, y = 15 },
    soul_pos = { x = 11, y = 15, extra = { x = 10, y = 15 } },

    config = {
        extra = {
            value = 1,
            value_gain = 0.05,
        },

        immutable = {
            rank = "Ace",
            suit = "Spades",
            id = 14,

            effects = {
                "emult",
                "echips",
                "xdollars",
                "gain",
            },
        },
    },

    add_to_deck = function(_, card)
        local valids = {}

        if G and G.playing_cards then
            for _, playing_card in ipairs(G.playing_cards) do
                if not (SMODS.has_no_suit(playing_card) or SMODS.has_no_rank(playing_card)) then
                    valids[#valids + 1] = playing_card
                end
            end
        end

        local idol_card = pseudorandom_element(valids, "what the statue hides" .. G.GAME.round_resets.ante, {})

        if idol_card ~= nil then
            card.ability.immutable.rank = idol_card.base.value
            card.ability.immutable.suit = idol_card.base.suit
            card.ability.immutable.id = idol_card.base.id
        end
    end,

    loc_vars = function(_, _, card)
        local other_card = card.ability.immutable

        return {
            vars = {
                localize(other_card.rank, "ranks"),
                localize(other_card.suit, "suits_plural"),
                card.ability.extra.value,
                card.ability.extra.value_gain,

                colours = {
                    G.C.SUITS[other_card.suit],
                },
            },
        }
    end,

    calculate = function(_, card, context)
        if (context.individual and context.cardarea == G.play) and ((context.other_card:get_id() == card.ability.immutable.id and context.other_card:is_suit(card.ability.immutable.suit)) or context.forcetrigger) then
            local effect = pseudorandom_element(card.ability.immutable.effects, "what the statue hides" .. G.GAME.round_resets.ante)
            local result = {}

            if (effect == "emult") or context.forcetrigger then
                result[effect] = card.ability.extra.value
            end

            if (effect == "echips") or context.forcetrigger then
                result[effect] = card.ability.extra.value
            end

            if (effect == "xdollars") or context.forcetrigger then
                ease_dollars_mult(card.ability.extra.value)
            end

            if (effect == "gain") or context.forcetrigger then
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = "value",
                    scalar_value = "value_gain",
                })
            end

            return result
        end

        if context.end_of_round and context.main_eval then
            local valids = {}

            if G and G.playing_cards then
                for _, playing_card in ipairs(G.playing_cards) do
                    if not (SMODS.has_no_suit(playing_card) or SMODS.has_no_rank(playing_card)) then
                        valids[#valids + 1] = playing_card
                    end
                end
            end

            local idol_card = pseudorandom_element(valids, "what the statue hides" .. G.GAME.round_resets.ante, {})

            if idol_card ~= nil then
                card.ability.immutable.rank = idol_card.base.value
                card.ability.immutable.suit = idol_card.base.suit
                card.ability.immutable.id = idol_card.base.id
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
