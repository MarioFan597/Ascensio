SMODS.Joker{
	key = "duane",
	config = { extra = { mult = 0, mult_mod = 2 } },
	rarity = 3,
	atlas = "c_atlas_mortal",
	blueprint_compat = true,
	demicoloncompat = true,
	pos = { x = 5, y = 0 },
	cost = 7,
	order = 508,
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				lenient_bignum(card.ability.extra.mult),
				lenient_bignum(card.ability.extra.mult_mod)
			},
		}
	end,
	calculate = function(self, card, context)
		if
			not context.blueprint
			and (
				(
					context.post_trigger
					and context.other_joker ~= card
					and Cryptid.isNonRollProbabilityContext(context.other_context)
				)
			)
		then
			card.ability.extra.mult = lenient_bignum(to_big(card.ability.extra.mult) + card.ability.extra.mult_mod)
			card_eval_status_text(card, "extra", nil, nil, nil, { message = localize("k_upgrade_ex") })
		end
		if (context.joker_main and (to_big(card.ability.extra.mult) > to_big(1))) or context.forcetrigger then
			if context.forcetrigger then
				card.ability.extra.mult =
					lenient_bignum(to_big(card.ability.extra.mult) + card.ability.extra.mult_mod)
			end
			return {
				message = localize({
					type = "variable",
					key = "a_mult",
					vars = {
						number_format(card.ability.extra.mult),
					},
				}),
				mult_mod = lenient_bignum(card.ability.extra.mult),
				colour = G.C.MULT,
			}
		end
	end,
	asc_credits = {
		idea = { "TheOfficalFem" },
		art = { "MarioFan597", "Shellular" },
		code = { "elial2", "MarioFan597" },
	},
}
