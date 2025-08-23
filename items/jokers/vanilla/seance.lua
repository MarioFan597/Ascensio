SMODS.Atlas({
	key = "seance",
	path = "seance.png",
	px = 71,
	py = 95,
})

SMODS.Joker({
	key = "mystic_summit",
	config = { extra = { mult = 1, gain = 0.25 } },
	rarity = "cry_exotic",
	atlas = "v_atlas_1",
	blueprint_compat = true,
	demicoloncompat = true,
	pos = { x = 0, y = 0 },
	soul_pos = { x = 0, y = 5, extra = { x = 0, y = 1 } },

	animation = {
		macro = {
			type = "skim",
			soul_pos_extra = {
				include = { { x1 = 0, y1 = 1, x2 = 9, y2 = 4 } },
				exclude = { { x1 = 1, y1 = 4, x2 = 9, y2 = 4 } },
			},
		},
	},

	cost = 50,
	order = 23,
	loc_vars = function(self, info_queue, card)
		return {
			vars = {},
		}
	end,
	calculate = function(self, card, context) end,
	asc_credits = {
		idea = {},
		art = {},
		code = {},
	},
})
