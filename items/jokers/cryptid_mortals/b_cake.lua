SMODS.Joker{
	key = "b_cake",
	config = { extra = { chips = 80, reroll = 20 } },
	rarity = 2,
	atlas = "c_atlas_mortal",
	blueprint_compat = true,
	demicoloncompat = true,
	pools = { ["Food"] = true },
	pos = { x = 0, y = 0 },
	cost = 8,
	order = 508,
	loc_vars = function(self, info_queue, card)
	return { vars = { card and lenient_bignum(card.ability.extra.chips), card and lenient_bignum(card.ability.extra.reroll) } }
	end,
	calculate = function(self, card, context)
	--Taken from crustulum

		if (context.reroll_shop and not context.blueprint) or context.forcetrigger then
			card.ability.extra.chips = lenient_bignum(card.ability.extra.chips) - lenient_bignum(card.ability.extra.reroll)
			if card.ability.extra.chips > 0 then
				--G.GAME.current_round.free_rerolls = G.GAME.current_round.free_rerolls + 1
				--calculate_reroll_cost(true)
				card_eval_status_text(card, "extra", nil, nil, nil, {
					card_eval_status_text(
					card,
					"extra",
					nil,
					nil,
					nil,
					{message =  "-" .. lenient_bignum(card.ability.extra.reroll), colour = G.C.CHIPS}
				)
				})
				return nil, true
			else
				-- This part plays the animation.
				G.E_MANAGER:add_event(Event({
					func = function()
						play_sound("tarot1")
						card.T.r = -0.2
						card:juice_up(0.3, 0.4)
						card.states.drag.is = true
						card.children.center.pinch.x = true
						-- This part destroys the card.
						G.E_MANAGER:add_event(Event({
							trigger = "after",
							delay = 0.3,
							blockable = false,
							func = function()
								G.jokers:remove_card(card)
								card:remove()
								card = nil
								return true;
							end
						}))
						return true
				end
				}))
				return {
					message = "Eaten!"
				}
			end
		end
		if (context.joker_main) or context.forcetrigger then
			if card.ability.extra.chips > 0 then
				return {
					chip_mod = lenient_bignum(card.ability.extra.chips),
					message = localize { type = "variable", key = "a_chips", vars = { lenient_bignum(card.ability.extra.chips) } }
				}
			end
		end
	end,
	add_to_deck = function(self, card, from_debuff)
		--This makes the reroll immediately after obtaining free because the game doesn't do that for some reason
		G.GAME.current_round.free_rerolls = G.GAME.current_round.free_rerolls + 1
		calculate_reroll_cost(true)
	end,
	remove_from_deck = function(self, card, from_debuff)
		calculate_reroll_cost(true)
	end,

	asc_credits = {
			idea = {
				"MarioFan597"
			},
			art = {
				"MarioFan597"
			},
			code = {
				"MarioFan597",
				"Jevonn"
			}
	},
}