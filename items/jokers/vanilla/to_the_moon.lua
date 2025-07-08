SMODS.Joker({
	key = "to_the_moon",
	config = { extra = {} },
	rarity = "cry_exotic",
	atlas = "v_atlas_1",
	blueprint_compat = false,
	demicoloncompat = true,
	pos = { x = 6, y = 2 },
	soul_pos = { x = 8, y = 2, extra = { x = 7, y = 2 } },
	cost = 50,
	--Modified from code taken directly from event 9 of choclate dice
	add_to_deck = function(self, card, from_debuff)
		SMODS.Events["ev_asc_tripple_money"]:start()
	end,
	calculate = function(self, card, context)
		if
			(
				context.end_of_round
				and not context.individual
				and not context.repetition
				and not context.blueprint
				and not context.retrigger_joker
				and G.GAME.blind.boss
			) or context.forcetrigger
		then
			--todo: check if duplicates of event are already started/finished
			SMODS.Events["ev_asc_tripple_money"]:finish()
			SMODS.Events["ev_asc_tripple_money"]:start()
			return {
				message = tostring(card.ability.extra.roll),
				colour = G.C.GREEN,
			}
		end
	end,
	remove_from_deck = function(self, card, from_debuff)
		if not from_debuff then
			SMODS.Events["ev_asc_tripple_money"]:finish()
		end
	end,
	asc_credits = {
		idea = {
			"TheOfficialfem",
		},
		art = {
			"Oinite12",
		},
		code = {
			"MarioFan597",
		},
	},
})
