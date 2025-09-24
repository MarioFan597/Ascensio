---@diagnostic disable: need-check-nil
SMODS.Joker({
    key = "invisible",
    rarity = "cry_exotic",
    atlas = "v_atlas_2",

    blueprint_compat = false,
    demicoloncompat = true,

    pos = { x = 9, y = 1 },
    soul_pos = { x = 11, y = 1, extra = { x = 10, y = 1 } },

    cost = 0,
    order = 1,

    config = {
        extra = {
            rounds = {
                req = 1,
                cur = 0,
            },
        },
    },

    loc_vars = function(_, _, card)
        if G.jokers and G.jokers.cards then
            for _, other in ipairs(G.jokers.cards) do
                if other ~= card and other.config.center.key == card.config.center.key then
                    other:start_dissolve()
                    juice_card(card)
                    return
                end
            end

            card.sell_cost = 0
        end

        return {
            vars = {
                card.ability.extra.rounds.req,
                card.ability.extra.rounds.cur,
                (card.ability.extra.rounds.req > 2) and "rounds" or "round",
            },
        }
    end,

    add_to_deck = function(_, card, _)
        for _, other in ipairs(G.jokers.cards) do
            if other ~= card and other.config.center.key == card.config.center.key then
                other:start_dissolve()
                juice_card(card)
                return
            end
        end

        card:set_edition("e_negative")
        card.sell_cost = 0
    end,

    calculate = function(_, card, context)
        if (context.selling_self and not context.blueprint) or context.forcetrigger then
            if (#G.jokers.cards <= G.jokers.config.card_limit and card.ability.extra.rounds.cur >= card.ability.extra.rounds.req) or context.forcetrigger then
                local i = 0
                for x, v in ipairs(G.jokers.cards) do
                    if v == card then
                        i = x
                    end
                end

                local copied = G.jokers.cards[i + 1]
                if copied then
                    local recopied = copy_card(copied, nil, nil, nil, copied.ability and copied.ability.negative)
                    recopied:add_to_deck()
                    G.jokers:emplace(recopied)
                else
                    return { message = localize("k_no_other_jokers") }
                end
                return { message = localize("k_duplicated_ex") }
            else
                return { message = localize("k_no_room_ex") }
            end
        end

        ---@diagnostic disable-next-line: unnecessary-if
        if (context.end_of_round and context.main_eval and not context.blueprint) or context.forcetrigger then
            if card.ability.extra.rounds.cur < card.ability.extra.rounds.req then
                card.ability.extra.rounds.cur = card.ability.extra.rounds.cur + 1
            else
                juice_card_until(card, function(this)
                    return not this.REMOVED
                end, true)
            end
        end
    end,

    remove_from_deck = function(_, _)
        local other_self = SMODS.add_card({ key = "j_asc_invisible" })
        juice_card(other_self)
        other_self:set_edition("e_negative")
        other_self.sell_cost = 0
    end,

    asc_credits = {
        idea = {
            "OmegaLife",
        },
        art = {
            "Lil Mr. Slipstream",
        },
        code = {
            "OmegaLife",
        },
    },
})
