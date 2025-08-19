SMODS.Atlas({
	key = "sync_catalyst",
	path = "sync_catalyst.png",
	px = 71,
	py = 95,
})

SMODS.Joker({
	key = "sync_catalyst",
	atlas = "sync_catalyst",

	pos = { x = 0, y = 0 },
	soul_pos = { x = 0, y = 6, extra = { x = 0, y = 1 } },

	animation = {
		macro = {
			type = "skim",
			soul_pos = {
				include = { { x1 = 0, y1 = 1, x2 = 9, y2 = 5 } },
			},
		},
	},

	config = {
		extra = {
			immutable = {
				emult = 1,
				echips = 1,
			},
		},
	},

	loc_vars = function(_, _, card)
		return { vars = {
			card.ability.extra.immutable.emult,
			card.ability.extra.immutable.echips,
		} }
	end,

	calculate = function(_, card, context)
		if context.joker_main or context.forcetrigger then
		end

		if context.final_scoring_step then
			return {
				balance = true,
				message = "Balanced!",
				colour = G.C.DARK_EDITION,
			}
		end

		if context.setting_blind then
		end
	end,

	asc_credits = {
		idea = {
			"OmegaLife",
		},
		art = {
			"Tatteredlurker",
		},
		code = {
			"OmegaLife",
		},
	},
})
