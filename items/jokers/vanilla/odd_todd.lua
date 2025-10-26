SMODS.Joker({
	key = "odd_todd",
	rarity = "cry_exotic",
	atlas = "v_atlas_1",
	blueprint_compat = true,
	demicoloncompat = true,
	pos = { x = 9, y = 8 },
	soul_pos = { x = 11, y = 8, extra = { x = 10, y = 8 } },
	cost = 50,
	order = 5,

	config = { extra = { chip = 3, bonus_chip = 7 } },

	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.chip,
				card.ability.extra.bonus_chip,
			},
		}
	end,

	calculate = function(self, card, context)
		if context.individual or context.forcetrigger then
			if
				(
					context.cardarea == G.play
					and (
						context.other_card:get_id() == 3
						or context.other_card:get_id() == 5
						or context.other_card:get_id() == 7
						or context.other_card:get_id() == 9
						or context.other_card:get_id() == 14
					)
				) or context.forcetrigger
			then
				if #context.full_hand % 2 ~= 0 then
					return {
						message = localize({
							type = "variable",
							key = "a_xchips",
							vars = { card.ability.extra.bonus_chip },
						}),
						Xchip_mod = card.ability.extra.bonus_chip,
						colour = G.C.CHIPS,
					}
				else
					return {
						message = localize({
							type = "variable",
							key = "a_xchips",
							vars = { card.ability.extra.chip },
						}),
						Xchip_mod = card.ability.extra.chip,
						colour = G.C.CHIPS,
					}
				end
			end
		end
	end,
	asc_credits = {
		idea = {
			"MarioFan597",
			"TheOfficialfem",
		},
		art = {
			"Lil Mr. Slipstream",
		},
		code = {
			"MarioFan597",
		},
	},
})
