SMODS.Atlas({
	key = "hunting_season",
	path = "hunting_season.png",
	px = 71,
	py = 95,
})

SMODS.Joker({
	key = "hunting_season",
	pos = { x = 0, y = 0 },
	soul_pos = { x = 0, y = 6, extra = { x = 0, y = 1 } },
	config = { extra = {} },
	rarity = "cry_exotic",
	cost = 50,
	order = 284,
	blueprint_compat = false,
	demicoloncompat = false,
	atlas = "hunting_season",

	animation = {
		macro = {
			type = "skim",
			soul_pos_extra = {
				include = { { x1 = 0, x2 = 9, y1 = 1, y2 = 5 } },
				exclude = { { x1 = 5, x2 = 9, y1 = 5, y2 = 5 } },
			},
			soul_pos = {
				include = { { x1 = 0, x2 = 9, y1 = 6, y2 = 10 } },
				exclude = { { x1 = 5, x2 = 9, y1 = 10, y2 = 10 } },
			},
		},
	},

	calculate = function(self, card, context) --This was taken in part and modified from the original hunting season
		if
			(context.cardarea == G.play or context.cardarea == "unscored")
			and context.destroy_card == context.full_hand[(#context.full_hand + 1) / 2]
			and (#context.full_hand % 2 ~= 0) -- Odd number of cards in played hand
			and #context.full_hand > 1
			and not context.blueprint
			and not context.retrigger_joker
		then
			local upgrade = false
			for _, c in ipairs(context.full_hand) do
				--c.ability.perma_x_chips = c.ability.perma_x_chips or 1
				--if type(context.full_hand[(#context.full_hand + 1) / 2]:get_id()) == number then
				--c.ability.perma_x_chips = c.ability.perma_x_chips + (context.full_hand[(#context.full_hand + 1) / 2]:get_id()-1)
				if context.full_hand[(#context.full_hand + 1) / 2]:get_id() > 0 then
					c.ability.perma_x_mult = c.ability.perma_x_mult
						+ context.full_hand[(#context.full_hand + 1) / 2]:get_id()
					upgrade = true
				end
			end
			if upgrade then
				return {
					extra = { message = localize("k_upgrade_ex"), colour = G.C.MULT },
					colour = G.C.MULT,
					card = context.other_card,
					remove = not context.destroy_card.ability.eternal,
				}
			else
				return {
					card = context.other_card,
					remove = not context.destroy_card.ability.eternal,
				}
			end
		end
	end,
	asc_credits = {
		idea = {
			"Grahkon",
		},
		art = {
			"Grahkon",
			"Tatteredlurker",
		},
		code = {
			"MarioFan597",
		},
	},
})
