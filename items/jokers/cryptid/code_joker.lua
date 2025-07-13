SMODS.Atlas({
	key = "code_joker",
	path = "code_joker.png",
	px = 71,
	py = 95,
})


SMODS.Joker({
	key = "code_joker",
	config = { extra = { multiuse = 1, gain = 1} },
	rarity = "cry_exotic",
	atlas = "code_joker",
	blueprint_compat = true,
	demicoloncompat = true,
	pos = { x = 0, y = 1 },
	soul_pos = { x = 0, y = 0, extra = { x = 0, y = 3 } },
	cost = 50,
	order = 1,
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = { key = "e_negative_consumable", set = "Edition", config = { extra = 1 } }
		return { vars = { card and lenient_bignum(card.ability.extra.multiuse), card and lenient_bignum(card.ability.extra.gain) } }
	end,
	calculate = function(self, card, context)
		if
			context.setting_blind
			and not (context.blueprint_card or self).getting_sliced
		then
				G.E_MANAGER:add_event(Event({
				trigger = "after",
				func = function()
						play_sound("timpani")
						local _card = create_card("Code", G.consumeables, nil, nil, nil, nil)
						_card:set_edition({
							negative = true,
						})
						if card.ability.extra.multiuse > 1 then
							_card.ability.cry_multiuse = card.ability.extra.multiuse
						end
						_card:add_to_deck()
						G.consumeables:emplace(_card)
						_card:juice_up(0.3, 0.5)
					return true
				end,
			}))
		end
		if
			((context.end_of_round and G.GAME.blind.boss) and not (context.individual or context.repetition or context.blueprint))
		then
			card.ability.extra.multiuse = card.ability.extra.multiuse + card.ability.extra.gain
			card_eval_status_text(card, "extra", nil, nil, nil, {
					message = localize("k_upgrade_ex"),
					colour = G.C.CODE,
				})
		end
		if context.forcetrigger then
			card.ability.extra.cards = card.ability.extra.cards + card.ability.extra.gain
			card_eval_status_text(card, "extra", nil, nil, nil, {
					message = localize("k_upgrade_ex"),
					colour = G.C.CODE,
				})
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				func = function()
					for i = 1, card.ability.extra.cards do
						play_sound("timpani")
						local card = create_card("Code", G.consumeables, nil, nil, nil, nil)
						card:set_edition({
							negative = true,
						})
						in_pool = function(self, args)
  							return true, {allow_duplicates = true}
						end
						card:add_to_deck()
						G.consumeables:emplace(card)
						card:juice_up(0.3, 0.5)
					end
					return true
				end,
			}))
		end
	end,
	animation = {
		macro = {
			type = "skim",
			pos = {
				include = { { x1 = 0, x2 = 6, y1 = 1, y2 = 2 } },
				exclude = { { x1 = 6, x2 = 6, y1 = 2, y2 = 2 }},

			},
			soul_pos_extra = {
				include = { { x1 = 0, x2 = 6, y1 = 3, y2 = 6 } },
			},
		},
	},
	asc_credits = {
		idea = {
			"wilfredlam0418",
			"MarioFan597"
		},
		art = {
			"MarioFan597",
			"Grahkon",
			"thje_axolotl",
		},
		code = {
			"MarioFan597",
		},
	},
})
