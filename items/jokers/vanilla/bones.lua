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
			eechips_gain = 0.02,
			active = true,
			percentage = 10,
			immutable = { beaten = 3, requirement = 3 },
		},
	},

	loc_vars = function(_, _, card)
		return {
			vars = {
				card.ability.extra.percentage,
				lenient_bignum(card.ability.extra.eechips_gain),
				card.ability.extra.active and localize("k_active_ex") or localize("asc_inactive"),
				lenient_bignum(card.ability.extra.eechips),
				card.ability.extra.immutable.requirement,
				card.ability.extra.immutable.beaten,
			},
		}
	end,

	calculate = function(self, card, context) --I belive omega grabbed and modifed this from VanillaRemade
		if (context.joker_main or context.forcetrigger) and card.ability.extra.eechips > 1 then
			return {
				message = "^^" .. lenient_bignum(card.ability.extra.eechips) .. " " .. localize("asc_chips"),
				EEchip_mod = lenient_bignum(card.ability.extra.eechips),
				colour = G.C.DARK_EDITION,
				card = card,
			}
		end

		if context.end_of_round and context.main_eval and not card.ability.extra.active and not context.game_over then
			if card.ability.extra.immutable.beaten < (card.ability.extra.immutable.requirement - 1) then
				card.ability.extra.immutable.beaten = card.ability.extra.immutable.beaten + 1
			else
				card.ability.extra.immutable.beaten = card.ability.extra.immutable.beaten + 1
				card.ability.extra.active = true
			end
		end

		if (context.end_of_round and context.game_over and context.main_eval) or context.forcetrigger then
			card.ability.extra.eechips = card.ability.extra.eechips + card.ability.extra.eechips_gain
			SMODS.scale_card(card, {
				ref_table = card.ability.extra,
				ref_value = "eechips",
				scalar_value = "eechips_gain",
				no_message = true,
			})
			card_eval_status_text(card, "extra", nil, nil, nil, {
				message = localize("k_upgrade_ex"),
				colour = G.C.DARK_EDITION,
			})

			if
				(
					context.game_over
					and (to_number(G.GAME.chips) / (to_number(G.GAME.blind.chips)) >= card.ability.extra.percentage / 100)
					and card.ability.extra.active
				) or context.forcetrigger
			then
				if not context.forcetrigger then
					card.ability.extra.immutable.beaten = 0
				end
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
					saved = "asc_saved_by_bones",
					colour = G.C.RED,
				}
			end
		end
	end,
	asc_credits = {
		idea = {
			"OmegaLife",
			"Crabus",
		},
		art = {
			"thje_axolotl",
		},
		code = {
			"OmegaLife",
			"MarioFan597",
		},
	},
})
