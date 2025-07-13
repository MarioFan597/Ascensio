SMODS.Joker{
    key = "b_pie",
	pos = { x = 3, y = 0 },
	rarity = 2,
	cost = 6.28, --2xpi, displays pi in sell value
	order = 509, --i think
	config = { extra = { chips = 3.14, hands_remaining = 3 } },
	blueprint_compat = true,
	demicoloncompat = true,
	immutable = true,
	atlas = "c_atlas_mortal",
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				lenient_bignum(lenient_bignum(card.ability.extra.chips)),
                lenient_bignum(lenient_bignum(card.ability.extra.hands_remaining))
			}
		}
	end,
	calculate = function(self, card, context) --took the code straight from circulus, no shame >:3
		if
			(
				context.joker_main
				and (
					G.GAME.current_round.hands_left >= card.ability.extra.hands_remaining
					and G.GAME.current_round.hands_left < card.ability.extra.hands_remaining + 1
				)
			) or context.forcetrigger
		then
			local pi = math.pi
			if Cryptid.safe_get(card, "edition", "cry_oversat") then
				pi = 2 * pi
			end
			return {
					message = localize({
						type = "variable",
						key = "a_xchips",
						vars = {
							(Cryptid.safe_get(card, "edition", "cry_oversat") and "tau" or "pi"),
						},
					}),
					Xchip_mod = lenient_bignum(pi),
					colour = G.C.CHIPS,
				}
		end
	end,
	asc_credits = {
			idea = {
				"hssr"
			},
			art = {
				"MarioFan597",
				"HexaCryonic",
			},
			code = {
				"hasu <3"
			}
	},
}

--localization
--
--          j_asc_b_pie = {
--				name = "Blueberry Pie",
--				text = {
--					"{X:mult,C:white}X#1#{} Mult",
--					"if {C:attention}exactly{} #2#",
--					"hand#<s>2# remaining"
--				}
--			},