SMODS.Joker({
	key = "hanging_chad",
	config = { extra = { retriggers = 0, hand_gain = 1, immutable = {max_rep = 200} } },
	rarity = "cry_exotic",
	atlas = "v_atlas_1",
	blueprint_compat = true,
	demicoloncompat = false,
	pos = { x = 6, y = 5 },
	soul_pos = { x = 8, y = 5, extra = { x = 7, y = 5 } },
	cost = 50,
	order = 115,
	loc_vars = function(self, info_queue, card)
		return { 
			vars = { 
			card and lenient_bignum(card.ability.extra.retriggers),
			card and lenient_bignum(card.ability.extra.hand_gain),
			card and lenient_bignum(card.ability.extra.immutable.max_rep)
			} 
		}
	end,
	calculate = function(self, card, context)
		card.ability.extra.retriggers = G.hand.config.card_limit
		if context.repetition and context.cardarea == G.play and (context.other_card == context.scoring_hand[1]) then
			return {
				message = localize("k_again_ex"),
				repetitions = to_number(
						math.min(card.ability.extra.immutable.max_rep, G.hand.config.card_limit)
					),
				card = card,
			}
		end
		if
			(
				context.end_of_round
				and G.GAME.blind.boss
				and not context.individual
				and not context.repetition
				and not context.blueprint
			) or context.forcetrigger
		then
			G.hand:change_size(card.ability.extra.hand_gain)
                return {
                    message = localize{type='variable',key='a_handsize',vars={card.ability.extra.hand_gain}},
               		colour = G.C.FILTER
           		}
		end
	end,
	asc_credits = {
		idea = {
			"MarioFan597",
		},
		art = {
			"Tatteredlurker",
		},
		code = {
			"Glitchkat10",
		},
	},
})
