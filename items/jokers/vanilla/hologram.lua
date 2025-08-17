SMODS.Atlas({
	key = "hologram",
	path = "hologram.png",
	px = 71,
	py = 95,
})

SMODS.Joker({
	key = "hologram",
	rarity = "cry_exotic",
	atlas = "hologram",
	blueprint_compat = true,
	demicoloncompat = true,
	cost = 50,

	pos = { x = 0, y = 0 },
	soul_pos = { x = 0, y = 8, extra = { x = 0, y = 4 } },

	animation = {
		macro = {
			type = "skim",
			pos = {
				include = { { x1 = 0, y1 = 0, x2 = 19, y2 = 3 } },
			},
			soul_pos = {
				include = { { x1 = 0, y1 = 4, x2 = 19, y2 = 7 } },
			},
			soul_pos_extra = {
				include = { { x1 = 0, y1 = 8, x2 = 19, y2 = 11 } },
			},
		},
	},

	config = {
		extra = {
			emult = 1,
			gain = 0.2,
			dup = 1,

			card = {
				has_card = false,
				enhancement = nil,
				edition = nil,
				rank = nil,
				suit = nil,
				seal = nil,
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
				card.ability.immutable.maxdup,
			},
		}
	end,

	calculate = function(self, card, context)
		local rank
		local suit
		local edition
		local enhancement
		local seal
		if context.individual and context.cardarea == G.play and context.other_card ~= nil then
			card.ability.extra.card.rank = context.other_card.base.value
			card.ability.extra.card.suit = context.other_card.base.suit
			card.ability.extra.card.edition = context.other_card.edition
			card.ability.extra.card.enhancement = context.other_card.config.center.key
			card.ability.extra.card.seal = context.other_card.seal
			card.ability.extra.card.has_copy = true
		end

		if context.first_hand_drawn then
			local cards = {}
			if card.ability.extra.card.has_copy then
				for _ = 1, math.min(card.ability.immutable.maxdup, lenient_bignum(card.ability.extra.dup)) do
					G.E_MANAGER:add_event(Event({
						trigger = "before",
						delay = 0.4,
						func = function()
							G.playing_card = (G.playing_card and G.playing_card + 1) or 1
							local _card = SMODS.create_card({
								set = "Base",
								rank = card.ability.extra.card.rank,
								suit = card.ability.extra.card.suit,
								enhancement = card.ability.extra.card.enhancement,
								edition = card.ability.extra.card.edition,
								seal = card.ability.extra.card.seal,
							})
							_card:start_materialize()
							_card:add_to_deck()
							G.deck.config.card_limit = G.deck.config.card_limit + 1
							table.insert(G.playing_cards, _card)
							G.hand:emplace(_card)
							playing_card_joker_effects({ _card })
							return true
						end,
					}))
				end
				return {
					message = localize("k_duplicated_ex"),
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
		end

		if (context.playing_card_added and not context.blueprint) or context.forcetrigger then
			for i = 1, #context.cards do
				card.ability.extra.emult = lenient_bignum(card.ability.extra.emult)
					+ lenient_bignum(card.ability.extra.gain)
				return {
					message = localize({
						type = "variable",
						key = "a_powmult",
						vars = {
							number_format(lenient_bignum(card.ability.extra.emult)),
						},
					}),
					colour = G.C.DARK_EDITION,
				}
			end
		end

		if context.remove_playing_cards and not context.blueprint then
			for i = 1, #context.removed do
				card.ability.extra.emult = lenient_bignum(card.ability.extra.emult)
					+ lenient_bignum(card.ability.extra.gain)
				return {
					message = localize({
						type = "variable",
						key = "a_powmult",
						vars = {
							number_format(lenient_bignum(card.ability.extra.emult)),
						},
					}),
					colour = G.C.DARK_EDITION,
				}
			end
		end

		if (context.joker_main or context.forcetrigger) and card.ability.extra.emult > 1 then
			return {
				message = localize({
					type = "variable",
					key = "a_powmult",
					vars = { card.ability.extra.emult },
				}),
				colour = G.C.DARK_EDITION,
				Emult_mod = card.ability.extra.emult,
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
