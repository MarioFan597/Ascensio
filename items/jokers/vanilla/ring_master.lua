SMODS.Joker({
    key    = "ring_master",
    rarity = "cry_exotic",
    atlas  = "v_atlas_2",

    -- todo: replace with next index, mariofan do this for me im lazy af
    pos      = { x = 0, y = 3 },
    soul_pos = { x = 2, y = 3, extra = { x = 1, y = 3 } },

    cost  = 50,
    order = 1,

    config = {
        extra = {
            emult = 1,
            emult_multiplier = 0.2,
        },
    },

    blueprint_compat = true,
    demicoloncompat  = true,

    loc_vars = function(_, _, card)
        return { vars = { card.ability.extra.emult_multiplier, card.ability.extra.emult } }
    end,

    calculate = function(self, card, ctx)
        if ctx.forcetrigger then
            SMODS.scale_card(card, {
                ref_table    = card.ability.extra,
                ref_value    = "emult",
                scalar_value = "gain",
                scalar_table = { gain = self.cost * card.ability.extra.emult_multiplier },
            })
        end

        if ctx.buying_card and not ctx.blueprint and #(SMODS.find_card(ctx.card.config.card_key)) > 1 then
            SMODS.scale_card(card, {
                ref_table    = card.ability.extra,
                ref_value    = "emult",
                scalar_value = "gain",
                scalar_table = { gain = ctx.card.cost * card.ability.extra.emult_multiplier },
            })
        end

        if ctx.joker_main then
            return { emult = card.ability.extra.emult }
        end
    end,
})

---@type fun(card_key: string): boolean
local showman_ref = SMODS.showman or function(_) return next(SMODS.find_card("j_ring_master")) and true or false end

---@param card_key string
---@param ...      any
---@return boolean
SMODS.showman = function(card_key, ...)
    if next(SMODS.find_card("j_asc_ring_master")) then
        return true
    else
        return showman_ref(card_key, ...)
    end
end
