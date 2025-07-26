SMODS.Joker({
	key = "bootstraps",
	config = { extra = { mult = 0, gain = 1, income = 15 } },
	rarity = "cry_exotic",
	atlas = "v_atlas_1",
	blueprint_compat = true,
	demicoloncompat = true,
	pos = { x = 0, y = 7 },
	soul_pos = { x = 2, y = 7, extra = { x = 1, y = 7 } },
	cost = 50,
	order = 1,
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card and lenient_bignum(card.ability.extra.mult),
				card and lenient_bignum(card.ability.extra.gain),
				card and lenient_bignum(card.ability.extra.income),
			},
		}
	end,
	calculate = function(self, card, context)
		card.ability.extra.mult = 0
		card.ability.extra.mult = lenient_bignum(card.ability.extra.mult)
			+ (to_number(G.GAME.dollars) * lenient_bignum(card.ability.extra.gain))
		if context.joker_main or context.forcetrigger then
			if card.ability.extra.mult > 0 then
				return {
					Xmult_mod = lenient_bignum(card.ability.extra.mult),
					message = localize({
						type = "variable",
						key = "a_xmult",
						vars = { lenient_bignum(card.ability.extra.mult) },
					}),
				}
			end
		end
	end,
	calc_dollar_bonus = function(self, card)
		if card.ability.extra.income >= 1 then
			return card.ability.extra.income
		end
	end,
	asc_credits = {
		idea = {
			"UTNerd24",
			"Glitchkat10",
		},
		art = {
			"MarioFan597",
		},
		code = {
			"MarioFan597",
		},
	},
})
