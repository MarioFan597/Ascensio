---@param force? boolean
---@return int
local total_steel = function(force)
    local accum = 0

    if G.playing_cards then
        for _, card in ipairs(G.playing_cards) do
            if SMODS.has_enhancement(card, "m_steel") or (force == true) then
                accum = accum + 1
            end
        end
    end

    return accum
end

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
            extern_xmult = 0.1,
            xmult = 1,
        },
    },

    loc_vars = function(_, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_steel
        local steels = total_steel()
        local exmult, xmult = card.ability.extra.extern_xmult, card.ability.extra.xmult

        return {
            vars = {
                exmult,
                1 + steels * exmult,
                xmult,
                1 + steels * xmult,
            },
        }
    end,

    calculate = function(_, card, context)
        if context.joker_main or context.forcetrigger then
            local steels = total_steel(context.forcetrigger ~= nil)
            return { xmult = 1 + card.ability.extra.xmult * steels }
        end
        if ((context.individual and context.cardarea == G.hand) or (context.individual and context.cardarea == G.play)) and not context.end_of_round then
            if context.other_card.debuff then
                return {
                    message = localize("k_debuffed"),
                    colour = G.C.RED,
                }
            else
                local steels = total_steel(context.forcetrigger ~= nil)
                if SMODS.has_enhancement(context.other_card, "m_steel") and steels > 0 then
                    return {
                        x_mult = 1 + card.ability.extra.extern_xmult * steels,
                    }
                end
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
            "MarioFan597",
        },
    },
})
