SMODS.Joker({
	key = "exorcist",
	config = { extra = {} },
	rarity = 3,
	atlas = "c_atlas_mortal",
	blueprint_compat = true,
	demicoloncompat = true,
	pools = { ["Food"] = true },
	pos = { x = 4, y = 0 },
	cost = 8,
	order = 508,
	loc_vars = function(self, info_queue, card)
		return {
			vars = {},
		}
	end,

	calculate = function(self, card, context) --Mostly taken from formidibus
		if
			(context.buying_card or context.cry_creating_card)
			and context.card.ability.set == "Joker"
			and context.card.config.center.rarity == "cry_cursed"
			and not context.blueprint
			and not (context.card == card)
		then
			G.E_MANAGER:add_event(Event({
				func = function()
					context.card:start_dissolve()
					card_eval_status_text(card, "extra", nil, nil, nil, {
						message = localize("k_nope_ex"),
						colour = G.C.BLACK,
					})
					local _card = create_card("Joker", G.jokers, nil, "cry_candy", nil, nil, nil, "cry_trick_candy")
					_card:add_to_deck()
					G.jokers:emplace(_card)
					return true
				end,
			}))
		end
	end,

	asc_credits = {
		idea = {
			"CapitalChirp",
			"hssr",
		},
		art = {
			"MarioFan597",
		},
		code = {
			"Foegro",
			"MarioFan597",
		},
	},
})
