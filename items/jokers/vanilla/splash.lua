SMODS.Joker({
    key = "splash",
    rarity = "cry_exotic",
    atlas = "v_atlas_2",

    blueprint_compat = true,
    demicoloncompat = true,

    pos = { x = 6, y = 1 },
    soul_pos = { x = 8, y = 1, extra = { x = 7, y = 1 } },

    cost = 50,
    order = 1,

    config = {
        extra = {
            hand_mod = 1,
            card_requirement = {
                current = 0,
                requirement = 20,
            },
        },

        immutable = {
            total_mod = 0,
            oldcsl = 5,
        },
    },

    loc_vars = function(_, _, card)
        card.ability.extra.hand_mod = math.floor(card.ability.extra.hand_mod)

        return {
            vars = {
                card.ability.extra.hand_mod,
                card.ability.immutable.total_mod,
                card.ability.extra.card_requirement.requirement,
                card.ability.extra.card_requirement.current,
            },
        }
    end,

    add_to_deck = function(_, card, _)
        card.ability.immutable.oldcsl = G.GAME.starting_params.play_limit
        ease_selection_limit(card.ability.extra.hand_mod)
        G.hand:change_size(card.ability.extra.hand_mod)

        SMODS.scale_card(card, {
            ref_table = card.ability.immutable,
            ref_value = "total_mod",
            scalar_value = "hand_mod",
            scalar_table = card.ability.extra,
        })
    end,

    calculate = function(_, card, context)
        if context.modify_scoring_hand and not context.blueprint then
            return {
                add_to_hand = true,
            }
        end

        if context.individual and context.cardarea == G.play then
            if card.ability.extra.card_requirement.current < card.ability.extra.card_requirement.requirement then
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra.card_requirement,
                    ref_value = "current",
                    scalar_value = "gain",
                    scalar_table = { gain = 1 },

                    no_message = true,
                })
            else
                card.ability.extra.card_requirement.current = 0
                ease_selection_limit(card.ability.extra.hand_mod)
                G.hand:change_size(card.ability.extra.hand_mod)

                SMODS.scale_card(card, {
                    ref_table = card.ability.immutable,
                    ref_value = "total_mod",
                    scalar_value = "hand_mod",
                    scalar_table = card.ability.extra,
                })
            end
        end
    end,

    remove_from_deck = function(_, card, _)
        set_selection_limit(card.ability.immutable.oldcsl)
        G.hand:change_size(-card.ability.immutable.total_mod)
    end,

    asc_credits = Ascensio.Credit({
        idea = { "Rhelvetican", "Grahkon" },
        art = { "???" },
        code = { "Rhelvetican" },
    }),
})
