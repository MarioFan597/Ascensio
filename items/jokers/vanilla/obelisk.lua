SMODS.Joker({
	key = "obelisk",
	rarity = "cry_exotic",
	atlas = "v_atlas_1",
	blueprint_compat = true,
	demicoloncompat = true,

	cost = 50,
	order = 23,

	pos = { x = 0, y = 14 },
	soul_pos = { x = 2, y = 14, extra = { x = 1, y = 14 } },

	config = {
		extra = {},
	},

	loc_vars = function(_, _, card)
		return {
			vars = {
				card.ability.extra.xmult,
			},
		}
	end,

	calculate = function(_, card, context) end,

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
