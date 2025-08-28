SMODS.Joker({
	key = "greedy",
	config = { extra = { e_mult = 1.2, gain = 0.001 } },
	rarity = "cry_exotic",
	atlas = "v_atlas_1",
	blueprint_compat = true,
	demicoloncompat = true,
	pos = { x = 0, y = 4 },
	soul_pos = { x = 2, y = 4, extra = { x = 1, y = 4 } },
	cost = 50,
	order = 2,
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				lenient_bignum(card.ability.extra.e_mult),
				lenient_bignum(card.ability.extra.gain),
			},
		}
	end,
	calculate = function(self, card, context)
		if context.individual or context.forcetrigger then
			if (context.cardarea == G.play and context.other_card:is_suit("Diamonds")) or context.forcetrigger then
				return {
					message = localize({
						type = "variable",
						key = "a_powmult",
						vars = { lenient_bignum(card.ability.extra.e_mult) },
					}),
					Emult_mod = lenient_bignum(card.ability.extra.e_mult),
					colour = G.C.DARK_EDITION,
				}
			end
		end
	end,
	asc_credits = {
		idea = {
			"Lexi",
		},
		art = {
			"MarioFan597",
		},
		code = {
			"Glitchkat10",
		},
	},
})

local ease_dollars_hook = ease_dollars
function ease_dollars(mod, instant)
	ease_dollars_hook(mod, instant)
	if to_big(mod) > to_big(0) then
		local greed_jokers = SMODS.find_card("j_asc_greedy")
		for _, card in pairs(greed_jokers) do
			--card.ability.extra.e_mult = card.ability.extra.e_mult + (card.ability.extra.gain * mod)
			SMODS.scale_card(card, {
				ref_table = card.ability.extra,
				ref_value = "e_mult",
				scalar_table = { total = card.ability.extra.gain * mod },
				scalar_value = "total",
				message_key = "a_powmult",
				message_colour = G.C.DARK_EDITION,
			})
			return nil, true
		end
	end
end
