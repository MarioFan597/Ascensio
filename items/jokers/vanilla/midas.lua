SMODS.Joker {
	key = "midas",
	config = { extra = { power = 1.1 } },
	rarity = "cry_exotic",
	atlas =  "v_atlas_1",
	blueprint_compat = true,
	demicoloncompat = true,
	pos = { x = 6, y = 0 },
	soul_pos = { x = 8, y = 0, extra = { x = 7, y = 0 } },
	cost = 50,
	order = 76,
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_gold
		info_queue[#info_queue + 1] = G.P_CENTERS.e_cry_gold
		return { vars = { card and lenient_bignum(card.ability.extra.power) } }
	end,
	calculate = function(self, card, context)
		if
			context.cardarea == G.jokers and context.before and not context.blueprint_card and not context.retrigger_joker then
			for i = 1, #context.scoring_hand do	
			converted = true
			local _card = context.scoring_hand[i]
				local enhancement = "m_gold"
				if _card.ability.effect ~= "Gold Card" then
					_card:set_ability(G.P_CENTERS[enhancement], nil, true)
				end
				local enhancement = "cry_golden"
				if _card.ability.effect ~= "Golden" then
					_card:set_edition( { cry_gold = true } )
				end
				G.E_MANAGER:add_event(Event( {
					delay = 0.6,
					func = function()	
						_card:juice_up()
						play_sound("tarot1")
						return true
					end,
				} ))
			end
			if converted then
				return { message = "Gold!", colour = G.C.GOLD, }
			end
		end
		if
			(context.individual
			and context.cardarea == G.hand
			and context.other_card.ability.effect == "Gold Card"
			and not context.end_of_round)
			or context.forcetrigger
		then
			if context.other_card.debuff then
				return {
					message = localize("k_debuffed"),
					colour = G.C.RED,
					card = card,
				}
			else
				return {
					Emult = lenient_bignum(card.ability.extra.power),
					colour = G.C.DARK_EDITION,
					card = card,
				}
			end
		end
	end,
	asc_credits = {
			idea = {
				"MarioFan597"
			},
			art = {
				"MarioFan597"
			},
			code = {
				"MarioFan597"
			}
	},
}