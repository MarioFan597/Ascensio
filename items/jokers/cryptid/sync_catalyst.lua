SMODS.Atlas({
	key = "sync_catalyst",
	path = "sync_catalyst.png",
	px = 71,
	py = 95,
})

local function balance_sound()
	play_sound("gong", 0.94, 0.3)
	play_sound("gong", 1.41, 0.2)
end

SMODS.Joker({
	key = "sync_catalyst",
	atlas = "sync_catalyst",

	pos = { x = 0, y = 0 },
	soul_pos = { x = 0, y = 6, extra = { x = 0, y = 1 } },
	rarity = "cry_exotic",
	cost = 50,

	blueprint_compat = false,
	demicoloncompat = true,

	animation = {
		macro = {
			type = "skim",
			soul_pos_extra = {
				include = { { x1 = 0, y1 = 1, x2 = 9, y2 = 5 } },
			},
		},
	},

	config = {
		extra = {
			immutable = {
				emult = 1,
				echips = 1,
			},
		},
	},

	loc_vars = function(_, _, card)
		return {
			vars = {
				card.ability.extra.immutable.emult,
				card.ability.extra.immutable.echips,
			},
		}
	end,

	calculate = function(_, card, context)
		if context.joker_main or context.forcetrigger then
			return {
				emult = card.ability.extra.immutable.emult,
				echips = card.ability.extra.immutable.echips,
			}
		end

		if context.final_scoring_step then
			if SMODS.get_scoring_parameter ~= nil and type(SMODS.get_scoring_parameter) == "function" then
				local balanced = (
					SMODS.get_scoring_parameter("chips", false)
					or 0 + SMODS.get_scoring_parameter("mult", false)
					or 0
				) / 2

				mult, hand_chips = balanced, balanced
				update_hand_text({ delay = 0 }, { chips = hand_chips, mult = mult })
			else
				local balanced = (mult + hand_chips) / 2
				mult, hand_chips = balanced, balanced
				update_hand_text({ delay = 0 }, { chips = hand_chips, mult = mult })
			end

			G.E_MANAGER:add_event(Event({
				func = function()
					-- scored_card:juice_up()
					play_sound("gong", 0.94, 0.3)
					play_sound("gong", 0.94 * 1.5, 0.2)
					play_sound("tarot1", 1.5)
					ease_colour(G.C.UI_CHIPS, { 0.8, 0.45, 0.85, 1 })
					ease_colour(G.C.UI_MULT, { 0.8, 0.45, 0.85, 1 })
					G.E_MANAGER:add_event(Event({
						trigger = "after",
						blockable = false,
						blocking = false,
						delay = 0.8,
						func = function()
							ease_colour(G.C.UI_CHIPS, G.C.BLUE, 0.8)
							ease_colour(G.C.UI_MULT, G.C.RED, 0.8)
							return true
						end,
					}))
					G.E_MANAGER:add_event(Event({
						trigger = "after",
						blockable = false,
						blocking = false,
						no_delete = true,
						delay = 1.3,
						func = function()
							G.C.UI_CHIPS[1], G.C.UI_CHIPS[2], G.C.UI_CHIPS[3], G.C.UI_CHIPS[4] =
								G.C.BLUE[1], G.C.BLUE[2], G.C.BLUE[3], G.C.BLUE[4]
							G.C.UI_MULT[1], G.C.UI_MULT[2], G.C.UI_MULT[3], G.C.UI_MULT[4] =
								G.C.RED[1], G.C.RED[2], G.C.RED[3], G.C.RED[4]
							return true
						end,
					}))
					return true
				end,
			}))

			return {
				message = "Balanced!",
				colour = G.C.DARK_EDITION,
				func = balance_sound,
			}
		end

		if context.setting_blind then
			local balance1 = (G.GAME.current_round.hands_left + card.ability.extra.immutable.echips) / 2
			G.GAME.current_round.hands_left = balance1
			card.ability.extra.immutable.echips = balance1

			local balance2 = (G.GAME.current_round.discards_left + card.ability.extra.immutable.emult) / 2
			G.GAME.current_round.discards_left = balance2
			card.ability.extra.immutable.emult = balance2

			return {
				message = "Balanced!",
				colour = G.C.DARK_EDITION,
				func = balance_sound,
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
