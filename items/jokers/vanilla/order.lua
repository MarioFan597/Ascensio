SMODS.Joker {
	key = "order",
	config = { extra = { e_mult = 3 } },
	rarity = "cry_exotic",
	atlas =  "v_atlas_1",
	pos = { x = 6, y = 3 },
	soul_pos = { x = 8, y = 3, extra = { x = 7, y = 3 } },
	cost = 50,
	order = 134,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.e_mult } }
	end,
	calculate = function(self, card, context)
		if (context.joker_main) or context.forcetrigger then
			if (context.poker_hands ~= nil and next(context.poker_hands["Straight"])) or context.forcetrigger then
			return {
				message = localize({
					type = "variable",
					key = "a_powmult",
					vars = {
						number_format(card.ability.extra.e_mult),
					},
				}),
				Emult_mod = math.min(card.ability.extra.e_mult, Global_Cap),
				colour = G.C.DARK_EDITION,
			}
			end
		end
	end,
	asc_credits = {
			idea = {
				"hssr96"
			},
			art = {
				"Oinite12"
			},
			code = {
				"Glitchkat10"
			}
		},
}