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
				card.ability.extra.immutable.hands,
			},
		}
	end,

	calculate = function(_, card, context)
		if context.before and context.main_eval then
			if not context.retrigger_joker then
				card.ability.extra.immutable.hands = card.ability.extra.immutable.hands + 1
			end
			return{
				SMODS.calculate_effect({ message = localize("k_level_up_ex") }, context.blueprint_card or card),
				SMODS.smart_level_up_hand(
					context.blueprint_card or card,
					context.scoring_name,
					nil,
					card.ability.extra.immutable.hands * card.ability.extra.level_gain
				)
			}
		end

		if context.beat_boss and card.ability.extra.immutable.hands ~= 0 then
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
