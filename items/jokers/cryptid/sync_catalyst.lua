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

local balance_chip_mult

-- Ok so on newer SMODS, the balance chips & mult are broken when you have exponentiations and stuffs.
-- This provides a fix until smods update the balance effect.
--
-- This should detects whether or not we should use the (temporary) fix or not.
-- MarioFan597 please dont delete this (at least until the next stable Smods)
if SMODS.get_scoring_parameter and type(SMODS.get_scoring_parameter) == "function" then
	-- This is ripped straight from SMODS.
	balance_chip_mult = function()
		local balanced = (
			SMODS.get_scoring_parameter("chips", false)
			or 0 + SMODS.get_scoring_parameter("mult", false)
			or 0
		) / 2

		mult, hand_chips = balanced, balanced

		update_hand_text({ delay = 0 }, { chips = hand_chips, mult = mult })

		G.E_MANAGER:add_event(Event({

			func = function()
				balance_sound()
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

		return nil, true
	end
else
	-- This will simply uses SMODS's implementation instead
	balance_chip_mult = function()
		return {
			balance = true,
		}
	end
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

			emult = 0,
			echips = 0,
		},
	},

	loc_vars = function(_, _, card)
		return {
			vars = {
				card.ability.extra.emult,
				card.ability.extra.echips,
			},
		}
	end,

	calculate = function(_, card, context)
		if context.joker_main or context.forcetrigger then
			return {
				echips = card.ability.extra.echips,
				emult = card.ability.extra.emult,
			}
		end

		if context.final_scoring_step then
			return balance_chip_mult()
		end

		if context.setting_blind and not context.blueprint then
			G.E_MANAGER:add_event(Event({
				func = function()
					local balance1 = (G.GAME.current_round.hands_left + card.ability.extra.echips) / 2
					ease_hands_played(-(G.GAME.current_round.hands_left - balance1), nil, true)
					card.ability.extra.echips = balance1

					local balance2 = (G.GAME.current_round.discards_left + card.ability.extra.emult) / 2
					ease_discard(-(G.GAME.current_round.discards_left - balance2), nil, true)
					card.ability.extra.emult = balance2

					card_eval_status_text(card, "extra", nil, nil, nil, {
						message = "Balanced!",
						colour = G.C.DARK_EDITION,
						func = balance_sound,
					})
					return true
				end,
			}))
			return nil, true
		end

		if context.end_of_round and not (context.individual or context.repetition or context.blueprint) then
			card.ability.extra.echips = 0
			card.ability.extra.emult = 0
			card_eval_status_text(card, "extra", nil, nil, nil, {
				message = localize("k_reset"),
				colour = G.C.DARK_EDITION,
			})
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
