SMODS.Joker({
	key = "hologram",
	rarity = "cry_exotic",
	atlas = "v_atlas_1",
	blueprint_compat = true,
	demicoloncompat = true,
	pos = { x = 9, y = 9 },
	soul_pos = { x = 11, y = 9, extra = { x = 10, y = 9 } },
	cost = 50,

	config = {
		extra = {
			emult = 1,
			gain = 0.05,
			dup = 1,

			card = {
				enhancement = "m_stone",
				edition = "e_foil",
				rank = "2",
				suit = "S",
			},
		},
		immutable = { maxdup = 40 },
	},

	loc_vars = function(_, _, card)
		return {
			vars = {
				math.min(lenient_bignum(card.ability.extra.dup), card.ability.immutable.maxdup),
				card.ability.extra.gain,
				card.ability.extra.emult,
			},
		}
	end,

	calculate = function(self, card, context)
		if context.remove_playing_cards and not context.blueprint then
			local cards = 0
			for _, _ in ipairs(context.removed) do
				cards = cards + 1
			end

			if cards > 0 then
				card.ability.extra.emult = card.ability.extra.emult + cards * card.ability.extra.gain
				return {
					message = localize("k_upgrade_ex"),
					colours = G.C.DARK_EDITION,
				}
			end
		end

		if context.playing_card_added and not context.blueprint then
			local cards = 0
			for _, _ in ipairs(context.cards) do
				cards = cards + 1
			end

			if cards > 0 then
				card.ability.extra.emult = card.ability.extra.emult + cards * card.ability.extra.gain
				return {
					message = localize("k_upgrade_ex"),
					colours = G.C.DARK_EDITION,
				}
			end
		end

		if context.first_hand_drawn then
			local cards = {}

			for _ = 1, math.min(card.ability.immutable.maxdup, lenient_bignum(card.ability.extra.dup)) do
				local ducard = SMODS.add_card({
					set = "Base",

					enhancement = card.ability.extra.card.enhancement,
					edition = card.ability.extra.card.edition,
					rank = card.ability.extra.card.rank,
					suit = card.ability.extra.card.suit,
				})

				G.playing_card = (G.playing_card and G.playing_card + 1) or 1
				G.deck.config.card_limit = G.deck.config.card_limit + 1
				table.insert(cards, ducard)

				ducard.states.visible = nil
				G.E_MANAGER:add_event(Event({
					func = function()
						ducard:start_materialize()
						return true
					end,
				}))
			end

			return {
				message = "Created!",
				colour = G.C.CHIPS,
				func = function()
					G.E_MANAGER:add_event(Event({
						func = function()
							SMODS.calculate_context({ playing_card_added = true, cards = cards })
							return true
						end,
					}))
				end,
			}
		end

		if context.joker_main then
			return {
				message = localize({
					type = "variable",
					key = "a_powmult",
					vars = { card.ability.extra.emult },
				}),
				colours = G.C.DARK_EDITION,
				Emult_mod = card.ability.extra.emult,
			}
		end
	end,

	asc_credits = {
		idea = {
			"OmegaLife",
		},
		art = {
			"???",
		},
		code = {
			"OmegaLife",
		},
	},
})
