SMODS.Joker({
	key = "space",
	rarity = "cry_exotic",
	atlas = "v_atlas_1",

	blueprint_compat = true,
	demicoloncompat = true,

	pos = { x = 9, y = 12 },
	soul_pos = { x = 11, y = 12, extra = { x = 10, y = 12 } },

	cost = 0,
	order = 50,

	config = {
		extra = {
			level_gain = 1,
			immutable = { hands = 0 },
		},
	},

	loc_vars = function(_, _, card)
		return {
			vars = {
				card.ability.extra.level_gain,
				card.ability.extra.hands,
			},
		}
	end,

	calculate = function(_, card, context)
		if context.before and context.cardarea == G.play then
			card.ability.extra.immutable.hands = card.ability.extra.immutable.hands + 1

			return {
				level_up = card.ability.extra.immutable.hands * card.ability.extra.level_gain,
				message = localize("k_upgrade_ex"),
				colour = G.C.MULT,
			}
		end

		if context.beat_boss then
			card.ability.extra.immutable.hands = 0
			return {
				message = "Reset!",
				colour = G.C.FILTER,
			}
		end
	end,

	asc_credits = {
		idea = {
			"OmegaLife",
		},
		art = {
			"Lil Mr. Slipstream",
		},
		code = {
			"OmegaLife",
		},
	},
})
