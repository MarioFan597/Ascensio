SMODS.Joker({
	key = "order",
	config = { extra = { power = 3 } },
	rarity = "cry_exotic",
	atlas = "v_atlas_1",
	pos = { x = 6, y = 3 },
	soul_pos = { x = 8, y = 3, extra = { x = 7, y = 3 } },
	cost = 50,
	order = 134,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { card and lenient_bignum(card.ability.extra.power) } }
	end,
	calculate = function(self, card, context)
		if --The card transformation apspect of this was taken and modifed in part from the Waterfall Joker from the Celesete Card Collection
			context.before
			and context.poker_hands ~= nil
			and next(context.poker_hands["Straight"])
		then
			return {
				G.E_MANAGER:add_event(Event({
					trigger = "immediate",
					func = function()
						for i = 1, #G.hand.cards do
							SMODS.change_base(
								G.hand.cards[i],
								_,
								context.scoring_hand[((i - 1) % #context.scoring_hand) + 1].base.value
							)
							G.hand.cards[i]:juice_up()
							play_sound("tarot1", 0.8, 0.4)
						end
						return true
					end,
				})),
			}
		end
		if
			(context.joker_main and context.poker_hands ~= nil and next(context.poker_hands["Straight"]))
			or context.forcetrigger
		then
			return {
				message = localize({
					type = "variable",
					key = "a_powmult",
					vars = { lenient_bignum(card.ability.extra.power) },
				}),
				Emult_mod = lenient_bignum(card.ability.extra.power),
				colour = G.C.DARK_EDITION,
			}
		end
	end,
	asc_credits = {
		idea = {
			"hssr96",
		},
		art = {
			"Oinite12",
		},
		code = {
			"Glitchkat10",
		},
	},
})
