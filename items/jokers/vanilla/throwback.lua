SMODS.Atlas({
    key = "throwback",
    path = "jokers/vanilla/throwback.png",
    px = 71,
    py = 95,
})

SMODS.Joker({
    key = "throwback",
    config = { extra = { mult = 1, rounds = 0, exp = 2 } },
    rarity = "cry_exotic",
    atlas = "throwback",
    blueprint_compat = true,
    demicoloncompat = true,
    pos = { x = 0, y = 0 },
    soul_pos = { x = 0, y = 4, extra = { x = 0, y = 2 } },
    cost = 50,
    order = 114,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                lenient_bignum(card.ability.extra.mult),
                lenient_bignum(card.ability.extra.rounds),
                lenient_bignum(card.ability.extra.exp),
            },
        }
    end,
    calculate = function(self, card, context) --Most of this is just modified from the original throwback
        card.ability.extra.rounds = G.GAME.skips
        card.ability.extra.mult = 1
        for i = 1, (card.ability.extra.rounds + 1) do
            card.ability.extra.mult = card.ability.extra.mult + i ^ card.ability.extra.exp
        end
        if context.joker_main or context.forcetrigger then
            return {
                message = localize({ type = "variable", key = "a_xmult", vars = { card.ability.extra.mult } }),
                Xmult_mod = lenient_bignum(card.ability.extra.mult),
                colour = G.C.RED,
            }
        end
        if context.skip_blind and not context.blueprint then
            return {
                message = localize({ type = "variable", key = "a_xmult", vars = { card.ability.extra.mult } }),
                colour = G.C.RED,
            }
        end
    end,
    animation = {
        macro = {
            type = "skim",
            pos = {
                include = { { x1 = 0, x2 = 9, y1 = 0, y2 = 1 } },
                exclude = { { x1 = 2, x2 = 9, y1 = 1, y2 = 1 } },
            },
            soul_pos_extra = {
                include = { { x1 = 0, x2 = 9, y1 = 2, y2 = 3 } },
                exclude = { { x1 = 2, x2 = 9, y1 = 3, y2 = 3 } },
            },
            soul_pos = {
                include = { { x1 = 0, x2 = 9, y1 = 4, y2 = 5 } },
                exclude = { { x1 = 2, x2 = 9, y1 = 5, y2 = 5 } },
            },
        },
    },
    asc_credits = {
        idea = {
            "TheOfficialfem",
            "Googol1e308plex",
        },
        art = {
            "Tatteredlurker",
        },
        code = {
            "MarioFan597",
        },
    },
})
