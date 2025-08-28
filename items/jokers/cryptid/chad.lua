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
		extra = { retriggers = 2, slot_gain = 1, base_retriggers = 2, immutable = { max_retriggers = 100, slots = 0 } },
	},

	loc_vars = function(_, _, card)
		return {
			vars = {
				math.min(
					lenient_bignum(card.ability.extra.retriggers),
					lenient_bignum(card.ability.extra.immutable.max_retriggers)
				),
				lenient_bignum(card.ability.extra.immutable.max_retriggers),
				lenient_bignum(card.ability.extra.slot_gain),
				lenient_bignum(card.ability.extra.immutable.slots),
				card.ability.extra.base_retriggers,
			},
		}
	end,

	calculate = function(self, card, context)
		card.ability.extra.retriggers = math.min(
			((G.jokers.config.card_limit - #G.jokers.cards) + card.ability.extra.base_retriggers),
			card.ability.extra.immutable.max_retriggers
		)
		if (context.ending_shop or context.forcetrigger) and not context.blueprint then
			card.ability.extra.immutable.slots = card.ability.extra.immutable.slots + card.ability.extra.slot_gain
			SMODS.scale_card(card, {
				ref_table = card.ability.extra.immutable,
				ref_value = "slots",
				scalar_table = {gain = (card.ability.extra.slot_gain)},
				scalar_value = "gain",
			})
			G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.slot_gain
			card_eval_status_text(card, "extra", nil, nil, nil, {
				message = localize("k_upgrade_ex"),
				colour = G.C.DARK_EDITION,
			})
		end

		if context.retrigger_joker_check and not context.retrigger_joker and context.other_card ~= self then
			if context.other_card == G.jokers.cards[1] or context.other_card == G.jokers.cards[#G.jokers.cards] then
				return {
					message = localize("k_again_ex"),
					repetitions = math.min(
						lenient_bignum(card.ability.extra.retriggers),
						lenient_bignum(card.ability.extra.immutable.max_retriggers)
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
