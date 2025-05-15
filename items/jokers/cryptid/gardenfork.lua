SMODS.Joker {
	key = "gardenfork",
	config = { extra = { money = 1.7 } },
	rarity = "cry_exotic",
	atlas = "c_atlas_1",
	blueprint_compat = true,
	pos = { x = 6, y = 0 },
	soul_pos = { x = 8, y = 0, extra = { x = 7, y = 0 } },
	cost = 50,
	order = 216,
	loc_vars = function(self, info_queue, card)
		return { vars = { card and card.ability.extra.money } }
	end,
	calculate = function(self, card, context)
		if context.cardarea == G.jokers and context.before and context.full_hand then
			local has_ace = false
			local has_7 = false
			for i = 1, #context.full_hand do
				if context.full_hand[i]:get_id() == 14 then
					has_ace = true
				elseif context.full_hand[i]:get_id() == 7 then
					has_7 = true
				end
			end
			if (has_ace or has_7) and G.GAME.dollars > to_big(0) then
				ease_dollars(G.GAME.dollars * card.ability.extra.money)
				return { message = "X" .. card.ability.extra.money, colour = G.C.MONEY }
			end
		end
	end,
    asc_credits = {
			idea = {
				"Adrianinoninja"
			},
			art = {
				"Oinite12"
			},
			code = {
				"Jevonn",
				"MarioFan597"
			}
		},
}