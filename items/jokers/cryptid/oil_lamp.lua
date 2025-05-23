SMODS.Joker {
	key = "oil_lamp", --This is mostly just taken straight from oil lamp's code
	pos = { x = 3, y = 0 },
	soul_pos = { x = 5, y = 0, extra = { x = 4, y = 0 } },
	config = { extra = { increase = 1.2 } },
	rarity = "cry_exotic",
	cost = 50,
	order = 277,
	blueprint_compat = false,
	demicoloncompat = true,
	atlas = "c_atlas_1",
	loc_vars = function(self, info_queue, card)
		card.ability.blueprint_compat_ui = card.ability.blueprint_compat_ui or ""
		card.ability.blueprint_compat_check = nil
		return {
			vars = { card.ability.extra.increase },
		}
	end,
	calculate = function(self, card, context)
		if (context.end_of_round and not context.repetition and not context.individual and not context.blueprint) or context.forcetrigger then
			local check = false
			for i = 1, #G.jokers.cards do
				if not (G.jokers.cards[i] == card) then
						if not Card.no(G.jokers.cards[i], "immutable", true) then
							check = true
							Cryptid.with_deck_effects(G.jokers.cards[i], function(cards)
								Cryptid.misprintize(
									cards,
									{ min = card.ability.extra.increase, max = card.ability.extra.increase },
									nil,
									true
								)
							end)
					end
				end
			end
			if check then
				card_eval_status_text(
					card,
					"extra",
					nil,
					nil,
					nil,
					{ message = localize("k_upgrade_ex"), colour = G.C.GREEN }
				)
			end
		end
	end,
	asc_credits = {
		idea = {
			"MarioFan597",
		},
		art = {
			"MarioFan597",
		},
		code = {
			"Foegro",
			"MarioFan597",
		},
	},
}