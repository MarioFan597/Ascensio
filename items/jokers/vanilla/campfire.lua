SMODS.Joker({
	key = "campfire",
	config = { extra = { mult = 1, temp_gain = 0.1, perm_gain = 0.03, immutable = {cards_sold = 0} } },
	rarity = "cry_exotic",
	atlas = "v_atlas_1",
	blueprint_compat = true,
	demicoloncompat = true,
	pos = { x = 9, y = 6 },
	soul_pos = { x = 11, y = 6, extra = { x = 10, y = 6 } },
	cost = 50,
	order = 1,
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card and lenient_bignum(card.ability.extra.mult),
				card and lenient_bignum(card.ability.extra.temp_gain),
				card and lenient_bignum(card.ability.extra.perm_gain),
				card and lenient_bignum(card.ability.extra.immutable.cards_sold),
			},
		}
	end,
	calculate = function(self, card, context)
		if (context.joker_main or context.forcetrigger) and card.ability.extra.mult > 1 then
			if context.forcetrigger then
				card.ability.extra.temp_gain = card.ability.extra.temp_gain
					+ (card.ability.extra.perm_gain * card.ability.extra.immutable.cards_sold)
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
			card.ability.extra.mult = lenient_bignum(to_big(card.ability.extra.mult) + card.ability.extra.temp_gain)
			card.ability.extra.immutable.cards_sold = card.ability.extra.immutable.cards_sold + 1
			card_eval_status_text(card, "extra", nil, nil, nil, {
				message = localize({
					type = "variable",
					key = "a_powmult",
					vars = { number_format(card.ability.extra.mult) },
				}),
			})
			return nil, true
		end

		if
			(context.end_of_round and G.GAME.blind.boss)
			and not (context.individual or context.repetition or context.blueprint)
		then
			card.ability.extra.mult = 1
			card.ability.extra.temp_gain = lenient_bignum(
				to_big(card.ability.extra.temp_gain + (card.ability.extra.perm_gain * card.ability.extra.immutable.cards_sold))
			)
			card.ability.extra.immutable.cards_sold = 0
			card_eval_status_text(card, "extra", nil, nil, nil, {
				message = localize("k_reset"),
				colour = G.C.DARK_EDITION,
			})
		end
	end,
	--[[animation = {
		macro = {
			type = "skim",
			pos = {
				include = { { x1 = 0, x2 = 6, y1 = 1, y2 = 2 } },
				exclude = { { x1 = 6, x2 = 6, y1 = 2, y2 = 2 }},

			},
			soul_pos_extra = {
				include = { { x1 = 0, x2 = 6, y1 = 3, y2 = 6 } },
			},
		},
	]]
	--},
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
