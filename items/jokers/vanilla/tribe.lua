SMODS.Joker({
	key = "tribe",
	config = { extra = { e_mult = 2 } },
	rarity = "cry_exotic",
	atlas = "v_atlas_1",
	pos = { x = 9, y = 3 },
	soul_pos = { x = 11, y = 3, extra = { x = 10, y = 3 } },
	cost = 50,
	order = 135,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.e_mult) } }
	end,
	calculate = function(self, card, context)
		if context.joker_main or context.forcetrigger then
			if (context.poker_hands ~= nil and next(context.poker_hands["Flush"])) or context.forcetrigger then
				return {
					message = localize({
						type = "variable",
						key = "a_powmult",
						vars = {
							number_format(lenient_bignum(card.ability.extra.e_mult)),
						},
					}),
					Emult_mod = lenient_bignum(card.ability.extra.e_mult),
					colour = G.C.DARK_EDITION,
				}
			end
		end
	end,
	asc_credits = {
		idea = {
			"hssr96",
		},
		art = {
			"Oinite12",
		},
		code = {
			"Glitchkat10",
		},
	},
})
