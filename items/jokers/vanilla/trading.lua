SMODS.Joker {
	key = "trading",
	config = { extra = { mult = 0, chips} },
	rarity = "cry_exotic",
	atlas = "trading_card",
	blueprint_compat = true,
	pos = { x = 0, y = 0 },
	soul_pos = { x = 2, y = 0, extra = { x = 1, y = 0 } },
	cost = 50,
	order = 1,
	loc_vars = function(self, info_queue, card)
		return { vars = { card and card.ability.extra.mult } }
	end,
	calculate = function(self, card, context)
	if context.joker_main then
			if card.ability.extra.mult > 0 then
				return {
					mult_mod = math.min(card.ability.extra.mult, Global_Cap),
					message = localize { type = "variable", key = "a_mult", vars = { math.min(card.ability.extra.mult, Global_Cap) } }
				}
			end
		end
	end,
	asc_credits = {
			idea = {
				"Inspector_B"
			},
			art = {
				"MarioFan597"
			},
			code = {
				"MarioFan597"
			}
	},
}