local function has_any_enhancement(card)
    for _, _ in pairs(SMODS.get_enhancements(card)) do
        return false
    end

    return true
end

SMODS.Joker({
    key = "smeared",
    rarity = "cry_exotic",
    atlas = "v_atlas_1",
    blueprint_compat = true,
    demicoloncompat = true,
    pos = { x = 9, y = 7 },
    soul_pos = { x = 11, y = 7, extra = { x = 10, y = 7 } },
    cost = 50,

    config = { extra = { emult = 1.25 } },

    loc_vars = function(_, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_wild

        return {
            vars = {
                card.ability.extra.emult,
            },
        }
    end,

    calculate = function(_, card, context)
        if (context.individual and context.cardarea == G.play) or context.forcetrigger then
            if (SMODS.has_enhancement(context.other_card, "m_wild")) or context.forcetrigger then
                return { emult = card.ability.extra.emult }
            end
        end

        if context.before and not context.blueprint or context.forcetrigger then
            for _, scored in ipairs(context.scoring_hand or {}) do
                if has_any_enhancement(card) then
                    scored:set_ability(G.P_CENTERS.m_wild, nil, true)
                end
            end
        end
    end,

    asc_credits = {
        idea = {
            "CapitalChirp",
            "OmegaLife",
        },
        art = {
            "Tatteredlurker",
        },
        code = {
            "Somethingcom515",
            "OmegaLife",
        },
    },
})

SMODS.current_mod.set_debuff = function(card)
    if next(SMODS.find_card("j_asc_smeared")) and card.playing_card and SMODS.has_enhancement(card, "m_wild") then
        return "prevent_debuff"
    end
end
