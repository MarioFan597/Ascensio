SMODS.Joker({
    key = "steel_joker",
    rarity = "cry_exotic",
    atlas = "v_atlas_2",

    blueprint_compat = true,
    demicoloncompat = true,

    pos = { x = 9, y = 0 },
    soul_pos = { x = 11, y = 0, extra = { x = 10, y = 0 } },

    cost = 50,
    order = 1,

    config = {
        extra = {
            emult = 1.2,
        },
    },

    loc_vars = function(_, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_steel

        return {
            vars = {
                card.ability.extra.emult,
            },
        }
    end,

    calculate = function(_, card, context)
        if context.before or context.forcetrigger then
            for _, card in ipairs(G.hand.cards) do
                local has_enh = false
                for _, _ in pairs(SMODS.get_enhancements(card)) do
                    has_enh = true
                    break
                end

                if not has_enh then
                    card:set_ability(G.P_CENTERS.m_steel)
                end
            end
        end

        if (context.individual and context.cardarea == G.hand and not context.end_of_round) or context.forcetrigger then
            if SMODS.has_enhancement(context.other_card, "m_steel") or context.forcetrigger then
                return { emult = card.ability.extra.emult }
            end
        end
    end,

    asc_credits = {
        idea = {
            "OmegaLife",
        },
        art = {
            "???",
        },
        code = {
            "OmegaLife",
        },
    },
})
