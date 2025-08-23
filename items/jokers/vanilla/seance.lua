---@param pat string
---@return boolean
function string:startswith(pat)
	return string.sub(self, 1, string.len(pat)) == pat
end

SMODS.Atlas({
	key = "seance",
	path = "seance.png",
	px = 71,
	py = 95,
})

SMODS.Joker({
	key = "seance",
	rarity = "cry_exotic",
	atlas = "seance",
	blueprint_compat = true,
	demicoloncompat = true,
	pos = { x = 0, y = 0 },
	soul_pos = { x = 0, y = 5, extra = { x = 0, y = 1 } },

	animation = {
		macro = {
			type = "skim",
			soul_pos_extra = {
				include = { { x1 = 0, y1 = 1, x2 = 9, y2 = 4 } },
				exclude = { { x1 = 1, y1 = 4, x2 = 9, y2 = 4 } },
			},
		},
	},

	cost = 50,
	order = 23,

	config = {
		extra = {
			hand_type = "High Card",
			pool = {},
		},
	},

	loc_vars = function(_, _, card)
		return {
			vars = {
				card.ability.extra.hand_type,
			},
		}
	end,

	add_to_deck = function(_, card, _)
		for k, v in pairs(G.P_CENTER_POOLS.Consumeables) do
			if type(k) == "string" and k:startswith("c_") and v.hidden then
				table.insert(card.ability.extra.pool, k)
			end
		end
	end,

	calculate = function(_, card, context)
		if
			(context.before and context.main_eval and context.scoring_name == card.ability.extra.hand_type)
			or context.forcetrigger
		then
			local speccard = pseudorandom_element(card.ability.extra.pool, os.clock() .. "")

			G.E_MANAGER:add_event(Event({
				func = function()
					delay(0.4)
					SMODS.add_card({ key = speccard })
					return true
				end,
			}))

			return {
				message = localize(speccard) .. "Created!",
				colour = G.C.FILTER,
			}
		end

		if context.end_of_round and context.main_eval and not context.game_over and not context.blueprint then
			local hands = {}

			for k, _ in pairs(G.GAME.hands) do
				if SMODS.is_poker_hand_visible(k) and k ~= card.ability.extra.hand_type then
					table.insert(hands, k)
				end
			end

			card.ability.extra.hand_type = pseudorandom_element(hands, "seed_seance")
			return {
				message = localize("k_reset"),
				colour = G.C.DARK_EDITION,
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
