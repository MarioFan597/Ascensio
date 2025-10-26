SMODS.Joker({
    key = "four_fingers",
    rarity = "cry_exotic",
    atlas = "v_atlas_1",
    blueprint_compat = false,
    demicoloncompat = false,
    pos = { x = 0, y = 6 },
    soul_pos = { x = 2, y = 6, extra = { x = 1, y = 6 } },
    cost = 50,
    asc_credits = {
        idea = {
            "TheOfficialfem",
        },
        art = {
            "Hasu",
            "MarioFan597",
        },
        code = {
            "Somethingcom515",
        },
    },
})

local oldsmodsfourfingers = SMODS.four_fingers
function SMODS.four_fingers()
    if next(SMODS.find_card("j_asc_four_fingers")) then
        return 2
    end
    return oldsmodsfourfingers()
end
