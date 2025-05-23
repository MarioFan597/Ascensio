SMODS.Joker {
	key = "abstract",
	config = { extra = { power = 1, gain = 0.3 } },
	rarity = "cry_exotic",
	atlas =  "v_atlas_1",
	blueprint_compat = true,
	demicoloncompat = true,
	pos = { x = 9, y = 1 },
	soul_pos = { x = 11, y = 1, extra = { x = 10, y = 1 } },
	cost = 50,
	order = 34,
	loc_vars = function(self, info_queue, card)
		return { vars = { card and lenient_bignum(card.ability.extra.power),  card and lenient_bignum(card.ability.extra.gain) } }
	end,
	calculate = function(self, card, context)
		card.ability.extra.power = 1
		--for i = 1, #G.jokers.cards do
		card.ability.extra.power = lenient_bignum(card.ability.extra.power) + (#G.jokers.cards * lenient_bignum(card.ability.extra.gain))
		--end

		if (context.joker_main) or context.forcetrigger then
			return {
				message = localize({ type = "variable", key = "a_powmult", vars = { card.ability.extra.power } }),
				Emult_mod = lenient_bignum(card.ability.extra.power),
				colour = G.C.DARK_EDITION,
			}
		end

	end,
	asc_credits = {
			idea = {
				"TheOfficialfem"
			},
			art = {
				"MarioFan597"
			},
			code = {
				"MarioFan597"
			}
	},
}