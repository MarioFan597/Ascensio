SMODS.Joker({
	key = "sock_and_buskin",
	rarity = "cry_exotic",
	atlas = "v_atlas_1",
	blueprint_compat = true,
	demicoloncompat = true,
	pos = { x = 0, y = 8 },
	soul_pos = { x = 2, y = 8, extra = { x = 1, y = 8 } },
	cost = 50,
	order = 1,

	config = {
		extra = {
			rep = 3,
			xchip = 1.5,
			xmult = 1.5,
			cnt = 1,
			immutable = {
				max_rep = 40,
			},
		},
	},

	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				lenient_bignum(card.ability.extra.rep),
				lenient_bignum(card.ability.extra.xchip),
				lenient_bignum(card.ability.extra.xmult),
				lenient_bignum(card.ability.extra.immutable.max_rep),
			},
		}
	end,
	calculate = function(_, card, context)
		if context.individual and context.cardarea == G.play then
			if context.other_card:is_face() then
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
			end
		end

		if context.repetition and context.cardarea == G.play and context.other_card:is_face() then
			return {
				message = localize("k_again_ex"),
				repetitions = to_number(math.min(card.ability.immutable.max_rep, card.ability.extra.rep)),
			}
		end
		if
			context.individual
			and context.cardarea == G.hand
			and context.other_card:is_face()
			and not context.end_of_round
		then
			if context.other_card.debuff then
				return {
					message = localize("k_debuffed"),
					colour = G.C.MULT,
					card = card,
				}
			else
				return {
					x_mult = lenient_bignum(card.ability.extra.xmult),
					card = card,
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
			"thje_axolotl",
		},
		code = {
			"OmegaLife",
		},
	},
})
