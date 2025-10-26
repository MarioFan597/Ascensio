SMODS.Atlas({
	key = "oops_all_6s",
	path = "jokers/vanilla/oops_all_6s.png",
	px = 71,
	py = 95,
})

SMODS.Joker({
	key = "oops",
	config = { extra = { slot_gain = 1, immutable = { joker_slots = 0, consumable_slots = 0 } } },
	rarity = "cry_exotic",
	atlas = "oops_all_6s",
	blueprint_compat = false,
	demicoloncompat = false,
	pos = { x = 0, y = 0 },
	soul_pos = { x = 1, y = 0, extra = { x = 0, y = 1 } },
	cost = 50,
	order = 126,
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = { key = "cry_rigged", set = "Other" }
		info_queue[#info_queue + 1] = { key = "asc_fixed", set = "Other" }
		local num, denom = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, "Exotic Oops", true)
		return {
			vars = {
				card and lenient_bignum(card.ability.extra.slot_gain),
				card and lenient_bignum(card.ability.extra.immutable.joker_slots),
				card and lenient_bignum(card.ability.extra.immutable.consumable_slots),
				--num,
				--denom
			},
		}
	end,

	animation = {
		macro = {
			type = "skim",
			soul_pos = {
				include = { { x1 = 1, x2 = 4, y1 = 0, y2 = 1 } },
			},
		},
	},

	calculate = function(self, card, context)
		if context.before and not context.blueprint_card and not context.retrigger_joker and not context.repetition then
			--This is directly borrowed/altered from kalidescope
			local selected_joker = math.random(1, #G.jokers.cards)
			local eligiblejokers = {}
			for k, v in pairs(G.jokers.cards) do
				if v.ability.set == "Joker" and not v.sticker and v ~= card then
					table.insert(eligiblejokers, v)
				end
			end
			if #eligiblejokers > 0 then
				local eligible_card =
					pseudorandom_element(eligiblejokers, pseudoseed("nevergonnagiveyouupnevergonnaletyoudown"))
				local sticker = { cry_rigged = true }
				eligible_card.ability.cry_rigged = true
				check_for_unlock({ type = "googol_play_rigged" })
			end
		end

		if
			context.cardarea == G.jokers
			and context.before
			and not context.blueprint_card
			and not context.retrigger_joker
		then
			local converted = false
			for i = 1, #context.scoring_hand do
				local _card = context.scoring_hand[i]
				converted = true
				local enhancement = "cry_rigged"
				if _card.ability.cry_rigged ~= "Rigged" then
					_card.ability.cry_rigged = true
				end
				G.E_MANAGER:add_event(Event({
					delay = 0.6,
					func = function()
						_card:juice_up()
						play_sound("tarot1")
						return true
					end,
				}))
			end
			if converted then
				return { message = "Rigged!", colour = G.C.GREEN }
			end
		end

		if context.joker_main and not context.blueprint_card then
			if math.random(1, 6) == 1 then
				--if SMODS.pseudorandom_probability(card, "Issac and his Issac", 1, card.ability.extra.odds, "Exotic Oops", true) then
				if math.random(1, 2) == 1 then
					card.ability.extra.immutable.joker_slots = lenient_bignum(card.ability.extra.immutable.joker_slots)
						+ lenient_bignum(card.ability.extra.slot_gain)
					SMODS.scale_card(card, {
						ref_table = card.ability.extra.immutable,
						ref_value = "joker_slots",
						scalar_table = { gain = card.ability.extra.slot_gain },
						scalar_value = "gain",
						no_message = true,
					})
					G.jokers.config.card_limit = G.jokers.config.card_limit
						+ lenient_bignum(card.ability.extra.slot_gain)
				else
					SMODS.scale_card(card, {
						ref_table = card.ability.extra.immutable,
						ref_value = "consumable_slots",
						scalar_table = { gain = card.ability.extra.slot_gain },
						scalar_value = "gain",
						no_message = true,
					})
					G.consumeables.config.card_limit = G.consumeables.config.card_limit
						+ lenient_bignum(card.ability.extra.slot_gain)
				end
				card_eval_status_text(card, "extra", nil, nil, nil, {
					message = localize("k_upgrade_ex"),
					colour = G.C.DARK_EDITION,
				})
			else
				card_eval_status_text(card, "extra", nil, nil, nil, {
					message = localize("k_nope_ex"),
					colour = G.C.DARK_EDITION,
				})
			end
		end
	end,

	add_to_deck = function(self, card, from_debuff)
		if G.jokers and not from_debuff then
			G.jokers.config.card_limit = G.jokers.config.card_limit
				+ lenient_bignum(card.ability.extra.immutable.joker_slots)
			G.consumeables.config.card_limit = G.consumeables.config.card_limit
				+ lenient_bignum(card.ability.extra.immutable.consumable_slots)
		end
	end,

	remove_from_deck = function(self, card, from_debuff)
		if G.jokers and not from_debuff then
			G.jokers.config.card_limit = G.jokers.config.card_limit
				- lenient_bignum(card.ability.extra.immutable.joker_slots)
			G.consumeables.config.card_limit = G.consumeables.config.card_limit
				- lenient_bignum(card.ability.extra.immutable.consumable_slots)
		end
	end,

	asc_credits = {
		idea = {
			"UTNerd24",
			"hssr96",
			"MarioFan597",
		},
		art = {
			"MarioFan597",
		},
		code = {
			"MarioFan597",
			"Jevonn",
		},
	},
})
