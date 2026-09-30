SMODS.Atlas({
    key = "seance",
    path = "jokers/vanilla/seance.png",
    px = 71,
    py = 95,
})

local function __get_seed()
    return G.TIMERS.REAL .. "_" .. G.SEED
end

SMODS.Joker({
    key    = "seance",
    rarity = "cry_exotic",
    atlas  = "seance",

    blueprint_compat = true,
    demicoloncompat  = true,

    pos      = { x = 0, y = 0 },
    soul_pos = { x = 0, y = 6, extra = { x = 0, y = 1 } },

    ---@type CardAnimation
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
            hand_pool = {},
            card_pool = {},

            odds = 2048,
            odds_pity = 2,

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
                card.ability.extra.odds_pity,
            },
        }
    end,

    set_ability = function(_, card, _, _)
        for _, v in ipairs(G.P_CENTER_POOLS.Consumeables) do
            if v.hidden and type(v.key) == "string" then table.insert(card.ability.extra.card_pool, v.key) end
        end
    end,

    add_to_deck = function(_, card, _)
        -- Taken from vanilla remade to do list
        local poker_hands = {}

        for handname, _ in pairs(G.GAME.hands) do
            if SMODS.is_poker_hand_visible(handname) and handname ~= card.ability.extra.hand_type then poker_hands[#poker_hands + 1] = handname end
        end

        card.ability.extra.hand_type = pseudorandom_element(poker_hands, "the_future_is_now" .. G.SEED)
    end,

    calculate = function(_, card, context)
        if context.forcetrigger then
            for _, card_key in ipairs(card.ability.extra.card_pool) do
                Ascensio.addEvent({
                    func = function()
                        delay(0.4)
                        SMODS.add_card({ key = card_key, set = "Spectral", edition = "e_negative" })
                        return true
                    end,
                })
            end
        end

        if (context.before and context.main_eval and context.scoring_name == card.ability.extra.hand_type) then
            if (card.ability.extra.odds <= 1 or SMODS.pseudorandom_probability(card, __get_seed(), 1, card.ability.extra.odds)) then
                -- Winning path
                for _ = 1, card.ability.extra.amount do
                    local _, prize = pseudorandom_element(card.ability.extra.card_pool, __get_seed())

                    Ascensio.addEvent({
                        func = function()
                            delay(0.4)
                            SMODS.add_card({ key = prize, set = "Spectral", edition = "e_negative" })
                            return true
                        end,
                    })
                end

                card.ability.extra.odds = card.ability.extra.immutable.std_odds
                return { message = localize("k_reset"), colour = G.C.DARK_EDITION }
            else
                -- Pity path
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = "odds",
                    scalar_value = "odds_pity",

                    operation = function(tbl, vl, init, change)
                        tbl[vl] = init / change
                    end,
                })
            end
        end

        if context.end_of_round and context.main_eval and not context.game_over and not context.blueprint then
            local hands = {}

            for k, _ in pairs(G.GAME.hands) do
                if SMODS.is_poker_hand_visible(k) and k ~= card.ability.extra.hand_type then table.insert(hands, k) end
            end

            card.ability.extra.hand_type = pseudorandom_element(hands, G.TIMERS.REAL .. "<>" .. G.SEED)
            return { message = localize("k_reset"), colour = G.C.DARK_EDITION }
        end
    end,

    asc_credits = {
        idea = {
            "Rhelvetican",
            "MarioFan597",
        },
        art = {
            "Tatteredlurker",
        },
        code = {
            "Rhelvetican",
        },
    },
})
