SMODS.Joker {
	key = "stencil",
	config = { extra = { mult = 0, mult_gain = 1, joker_slots = 0, slot_gain = 1 } },
	rarity = "cry_exotic",
	atlas =  "v_atlas_1",
	blueprint_compat = true,
	pos = { x = 9, y = 2 },
	soul_pos = { x = 11, y = 2, extra = { x = 10, y = 2 } },
	cost = 50,
	order = 17,
	loc_vars = function(self, info_queue, card)
		return { vars = { card and card.ability.extra.mult,  card and card.ability.extra.mult_gain, card and card.ability.extra.joker_slots, card and card.ability.extra.slot_gain } }
	end,
	calculate = function(self, card, context)
		if context.end_of_round and context.cardarea == G.jokers and not context.blueprint and not context.retrigger_joker then
			card.ability.extra.mult = ((G.jokers.config.card_limit - #G.jokers.cards) * card.ability.extra.mult_gain) + card.ability.extra.mult
			card_eval_status_text(card, "extra", nil, nil, nil, {
					message = localize("k_upgrade_ex"),
					colour = G.C.MULT,
				})
		end

		if context.ending_shop then
			card.ability.extra.joker_slots = card.ability.extra.joker_slots + card.ability.extra.slot_gain
			G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.slot_gain
			card_eval_status_text(card, "extra", nil, nil, nil, {
					message = localize("k_upgrade_ex"),
					colour = G.C.DARK_EDITION,
				})
		end
		if context.joker_main then
			return {
				message = localize({
					type = "variable",
					key = "a_xmult",
					vars = {
						number_format(card.ability.extra.mult),
					},
				}),
				Xmult_mod = to_big(card.ability.extra.mult),
				colour = G.C.MULT,
			}
		end
	end,
	add_to_deck = function(self, card, from_debuff)
 		if G.jokers and not from_debuff then
			card.ability.extra.mult = ((G.jokers.config.card_limit - #G.jokers.cards) * card.ability.extra.mult_gain)
			G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.joker_slots
		end
	end,
	remove_from_deck = function(self, card, from_debuff)
		if G.jokers and not from_debuff then
			G.jokers.config.card_limit = G.jokers.config.card_limit - card.ability.extra.joker_slots
		end
	end,
	cry_credits = {
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