SMODS.Joker {
	key = "golden",
	config = { extra = { gold = 2, gain = 1, odds = 7 } },
	rarity = "cry_exotic",
	atlas = "v_atlas_1",
	blueprint_compat = false,
	pos = { x = 0, y = 2 },
	soul_pos = { x = 2, y = 2, extra = { x = 1, y = 2 } },
	cost = 50,
	order = 90,
	loc_vars = function(self, info_queue, card)
		return { vars = { cry_prob(card.ability.cry_prob, card.ability.extra.odds, card.ability.cry_rigged), card and card.ability.extra.gold, card and card.ability.extra.gain, card and card.ability.extra.odds} }
	end,

	calc_dollar_bonus = function (self, card)
		if card.ability.extra.gold > 1 then
			if pseudorandom("moooooooooooonside") < cry_prob(card.ability.cry_prob, card.ability.extra.odds, card.ability.cry_rigged) / card.ability.extra.odds then
				card.ability.extra.gold = card.ability.extra.gold + card.ability.extra.gain
				card_eval_status_text(
					card,
					"extra",
					nil,
					nil,
					nil,
					{ message = localize("k_upgrade_ex"), colour = G.C.GOLD }
				)
			end
			return (card.ability.extra.gold * (to_number(G.GAME.dollars) or 0))
		end
	end,
	cry_credits = {
			idea = {
				"yahooyowza",
				"UTNerd24"
			},
			art = {
				"MarioFan597"
			},
			code = {
				"MarioFan597"
			}
	},
}