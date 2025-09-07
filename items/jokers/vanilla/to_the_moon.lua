SMODS.Joker({
    key = "to_the_moon",
    rarity = "cry_exotic",
    atlas = "v_atlas_1",
    blueprint_compat = false,
    demicoloncompat = true,
    pos = { x = 6, y = 2 },
    soul_pos = { x = 8, y = 2, extra = { x = 7, y = 2 } },
    cost = 50,

    config = { extra = { multiplier = 3 } },

    loc_vars = function(_, _, card)
        return {
            vars = {
                card.ability.extra.multiplier,
            },
        }
    end,

    asc_credits = {
        idea = {
            "TheOfficialfem",
        },
        art = {
            "Oinite12",
        },
        code = {
            "Somethingcom515",
            "OmegaLife",
        },
    },
})

local oldeasedollars = ease_dollars

function ease_dollars(mod, instant)
    if to_big(mod) > to_big(0) then
        local mult = 1
        for _, card in ipairs(SMODS.find_card("j_asc_to_the_moon")) do
            mult = mult * card.ability.extra.multiplier
        end

        return oldeasedollars(mod * mult, instant)
    end

    return oldeasedollars(mod, instant)
end
