SMODS.Joker({
	key = "lusty",
	config = { extra = { e_mult = 1.2, odds = 2, rep = 1, immutable = { max_rep = 40 } } },
	rarity = "cry_exotic",
	atlas = "v_atlas_1",
	blueprint_compat = true,
	pos = { x = 3, y = 4 },
	soul_pos = { x = 5, y = 4, extra = { x = 4, y = 4 } },
	cost = 50,
	order = 3,
	loc_vars = function(self, info_queue, card)
		local num, denom = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, "Exotic Lusty Joker")
		return {
			vars = {
				lenient_bignum(card.ability.extra.e_mult),
				num,
				denom,
				math.min(card.ability.extra.rep, card.ability.extra.immutable.max_rep),
				card.ability.extra.immutable.max_rep,
			},
		}
	end,
	calculate = function(_, card, context)
		if context.repetition and context.cardarea == G.play and not context.repetition_only then
			local hearts = {}
			local my_pos
			for i, v in ipairs(context.scoring_hand) do
				if v == context.other_card then
					my_pos = i
				end
				if v:is_suit("Hearts") then
					hearts[i] = v
				end
			end
			local first_card =
				SMODS.pseudorandom_probability(card, "Heartache", 1, card.ability.extra.odds, "Exotic Lusty Joker")
			local second_card =
				SMODS.pseudorandom_probability(card, "Cardiac Arrest", 1, card.ability.extra.odds, "Exotic Lusty Joker")
			if
				table.contains(hearts, context.other_card)
				and (hearts[my_pos + 1] or hearts[my_pos - 1])
				and first_card
				and my_pos == (0 or #context.scoring_hand)
			then
			elseif
				table.contains(hearts, context.other_card)
				and (hearts[my_pos + 1] and hearts[my_pos - 1])
				and (first_card and second_card)
			then
				return {
					repetitions = to_number(math.min(card.ability.extra.immutable.max_rep, card.ability.extra.rep * 2)),
				}
			elseif
				table.contains(hearts, context.other_card)
				and (hearts[my_pos + 1] or hearts[my_pos - 1])
				and (first_card or second_card)
			then
				return {
					repetitions = to_number(math.min(card.ability.extra.immutable.max_rep, card.ability.extra.rep)),
				}
			end
		end
		if
			(context.individual and context.cardarea == G.play and context.other_card:is_suit("Hearts"))
			or context.forcetrigger
		then
			return {
				message = localize({
					type = "variable",
					key = "a_powmult",
					vars = { lenient_bignum(card.ability.extra.e_mult) },
				}),
				Emult_mod = lenient_bignum(card.ability.extra.e_mult),
				colour = G.C.DARK_EDITION,
			}
		end
	end,
	asc_credits = {
		idea = {
			"Lexi",
			"Lil Mr. Slipstream",
		},
		art = {
			"MarioFan597",
		},
		code = {
			"Somethingcom515",
			"MarioFan597",
			"Glitchkat10",
		},
	},
})
