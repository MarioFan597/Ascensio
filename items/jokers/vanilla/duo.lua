SMODS.Joker({
	key = "duo",
	config = { extra = { power = 2 } },
	rarity = "cry_exotic",
	atlas = "v_atlas_1",
	blueprint_compat = true,
	demicoloncompat = true,
	pos = { x = 9, y = 0 },
	soul_pos = { x = 11, y = 0, extra = { x = 10, y = 0 } },
	cost = 50,
	order = 131,
	loc_vars = function(self, info_queue, card)
		return { vars = { card and lenient_bignum(card.ability.extra.power) } }
	end,
	calculate = function(self, card, context)
		if --The card transformation apspect of this was taken and modifed in part from the Waterfall Joker from the Celesete Card Collection
			context.before
			and context.poker_hands ~= nil
			and next(context.poker_hands["Pair"])
		then
			local rank_count = {}
			for i = 1, #context.scoring_hand do
				local _card = context.scoring_hand[i]
				if rank_count[_card.base.value] == nil then
					rank_count[_card.base.value] = 1
				else
					rank_count[_card.base.value] = rank_count[_card.base.value] + 1
				end
			end
			if next(rank_count) ~= nil then
				local rank = next(rank_count)
				local most = rank_count[rank]

				for k, v in pairs(rank_count) do
					if rank_count[k] > most then
						rank, most = k, v
					end
				end

				return {
					G.E_MANAGER:add_event(Event({
						trigger = "immediate",
						func = function()
							for i = 1, #G.hand.cards do
								assert(SMODS.change_base(G.hand.cards[i], _, rank))
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
			(context.joker_main and context.poker_hands ~= nil and next(context.poker_hands["Pair"]))
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
			"MarioFan597",
		},
		art = {
			"MarioFan597",
		},
		code = {
			"MarioFan597",
		},
	},
})
