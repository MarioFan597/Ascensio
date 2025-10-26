SMODS.Joker({
    key = "seltzer",
    config = { extra = { retriggers = 1, played_hands = 10, goal_hands = 10, immutable = { max_rep = 40 } } },
    rarity = "cry_exotic",
    atlas = "v_atlas_1",
    blueprint_compat = true,
    demicoloncompat = false,
    pos = { x = 3, y = 0 },
    soul_pos = { x = 5, y = 0, extra = { x = 4, y = 0 } },
    cost = 50,
    order = 102,
    loc_vars = function(_, _, card)
        card.ability.extra.retriggers = math.min(card.ability.extra.retriggers, card.ability.extra.immutable.max_rep)

        return {
            vars = {
                card.ability.extra.retriggers,
                card.ability.extra.played_hands,
                card.ability.extra.goal_hands,
                card.ability.extra.immutable.max_rep,
            },
        }
    end,
    calculate = function(_, card, context)
        if context.cardarea == G.play and context.repetition and not context.repetition_only then
            return {
                message = localize("k_again_ex"),
                repetitions = to_number(math.min(card.ability.extra.immutable.max_rep, card.ability.extra.retriggers)),
                card = card,
            }
        end
        if context.after and context.cardarea == G.jokers and not context.blueprint then
            if lenient_bignum(card.ability.extra.played_hands) <= 1 then
                card.ability.extra.retriggers = lenient_bignum(card.ability.extra.retriggers) + 1
                card.ability.extra.played_hands = lenient_bignum(card.ability.extra.goal_hands)
                card_eval_status_text(card, "extra", nil, nil, nil, { message = localize("k_upgrade_ex"), colour = G.C.GOLD })
            else
                card.ability.extra.played_hands = lenient_bignum(card.ability.extra.played_hands) - 1
                return {
                    message = card.ability.extra.played_hands .. "",
                    colour = G.C.FILTER,
                }
            end
        end
    end,
    asc_credits = {
        idea = {
            "MarioFan597",
        },
        art = {
            "MarioFan597",
        },
        code = {
            "MarioFan597",
        },
    },
})
