SMODS.Joker {
	key = "scary",
	config = { extra = { power = 1.25 } },
	rarity = "cry_exotic",
	atlas =  "v_atlas_1",
	blueprint_compat = true,
	demicoloncompat = true,
	pos = { x = 6, y = 1 },
	soul_pos = { x = 8, y = 1, extra = { x = 7, y = 1 } },
	cost = 50,
	order = 33,
	loc_vars = function(self, info_queue, card)
		return { vars = { card and card.ability.extra.power } }
	end,
	calculate = function(self, card, context)
		if (context.cardarea == G.play and context.individual) or context.forcetrigger then
			if (context.other_card:is_face()) or context.forcetrigger then
				return {
					message = localize({ type = "variable", key = "a_powchips", vars = { card.ability.extra.power } }),
					Echip_mod = math.min(card.ability.extra.power, Global_Cap),
					colour = G.C.DARK_EDITION,
				}
			end
		end
	end,
	asc_credits = {
			idea = {
				"TheOfficialfem"
			},
			art = {
				"MarioFan597"
			},
			code = {
				"MarioFan597"
			}
	},
}