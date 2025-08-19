SMODS.Joker({
	key = "chuckle_cola",
	config = { extra = { triggers = 20, xchip_mod = 2, gain = 1, immutable = { trig_reset = 20 } } },
	rarity = "cry_exotic",
	atlas = "e_atlas_1",
	blueprint_compat = true,
	demicoloncompat = true,
	pos = { x = 3, y = 0 },
	soul_pos = { x = 5, y = 0, extra = { x = 4, y = 0 } },
	cost = 50,
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				lenient_bignum(card.ability.extra.xchip_mod),
				lenient_bignum(card.ability.extra.triggers),
				lenient_bignum(card.ability.extra.gain),
			},
		}
	end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			card.ability.extra.triggers = card.ability.extra.triggers - 1
			context.other_card.ability.bonus = (context.other_card.ability.bonus or 0)
				+ context.other_card:get_chip_bonus() * (card.ability.extra.xchip_mod - 1)
			if card.ability.extra.triggers <= 0 and not context.blueprint then
				card.ability.extra.xchip_mod = lenient_bignum(card.ability.extra.xchip_mod)
					+ lenient_bignum(card.ability.extra.gain)
				card.ability.extra.immutable.trig_reset = card.ability.extra.immutable.trig_reset * 2
				card.ability.extra.triggers = card.ability.extra.immutable.trig_reset
				card_eval_status_text(card, "extra", nil, nil, nil, {
					message = localize("k_upgrade_ex"),
					colour = G.C.BLUE,
				})
				return {
					message = localize("k_upgrade_ex"),
					colour = G.C.BLUE,
					card = card,
				}
			else
				return {
					message = localize("k_upgrade_ex"),
					colour = G.C.BLUE,
					card = context.other_card,
				}
			end
		end
	end,
	ascxentr_credits = {
		idea = {
			"MarioFan597",
		},
		art = {
			"MarioFan597",
		},
		code = {
			"MarioFan597",
			"Ruby",
		},
	},
})
