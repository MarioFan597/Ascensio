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
		extra = { emult = 1, gain = 0.05, dup = 1 },
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
			card.ability.extra.emult = card.ability.extra.emult + card.ability.extra.gain
			return {
				message = localize("k_upgrade_ex"),
				colours = G.C.DARK_EDITION,
			}
		end

		if context.individual or context.forcetrigger then
			local cards = {}

			for _ = 1, math.min(lenient_bignum(card.ability.extra.dup), card.ability.immutable.maxdup) do
				G.playing_card = (G.playing_card and G.playing_card + 1) or 1
				local new = copy_card(context.other_card, nil, nil, G.playing_card)
				new:add_to_deck()
				table.insert(G.playing_cards, copy_card)
				table.insert(cards, new)
				G.hand:emplace(new)
				new.states.visible = nil

				G.E_MANAGER:add_event(Event({
					func = function()
						new:start_materialize()
						return true
					end,
				}))
			end

			G.E_MANAGER:add_event(Event({
				func = function()
					context.other_card:start_dissolve({ HEX("57ecab") }, nil, 1.6)
					play_sound("slice1", 0.96 + math.random() * 0.08)
					return true
				end,
			}))

			return {
				message = "Duplicated!",
				colour = G.C.SECONDARY_SET.Enhanced,
				func = function()
					for _ = 1, math.min(lenient_bignum(card.ability.extra.dup), card.ability.immutable.maxdup) do
						G.E_MANAGER:add_event(Event({
							func = function()
								G.deck.config.card_limit = G.deck.config.card_limit + 1
								return true
							end,
						}))
						draw_card(G.play, G.deck, 90, "up")
						SMODS.calculate_context({ playing_card_added = true, cards = cards })
					end
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
