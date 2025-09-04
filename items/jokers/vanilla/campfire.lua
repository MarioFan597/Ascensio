SMODS.Joker({
	key = "campfire",
	rarity = "cry_exotic",
	atlas = "v_atlas_1",
	blueprint_compat = true,
	demicoloncompat = true,
	pos = { x = 9, y = 6 },
	soul_pos = { x = 11, y = 6, extra = { x = 10, y = 6 } },
	cost = 50,
	order = 1,

	config = {
		extra = {
			mult = 1.0,
			temp_gain = 0.1,
			perm_gain = 0.02,
			immutable = { cards_sold = 0 },
		},
	},

	loc_vars = function(_, _, card)
		return {
			vars = {
				card.ability.extra.mult,
				card.ability.extra.temp_gain,
				card.ability.extra.perm_gain,
				card.ability.extra.immutable.cards_sold,
			},
		}
	end,
	calculate = function(_, card, context)
		if (context.joker_main or context.forcetrigger) and card.ability.extra.mult > 1 then
			if context.forcetrigger then
				SMODS.scale_card(card, {
					ref_table = card.ability.extra,
					ref_value = "mult",
					scalar_value = "temp_gain",
					message_key = "a_powmult",
					message_colour = G.C.DARK_EDITION,
				})
			end
			return {
				message = localize({
					type = "variable",
					key = "a_powmult",
					vars = {
						card.ability.extra.mult,
					},
				}),
				Emult_mod = lenient_bignum(card.ability.extra.mult),
				colour = G.C.DARK_EDITION,
			}
		end

		if context.selling_card and not context.blueprint then
			SMODS.scale_card(card, {
				ref_table = card.ability.extra,
				ref_value = "mult",
				scalar_value = "temp_gain",
				message_key = "a_powmult",
				message_colour = G.C.DARK_EDITION,
			})

			card.ability.extra.immutable.cards_sold = card.ability.extra.immutable.cards_sold + 1
			return nil, true
		end

		if
			(context.end_of_round and G.GAME.blind.boss and context.main_eval)
			and not (context.individual or context.repetition or context.blueprint)
		then
			card.ability.extra.mult = 1
			SMODS.scale_card(card, {
				ref_table = card.ability.extra,
				ref_value = "temp_gain",
				scalar_table = {
					card_sold_gain = (card.ability.extra.perm_gain * card.ability.extra.immutable.cards_sold),
				},
				scalar_value = "card_sold_gain",
				no_message = true,
			})

			card.ability.extra.immutable.cards_sold = 0
			card_eval_status_text(card, "extra", nil, nil, nil, {
				message = localize("k_reset"),
				colour = G.C.DARK_EDITION,
			})
		end
	end,

	asc_credits = {
		idea = {
			"wilfredlam0418",
			"MarioFan597",
		},
		art = {
			"Tatteredlurker",
		},
		code = {
			"MarioFan597",
		},
	},
})
