SMODS.Joker({
	key = "mr_bones",

	pos = { x = 3, y = 13 },
	soul_pos = { x = 5, y = 13, extra = { x = 4, y = 13 } },

	rarity = "cry_exotic",
	atlas = "v_atlas_1",

	blueprint_compat = true,
	demicoloncompat = true,

	cost = 50,
	order = 255,

	config = {
		extra = {
			eechips = 1,
			eechips_gain = 0.2,
			active = true,
			percentage = 10,
			immutable = { beaten = 0, requirement = 3 },
		},
	},

	loc_vars = function(_, _, card)
		return {
			vars = {
				card.ability.extra.percentage,
				card.ability.extra.eechips_gain,
				card.ability.extra.active and "active" or "inactive",
				card.ability.extra.eechips,
				card.ability.extra.immutable.requirement,
				card.ability.extra.immutable.beaten,
			},
		}
	end,

	calculate = function(_, card, context)
		if context.joker_main then
			return {
				eechips = card.ability.extra.eechips,
				message = localize({
					type = "variable",
					key = "a_eechips",
					vars = { card.ability.extra.eechips },
				}),
			}
		end

		if context.blind_defeated and context.main_eval and not card.ability.extra.active then
			if card.ability.extra.immutable.beaten < card.ability.extra.immutable.requirement then
				card.ability.extra.immutable.beaten = card.ability.extra.immutable.beaten + 1
			else
				card.ability.extra.immutable.beaten = 0
				card.ability.extra.active = true
			end
		end

		if context.end_of_round and context.game_over and context.main_eval or context.forcetrigger then
			card.ability.extra.eechips = card.ability.extra.eechips + card.ability.extra.eechips_gain

			card_eval_status_text(card, "extra", nil, nil, nil, {
				message = localize("k_upgrade_ex"),
				colour = G.C.DARK_EDITION,
			})

			if
				(
					context.game_over
					and (G.GAME.chips / G.GAME.blind.chips >= card.ability.extra.percentage / 100)
					and card.ability.extra.active
				) or context.forcetrigger
			then
				G.E_MANAGER:add_event(Event({
					func = function()
						G.hand_text_area.blind_chips:juice_up()
						G.hand_text_area.game_chips:juice_up()
						play_sound("tarot1")
						card.ability.extra.active = false
						return true
					end,
				}))

				return {
					message = localize("k_saved_ex"),
					saved = "ph_mr_bones",
					colour = G.C.RED,
				}
			end
		end
	end,
})
