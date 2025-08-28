SMODS.Atlas({
	key = "banner",
	path = "jokers/vanilla/banner.png",
	px = 71,
	py = 95,
})

SMODS.Joker({
	key = "banner",
	config = { extra = { chips = 1, gain = 1, bonus = 2 } },
	rarity = "cry_exotic",
	atlas = "banner",
	blueprint_compat = true,
	demicoloncompat = true,
	pos = { x = 0, y = 0 },
	soul_pos = { x = 0, y = 5, extra = { x = 0, y = 1 } },
	cost = 50,
	order = 23,
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card and lenient_bignum(card.ability.extra.chips),
				card and lenient_bignum(card.ability.extra.gain),
				card and lenient_bignum(card.ability.extra.bonus),
			},
		}
	end,
	calculate = function(self, card, context)
		if (context.before and not context.blueprint and not context.retrigger_joker) or context.forcetrigger then
			if G.GAME.current_round.discards_left > 0 then
				SMODS.scale_card(card, {
					ref_table = card.ability.extra,
					ref_value = "chips",
					scalar_table = { discards = G.GAME.current_round.discards_left},
					scalar_value = "discards",
					no_message = true
				})
				card_eval_status_text(card, "extra", nil, nil, nil, {
					message = localize("k_upgrade_ex"),
					colour = G.C.CHIPS,
				})
			end
		end
		if context.joker_main or context.forcetrigger then
			if
				(lenient_bignum(card.ability.extra.chips) > 1)
				or (lenient_bignum(card.ability.extra.bonus) > 1 and G.GAME.current_round.discards_left > 0)
			then
				return {
					message = localize({
						type = "variable",
						key = "a_xchips",
						vars = {
							lenient_bignum(
								card.ability.extra.chips
									* (card.ability.extra.bonus * G.GAME.current_round.discards_left)
							),
						},
					}),
					Xchip_mod = lenient_bignum(card.ability.extra.chips),
					colour = G.C.CHIPS,
				}
			end
		end
	end,
	animation = {
		macro = {
			type = "skim",
			soul_pos_extra = {
				include = { { x1 = 0, x2 = 3, y1 = 1, y2 = 4 } },
			},
		},
	},
	asc_credits = {
		idea = {
			"Googol1e308plex",
			"TheOfficalFem",
		},
		art = {
			"Tatteredlurker",
		},
		code = {
			"MarioFan597",
		},
	},
})
