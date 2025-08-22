SMODS.Joker({
	key = "clever",
	rarity = "cry_exotic",
	atlas = "v_atlas_1",
	blueprint_compat = true,
	demicoloncompat = true,
	pos = { x = 6, y = 11 },
	soul_pos = { x = 8, y = 11, extra = { x = 7, y = 11 } },
	config = { extra = { Xchip = 1, Xchip_mod = 8, hand_type = "Two Pair" } },
	cost = 50,
	asc_credits = {
		idea = {
			"TheOfficalFem",
		},
		art = {
			"Tatteredlurker",
		},
		code = {
			"Somethingcom515",
		},
	},
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.Xchip_mod,
				card.ability.extra.Xchip,
				localize(card.ability.extra.hand_type, "poker_hands"),
			},
		}
	end,
	calculate = function(self, card, context)
		if context.before or context.forcetrigger then
			if context.scoring_name == card.ability.extra.hand_type or context.forcetrigger then
				card.ability.extra.Xchip =
					lenient_bignum(to_big(card.ability.extra.Xchip) + card.ability.extra.Xchip_mod)
				SMODS.calculate_effect(
					{ message = localize("k_upgrade_ex"), colour = G.C.CHIPS },
					context.blueprint_card or card
				)
			elseif to_big(card.ability.extra.Xchip) > to_big(1) then
				card.ability.extra.Xchip = to_big(1)
				SMODS.calculate_effect({ message = localize("k_reset") }, context.blueprint_card or card)
			end
		end
		if (context.end_of_round and context.main_eval) or context.forcetrigger then
			return {
				func = function()
					local temprank = 0
					local tempcard
					for i, v in ipairs(G.hand.cards) do
						if v:get_id() > temprank and not v.debuff then
							temprank = v:get_id()
							tempcard = v
						end
					end
					if not tempcard or tempcard.REMOVED then
						return nil
					end
					G.E_MANAGER:add_event(Event({
						func = function()
							G.hand:add_to_highlighted(tempcard)
							return true
						end,
					}))
					SMODS.calculate_effect({ message = localize("k_level_up_ex") }, context.blueprint_card or card)
					SMODS.smart_level_up_hand(
						context.blueprint_card or card,
						card.ability.extra.hand_type,
						nil,
						temprank
					)
					G.E_MANAGER:add_event(Event({
						func = function()
							G.hand:remove_from_highlighted(tempcard)
							return true
						end,
					}))
				end,
			}
		end
		if context.joker_main and to_big(card.ability.extra.Xchip) > to_big(1) then
			return {
				message = localize({
					type = "variable",
					key = "a_xchips",
					vars = {
						card.ability.extra.Xchip,
					},
				}),
				Xchip_mod = lenient_bignum(card.ability.extra.Xchip),
				colour = G.C.CHIPS,
			}
		end
	end,
})
