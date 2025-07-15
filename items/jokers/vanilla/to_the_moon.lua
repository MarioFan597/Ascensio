SMODS.Joker {
	key = "to_the_moon",
	config = { extra = {  } },
	rarity = "cry_exotic",
	atlas = "v_atlas_1",
	blueprint_compat = false,
	demicoloncompat = true,
	pos = { x = 6, y = 2 },
	soul_pos = { x = 8, y = 2, extra = { x = 7, y = 2 } },
	cost = 50,
    asc_credits = {
			idea = {
				"TheOfficialfem"
			},
			art = {
				"Oinite12"
			},
			code = {
				"Somethingcom515"
			}
		},
}

local oldeasedollars = ease_dollars
function ease_dollars(mod, instant)
	if next(SMODS.find_card("j_asc_to_the_moon")) then
		if to_big(mod) > to_big(0) then
			mod = mod * (3 ^ #SMODS.find_card("j_asc_to_the_moon"))
		end
	end
	return oldeasedollars(mod, instant)
end