local function createMultTbl(base)
    local tbl = {}
    for i, v in ipairs(asc_circus_mult_tbl(base)) do
        if i == 6 then
            tbl["cry_exotic"] = v.emult
        elseif i == 7 then
            tbl["entr_entropic"] = v.emult
        elseif i == 4 then
            tbl["cry_epic"] = v.emult
        else
            tbl[i] = v.emult
        end
    end

    return tbl
end

SMODS.Joker({
    key = "circus",
    order = 4,
    pos = { x = 0, y = 4 },
    soul_pos = { x = 2, y = 4, extra = { x = 1, y = 4 } },
    rarity = "cry_exotic",
    cost = 50,
    blueprint_compat = true,
    atlas = "c_atlas_1",

    config = {
        extra = { base = to_big(1.1), base_gain = 0.01 },
        immutable = {},
    },

    set_ability = function(_, card)
        card.ability.immutable = createMultTbl(card.ability.extra.base)
    end,

    loc_vars = function(_, _, card)
        card.ability.immutable = createMultTbl(card.ability.extra.base)

        local mult_tbl = asc_circus_mult_tbl(card.ability.extra.base)
        local mult_tbls = {}

        for i, v in ipairs(mult_tbl) do
            mult_tbls[i] = v.emult
        end

        mult_tbls[#mult_tbls + 1] = number_format(card.ability.extra.base)
        mult_tbls[#mult_tbls + 1] = card.ability.extra.base_gain

        return {
            vars = mult_tbls,
        }
    end,

    calculate = function(self, card, context)
        if context.other_joker and card ~= context.other_joker and (card.ability.immutable[context.other_joker.config.center.rarity] or 0) > 1 then
            if not Talisman.config_file.disable_anims then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        context.other_joker:juice_up(0.5, 0.5)
                        return true
                    end,
                }))
            end

            local emult = card.ability.immutable[context.other_joker.config.center.rarity] or 1

            return {
                emult = emult,
            }
        end

        if (context.end_of_round and context.main_eval) or context.forcetrigger then
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "base",
                scalar_value = "base_gain",
            })

            card.ability.immutable = createMultTbl(card.ability.extra.base)
        end

        if context.forcetrigger then
            local x = to_big(1)

            for _, item in pairs(card.ability.immutable) do
                x:pow(item)
            end

            return { emult = x }
        end

        if context.joker_main then
            return { emult = card.ability.immutable["cry_exotic"] }
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
