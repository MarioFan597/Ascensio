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
				xmult = 1,
				most_played = nil,
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
		if (context.before and context.main_eval and not context.blueprint) or context.forcetrigger then
			if (context.scoring_name ~= (card.ability.extra.immutable.most_played or "")) or context.forcetrigger then
				return SMODS.scale_card(card, {
					ref_table = card.ability.extra,
					ref_value = "xmult",
					operation = function(tbl, ref_value, initial, _)
						local scaling_hand = 0

						for hand, data in pairs(G.GAME.hands) do
							if
								card.ability.extra.immutable.most_played
								and card.ability.extra.immutable.most_played ~= hand
							then
								scaling_hand = scaling_hand + (data.played or 0)
							end
						end

						tbl[ref_value] = initial + scaling_hand
					end,
				})
			else
				card.ability.extra.xmult = card.ability.extra.immutable.xmult
				return {
					message = localize("k_reset_ex"),
					colour = G.C.FILTER,
				}
			end
		end

		if context.joker_main then
			return {
				xmult = card.ability.extra.xmult,
			}
		end

		if context.after and context.main_eval then
			local most_played, most_played_time = nil, 0
			for hand, data in pairs(G.GAME.hands) do
				if (data.played or 0) > most_played_time then
					most_played = hand
					most_played_time = most_played_time
				else
					if (data.played or 0) == most_played_time then
						card.ability.extra.immutable.most_played = nil
						break
					end
				end
			end

			card.ability.extra.immutable.most_played = most_played
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
