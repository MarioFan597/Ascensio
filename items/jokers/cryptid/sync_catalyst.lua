SMODS.Atlas({
    key = "sync_catalyst",
    path = "jokers/cryptid/sync_catalyst.png",
    px = 71,
    py = 95,
})

local function balance_sound()
    play_sound("gong", 0.94, 0.3)
    play_sound("gong", 1.41, 0.2)
end

SMODS.Joker({
    key = "sync_catalyst",
    atlas = "sync_catalyst",

    pos = { x = 0, y = 0 },
    soul_pos = { x = 0, y = 6, extra = { x = 0, y = 1 } },
    rarity = "cry_exotic",
    cost = 50,

    blueprint_compat = false,
    demicoloncompat = true,

    animation = {
        macro = {
            type = "skim",
            soul_pos_extra = {
                include = { { x1 = 0, y1 = 1, x2 = 9, y2 = 5 } },
            },
        },
    },

    config = {
        extra = {
            emult = 1,
            echips = 1,

            gain = 0.5,
        },
    },

    loc_vars = function(_, _, card)
        return {
            vars = {
                card.ability.extra.emult,
                card.ability.extra.echips,

                card.ability.extra.gain,
            },
        }
    end,

    calculate = function(_, card, context)
        if context.joker_main then
            return {
                echips = card.ability.extra.echips,
                emult = card.ability.extra.emult,
            }
        end

        if context.final_scoring_step then
            return {
                balance = true,
                func = balance_sound,
            }
        end

        if context.setting_blind and not context.blueprint then
            G.E_MANAGER:add_event(Event({
                func = function()
                    local balans = (G.GAME.current_round.hands_left + G.GAME.current_round.discards_left) / 2
                    ease_hands_played(-(G.GAME.current_round.hands_left - balans), nil, true)
                    ease_discard(-(G.GAME.current_round.discards_left - balans), nil, true)

                    card_eval_status_text(card, "extra", nil, nil, nil, {
                        message = "Balanced!",
                        colour = G.C.DARK_EDITION,
                        func = balance_sound,
                    })
                    return true
                end,
            }))

            local balans = (card.ability.extra.emult + card.ability.extra.echips) / 2
            card.ability.extra.emult = balans
            card.ability.extra.echips = balans

            return {
                message = "Balanced!",
                colour = G.C.DARK_EDITION,
                func = balance_sound,
            }
        end

        if (context.beat_boss and context.main_eval and not context.blueprint) or context.forcetrigger then
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "emult",
                scalar_value = "gain",
            })
        end
    end,

    asc_credits = {
        idea = {
            "OmegaLife",
        },
        art = {
            "Tatteredlurker",
        },
        code = {
            "OmegaLife",
        },
    },
})
