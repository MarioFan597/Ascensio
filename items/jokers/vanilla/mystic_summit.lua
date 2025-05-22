SMODS.Joker {
	key = "mystic_summit",
	config = { extra = { mult = 1, gain = 0.25 } },
	rarity = "cry_exotic",
	atlas = "v_atlas_1",
	blueprint_compat = true,
	pos = { x = 9, y = 5 },
	soul_pos = { x = 11, y = 5, extra = { x = 10, y = 5 } },
	cost = 50,
	order = 23,
	loc_vars = function(self, info_queue, card)
		return { vars = { card and card.ability.extra.mult, card and card.ability.extra.gain } }
	end,
	calculate = function(self, card, context)
	if context.end_of_round and context.cardarea == G.jokers and not context.blueprint and not context.retrigger_joker then
		if G.GAME.current_round.discards_left == 0 then
			card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.gain
			card_eval_status_text(card, "extra", nil, nil, nil, {
					message = localize("k_upgrade_ex"),
					colour = G.C.DARK_EDITION,
				})
		end
	end
	if context.joker_main then
			if card.ability.extra.mult > 1 then
				return {
					message = localize { type = "variable", key = "a_powmult", vars = { math.min(card.ability.extra.mult, Global_Cap) } },
					Emult_mod = math.min(card.ability.extra.mult, Global_Cap),
					colour = G.C.DARK_EDITION,
				}
			end
		end
	end,
	asc_credits = {
			idea = {
				"TheOfficalFem"
			},
			art = {
				"Tatteredlurker"
			},
			code = {
				"MarioFan597"
			}
	},
}