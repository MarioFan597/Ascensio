SMODS.Joker({
	key = "dna",
	config = { extra = { copies = 10, immutable = { max_copies = 40 } } },
	rarity = "cry_exotic",
	atlas = "v_atlas_1",
	blueprint_compat = true,
	demicoloncompat = true,
	pos = { x = 0, y = 3 },
	soul_pos = { x = 2, y = 3, extra = { x = 1, y = 3 } },
	cost = 50,
	order = 51,
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card and lenient_bignum(card.ability.extra.copies),
				card and lenient_bignum(card.ability.extra.immutable.max_copies),
			},
		}
	end,
	calculate = function(self, card, context)
		if context.first_hand_drawn then
			local eval = function()
				return G.GAME.current_round.hands_played == 0
			end
			juice_card_until(card, eval, true)
		end
		if
			(context.joker_main and G.GAME.current_round.hands_played == 0 and #context.full_hand == 1)
			or context.forcetrigger
		then
			local _card = copy_card(context.full_hand[1], nil, nil, G.playing_card)

			G.E_MANAGER:add_event(Event({
				trigger = "before",
				delay = 0.75,
				func = function()
					for k, v in pairs(G.hand.cards) do
						if
							not (
								v.base.suit == _card.base.suit
								and v.base.value == _card.base.value
								and v.config.center == _card.config.center
								and v.seal == _card.seal
							)
						then
							G.E_MANAGER:add_event(Event({
					            trigger = 'after',
					            delay = 0.2,
					            func = function()
					                SMODS.destroy_cards(v)
					                return true
					            end
					        }))
						else
							v:set_edition(_card.edition)
						end
					end
					return true
				end,
			}))
			for _ = 1, to_number(math.min(card.ability.extra.immutable.max_copies, card.ability.extra.copies - 1)) do
				--G.playing_card = (G.playing_card and G.playing_card + 1) or 1
				G.E_MANAGER:add_event(Event({
					trigger = "before",
					delay = 0.4,
					func = function()
						card:juice_up(0.3, 0.4)
						G.playing_card = (G.playing_card and G.playing_card + 1) or 1
						local _card = copy_card(context.full_hand[1], nil, nil, G.playing_card)
						_card:start_materialize()
						_card:add_to_deck()
						G.deck.config.card_limit = G.deck.config.card_limit + 1
						table.insert(G.playing_cards, _card)
						G.hand:emplace(_card)
						playing_card_joker_effects({ _card })
						return true
					end,
				}))
			end
			G.hand:emplace(_card)
			return {
				message = localize("k_copied_ex"),
				colour = G.C.CHIPS,
				card = self,
				playing_cards_created = { true },
			}
		end
	end,
	asc_credits = {
		idea = {
			"Lexi",
			"Tatteredlurker",
		},
		art = {
			"Tatteredlurker",
		},
		code = {
			"Math",
			"Mario",
		},
	},
})
