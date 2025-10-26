SMODS.Atlas({
    key = "blackboard",
    path = "jokers/vanilla/blackboard.png",
    px = 71,
    py = 95,
})

SMODS.Joker({
    key = "blackboard",
    config = { extra = { mult = 1, black_gain = 2, norm_gain = 1 } },
    rarity = "cry_exotic",
    atlas = "blackboard",
    blueprint_compat = true,
    demicoloncompat = true,
    pos = { x = 0, y = 0 },
    soul_pos = { x = 0, y = 3, extra = { x = 0, y = 2 } },
    cost = 50,
    order = 1,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                lenient_bignum(card.ability.extra.mult),
                lenient_bignum(card.ability.extra.black_gain),
                lenient_bignum(card.ability.extra.norm_gain),
            },
        }
    end,
    calculate = function(self, card, context) --Kinda directly taken and modified from blackboard.
        local black_suits = 0
        local all_cards = 0
        if context.before or context.forcetrigger then
            for k, v in ipairs(G.hand.cards) do
                all_cards = all_cards + 1
                if v:is_suit("Clubs", nil, true) or v:is_suit("Spades", nil, true) then
                    black_suits = black_suits + 1
                end
            end
            if black_suits == all_cards and card.ability.extra.mult > 1 then
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = "mult",
                    scalar_table = { all_black = (black_suits * card.ability.extra.black_gain) },
                    scalar_value = "all_black",
                    no_message = true,
                })
                return {
                    extra = { message = localize("k_upgrade_ex"), colour = G.C.MULT },
                    colour = G.C.MULT,
                }
            elseif black_suits > 0 then
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = "mult",
                    scalar_table = { non_all_black = (black_suits * card.ability.extra.norm_gain) },
                    scalar_value = "non_all_black",
                    no_message = true,
                })
                return {
                    extra = { message = localize("k_upgrade_ex"), colour = G.C.MULT },
                    colour = G.C.MULT,
                }
            end
        end
        if context.joker_main or context.forcetrigger then
            card.ability.extra.mult = card.ability.extra.mult + (black_suits * card.ability.extra.norm_gain)
            return {
                message = localize({ type = "variable", key = "a_xmult", vars = { card.ability.extra.mult } }),
                Xmult_mod = card.ability.extra.mult,
            }
        end
    end,

    ---@type CardAnimation
    animation = {
        macro = {
            type = "skim",
            pos = {
                include = { { x1 = 0, x2 = 9, y1 = 0, y2 = 1 } },
                exclude = { { x1 = 5, x2 = 9, y1 = 1, y2 = 1 } },
            },
        },
    },

    asc_credits = {
        idea = {
            "CycloneShocke",
            "TheOfficialfem",
        },
        art = {
            "Tatteredlurker",
        },
        code = {
            "MarioFan597",
        },
    },
})
