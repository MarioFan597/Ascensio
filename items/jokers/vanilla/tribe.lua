SMODS.Joker({
	key = "tribe",
	config = { extra = { power = 2, } },
	rarity = "cry_exotic",
	atlas = "v_atlas_1",
	pos = { x = 9, y = 3 },
	soul_pos = { x = 11, y = 3, extra = { x = 10, y = 3 } },
	cost = 50,
	order = 135,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { card and lenient_bignum(card.ability.extra.power)} }
	end,
	calculate = function(self, card, context)
		if --The card transformation apspect of this was taken and modifed in part from the Waterfall Joker from the Celesete Card Collection
			context.before and context.poker_hands ~= nil and next(context.poker_hands["Flush"])
		then
			for _, pair in ipairs(context.poker_hands["Flush"]) do
				card.ability.extra.power = card.ability.extra.power + card.ability.extra.gain
			end
			return {
					extra = { focus = card, message = localize("k_upgrade_ex") },
					card = card,
					colour = G.C.DARK_EDITION,
				}
		end
		if (context.joker_main and context.poker_hands ~= nil and next(context.poker_hands["Flush"])) or context.forcetrigger then
			return {
				message = localize({
					type = "variable",
					key = "a_powmult",
					vars = { lenient_bignum(card.ability.extra.power) },
				}),
				Emult_mod = lenient_bignum(card.ability.extra.power),
				colour = G.C.DARK_EDITION,
				}
		end
	end,
	asc_credits = {
		idea = {
			"hssr96",
		},
		art = {
			"Oinite12",
		},
		code = {
			"MarioFan597",
			"Glitchkat10",
		},
	},
})
