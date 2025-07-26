SMODS.Joker({
	key = "sock_and_buskin",
	rarity = "cry_exotic",
	atlas = "v_atlas_1",
	blueprint_compat = true,
	demicoloncompat = true,
	pos = { x = 0, y = 8 },
	cost = 50,
	order = 1,

	config = {
		extra = {
			rep = 5,
			xchip = 2,
			xmult = 1.25,
		},
	},

	loc_vars = function(_, _, card)
		if card then
			return {
				vars = {
					lenient_bignum(card.ability.extra.rep),
					lenient_bignum(card.ability.extra.xchip),
					lenient_bignum(card.ability.extra.xmult),
				},
			}
		else
			return { vars = { 5, 1.5, 1.5 } }
		end
	end,

	calculate = function(_, card, context)
		if context.individual and context.cardarea == G.play and context.other_card:is_face() then
			for _, scored_card in pairs(context.scoring_hand) do
				if scored_card == context.other_card then
					return {
						message = localize({
							type = "variable",
							key = "a_xchips",
							vars = { number_format(card.ability.extra.xchip) },
						}),
						Xchip_mod = card.ability.extra.xchip,
						colour = G.C.CHIPS,
					}
				end
			end

			if (not context.end_of_round) and not context.other_card.debuffed then
				return {
					message = localize({
						type = "variable",
						key = "a_xmult",
						vars = { number_format(card.ability.extra.xmult) },
					}),
					Xmult_mod = card.ability.extra.xmult,
					colour = G.C.MULT,
				}
			end
		end

		if context.repetition and context.cardarea == G.play then
			if context.other_card:is_face() then
				return {
					message = localize("k_again_ex"),
					repetitions = card.ability.extra.rep,
				}
			end
		end
	end,

	asc_credits = {
		idea = {
			"OmegaLife",
			"yahooyowza",
		},
		art = {
			"???",
		},
		code = {
			"OmegaLife",
		},
	},
})
