SMODS.Joker({
	key = "lusty",
	config = { extra = { e_mult = 1.2 } },
	rarity = "cry_exotic",
	atlas = "v_atlas_1",
	blueprint_compat = true,
	pos = { x = 3, y = 4 },
	soul_pos = { x = 5, y = 4, extra = { x = 4, y = 4 } },
	cost = 50,
	order = 3,
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.e_mult) } }
	end,
	calculate = function(self, card, context)
		if context.individual or context.forcetrigger then
			if (context.cardarea == G.play and context.other_card:is_suit("Hearts")) or context.forcetrigger then
				return {
					message = localize({
						type = "variable",
						key = "a_powmult",
						vars = { lenient_bignum(card.ability.extra.e_mult) },
					}),
					Emult_mod = lenient_bignum(card.ability.extra.e_mult),
					colour = G.C.DARK_EDITION,
				}
			end
		end
	end,
	asc_credits = {
		idea = {
			"Lexi",
		},
		art = {
			"MarioFan597",
		},
		code = {
			"Glitchkat10",
		},
	},
})
