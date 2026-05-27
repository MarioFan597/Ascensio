SMODS.Joker({
    key = "eight_ball",
    rarity = "cry_exotic",
    atlas = "v_atlas_2",

    pos = { x = 0, y = 3 }, -- todo: replace with next index, mariofan do this for me im lazy af
    soul_pos = { x = 2, y = 3, extra = { x = 1, y = 3 } },

    cost = 50,
    order = 1,

    config = { extra = { prob = { num = 1, denum = 2 }, xmult_gain = 8, xmult = 8 } },

    blueprint_compat = true,
    demicoloncompat = true,

    loc_vars = function(_, _, card)
        return {
            vars = {
                card.ability.extra.prob.num,
                card.ability.extra.prob.denum,
                card.ability.extra.xmult_gain,
                card.ability.extra.xmult,
            },
        }
    end,

    calculate = function(_, card, ctx)
        if ctx.joker_main then
            return {
                xmult = lenient_bignum(card.ability.extra.xmult),
            }
        end

        if
            (
                ctx.individual
                and ctx.cardarea == G.play
                and ctx.other_card:get_id() == 8
                and SMODS.pseudorandom_probability(card, "8 Planets __(subpcall rdx abx ctx)__ // dummy seed", card.ability.extra.prob.num, card.ability.extra.prob.denum)
            ) or ctx.forcetrigger
        then
            local localized, set = localize("k_plus_tarot"), "Tarot"
            if SMODS.pseudorandom_probability(card, "planet or tarot", 1, 2) then
                localized, set = localize("k_plus_planet"), "Planet"
            end
            return {
                extra = {
                    message = localized,
                    message_card = card,
                    func = function()
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                delay(0.2)
                                SMODS.add_card({ set = set, edition = "e_negative" })
                                return true
                            end,
                        }))
                    end,
                },
            }
        end

        if ctx.using_consumeable and not ctx.blueprint and (ctx.consumeable.ability.set == "Tarot" or ctx.consumeable.ability.set == "Planet") then
            return SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "xmult",
                scalar_value = "xmult_gain",
            })
        end
    end,
})
