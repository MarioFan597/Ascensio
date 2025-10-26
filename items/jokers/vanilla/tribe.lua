SMODS.Joker({
	key = "tribe",
	config = { extra = { e_mult = 2 } },
	rarity = "cry_exotic",
	atlas = "v_atlas_1",
	pos = { x = 9, y = 3 },
	soul_pos = { x = 11, y = 3, extra = { x = 10, y = 3 } },
	cost = 50,
	order = 135,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.e_mult) } }
	end,
	calculate = function(self, card, context)
		if --The card transformation apspect of this was taken and modifed in part from the Waterfall Joker from the Celesete Card Collection
			context.before
			and context.poker_hands ~= nil
			and next(context.poker_hands["Flush"])
		then
			local suit_count = {}
			for i = 1, #context.scoring_hand do
				local _card = context.scoring_hand[i]
				if suit_count[_card.base.suit] == nil then
					suit_count[_card.base.suit] = 1
				else
					suit_count[_card.base.suit] = suit_count[_card.base.suit] + 1
				end
			end
			if next(suit_count) ~= nil then
				local suit = next(suit_count)
				local most = suit_count[suit]

				for k, v in pairs(suit_count) do
					if suit_count[k] > most then
						suit, most = k, v
					end
				end
				return {
					G.E_MANAGER:add_event(Event({
						trigger = "immediate",
						func = function()
							for i = 1, #G.hand.cards do
								G.hand.cards[i]:change_suit(suit)
								G.hand.cards[i]:juice_up()
								play_sound("tarot1", 0.8, 0.4)
							end
							return true
						end,
					})),
				}
			end
		end
		if
			(context.joker_main and context.poker_hands ~= nil and next(context.poker_hands["Flush"]))
			or context.forcetrigger
		then
			return {
				message = localize({
					type = "variable",
					key = "a_powmult",
					vars = {
						number_format(lenient_bignum(card.ability.extra.e_mult)),
					},
				}),
				Emult_mod = lenient_bignum(card.ability.extra.e_mult),
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
			"MarioFan597",
			"Glitchkat10",
		},
	},
})
