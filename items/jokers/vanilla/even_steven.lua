SMODS.Joker({
	key = "even_steven",
	config = { extra = { mult = 4, bonus_mult = 8} },
	rarity = "cry_exotic",
	atlas = "v_atlas_1",
	blueprint_compat = true,
	demicoloncompat = true,
	pos = { x = 6, y = 8 },
	soul_pos = { x = 8, y = 8, extra = { x = 7, y = 8 } },
	cost = 50,
	order = 5,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult, card.ability.extra.bonus_mult } }
	end,
	calculate = function(self, card, context)
		if context.individual or context.forcetrigger then
			if (context.cardarea == G.play 
				and (context.other_card:get_id() == 2 
					or context.other_card:get_id() == 4 
					or context.other_card:get_id() == 6
					or context.other_card:get_id() == 8
					or context.other_card:get_id() == 10)) 
				or context.forcetrigger 
			then
				if 
					(#context.full_hand % 2 == 0)
				then
					return {
						message = localize({
							type = "variable",
							key = "a_xmult",
							vars = { lenient_bignum(card.ability.extra.bonus_mult) },
						}),
						Xmult_mod = lenient_bignum(card.ability.extra.bonus_mult),
						colour = G.C.MULT,
					}
				else
					return {
						message = localize({
							type = "variable",
							key = "a_xmult",
							vars = { lenient_bignum(card.ability.extra.mult) },
						}),
						Xmult_mod = lenient_bignum(card.ability.extra.mult),
						colour = G.C.MULT,
					}
				end
			end
		end
	end,
	asc_credits = {
		idea = {
			"MarioFan597",
			"TheOfficialfem"
		},
		art = {
			"Lil Mr. Slipstream",
		},
		code = {
			"MarioFan597",
		},
	},
})
