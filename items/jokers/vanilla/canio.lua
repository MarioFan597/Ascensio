SMODS.Joker({
	key = "canio",
	config = { extra = { power = 1, gain = 1 } },
	rarity = "cry_exotic",
	atlas = "v_atlas_1",
	blueprint_compat = true,
	demicoloncompat = true,
	pos = { x = 3, y = 2 },
	soul_pos = { x = 5, y = 2, extra = { x = 4, y = 2 } },
	cost = 50,
	order = 146,

	loc_vars = function(_, _, card)
		return {
			vars = {
				card.ability.extra.power,
				card.ability.extra.gain,
			},
		}
	end,

	calculate = function(_, card, context)
		if
			(context.blueprint and context.remove_playing_cards and context.removed)
			or (context.remove_playing_cards and context.removed)
		then --Check if face cards are removed.
			local check = 0
			for _, _card in ipairs(context.removed) do
				if _card:is_face() then
					local replacement = copy_card(_card)
					_card:add_to_deck()
					table.insert(G.playing_cards, replacement)
					G.hand:emplace(replacement)
					playing_card_joker_effects({ replacement })
					if not context.blueprint then
						card.ability.extra.power = card.ability.extra.power + card.ability.extra.gain
						check = check + 1 --We need to do a check here instead of the return statement otherwise it wouldn't count every face card
					end
				end
			end
			if check > 0 then
				return {
					message = localize("k_upgrade_ex"),
					colour = G.C.DARK_EDITION,
					remove = true,
				}
			end
			if context.forcetrigger then
				card.ability.extra.power = card.ability.extra.power + card.ability.extra.gain
				return {
					message = localize("k_upgrade_ex"),
					colour = G.C.DARK_EDITION,
					remove = true,
				}
			end
		end
		if context.joker_main then
			if card.ability.extra.power > 1 then
				return {
					message = localize({
						type = "variable",
						key = "a_powmult",
						vars = { card.ability.extra.power },
					}),
					Emult_mod = card.ability.extra.power,
					colour = G.C.DARK_EDITION,
				}
			end
		end
	end,
	asc_credits = {
		idea = {
			"hssr96",
			"TheOfficialfem",
		},
		art = {
			"MarioFan597",
		},
		code = {
			"MarioFan597",
		},
	},
})
