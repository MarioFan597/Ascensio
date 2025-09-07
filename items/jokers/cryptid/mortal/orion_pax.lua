SMODS.Joker({
    key = "orion_pax",
    config = { extra = { mult = 3 } },
    rarity = 3,
    atlas = "c_atlas_mortal",
    blueprint_compat = true,
    demicoloncompat = true,
    pos = { x = 2, y = 0 },
    cost = 7,
    order = 508,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card and lenient_bignum(card.ability.extra.mult),
            },
        }
    end,
    calculate = function(self, card, context) --Taken and modifed from triplet rhythmn and primus
        if context.joker_main and context.scoring_hand then
            local prime = 0
            for i = 1, #context.scoring_hand do
                if
                    not (
                        context.scoring_hand[i]:get_id() == 4
                        or context.scoring_hand[i]:get_id() == 6
                        or context.scoring_hand[i]:get_id() == 8
                        or context.scoring_hand[i]:get_id() == 9
                        or context.scoring_hand[i]:get_id() == 10
                        or context.scoring_hand[i]:get_id() == 11
                        or context.scoring_hand[i]:get_id() == 12
                        or context.scoring_hand[i]:get_id() == 13
                    )
                then
                    prime = prime + 1
                end
            end
            if prime == #context.scoring_hand then
                return {
                    message = localize({
                        type = "variable",
                        key = "a_xmult",
                        vars = { number_format(card.ability.extra.mult) },
                    }),
                    Xmult_mod = lenient_bignum(card.ability.extra.mult),
                }
            end
        end
        if context.forcetrigger then
            return {
                message = localize({
                    type = "variable",
                    key = "a_xmult",
                    vars = { number_format(card.ability.extra.mult) },
                }),
                Xmult_mod = lenient_bignum(card.ability.extra.mult),
            }
        end
    end,

    asc_credits = {
        idea = {
            "MarioFan597",
            "Glitchkat10",
        },
        art = {
            "Jevon",
        },
        code = {
            "MarioFan597",
            "Math",
        },
    },
})
