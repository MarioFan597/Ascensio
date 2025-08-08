SMODS.Joker({ --Commented out at the moment as it is also increasing hand size at the moment for some reason
	key = "accomplice", --Mostly taken from gemini
	config = { extra = { scale_mult = 4, scale_chip = 16, scale_score = 300,} },
	rarity = 2,
	atlas = "c_atlas_mortal",
	blueprint_compat = true,
	demicoloncompat = true,
	pos = { x = 1, y = 0 },
	cost = 8,
	order = 515,
	loc_vars = function(self, info_queue, card)
		if next(SMODS.find_mod("Astronomica")) then
			info_queue[#info_queue+1] = {key = 'asc_astronomica_compat', set = 'Other'}
		end
		card.ability.blueprint_compat_ui = card.ability.blueprint_compat_ui or ""
		card.ability.blueprint_compat_check = nil
		return {
			vars = { number_format(card.ability.extra.scale_mult), 
					number_format(card.ability.extra.scale_chip), 
					--number_format(card.ability.extra.curr_mult),
					--number_format(card.ability.extra.curr_chip) 
					},
			main_end = (card.area and card.area == G.jokers) and {
				{
					n = G.UIT.C,
					config = { align = "bm", minh = 0.4 },
					nodes = {
						{
							n = G.UIT.C,
							config = {
								ref_table = card,
								align = "m",
								colour = G.C.JOKER_GREY,
								r = 0.05,
								padding = 0.06,
								func = "blueprint_compat",
							},
							nodes = {
								{
									n = G.UIT.T,
									config = {
										ref_table = card.ability,
										ref_value = "blueprint_compat_ui",
										colour = G.C.UI.TEXT_LIGHT,
										scale = 0.32 * 0.8,
									},
								},
							},
						},
					},
				},
			} or nil,
		}
	end,
	update = function(self, card, front)
		--card.ability.extra.curr_mult = tonumber(G.GAME.round) * card.ability.extra.scale_mult
		--card.ability.extra.curr_chip = tonumber(G.GAME.round) * card.ability.extra.scale_chip
		--card.ability.extra.curr_score = tonumber(G.GAME.round) * card.ability.extra.scale_score
		if G.STAGE == G.STAGES.RUN then
			other_joker = G.jokers.cards[1]
			--[[local check = false
			if G.GAME and other_joker and (
				G.P_CENTERS[other_joker].effect == "Type Mult"
				or G.P_CENTERS[other_joker].effect == "Cry Type Mult"
				or G.P_CENTERS[other_joker].effect == "Cry Type Chips"
				--or G.P_CENTERS[other_joker].effect == "Cry Type Score"
				or G.P_CENTERS[other_joker].effect == "Boost Kidnapping"
				or (
					G.P_CENTERS[other_joker].name == "Sly Joker"
					or G.P_CENTERS[other_joker].name == "Wily Joker"
					or G.P_CENTERS[other_joker].name == "Clever Joker"
					or G.P_CENTERS[other_joker].name == "Devious Joker"
					or G.P_CENTERS[other_joker].name == "Crafty Joker"
				))
			then
				check = true
			end]]
			if other_joker 
				and other_joker ~= card
				and (other_joker.config.center.effect == "Type Mult"
				or other_joker.config.center.effect == "Cry Type Mult"
				or other_joker.config.center.effect == "Cry Type Chips"
				or other_joker.config.center.effect == "Cry Type Score"
				or other_joker.config.center.effect == "Boost Kidnapping"
				or (
					other_joker.config.center.name == "Sly Joker"
					or other_joker.config.center.name == "Wily Joker"
					or other_joker.config.center.name == "Clever Joker"
					or other_joker.config.center.name == "Devious Joker"
					or other_joker.config.center.name == "Crafty Joker"
				))
				and not (Card.no(other_joker, "immutable", true)) then
				card.ability.blueprint_compat = "compatible"
			else
				card.ability.blueprint_compat = "incompatible"
			end
		end
	end,
	calculate = function(self, card2, context)
		if (context.end_of_round and not context.repetition and not context.individual)
			or context.forcetrigger then
			local check = false
			local card = G.jokers.cards[1]
			if  other_joker.config.center.effect == "Cry Type Score"
				and not Card.no(G.jokers.cards[1], "immutable", true) then
				Cryptid.manipulate(G.jokers.cards[1], { value = card2.ability.extra.scale_score, type = "+" })
				check = true
			elseif other_joker.config.center.effect == "Cry Type Chips"
				or (
					other_joker.config.center.name == "Sly Joker"
					or other_joker.config.center.name == "Wily Joker"
					or other_joker.config.center.name == "Clever Joker"
					or other_joker.config.center.name == "Devious Joker"
					or other_joker.config.center.name == "Crafty Joker"
				) and not Card.no(G.jokers.cards[1], "immutable", true) then
				Cryptid.manipulate(G.jokers.cards[1], { value = card2.ability.extra.scale_chip, type = "+" })
				check = true
			elseif (other_joker.config.center.effect == "Type Mult"
				or other_joker.config.center.effect == "Cry Type Mult"
				or other_joker.config.center.effect == "Boost Kidnapping")
				and not Card.no(G.jokers.cards[1], "immutable", true) then
				Cryptid.manipulate(G.jokers.cards[1], { value = card2.ability.extra.scale_mult, type = "+" })
				check = true
			end
			if check then
				card_eval_status_text(
					context.blueprint_card or card2,
					"extra",
					nil,
					nil,
					nil,
					{ message = localize("k_upgrade_ex"), colour = G.C.GREEN }
				)
			end
			return nil, true
		end
	end,
	asc_credits = {
		idea = {
			"Googol1e308plex",
			"MarioFan597"
		},
		art = {
			"Requiacity",
			"MarioFan597",
		},
		code = {
			"MarioFan597",
			"Math",
		},
	},
})


