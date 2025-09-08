SMODS.Joker({
    key = "half",
    rarity = "cry_exotic",
    atlas = "v_atlas_1",
    blueprint_compat = true,
    demicoloncompat = true,
    pos = { x = 3, y = 14 },
    soul_pos = { x = 5, y = 14, extra = { x = 4, y = 14 } },
    cost = 50,
    order = 16,

    config = { extra = { mult = 1.2, max_play = 2 } },

    loc_vars = function(_, _, card)
        return {
            vars = {
                card.ability.extra.mult,
                card.ability.extra.max_play,
            },
        }
    end,

    calculate = function(_, card, context) --I LOVE LUASLOP!!!! LUASLOP MY BELOVED!!!
        if context.joker_main or context.forcetrigger then
            if #context.full_hand <= card.ability.extra.max_play or context.forcetrigger then
                return {
                    message = "^^" .. lenient_bignum(card.ability.extra.mult) .. " " .. localize("asc_mult"),
                    EEmult_mod = lenient_bignum(card.ability.extra.mult),
                    colour = G.C.DARK_EDITION,
                    card = card,
                }
            end
        end
    end,
    asc_credits = {
        idea = {
            "hssr",
        },
        art = {
            "Lil Mr. Slipstream",
        },
        code = {
            "hasu",
        },
    },
})
