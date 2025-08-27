SMODS.Atlas({
	key = "seance",
	path = "jokers/vanilla/seance.png",
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
			amount = 1,
			hand_type = "High Card",
			pool = {},
			odds = 2048,

			immutable = {
				std_odds = 2048,
			},
		},
	},

	loc_vars = function(_, _, card)
		return {
			vars = {
				card.ability.extra.amount,
				card.ability.extra.hand_type,
				cry_prob(card.ability.cry_prob, lenient_bignum(card.ability.extra.odds), card.ability.cry_rigged),
				card.ability.extra.odds,
			},
		}
	end,

	add_to_deck = function(_, card, _)
		for _, v in pairs(G.P_CENTER_POOLS.Consumeables) do
			if v.hidden and type(v.key) == "string" then
				table.insert(card.ability.extra.pool, v.key)
			end
		end
	end,

	calculate = function(_, card, context)
		if
			(context.before and context.main_eval and context.scoring_name == card.ability.extra.hand_type)
			or context.forcetrigger
		then
			if
				pseudorandom("future_knowledge" .. G.SEED)
				< cry_prob(card.ability.cry_prob, card.ability.extra.odds, card.ability.cry_rigged)
					/ card.ability.extra.odds
			then
				card.ability.extra.odds = card.ability.extra.immutable.std_odds
				for _ = 1, card.ability.extra.amount do
					local speccard = pseudorandom_element(card.ability.extra.pool, "j_asc_seance" .. G.SEED)

					G.E_MANAGER:add_event(Event({
						func = function()
							delay(0.4)
							SMODS.add_card({ key = speccard, edition = "e_negative" })
							return true
						end,
					}))
				end
			else
				card.ability.extra.odds = card.ability.extra.odds / 2
				return {
					message = "The World is not here...",
					colour = G.C.FILTER,
				}
			end
		end

		if context.end_of_round and context.main_eval and not context.game_over and not context.blueprint then
			local hands = {}

			for k, _ in pairs(G.GAME.hands) do
				if SMODS.is_poker_hand_visible(k) and k ~= card.ability.extra.hand_type then
					table.insert(hands, k)
				end
			end

			card.ability.extra.hand_type = pseudorandom_element(hands, "seed_seance" .. G.SEED)
			return {
				message = localize("k_reset"),
				colour = G.C.DARK_EDITION,
			}
		end
	end,

	set_ability = function(self, card, initial, delay_sprites) --Taken from vanilla remade to do list
		local _poker_hands = {}
		for handname, _ in pairs(G.GAME.hands) do
			if SMODS.is_poker_hand_visible(handname) and handname ~= card.ability.extra.hand_type then
				_poker_hands[#_poker_hands + 1] = handname
			end
		end
		card.ability.extra.hand_type = pseudorandom_element(_poker_hands, "the_future_is_now" .. G.SEED)
	end,

	asc_credits = {
		idea = {
			"OmegaLife",
			"MarioFan597",
		},
		art = {
			"Tatteredlurker",
		},
		code = {
			"OmegaLife",
		},
	},
})
