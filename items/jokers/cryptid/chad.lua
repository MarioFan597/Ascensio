SMODS.Joker({
	key = "chad",
	order = 4,

	pos = { x = 9, y = 3 },
	soul_pos = { x = 11, y = 3, extra = { x = 10, y = 3 } },
	rarity = "cry_exotic",
	cost = 50,
	blueprint_compat = true,
	atlas = "c_atlas_1",

	config = {
		extra = { retriggers = 2, immutable = { slots = 0 }, slot_gain = 1 },
		immutable = { max_retriggers = 40 },
	},

	loc_vars = function(_, _, card)
		return {
			vars = {
				math.min(
					lenient_bignum(card.ability.extra.retriggers),
					lenient_bignum(card.ability.immutable.max_retriggers)
				),
				lenient_bignum(card.ability.extra.slot_gain),
				lenient_bignum(card.ability.extra.immutable.slots),
			},
		}
	end,

	calculate = function(self, card, context)
		if (context.ending_shop or context.forcetrigger) and not context.blueprint then
			card.ability.extra.immutable.slots = card.ability.extra.immutable.slots + card.ability.extra.slot_gain
			G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.slot_gain
			card.ability.extra.retriggers = math.min((G.jokers.config.card_limit - #G.jokers.cards), 40)
		end

		if context.retrigger_joker_check and not context.retrigger_joker and context.other_card ~= self then
			if context.other_card == G.jokers.cards[1] or context.other_card == G.jokers.cards[#G.jokers.cards] then
				return {
					message = localize("k_again_ex"),
					repetitions = math.min(
						lenient_bignum(card.ability.extra.retriggers),
						lenient_bignum(card.ability.immutable.max_retriggers)
					),
					card = card,
				}
			else
				return nil, true
			end
		end
	end,

	add_to_deck = function(_, card, from_debuff)
		if G.jokers and not from_debuff then
			G.jokers.config.card_limit = G.jokers.config.card_limit + lenient_bignum(card.ability.extra.immutable.slots)
		end
	end,

	remove_from_deck = function(_, card, from_debuff)
		if G.jokers and not from_debuff then
			G.jokers.config.card_limit = G.jokers.config.card_limit - lenient_bignum(card.ability.extra.immutable.slots)
		end
	end,

	asc_credits = {
		idea = {
			"OmegaLife",
		},
		art = {
			"Tatteredlurker",
		},
		code = {
			"OmegaLife",
		},
	},
})
