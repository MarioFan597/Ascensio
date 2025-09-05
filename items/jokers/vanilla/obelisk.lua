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
		extra = {
			xmult = 1,
			immutable = {
				consecutive = 0,
			},
		},
	},

	loc_vars = function(_, _, card)
		return {
			vars = {
				card.ability.extra.xmult,
			},
		}
	end,

	calculate = function(_, card, context)
		if (context.before and not context.blueprint) or context.forcetrigger then
			local reset, played_more_than = true, (G.GAME.hands[context.scoring_name].played or 0)

			for hand, val in pairs(G.GAME.hands) do
				if
					hand ~= context.scoring_name
					and val.played >= played_more_than
					and SMODS.is_poker_hand_visible(hand)
				then
					reset = false
					break
				end
			end

			if reset and not context.forcetrigger then
				card.ability.immutable.consecutive = 0
				return {
					message = localize("k_reset"),
				}
			else
				card.ability.extra.immutable.consecutive = card.ability.extra.immutable.consecutive + 1

				return SMODS.scale_card(card, {
					ref_table = card.ability.extra,
					ref_value = "xmult",
					scalar_value = "consecutive",
					scalar_table = card.ability.extra.immutable,
				})
			end
		end

		if context.joker_main then
			return {
				xmult = card.ability.extra.xmult,
			}
		end
	end,

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
