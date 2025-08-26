SMODS.Atlas({
	key = "square",
	path = "jokers/vanilla/square.png",
	px = 71,
	py = 71,
})

SMODS.Joker({
	key = "square",
	config = { extra = { gain = 0.004, chips = 1 } },
	rarity = "cry_exotic",
	atlas = "square",
	blueprint_compat = true,
	demicoloncompat = true,
	pos = { x = 0, y = 0 },
	soul_pos = { x = 0, y = 1, extra = { x = 1, y = 0 } },
	display_size = { w = 1 * 71, h = 0.75 * 95 },
	--pixel_size = { w =  1 * 71, h = 1 * 71},
	cost = 50,
	order = 1,
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card and lenient_bignum(card.ability.extra.gain),
				card and lenient_bignum(card.ability.extra.chips),
			},
		}
	end,
	calculate = function(self, card, context)
		if
			context.cardarea == G.jokers
			and context.before
			and #context.full_hand == 4
			and not context.blueprint
			and not context.retrigger_joker
		then
			card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.gain
			return {
				extra = { message = localize("k_upgrade_ex"), colour = G.C.DARK_EDITION },
			}
		end
		if context.joker_main or context.forcetrigger then
			if card.ability.extra.chips > 1 then
				return {
					message = "^^" .. lenient_bignum(card.ability.extra.chips) .. " Chips",
					EEchip_mod = lenient_bignum(card.ability.extra.chips),
					colour = G.C.DARK_EDITION,
					card = card,
				}
			end
		end
	end,
	animation = {
		macro = {
			type = "skim",
			soul_pos = {
				include = { { x1 = 0, x2 = 5, y1 = 1, y2 = 10 } },
				exclude = { { x1 = 3, x2 = 5, y1 = 10, y2 = 10 } },
				timing = { 1 },
				is_periodic = true,
			},
		},
	},
	asc_credits = {
		idea = {
			"UTNerd24 (Name)",
			"Googol1e308plex",
		},
		art = {
			"Tatteredlurker",
		},
		code = {
			"MarioFan597",
		},
	},
})
