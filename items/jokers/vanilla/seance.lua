SMODS.Atlas({
    key = "seance",
    path = "jokers/vanilla/seance.png",
    px = 71,
    py = 95,
})

SMODS.Joker({
    key = "seance",
    rarity = "cry_exotic",
    atlas = "seance",
    blueprint_compat = true,
    demicoloncompat = true,

    pos = { x = 0, y = 0 },
    soul_pos = { x = 0, y = 6, extra = { x = 0, y = 1 } },

    animation = {
        macro = {
            type = "skim",
            soul_pos_extra = {
                include = { { x1 = 0, y1 = 1, x2 = 6, y2 = 5 } },
                exclude = { { x1 = 3, y1 = 5, x2 = 6, y2 = 5 } },
            },
        },
    },

    cost = 50,
    order = 23,

    config = {
        extra = {
            amount = 1,
            hand_type = "High Card",
            pool = {},
            odds = 2048,

            immutable = {
                std_odds = 2048,
            },
        },
    },

    loc_vars = function(_, info_queue, card)
        info_queue[#info_queue + 1] = { key = "asc_fixed", set = "Other" }
        return {
            vars = {
                card.ability.extra.amount,
                card.ability.extra.hand_type,
                card.ability.extra.odds,
            },
        }
    end,

    add_to_deck = function(_, card, _)
        for _, v in pairs(G.P_CENTER_POOLS.Consumeables) do
            if v.hidden and type(v.key) == "string" then
                table.insert(card.ability.extra.pool, v.key)
            end
        end
    end,

    calculate = function(_, card, context)
        if (context.before and context.main_eval and context.scoring_name == card.ability.extra.hand_type) or context.forcetrigger then --SMODS probability doesn't seem to actually prevent odds yet. As a result, I am using another method to fix until it fixes. Ha ha
            if --SMODS.pseudorandom_probability(card, "future knowledge", 1, card.ability.extra.odds, "Exotic Seance", true) then
                math.random(1, card.ability.extra.odds) == 1
            then
                card.ability.extra.odds = card.ability.extra.immutable.std_odds
                for _ = 1, card.ability.extra.amount do
                    local speccard = pseudorandom_element(card.ability.extra.pool, "j_asc_seance" .. G.SEED)

                    G.E_MANAGER:add_event(Event({
                        func = function()
                            delay(0.4)
                            SMODS.add_card({ key = speccard, edition = "e_negative" })
                            return true
                        end,
                    }))
                end

                return {
                    message = localize("k_plus_spectral"),
                    colour = G.C.SECONDARY_SET.Spectral,
                }
            else
                card.ability.extra.odds = card.ability.extra.odds / 2
                return {
                    message = localize("asc_seance_msg"),
                    colour = G.C.DARK_EDITION,
                }
            end
        end

        if context.end_of_round and context.main_eval and not context.game_over and not context.blueprint then
            local hands = {}

            for k, _ in pairs(G.GAME.hands) do
                if SMODS.is_poker_hand_visible(k) and k ~= card.ability.extra.hand_type then
                    table.insert(hands, k)
                end
            end

            card.ability.extra.hand_type = pseudorandom_element(hands, "seed_seance" .. G.SEED)
            return {
                message = localize("k_reset"),
                colour = G.C.DARK_EDITION,
            }
        end
    end,

    set_ability = function(_, card, _, _) --Taken from vanilla remade to do list
        local poker_hands = {}
        for handname, _ in pairs(G.GAME.hands) do
            if SMODS.is_poker_hand_visible(handname) and handname ~= card.ability.extra.hand_type then
                poker_hands[#poker_hands + 1] = handname
            end
        end
        card.ability.extra.hand_type = pseudorandom_element(poker_hands, "the_future_is_now" .. G.SEED)
    end,

    asc_credits = {
        idea = {
            "OmegaLife",
            "MarioFan597",
        },
        art = {
            "Tatteredlurker",
        },
        code = {
            "OmegaLife",
        },
    },
})
