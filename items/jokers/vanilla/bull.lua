SMODS.Joker {
	key = "bull",
	config = { extra = { chips = 1, gain = 0.01 } },
	rarity = "cry_exotic",
	atlas = "v_atlas_1",
	blueprint_compat = true,
	demicoloncompat = true,
	pos = { x = 3, y = 5 },
	soul_pos = { x = 5, y = 5, extra = { x = 4, y = 5 } },
	cost = 50,
	order = 1,
	loc_vars = function(self, info_queue, card)
		return { vars = { card and lenient_bignum(card.ability.extra.chips), card and lenient_bignum(card.ability.extra.gain) } }
	end,
	calculate = function(self, card, context)
	card.ability.extra.chips = 1
	card.ability.extra.chips = lenient_bignum(card.ability.extra.chips) + (to_number(G.GAME.dollars) * lenient_bignum(card.ability.extra.gain))
	if (context.joker_main) or context.forcetrigger then
			if card.ability.extra.chips > 0 then
				return {
					Echip_mod = lenient_bignum(card.ability.extra.chips),
					message = localize { type = "variable", key = "a_powchips", vars = { lenient_bignum(card.ability.extra.chips) } }
				}
			end
		end
	end,
	asc_credits = {
			idea = {
				"TheOfficialfem"
			},
			art = {
				"unexian",
				"MarioFan597"
			},
			code = {
				"MarioFan597"
			}
	},
}