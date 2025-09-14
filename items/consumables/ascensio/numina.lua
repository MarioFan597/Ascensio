SMODS.ConsumableType({
    key = "Numina",
    primary_colour = G.C.FILTER, -- Placeholder Colours
    secondary_colour = G.C.FILTER, -- Placeholder Colours
    collection_rows = { 6, 6, 6 },
    shop_rate = 0,
    default = "c_asc_samsara", -- Replace
})

SMODS.Sticker({
    key = "cyclone",
    atlas = "sticker",
    pos = { x = 1, y = 0 },
    soul_pos = { x = 0, y = 0 },
})

SMODS.Consumable({
    key = "samsara",
    set = "Numina",
    atlas = "numina",

    pos = { x = 0, y = 0 },
    soul_pos = { x = 1, y = 0 },

    cost = 4,

    loc_vars = function(_, info_queue, _)
        info_queue[#info_queue + 1] = { key = "asc_samsara", set = "Other" }
    end,
})
