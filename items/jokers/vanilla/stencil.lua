SMODS.Joker {
	key = "stencil",
	config = { extra = { mult = 0, mult_gain = 1, joker_slots = 0, slot_gain = 1 } },
	rarity = "cry_exotic",
	atlas =  "v_atlas_1",
	blueprint_compat = true,
	demicoloncompat = true,
	pos = { x = 9, y = 2 },
	soul_pos = { x = 11, y = 2, extra = { x = 10, y = 2 } },
	cost = 50,
	order = 17,
	loc_vars = function(self, info_queue, card)
		return { vars = { card and lenient_bignum(card.ability.extra.mult), card and lenient_bignum(card.ability.extra.mult_gain), card and lenient_bignum(card.ability.extra.joker_slots), card and lenient_bignum(card.ability.extra.slot_gain) } }
	end,
	calculate = function(self, card, context)
		if (context.end_of_round and context.cardarea == G.jokers and not context.blueprint and not context.retrigger_joker) or context.forcetrigger then
			card.ability.extra.mult = ((G.jokers.config.card_limit - #G.jokers.cards) * lenient_bignum(card.ability.extra.mult_gain)) + lenient_bignum(card.ability.extra.mult)
			card_eval_status_text(card, "extra", nil, nil, nil, {
					message = localize("k_upgrade_ex"),
					colour = G.C.MULT,
				})
		end

		if (context.ending_shop) or context.forcetrigger then
			card.ability.extra.joker_slots = lenient_bignum(card.ability.extra.joker_slots) + lenient_bignum(card.ability.extra.slot_gain)
			G.jokers.config.card_limit = G.jokers.config.card_limit + lenient_bignum(card.ability.extra.slot_gain)
			card_eval_status_text(card, "extra", nil, nil, nil, {
					message = localize("k_upgrade_ex"),
					colour = G.C.DARK_EDITION,
				})
		end
		if (context.joker_main) or context.forcetrigger then
			if card.ability.extra.mult > 0 then
				return {
					message = localize({
						type = "variable",
						key = "a_xmult",
						vars = {
							number_format(lenient_bignum(card.ability.extra.mult)),
						},
					}),
					Xmult_mod = lenient_bignum(card.ability.extra.mult),
					colour = G.C.MULT,
				}
			end
		end
	end,
	add_to_deck = function(self, card, from_debuff)
 		if G.jokers and not from_debuff then
			card.ability.extra.mult = ((G.jokers.config.card_limit - #G.jokers.cards) * lenient_bignum(card.ability.extra.mult_gain))
			G.jokers.config.card_limit = G.jokers.config.card_limit + lenient_bignum(card.ability.extra.joker_slots)
		end
	end,
	remove_from_deck = function(self, card, from_debuff)
		if G.jokers and not from_debuff then
			G.jokers.config.card_limit = G.jokers.config.card_limit - lenient_bignum(card.ability.extra.joker_slots)
		end
	end,
	asc_credits = {
			idea = {
				"UTNerd24",
				"Glitchkat10"
			},
			art = {
				"Tatteredlurker"
			},
			code = {
				"MarioFan597"
			}
	},
}