SMODS.Atlas({
    key = "sunny_joker_entr",
    path = "jokers/entropy_entropics/sunny_joker_entr.png",
    px = 71,
    py = 95,
})

SMODS.Joker({
    key = "sunny_joker_entr",
    config = { extra = { asc = 4, immutable = { hands = 4, level = -1, sign = "+" } } },
    rarity = "entr_entropic",
    atlas = "sunny_joker_entr",
    blueprint_compat = true,
    demicoloncompat = true,
    pos = { x = 0, y = 0 },
    soul_pos = { x = 2, y = 2, extra = { x = 0, y = 2 } },
    cost = 150,
    order = 1,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                number_format(card.ability.extra.asc),
                number_format(card.ability.extra.immutable.hands),
                card.ability.extra.immutable.sign,
            },
        }
    end, --This was in part inspired by astronomica's Asgard
    calculate = function(self, card, context)
        if (context.before and not context.blueprint) or context.forcetrigger then
            local asc = G.GAME.current_round.current_hand.cry_asc_num
            if asc ~= 0 then
                card.ability.extra.immutable.hands = card.ability.extra.immutable.hands - 1
                if card.ability.extra.immutable.hands <= 0 then
                    card.ability.extra.immutable.hands = 4
                    card.ability.extra.immutable.level = card.ability.extra.immutable.level + 1
                    return {
                        extra = { focus = card, message = localize("k_upgrade_ex") },
                        card = card,
                        colour = G.C.GOLD,
                    }
                end
            end
        end
        if context.joker_main or context.forcetrigger then
            if card.ability.extra.asc > 1 then
                if card.ability.extra.immutable.level <= -1 then
                    card.ability.extra.immutable.sign = "+"
                    return {
                        plus_asc = lenient_bignum(card.ability.extra.asc),
                    }
                elseif card.ability.extra.immutable.level == 0 then
                    card.ability.extra.immutable.sign = "X"
                    return {
                        asc = lenient_bignum(card.ability.extra.asc),
                    }
                elseif card.ability.extra.immutable.level == 1 then
                    card.ability.extra.immutable.sign = "^"
                    return {
                        exp_asc = lenient_bignum(card.ability.extra.asc),
                    }
                elseif card.ability.extra.immutable.level >= 2 then
                    card.ability.extra.immutable.sign = ""
                    for i = 1, card.ability.extra.immutable.level, 1 do
                        card.ability.extra.immutable.sign = card.ability.extra.immutable.sign .. "^"
                    end
                    return {
                        hyperasc_mod = {
                            card.ability.extra.immutable.level,
                            card.ability.extra.asc,
                        },
                    }
                end
            end
        end
    end,
    ---@type CardAnimation
    animation = {
        macro = {
            type = "skim",
            pos = {
                include = { { x1 = 0, x2 = 4, y1 = 0, y2 = 1 } },
                timing = { 1 },
                is_periodic = true,
            },
            soul_pos_extra = {
                include = { { x1 = 0, x2 = 1, y1 = 2, y2 = 2 } },
                timing = { 5 },
                is_periodic = true,
            },
        },
    },
    ascxentr_credits = {
        idea = {
            "Grahkon",
        },
        art = {
            "Lil. Mr Slipstream",
        },
        code = {
            "MarioFan597",
            "Riley",
        },
    },
})
