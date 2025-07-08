SMODS.Joker({
	key = "trio",
	config = { extra = { power = 3 } },
	rarity = "cry_exotic",
	atlas = "v_atlas_1",
	blueprint_compat = true,
	demicoloncompat = true,
	pos = { x = 0, y = 1 },
	soul_pos = { x = 2, y = 1, extra = { x = 1, y = 1 } },
	cost = 50,
	order = 132,
	loc_vars = function(self, info_queue, card)
		return { vars = { card and lenient_bignum(card.ability.extra.power) } }
	end,
	calculate = function(self, card, context)
		if context.joker_main or context.forcetrigger then
			if
				(context.poker_hands ~= nil and next(context.poker_hands["Three of a Kind"])) or context.forcetrigger
			then
				return {
					message = localize({
						type = "variable",
						key = "a_powmult",
						vars = { lenient_bignum(card.ability.extra.power) },
					}),
					Emult_mod = lenient_bignum(card.ability.extra.power),
					colour = G.C.DARK_EDITION,
				}
			end
		end
	end,
	asc_credits = {
		idea = {
			"MarioFan597",
		},
		art = {
			"MarioFan597",
		},
		code = {
			"MarioFan597",
		},
	},
})
