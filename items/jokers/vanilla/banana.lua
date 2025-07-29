SMODS.Joker({
	key = "banana",
	config = { extra = { xmult = 15, xmult_gain = 2.5, probability_denum = 64 } },
	rarity = "cry_exotic",
	atlas = "v_atlas_1",
	blueprint_compat = true,
	demicoloncompat = true,
	pos = { x = 3, y = 8 },
	soul_pos = { x = 5, y = 8, extra = { x = 4, y = 8 } },
	cost = 50,
	order = 3,
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				lenient_bignum(card.ability.extra.xmult),
				lenient_bignum(card.ability.extra.xmult_gain),
				cry_prob(card.ability.cry_prob, lenient_bignum(card.ability.extra.probability_denum), card.ability.cry_rigged),
				lenient_bignum(card.ability.extra.probability_denum),
			},
		}
	end,
	calculate = function(self, card, context)
		

		if context.joker_main or context.forcetrigger then
			return {
				message = localize({
					type = "variable",
					key = "a_xmult",
					vars = { number_format(lenient_bignum(card.ability.extra.xmult)) },
				}),
				Xmult_mod = lenient_bignum(card.ability.extra.xmult),
				colour = G.C.MULT,
			}
		end

		if context.end_of_round 
			and not (context.individual 
			or context.repetition 
			or context.blueprint) 
		then
			if
				pseudorandom("ooooooooooh banana")
				< cry_prob(card.ability.cry_prob, card.ability.extra.probability_denum, card.ability.cry_rigged)
					/ card.ability.extra.probability_denum
				and #G.jokers.cards
				and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit
				and not (context.blueprint
				or context.repetition
				or context.retrigger_joker_check 
				or context.retrigger_joker)
			then
				local roundcreatejoker = math.min(1, G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer))
				G.GAME.joker_buffer = G.GAME.joker_buffer + roundcreatejoker
					card_eval_status_text(
					card,
					"extra",
					nil,
					nil,
					nil,
					{ message = localize("asc_banana_ex"), colour = G.C.MONEY })
				G.E_MANAGER:add_event(Event({
					func = function()
						local _card = copy_card(card, nil, nil, nil, card.edition and card.edition.negative)
						_card:set_edition(card.edition)
						_card:add_to_deck()
						G.jokers:emplace(_card)
						_card:start_materialize()
						G.GAME.joker_buffer = 0
						return true
					end,
				}))

				--card_eval_status_text(card, "extra", nil, nil, nil, { message = localize("k_duplicated_ex") })
				return nil, true
			else
				card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_gain

				return {
					message = localize("k_upgrade_ex"),
					colour = G.C.MULT,
				}
			end
		end
	end,
	asc_credits = {
		idea = { "OmegaLife" },
		art = { "Lil Mr. Slipstream" },
		code = { "OmegaLife"},
	},
})
