--This was taken and modifed straight from entropy
local G_UIDEF_use_and_sell_buttons_ref = G.UIDEF.use_and_sell_buttons
function G.UIDEF.use_and_sell_buttons(card)
    local abc = G_UIDEF_use_and_sell_buttons_ref(card)
    if (card.area == G.jokers and G.jokers and card.config.center.key == "j_asc_marble_entr") and not card.debuff then --Gives buttons to entropic marble Joker
        sell = {
            n = G.UIT.C,
            config = { align = "cr" },
            nodes = { --Default Sell Button
                {
                    n = G.UIT.C,
                    config = {
                        ref_table = card,
                        align = "cr",
                        padding = 0.1,
                        r = 0.08,
                        minw = 1.25,
                        hover = true,
                        shadow = true,
                        colour = G.C.UI.BACKGROUND_INACTIVE,
                        one_press = true,
                        button = "sell_card",
                        func = "can_sell_card",
                        handy_insta_action = "sell",
                    },
                    nodes = {
                        { n = G.UIT.B, config = { w = 0.1, h = 0.6 } },
                        {
                            n = G.UIT.C,
                            config = { align = "tm" },
                            nodes = {
                                {
                                    n = G.UIT.R,
                                    config = { align = "cm", maxw = 1.25 },
                                    nodes = {
                                        {
                                            n = G.UIT.T,
                                            config = {
                                                text = localize("b_sell"),
                                                colour = G.C.UI.TEXT_LIGHT,
                                                scale = 0.4,
                                                shadow = true,
                                            },
                                        },
                                    },
                                },
                                {
                                    n = G.UIT.R,
                                    config = { align = "cm" },
                                    nodes = {
                                        {
                                            n = G.UIT.T,
                                            config = {
                                                text = localize("$"),
                                                colour = G.C.WHITE,
                                                scale = 0.4,
                                                shadow = true,
                                            },
                                        },
                                        {
                                            n = G.UIT.T,
                                            config = {
                                                ref_table = card,
                                                ref_value = "sell_cost_label",
                                                colour = G.C.WHITE,
                                                scale = 0.55,
                                                shadow = true,
                                            },
                                        },
                                    },
                                },
                            },
                        },
                    },
                },
            },
        }
        buyslot = {
            n = G.UIT.C,
            config = { align = "cr" },
            nodes = { --Button to Buy Stone Cards
                {
                    n = G.UIT.C,
                    config = {
                        ref_table = card,
                        align = "cr",
                        padding = 0.1,
                        r = 0.08,
                        minw = 1.25,
                        hover = true,
                        shadow = true,
                        colour = G.C.UI.BACKGROUND_INACTIVE,
                        button = "buy_stone",
                        func = "can_buy_stone",
                    },
                    nodes = {
                        { n = G.UIT.B, config = { w = 0.1, h = 0.6 } },
                        {
                            n = G.UIT.C,
                            config = { align = "tm" },
                            nodes = {
                                {
                                    n = G.UIT.R,
                                    config = { align = "cm", maxw = 1.25 },
                                    nodes = {
                                        {
                                            n = G.UIT.T,
                                            config = {
                                                text = localize("b_buy_stone"),
                                                colour = G.C.UI.TEXT_LIGHT,
                                                scale = 0.4,
                                                shadow = true,
                                            },
                                        },
                                    },
                                },
                                {
                                    n = G.UIT.R,
                                    config = { align = "cm" },
                                    nodes = {
                                        {
                                            n = G.UIT.T,
                                            config = {
                                                text = localize("$"),
                                                colour = G.C.WHITE,
                                                scale = 0.4,
                                                shadow = true,
                                            },
                                        },
                                        {
                                            n = G.UIT.T,
                                            config = {
                                                ref_table = card.ability,
                                                ref_value = "buycost",
                                                colour = G.C.WHITE,
                                                scale = 0.55,
                                                shadow = true,
                                            },
                                        },
                                    },
                                },
                            },
                        },
                    },
                },
            },
        }
        sellslot = {
            n = G.UIT.C,
            config = { align = "cr" },
            nodes = { --Button to Sell Stone Cards
                {
                    n = G.UIT.C,
                    config = {
                        ref_table = card,
                        align = "cr",
                        padding = 0.1,
                        r = 0.08,
                        minw = 1.25,
                        hover = true,
                        shadow = true,
                        colour = G.C.UI.BACKGROUND_INACTIVE,
                        button = "sell_stone",
                        func = "can_sell_stone",
                    },
                    nodes = {
                        { n = G.UIT.B, config = { w = 0.1, h = 0.6 } },
                        {
                            n = G.UIT.C,
                            config = { align = "tm" },
                            nodes = {
                                {
                                    n = G.UIT.R,
                                    config = { align = "cm", maxw = 1.25 },
                                    nodes = {
                                        {
                                            n = G.UIT.T,
                                            config = {
                                                text = localize("b_sell_stone"),
                                                colour = G.C.UI.TEXT_LIGHT,
                                                scale = 0.4,
                                                shadow = true,
                                            },
                                        },
                                    },
                                },
                                {
                                    n = G.UIT.R,
                                    config = { align = "cm" },
                                    nodes = {
                                        {
                                            n = G.UIT.T,
                                            config = {
                                                text = localize("$"),
                                                colour = G.C.WHITE,
                                                scale = 0.4,
                                                shadow = true,
                                            },
                                        },
                                        {
                                            n = G.UIT.T,
                                            config = {
                                                ref_table = card.ability,
                                                ref_value = "sellcost",
                                                colour = G.C.WHITE,
                                                scale = 0.55,
                                                shadow = true,
                                            },
                                        },
                                    },
                                },
                            },
                        },
                    },
                },
            },
        }
        return {
            n = G.UIT.ROOT,
            config = { padding = 0, colour = G.C.CLEAR },
            nodes = {
                {
                    n = G.UIT.C,
                    config = { padding = 0, align = "cl" },
                    nodes = {
                        { n = G.UIT.R, config = { align = "cl" }, nodes = {
                            sell,
                        } },
                        { n = G.UIT.R, config = { align = "cl" }, nodes = {
                            buyslot,
                        } },
                        {
                            n = G.UIT.R,
                            config = { align = "cl" },
                            nodes = {
                                sellslot,
                            },
                        },
                    },
                },
            },
        }
    end
    return abc
end

local is_buying_stone = false
local is_selling_stone = false

G.FUNCS.can_buy_stone = function(e)
    if to_big(G.GAME.dollars - G.GAME.bankrupt_at) >= to_big(e.config.ref_table.ability.buycost) and not is_buying_stone and not G.CONTROLLER.locked then
        e.config.colour = G.C.GREEN
        e.config.button = "buy_stone"
    else
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        e.config.button = nil
    end
end

G.FUNCS.buy_stone = function(e)
    is_buying_stone = true
    local ref = e.config.ref_table
    ease_dollars(-ref.ability.buycost)

    local stone = SMODS.create_card({
        set = "Base",
        enhancement = "m_stone",
        seal = "entr_crimson",
        area = G.discard,
    })

    stone:set_edition("e_cry_mosaic", nil, true)
    G.playing_card = (G.playing_card and G.playing_card + 1) or 1
    stone.playing_card = G.playing_card
    table.insert(G.playing_cards, stone)

    G.E_MANAGER:add_event(Event({
        func = function()
            stone:start_materialize({ G.C.SECONDARY_SET.Enhanced })
            G.play:emplace(stone)
            return true
        end,
    }))

    G.E_MANAGER:add_event(Event({
        func = function()
            G.deck.config.card_limit = G.deck.config.card_limit + 1
            return true
        end,
    }))

    draw_card(G.play, G.deck, 90, "up")
    SMODS.calculate_context({ playing_card_added = true, cards = { stone } })
    is_buying_stone = false
end

G.FUNCS.can_sell_stone = function(e)
    local has_stone = false
    if G and G.deck and G.deck.cards then
        for _, c in ipairs(G.deck.cards) do
            if SMODS.has_enhancement(c, "m_stone") and not SMODS.is_eternal(c) then
                has_stone = true
            end
        end
    end
    if has_stone and not G.CONTROLLER.locked then
        e.config.colour = G.C.GREEN
        e.config.button = "sell_stone"
    else
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        e.config.button = nil
    end
end

G.FUNCS.sell_stone = function(e)
    is_selling_stone = true
    G.E_MANAGER:add_event(Event({
        func = function()
            if G and G.deck and G.deck.cards then
                for _, c in ipairs(G.deck.cards) do
                    if SMODS.has_enhancement(c, "m_stone") then
                        SMODS.destroy_cards(c)
                        local c1 = e.config.ref_table
                        ease_dollars(e.config.ref_table.ability.sellcost)
                        is_selling_stone = false
                        return true
                    end
                end
            end
        end,
    }))
end

local calc = SMODS.calculate_individual_effect

SMODS.calculate_individual_effect = function(effect, scored_card, key, amount, from_edition)
    local ret = calc(effect, scored_card, key, amount, from_edition)

    if ret then
        return ret
    end

    if (key == "xdollars" or key == "Xdollars") and amount ~= 1 then
        if effect.card then
            juice_card(effect.card)
        end

        if type(amount) ~= "boolean" then
            ease_dollars_mult(amount)
        end
        return true
    end

    if (key == "csl") and amount ~= 0 then
        if effect.card then
            juice_card(effect.card)
        end

        ease_selection_limit(lenient_bignum(amount))
        return true
    end
end

for _, v in ipairs({ "xdollars", "Xdollars", "csl" }) do
    table.insert(SMODS.scoring_parameter_keys or SMODS.calculation_keys, v)
end

local er = end_round
function end_round()
    er()

    for _, area in ipairs({ G.jokers, G.hand, G.consumeables, G.discard, G.deck }) do
        for _, card in pairs(area.cards) do
            if card.ability then
                if card.ability.samsara then
                    if card.ability.debuff then
                        card:set_debuff(nil)
                        card.ability.samsara = true
                    else
                        if Ascensio.isAscendable(card) then
                            local ascref = Ascensio.ascendJoker(card)
                            ascref.ability.samsara = true
                        else
                            if Ascensio.Descensions[card] then
                                local desref = Ascensio.descendJoker(card)
                                desref.ability.samsara = true
                                desref:set_debuff(true)
                            end
                        end
                    end
                end
            end
        end
    end
end
