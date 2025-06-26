SMODS.Joker{
    key = "blue",
	pos = { x = 3, y = 6 },
	soul_pos = { x = 5, y = 6, extra = { x = 4, y = 6 } },
	rarity = "cry_exotic",
	cost = 50,
	order = 53,
	config = { extra = { x_chips = 0, x_chips_mod = 0.1 } },
	blueprint_compat = true,
	demicoloncompat = true,
	atlas = "v_atlas_1",
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				lenient_bignum(lenient_bignum(card.ability.extra.x_chips) + ((G.deck and #G.deck.cards or 1) * (card.ability.extra.x_chips_mod) ) ),
				lenient_bignum(lenient_bignum(card.ability.extra.x_chips_mod)),
				lenient_bignum(lenient_bignum(0.1))
			}
		}
	end,
	calculate = function(self, card, context)
		if context.forcetrigger then
			return {
				x_chips = lenient_bignum(#G.deck.cards * card.ability.extra.x_chips_mod)
			}
		end
		if context.joker_main and not context.blueprint then
			return {
				x_chips = lenient_bignum(#G.deck.cards * card.ability.extra.x_chips_mod)
			}
		end
		if context.playing_card_added then
			card.ability.extra.x_chips_mod = card.ability.extra.x_chips_mod + 0.1
			return {
				localize("k_upgrade_ex"),
				colour = G.C.CHIPS
				}
		end
		return nil
	end,
	asc_credits = {
			idea = {
				"hssr"
			},
			art = {
				"hasu <3"
			},
			code = {
				"hasu <3",
				"Somethingcom515"
			}
	},
}
