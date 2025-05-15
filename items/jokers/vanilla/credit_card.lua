SMODS.Joker {
	key = "credit_card",
	config = { extra = { debt = 5000, chips = 1, gain = 0.002 } },
	rarity = "cry_exotic",
	atlas = "v_atlas_1",
	blueprint_compat = true,
	pos = { x = 3, y = 3 },
	soul_pos = { x = 5, y = 3, extra = { x = 4, y = 3 } },
	cost = 50,
	order = 20,
	loc_vars = function(self, info_queue, card)
		return { vars = { card and card.ability.extra.debt, card and card.ability.extra.chips, card and card.ability.extra.gain } }
	end,
	add_to_deck = function(self, card, from_debuff)
		G.GAME.bankrupt_at = G.GAME.bankrupt_at - card.ability.extra.debt
	end,
	remove_from_deck = function(self, card, from_debuff)
		G.GAME.bankrupt_at = G.GAME.bankrupt_at + card.ability.extra.debt
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			if (to_big(card.ability.extra.chips) > to_big(1)) then
				return {
					chip_mod = math.min(card.ability.extra.chips, Global_Cap),
					message = localize { type = "variable", key = "a_xchips", vars = { math.min(card.ability.extra.chips, Global_Cap) } }
				}
			end
		end
		if context.ending_shop and not context.individual and not context.repetition and not (context.blueprint_card or card).getting_sliced then
			local debt = to_big(G.GAME.dollars)
			if debt < to_big(0) then
				card.ability.extra.chips = card.ability.extra.chips + (card.ability.extra.gain * (-1 * debt))
				card_eval_status_text(card, "extra", nil, nil, nil, {
					message = localize("k_upgrade_ex"),
					colour = G.C.CHIPS,
				})
			end
		end
	end,
	asc_credits = {
			idea = {
				"UTNerd24",
				"MarioFan597"
			},
			art = {
				"Tatteredlurker"
			},
			code = {
				"MarioFan597"
			}
	},
}