local rarity_mapping = {
    [1] = 1,
    [2] = 2,
    [3] = 3,
    ["cry_epic"] = 4,
    [4] = 5,
    ["cry_exotic"] = 6,
}

if Entropy then
    rarity_mapping["entr_entropic"] = 7
end

local function pow(a, b)
    if type(a) == "number" and type(b) == "number" then
        return math.pow(a, b)
    end

    return Big:ensureBig(a):pow(b)
end

local function add(a, b)
    if type(a) == "number" and type(b) == "number" then
        return a + b
    end

    return Big:ensureBig(a):add(b)
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
        extra = { base = 1.2, base_gain = 0.1, bignum = false },
        immutable = {},
    },

    loc_vars = function(_, _, card)
        if type(card.ability.extra.base) == "number" and card.ability.extra.base > 1e40 then
            card.ability.extra.bignum = true
            card.ability.extra.base = Big:create(card.ability.extra.base)
        end

        if type(card.ability.extra.base_gain) == "number" and card.ability.extra.base_gain > 1e40 then
            card.ability.extra.bignum = true
            card.ability.extra.base_gain = Big:create(card.ability.extra.base_gain)
        end

        local mult_tbl = {}

        for _, idx in pairs(rarity_mapping) do
            mult_tbl[#mult_tbl + 1] = pow(card.ability.extra.base, idx)
        end

        for i, v in ipairs(mult_tbl) do
            card.ability.immutable[i] = v
        end

        mult_tbl[#mult_tbl + 1] = card.ability.extra.base_gain

        return {
            vars = mult_tbl,
        }
    end,

    calculate = function(_, card, context)
        if not card.ability.extra.bignum or type(card.ability.extra.base) == "number" then
            if type(card.ability.extra.base) == "number" and card.ability.extra.base > 1e40 then
                card.ability.extra.bignum = true
                card.ability.extra.base = Big:create(card.ability.extra.base)
            end

            if type(card.ability.extra.base_gain) == "number" and card.ability.extra.base_gain > 1e40 then
                card.ability.extra.bignum = true
                card.ability.extra.base_gain = Big:create(card.ability.extra.base_gain)
            end

            local mult_tbl = {}

            for _, idx in pairs(rarity_mapping) do
                mult_tbl[#mult_tbl + 1] = pow(card.ability.extra.base, idx)
            end

            card.ability.immutable = mult_tbl
        end

        if context.other_joker and card ~= context.other_joker and not context.other_joker.debuff then
            local emult = card.ability.immutable[rarity_mapping[context.other_joker.config.center.rarity] or 1] or 1

            if type(emult) == "string" then
                emult = 1
            end

            if not Talisman.config_file.disable_anims then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        context.other_joker:juice_up(0.5, 0.5)
                        return true
                    end,
                }))
            end

            return {
                emult = emult,
            }
        end

        if (context.end_of_round and context.main_eval) or context.forcetrigger then
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "base",
                scalar_value = "base_gain",

                operation = function(ref_table, ref_value, initial, change)
                    ref_table[ref_value] = add(initial, change)
                end,
            })

            local mult_tbl = {}

            for _, idx in pairs(rarity_mapping) do
                mult_tbl[#mult_tbl + 1] = pow(card.ability.extra.base, idx)
            end

            card.ability.immutable = mult_tbl
        end

        if context.forcetrigger then
            local x = Big:create(1)

            for _, item in pairs(card.ability.immutable) do
                x:pow(item)
            end

            return { emult = x }
        end

        if context.joker_main then
            return { emult = card.ability.immutable[6] }
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
