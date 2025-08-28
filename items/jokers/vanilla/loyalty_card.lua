SMODS.Joker({
	key = "jimbo",

	rarity = "cry_exotic",
	atlas = "v_atlas_1",
	blueprint_compat = true,
	demicoloncompat = true,

	pos = { x = 0, y = 0 },
	soul_pos = { x = 2, y = 0, extra = { x = 1, y = 0 } },

	cost = 50,
	order = 1,

	config = {
		extra = {
			xmult = 16,
			multiplier = 4,

			immutable = {
				hand_played = 0,
				hand_requirement = 6,
			},
		},
	},

	loc_vars = function(_, _, card)
		return {
			vars = {
				card.ability.extra.xmult,
				card.ability.extra.multiplier,

				card.ability.extra.immutable.hand_played,
				card.ability.extra.immutable.hand_requirement,
			},
		}
	end,

	calculate = function(_, card, context)
		if (context.before and context.main_eval) or context.forcetrigger then
			card.ability.extra.immutable.hand_played = card.ability.extra.immutable.hand_played + 1

			if
				(card.ability.extra.immutable.hand_played >= card.ability.extra.immutable.hand_requirement)
				or context.forcetrigger
			then
				card.ability.extra.immutable.hand_played = 0
				card.ability.extra.xmult = card.ability.extra.xmult * card.ability.extra.multiplier

				return {
					message = localize("k_upgrade_ex"),
					colour = G.C.MULT,
				}
			end
		end

		if context.joker_main then
			return {
				x_mult = card.ability.extra.xmult,
			}
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
