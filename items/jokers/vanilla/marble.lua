SMODS.Joker({
	key = "marble",
	rarity = "cry_exotic",
	atlas = "v_atlas_1",
	blueprint_compat = true,
	demicoloncompat = true,
	pos = { x = 3, y = 9 },
	soul_pos = { x = 5, y = 9, extra = { x = 4, y = 9 } },

	config = {
		extra = {
			echips = 1.5,
			retrigger = 3,
			create = 3,
		},

		immutable = {
			recap = 40,
			cacap = 8,
		},
	},

	loc_vars = function(_, _, card)
		return {
			vars = {
				lenient_bignum(math.min(card.ability.extra.retrigger, card.ability.immutable.recap)),
				lenient_bignum(card.ability.extra.echips),
				lenient_bignum(math.min(card.ability.extra.create, card.ability.immutable.cacap)),
			},
		}
	end,

	calculate = function(_, card, context)
		if
			context.repetition
			and context.cardarea == G.play
			and SMODS.has_enhancement(context.other_card, "m_stone")
		then
			return {
				message = localize("k_again_ex"),
				repetitions = to_number(math.min(card.ability.immutable.recap, card.ability.extra.retrigger)),
			}
		end

		if
			context.individual
			and context.cardarea == G.play
			and SMODS.has_enhancement(context.other_card, "m_stone")
		then
			return {
				message = localize({
					type = "variable",
					key = "a_powchips",
					vars = { number_format(card.ability.extra.echips) },
				}),
				Echip_mod = card.ability.extra.echips,
				colour = G.C.DARK_EDITION,
			}
		end

		if context.setting_blind then
			local stones = {}
			for _ = 1, to_number(math.min(card.ability.extra.create, card.ability.immutable.cacap)) do
				local stone = SMODS.add_card({
					set = "Playing Card",
					enhancement = "m_stone",
					edition = "e_cry_mosaic",
					seal = "Red",
					area = G.deck,
				})

				table.insert(stones, stone)
			end

			return {
				message = localize("k_plus_stone"),
				colour = G.C.SECONDARY_SET.Enhanced,
				func = function()
					SMODS.calculate_context({ playing_card_added = true, cards = stones })
				end,
			}
		end
	end,

	asc_credits = {
		idea = {
			"OmegaLife",
		},
		art = {
			"Tatteredlurker",
		},
		code = {
			"OmegaLife",
		},
	},
})
