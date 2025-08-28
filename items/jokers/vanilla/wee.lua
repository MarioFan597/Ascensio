SMODS.Joker({
	key = "wee",
	rarity = "cry_exotic",
	atlas = "v_atlas_1",
	blueprint_compat = false,
	demicoloncompat = true,

	pos = { x = 9, y = 13 },
	soul_pos = { x = 11, y = 13, extra = { x = 10, y = 13 } },

	cost = 50,

	config = {
		extra = {
			eechips = 1,
			eechips_gain = 0.0008,
		},
	},

	loc_vars = function(_, _, card)
		return {
			vars = {
				card.ability.extra.multiplier,
			},
		}
	end,

	calculate = function(_, card, context)
		if
			(
				context.individual
				and context.cardarea == G.play
				and context.other_card:get_id() == 2
				and not context.blueprint
			) or context.forcetrigger
		then
			SMODS.scale_card(card, {
				ref_table = card.ability.extra,
				ref_value = "eechips",
				scalar_value = "eechips_gain",
				operation = "+",
			})

			return {
				message = localize("k_upgrade_ex"),
				colour = G.C.CHIPS,
				message_card = card,
			}
		end

		if context.joker_main then
			return {
				message = "^^" .. card.ability.extra.eechips .. " " .. localize("asc_chips"),
				EEchip_mod = card.ability.extra.eechips,
				colour = G.C.DARK_EDITION,
				card = card,
			}
		end
	end,

	asc_credits = {
		idea = {
			"OmegaLife",
		},
		art = {
			"Lil Mr. Slipstream",
		},
		code = {
			"OmegaLife",
		},
	},
})
