SMODS.Joker({
	key = "ice_cream",
	rarity = "cry_exotic",
	atlas = "v_atlas_1",
	blueprint_compat = true,
	demicoloncompat = true,
	pos = { x = 6, y = 9 },
	soul_pos = { x = 8, y = 9, extra = { x = 7, y = 9 } },
	cost = 50,

	config = { extra = { chips = to_big(1), flag = false } },

	loc_vars = function(_, _, card)
		if card.ability.extra.flag then
			return {
				vars = {
					card.ability.extra.chips,
				},
			}
		else
			return {
				vars = { 1 },
			}
		end
	end,

	calculate = function(_, card, context)
		if context.before then
			card.ability.extra.flag = true
			card.ability.extra.chips = card.ability.extra.chips * 2

			card_eval_status_text(
				card,
				"extra",
				nil,
				nil,
				nil,
				{ message = localize("k_upgrade_ex"), colour = G.C.DARK_EDITION }
			)
		end

		if context.joker_main then
			return {
				chips = card.ability.extra.chips,
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
