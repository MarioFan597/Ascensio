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
			return {
				balance = true,
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
