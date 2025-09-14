SMODS.ConsumableType({
    key = "Numina",
    primary_colour = G.C.FILTER, -- Placeholder Colours
    secondary_colour = G.C.FILTER, -- Placeholder Colours
    collection_rows = { 6, 6, 6 },
    shop_rate = 0,
    default = "c_asc_samsara", -- Replace
})

SMODS.Sticker({
    key = "samsara",
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

SMODS.Consumable({
    key = "rapture",
    set = "Numina",
    atlas = "numina",

    pos = { x = 4, y = 2 },
    soul_pos = { x = 5, y = 2 },

    cost = 4,
})

SMODS.Consumable({
    key = "mandala",
    set = "Numina",
    atlas = "numina",

    pos = { x = 0, y = 1 },
    soul_pos = { x = 1, y = 1 },

    cost = 4,

    loc_vars = function(_, info_queue, _)
        info_queue[#info_queue + 1] = { key = "asc_skibidi", set = "Other" }
    end,
})

SMODS.Consumable({
    key = "punya",
    set = "Numina",
    atlas = "numina",

    pos = { x = 4, y = 2 },
    soul_pos = { x = 5, y = 2 },

    cost = 4,
})

SMODS.Consumable({
    key = "prana",
    set = "Numina",
    atlas = "numina",

    pos = { x = 0, y = 2 },
    soul_pos = { x = 1, y = 2 },

    cost = 4,
})

SMODS.Consumable({
    key = "samadhi",
    set = "Numina",
    atlas = "numina",

    pos = { x = 0, y = 3 },
    soul_pos = { x = 1, y = 3 },

    cost = 4,
})

SMODS.Consumable({
    key = "punarbhava",
    set = "Numina",
    atlas = "numina",

    pos = { x = 0, y = 4 },
    soul_pos = { x = 1, y = 4 },

    cost = 4,
})

SMODS.Consumable({
    key = "syncretisa",
    set = "Numina",
    atlas = "numina",

    pos = { x = 0, y = 5 },
    soul_pos = { x = 1, y = 5 },

    cost = 4,
})
