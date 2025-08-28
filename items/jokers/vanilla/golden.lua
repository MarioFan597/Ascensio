SMODS.Joker({
	key = "golden",
	config = { extra = { gold = 2, gain = 1, odds = 7 } },
	rarity = "cry_exotic",
	atlas = "v_atlas_1",
	blueprint_compat = false,
	demicoloncompat = true,
	pos = { x = 0, y = 2 },
	soul_pos = { x = 2, y = 2, extra = { x = 1, y = 2 } },
	cost = 50,
	order = 90,
	loc_vars = function(self, info_queue, card)
		local num, denom = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, "Exotic Golden Joker")
		return {
			vars = {
				num,
				lenient_bignum(card.ability.extra.gold),
				lenient_bignum(card.ability.extra.gain),
				denom,
			},
		}
	end,
	calc_dollar_bonus = function(self, card)
		if card.ability.extra.gold > 1 then
			if
				SMODS.pseudorandom_probability(card, "mooooooooonside", 1, card.ability.extra.odds, "Exotic Golden Joker")
			then
				SMODS.scale_card(card, {
					ref_table = card.ability,
					ref_value = "gold",
					scalar_value = "gain",
					message_colour = G.C.MONEY,
				})
				card_eval_status_text(
					card,
					"extra",
					nil,
					nil,
					nil,
					{ message = localize("k_upgrade_ex"), colour = G.C.GOLD }
				)
			end
			return (lenient_bignum(card.ability.extra.gold) * (to_number(G.GAME.dollars) or 0))
		end
	end,
	calculate = function(self, card, context)
		if context.forcetrigger then
			ease_dollars(G.GAME.dollars * lenient_bignum(card.ability.extra.gold))
			return { message = "X" .. lenient_bignum(card.ability.extra.gold), colour = G.C.MONEY }
		end
	end,
	asc_credits = {
		idea = {
			"yahooyowza",
			"UTNerd24",
		},
		art = {
			"MarioFan597",
		},
		code = {
			"MarioFan597",
		},
	},
})
