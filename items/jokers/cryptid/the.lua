SMODS.Joker({
    key = "the",
    config = { extra = { emult = 1, emult_gain = 0.02 } },
    rarity = "cry_exotic",
    atlas = "c_atlas_1",
    blueprint_compat = true,
    demicoloncompat = true,
    pos = { x = 0, y = 4 },
    soul_pos = { x = 2, y = 4, extra = { x = 1, y = 4 } },
    cost = 50,
    order = 131,
    loc_vars = function(_, _, card)
        ---@cast card.ability table<string, any>
        return {
            vars = {
                card.ability.extra.emult,
                card.ability.extra.emult_gain,
            },
        }
    end,
    calculate = function(_, card, context)
        ---@cast G.hand balatro.CardArea
        ---@cast card.ability table<string, any>

        if (context.before and context.scoring_name == "cry_None") or context.forcetrigger then
            for _, cardx in ipairs(G.hand.cards) do
                G.E_MANAGER:add_event(Event({
                    trigger = "immediate",
                    func = function()
                        cardx:juice_up()

                        if card.ability.eternal then
                            return true, nil
                        end

                        SMODS.scale_card(card, {
                            ref_table = card.ability.extra,
                            ref_value = "emult",
                            scalar_value = "emult_gain",
                        })

                        cardx:start_dissolve()
                        return true, nil
                    end,
                }))
            end
        end

        if context.joker_main or context.forcetrigger then
            return {
                emult = card.ability.extra.emult,
            }
        end
    end,
    asc_credits = {
        idea = {
            "Rhelvetican",
        },
        art = {
            "???",
        },
        code = {
            "Rhelvetican",
        },
    },
})
