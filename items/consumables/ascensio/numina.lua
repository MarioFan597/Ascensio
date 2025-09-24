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
    badge_colour = G.C.CRY_EXOTIC,
    no_sticker_sheet = true,

    apply = function(_, card)
        card.ability.samsara = true
        card.ability.debuff = true
    end,
})

SMODS.Consumable({
    key = "samsara",
    set = "Numina",
    atlas = "numina",

    pos = { x = 0, y = 0 },
    soul_pos = { x = 1, y = 0 },

    cost = 4,

    config = { extra = { max_sl = 1 } },

    loc_vars = function(_, info_queue, card)
        info_queue[#info_queue + 1] = { key = "asc_samsara", set = "Other" }

        return {
            vars = {
                card.ability.extra.max_sl,
                (card.ability.extra.max_sl == 1) and "Joker" or "Jokers",
            },
        }
    end,

    can_use = function(_, card)
        -- todo: use something else, this is kinda rudimentary
        return G.jokers and Ascensio.isInRange(#G.jokers.highlighted, { min = 1, max = card.ability.extra.max_sl })
    end,

    use = function(_, card, cardarea, _)
        for _, other_card in ipairs(G.jokers.highlighted) do
            other_card.ability.samsara = true
        end
    end,
})

SMODS.Consumable({
    key = "rapture",
    set = "Numina",
    atlas = "numina",

    pos = { x = 4, y = 0 },
    soul_pos = { x = 5, y = 0 },

    cost = 4,
})

SMODS.Consumable({
    key = "mandala",
    set = "Numina",
    atlas = "numina",

    pos = { x = 0, y = 1 },
    soul_pos = { x = 1, y = 1 },

    cost = 4,
})

SMODS.Consumable({
    key = "punya",
    set = "Numina",
    atlas = "numina",

    pos = { x = 4, y = 1 },
    soul_pos = { x = 5, y = 1 },

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
    key = "karma",
    set = "Numina",
    atlas = "numina",

    pos = { x = 4, y = 2 },
    soul_pos = { x = 5, y = 2 },

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
    key = "valhalla",
    set = "Numina",
    atlas = "numina",

    pos = { x = 4, y = 3 },
    soul_pos = { x = 5, y = 3 },

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
    key = "nirvana",
    set = "Numina",
    atlas = "numina",

    pos = { x = 4, y = 4 },
    soul_pos = { x = 5, y = 4 },

    cost = 4,
})

SMODS.Consumable({
    key = "syncretisa",
    set = "Numina",
    atlas = "numina",

    pos = { x = 0, y = 5 },
    soul_pos = { x = 1, y = 5 },

    cost = 4,

    loc_vars = function(_, _, _)
        return {
            vars = {
                "{444}",
            },
        }
    end,
})
