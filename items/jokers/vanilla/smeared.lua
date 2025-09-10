SMODS.Joker({
    key = "smeared",
    rarity = "cry_exotic",
    atlas = "v_atlas_1",
    blueprint_compat = true,
    demicoloncompat = true,
    pos = { x = 9, y = 7 },
    soul_pos = { x = 11, y = 7, extra = { x = 10, y = 7 } },
    cost = 50,

    config = { extra = { eemult = 1.1 } },

    loc_vars = function(_, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_wild

        return {
            vars = {
                card.ability.extra.eemult,
            },
        }
    end,

    calculate = function(_, card, context)
        if (context.individual and context.cardarea == G.play) or context.forcetrigger then
            if (SMODS.has_enhancement(context.other_card, "m_wild")) or context.forcetrigger then
                return { eemult = card.ability.extra.eemult }
            end
        end

        if context.after and not context.blueprint then
            for _, scored in ipairs(context.scoring_hand or {}) do
                scored:set_ability(G.P_CENTERS.m_wild, nil, true)
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
    if next(SMODS.find_card("j_asc_smeard")) and card.playing_card and SMODS.has_enhancement(card, "m_wild") then
        return "prevent_debuff"
    end
end
