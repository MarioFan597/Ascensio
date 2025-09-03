SMODS.Joker({
	key = "copy_cat",
	config = { extra = { mult = 2, rep = 1, immutable = {max_rep = 40} } },
	rarity = 3,
	atlas = "c_atlas_mortal",
	blueprint_compat = true,
	demicoloncompat = true,
	pos = { x = 6, y = 0 },
	cost = 6,
	order = 508,
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				lenient_bignum(card.ability.extra.mult),
				math.min(card.ability.extra.rep, card.ability.extra.immutable.max_rep),
				card.ability.extra.immutable.max_rep
			},
		}
	end,
	calculate = function(self, card, context)
		if context.repetition then
			if context.cardarea == G.play then
				return {
					message = localize("k_again_ex"),
					repetitions = to_number(
						math.min(card.ability.extra.rep, card.ability.extra.immutable.max_rep)
					),
					card = card,
				}
			end
		elseif context.individual then
			if context.cardarea == G.play then
				return {
					mult = card.ability.extra.mult,
					colour = G.C.RED,
					card = card,
				}
			end
		end
		if context.forcetrigger then
			return {
				mult = card.ability.extra.x_mult,
				colour = G.C.RED,
				card = card,
			}
		end
	end,

	asc_credits = {
		idea = {
			"Googol1e308plex",
		},
		art = {
			"Grahkon",
		},
		code = {
			"MarioFan597",
			"Math",
		},
	},
})
