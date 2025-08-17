SMODS.Joker({
	key = "wrathful",
	config = { extra = { e_mult = 1.2, gain = 0.01, odds = 4 } },
	rarity = "cry_exotic",
	atlas = "v_atlas_1",
	blueprint_compat = true,
	demicoloncompat = true,
	pos = { x = 6, y = 4 },
	soul_pos = { x = 8, y = 4, extra = { x = 7, y = 4 } },
	cost = 50,
	order = 4,
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				lenient_bignum(card.ability.extra.e_mult),
				lenient_bignum(card.ability.extra.gain),
				cry_prob(card.ability.cry_prob, lenient_bignum(card.ability.extra.odds), card.ability.cry_rigged),
				lenient_bignum(card.ability.extra.odds),
			},
		}
	end,
	calculate = function(self, card, context)
		local flag = true
		local to_destroy = {}
		if
			(context.individual and context.cardarea == G.play and context.other_card:is_suit("Spades"))
			or context.forcetrigger
		then
			if
				pseudorandom("Where are the grapes?" .. G.SEED)
				< cry_prob(card.ability.cry_prob, card.ability.extra.odds, card.ability.cry_rigged)
					/ card.ability.extra.odds
			then
				--This part was modified from Cryptid's SUS
				if #G.hand.cards > 0 then
					for _, v in ipairs(G.hand.cards) do
						if not SMODS.is_eternal(v) and not v:is_suit("Spades") then
							table.insert(to_destroy, v)
						end
					end
				end
				-- Destroy Cards
				-- Don't destroy them if they were already destroyed though
				if flag then
					asc_spade_alt_table = to_destroy --I think I have to make this a global variable. Doesn't want to work without it
				end
				G.E_MANAGER:add_event(Event({
					trigger = "immediate",
					--delay = 0.1,
					func = function()
						local selected = math.random(#asc_spade_alt_table)
						local aaa = asc_spade_alt_table[selected]
						if aaa == nil then
							math.random(#asc_spade_alt_table)
						end
						table.remove(asc_spade_alt_table, selected)
						if aaa ~= nil then
							SMODS.destroy_cards(aaa)
							--Upgrade ^mult and display upgrade message
							card.ability.extra.e_mult = lenient_bignum(card.ability.extra.e_mult)
								+ lenient_bignum(card.ability.extra.gain)
							card_eval_status_text(
								card,
								"extra",
								nil,
								nil,
								nil,
								{
									message = localize({
										type = "variable",
										key = "a_powmult",
										vars = { lenient_bignum(card.ability.extra.e_mult) },
									}),
									colour = G.C.DARK_EDITION,
								}
							)
						end
						return true
					end,
				}))
			end
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
		if context.after then
			flag = true
		end
	end,
	asc_credits = {
		idea = {
			"Lil Mr. Slipstream",
			"Lexi",
		},
		art = {
			"MarioFan597",
		},
		code = {
			"Glitchkat10",
		},
	},
})
