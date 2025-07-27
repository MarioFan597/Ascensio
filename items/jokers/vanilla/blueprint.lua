SMODS.Atlas({
	key = "blueprint",
	path = "blueprint.png",
	px = 71,
	py = 95,
})

SMODS.Joker({
	key = "blueprint",
	config = { extra = {} },
	rarity = "cry_exotic",
	atlas = "blueprint",
	blueprint_compat = true,
	demicoloncompat = true,
	pos = { x = 0, y = 0 },
	soul_pos = { x = 0, y = 2, extra = { x = 0, y = 1 } },
	cost = 50,
	order = 123,

	animation = {
		macro = {
			type = "skim",
			soul_pos = {
				include = { { x1 = 0, x2 = 14, y1 = 2, y2 = 9 } },
				exclude = { { x1 = 5, x2 = 14, y1 = 9, y2 = 9 } },
			},
		},
	},

	--Taken from old blueprint and Chad
	calculate = function(self, card, context)
		local other_joker = nil
		local position = 1
		for i = 1, #G.jokers.cards do
			if G.jokers.cards[i] == card then
				other_joker = G.jokers.cards[i + 1]
				position = i
			end
		end
		if context.retrigger_joker_check and not context.retrigger_joker and other_joker ~= nil then
			local same_count = 0
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i].config.center.key == other_joker.config.center.key then
					same_count = same_count + 1
				end
			end
			if context.other_card == other_joker then
				return {
					message = localize("k_again_ex"),
					repetitions = same_count,
					card = card,
				}
			else
				return nil, true
			end
		end
		--Taken and modifed from Cryptid's smile (:D)
		if
			(
				context.ending_shop
				and not context.individual
				and not context.repetition
				and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit
				and #G.jokers.cards
				and other_joker ~= nil
			) or context.forcetrigger
			--and not position == #G.jokers.cards
		then
			local roundcreatejoker = math.min(1, G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer))
			G.GAME.joker_buffer = G.GAME.joker_buffer + roundcreatejoker
			G.E_MANAGER:add_event(Event({
				func = function()
					if other_joker and roundcreatejoker > 0 then
						local _card =
							copy_card(other_joker, nil, nil, nil, other_joker.edition and other_joker.edition.negative)
						_card:set_edition(other_joker.edition)
						_card:add_to_deck()
						G.jokers:emplace(_card)
						_card:start_materialize()
						G.GAME.joker_buffer = 0
					end
					return true
				end,
			}))
			card_eval_status_text(card, "extra", nil, nil, nil, { message = localize("k_duplicated_ex") })
			return nil, true
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
			"MarioFan597",
		},
	},
})
