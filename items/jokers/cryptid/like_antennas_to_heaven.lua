SMODS.Atlas({
	key = "like_antennas_to_heaven",
	path = "like_antennas_to_heaven.png",
	px = 71,
	py = 95,
})

SMODS.Joker({
	key = "like_antennas_to_heaven",
	config = { extra = { chips = 1, gain = 0.01 } },
	rarity = "cry_exotic",
	atlas = "like_antennas_to_heaven",
	blueprint_compat = true,
	demicoloncompat = true,
	pos = { x = 0, y = 0 },
	soul_pos = { x = 1, y = 0, extra = { x = 0, y = 1 } },
	cost = 50,
	order = 216,
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card and lenient_bignum(card.ability.extra.gain),
				card and lenient_bignum(card.ability.extra.chips),
			},
		}
	end,
	animation = {
		macro = {
			type = "skim",
			soul_pos = {
				include = { { x1 = 1, x2 = 4, y1 = 0, y2 = 1 } },
				exclude = { { x1 = 0, x2 = 0, y1 = 0, y2 = 1 } },
			},
		},
	},
	calculate = function(self, card, context) --Taken in part from roffeltro's thanks for the primes joker
		if context.cardarea == G.jokers and context.before and not context.blueprint or context.forcetrigger then
			if #context.scoring_hand >= 1 then
				local number_count = 0
				for _, c in pairs(context.full_hand) do
					local id = c:get_id()
					if id == 7 or id == 4 then
						number_count = number_count + 1
					end
				end
				if number_count > 0 then
					card.ability.extra.chips = card.ability.extra.chips + (card.ability.extra.gain * number_count)
					card_eval_status_text(card, "extra", nil, nil, nil, {
						message = localize("k_upgrade_ex"),
						colour = G.C.DARK_EDITION,
					})
				end
			end
		end
		if context.joker_main or context.forcetrigger then
			if card.ability.extra.chips > 1 then
				return {
					Echip_mod = lenient_bignum(card.ability.extra.chips),
					message = localize({
						type = "variable",
						key = "a_powchips",
						vars = { lenient_bignum(card.ability.extra.chips) },
					}),
				}
			end
		end
	end,
	asc_credits = {
		idea = {
			"Oinite(name)",
			"hssr96",
			"Adrianinoninja",
		},
		art = {
			"Oinite12",
		},
		code = {
			"MarioFan597",
		},
	},
})
