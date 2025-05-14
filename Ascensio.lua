----------------------------------------------
------------MOD CODE -------------------------
---
---
---
local Global_Cap = 1000000
----------Defining Atlases------------------
SMODS.Atlas {
	key = "modicon",
	path = "modicon.png",
	px = 34,
	py = 34
}

SMODS.Atlas {
	key = "v_atlas_1",
	path = "vanilla_atlas_1.png",
	px = 71,
	py = 95
}

SMODS.Atlas {
	key = "c_atlas_1",
	path = "cryptid_atlas_1.png",
	px = 71,
	py = 95
}

SMODS.Atlas {
	key = "c_atlas_mortal",
	path = "cryptid_mortals_atlas.png",
	px = 71,
	py = 95
}

SMODS.Atlas {
	key = "ascension",
	path = "ascension.png",
	px = 71,
	py = 95
}

SMODS.Atlas {
	key = "oops_all_6s",
	path = "oops_all_6s.png",
	px = 71,
	py = 95
}

SMODS.Atlas {
	key = "defectus",
	path = "defectus.png",
	px = 71,
	py = 95
}

--[[
SMODS.Atlas {
	key = "gluttony",
	path = "gluttony.png",
	px = 71,
	py = 95
}


-----Defining Sounds------
SMODS.Sound{
	key = "mani",
	path = "mani.ogg"
}
--]]

----------Defining Consumables----------
--Borrowed and modyfied from MoreMarioJoker's powerup card and cryptid's gateway
local ascensionable = {
			j_joker = "j_asc_jimbo",
			j_greedy_joker = "j_asc_greedy",
			j_lusty_joker = "j_asc_lusty",
			j_wrathful_joker = "j_asc_wrathful",
			j_gluttonous_joker = "j_asc_gluttonous",
			j_stencil = "j_asc_stencil",
			j_credit_card = "j_asc_credit_card",
			j_misprint = "j_asc_misprint",
			j_scary_face = "j_asc_scary",
			j_abstract = "j_asc_abstract",
			j_dna = "j_asc_dna",
			j_midas_mask = "j_asc_midas",
			j_golden = "j_asc_golden",
			j_bull = "j_asc_bull",
			j_selzer = "j_asc_seltzer",
			j_oops = "j_asc_oops",
			j_duo = "j_asc_duo",
			j_trio = "j_asc_trio",
			j_family = "j_asc_family",
			j_order = "j_asc_order",
			j_tribe = "j_asc_tribe",
			j_drivers_license = "j_asc_drivers_license",
			j_caino = "j_asc_thanatos",
			-- j_to_the_moon = "j_asc_to_the_moon",
			j_cry_gardenfork = "j_asc_gardenfork",
			j_cry_oil_lamp = "j_asc_oil_lamp",
			j_cry_highfive = "j_asc_high_five",
			j_asc_b_cake = "j_cry_crustulum",
			j_asc_gemino = "j_cry_gemino"
		}

SMODS.Consumable {
	key = "ascension",
	set = "Spectral",
	atlas = "ascension",
	pos = { x = 0, y = 0 },
	soul_pos = { x = 2, y = 0, extra = { x = 1, y = 0 } },
	cost = 4,
	hidden = true,
	config = {},
	can_use = function(self, card)
		if #G.jokers.highlighted == 1 and ascensionable[G.jokers.highlighted[1].config.center.key] then
				return true
		end
	end,
	use = function(self, card, area, copier)
		local ascendent = G.jokers.highlighted[1]
		ascendent:set_eternal(nil)
		if (#SMODS.find_card("j_jen_saint") + #SMODS.find_card("j_jen_saint_attuned")) <= 0 then
			local deletable_jokers = {}
			if asc_config["Insanity Mode!!!"] or false then
				for k, v in pairs(G.jokers.cards) do
					if v == G.jokers.highlighted[1] then
						deletable_jokers[#deletable_jokers + 1] = v
					end
				end
			else
				for k, v in pairs(G.jokers.cards) do
					if not v.ability.eternal then
						deletable_jokers[#deletable_jokers + 1] = v
					end
				end
			end

			local _first_dissolve = nil
			G.E_MANAGER:add_event(Event({
				trigger = "before",
				delay = 0.75,
				func = function()
					for k, v in pairs(deletable_jokers) do
						if v.config.center.rarity == "cry_exotic" then
							check_for_unlock({ type = "what_have_you_done" })
						end
						v:start_dissolve(nil, _first_dissolve)
						_first_dissolve = true
					end
					return true
				end,
			}))
		end
		--SMODS.add_card({key = ascensionable[G.jokers.highlighted[1].config.center.key]})
		G.E_MANAGER:add_event(Event({
			trigger = "after",
			delay = 0.4,
			func = function()
				play_sound("timpani")
				local card = create_card("Joker", G.jokers, nil, "cry_exotic", nil, nil, ascensionable[ascendent.config.center.key], "cry_gateway")
				card:add_to_deck()
				G.jokers:emplace(card)
				card:juice_up(0.3, 0.5)
				return true
			end,
		}))
		delay(0.6)
	end,
	in_pool = function()
		if G and G.jokers and G.jokers.cards then
			for k, v in ipairs(G.jokers.cards) do
				if ascensionable[v.config.center.key] then
					return true 
				end
			end
		end
		return false
	end,
	cry_credits = {
		idea = {
			"MarioFan597",
		},
		art = {
			"cozyori",
			"MarioFan597",
		},
		code = {
			"MarioFan597",
			"MathIsFun",
			"SMG9000"
		},
	},
}

----------Defining Jokers----------
SMODS.Joker {
	key = "jimbo",
	config = { extra = { mult = 44444 } },
	rarity = "cry_exotic",
	atlas = "v_atlas_1",
	blueprint_compat = true,
	pos = { x = 0, y = 0 },
	soul_pos = { x = 2, y = 0, extra = { x = 1, y = 0 } },
	cost = 50,
	order = 1,
	loc_vars = function(self, info_queue, card)
		return { vars = { card and card.ability.extra.mult } }
	end,
	calculate = function(self, card, context)
	if context.joker_main then
			if card.ability.extra.mult > 0 then
				return {
					mult_mod = math.min(card.ability.extra.mult, Global_Cap),
					message = localize { type = "variable", key = "a_mult", vars = { math.min(card.ability.extra.mult, Global_Cap) } }
				}
			end
		end
	end,
	cry_credits = {
			idea = {
				"Inspector_B"
			},
			art = {
				"MarioFan597"
			},
			code = {
				"MarioFan597"
			}
	},
}

SMODS.Joker {
	key = "greedy",
	config = { extra = { e_mult = 1.2 } },
	rarity = "cry_exotic",
	atlas = "v_atlas_1",
	blueprint_compat = true,
	pos = { x = 0, y = 4 },
	soul_pos = { x = 2, y = 4, extra = { x = 1, y = 4 } },
	cost = 50,
	order = 2,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.e_mult } }
	end,
	calculate = function(self, card, context)
		if context.individual then
			if context.cardarea == G.play and context.other_card:is_suit("Diamonds") then
				return {
					message = localize({ type = "variable", key = "a_powmult", vars = { card.ability.extra.e_mult } }),
					Emult_mod = math.min(card.ability.extra.e_mult, Global_Cap),
					colour = G.C.DARK_EDITION,
				}
			end
		end
	end,
	cry_credits = {
		idea = {
			"Lexi"
		},
		art = {
			"MarioFan597"
		},
		code = {
			"Glitchkat10"
		}
	},
}

SMODS.Joker {
	key = "lusty",
	config = { extra = { e_mult = 1.2 } },
	rarity = "cry_exotic",
	atlas = "v_atlas_1",
	blueprint_compat = true,
	pos = { x = 3, y = 4 },
	soul_pos = { x = 5, y = 4, extra = { x = 4, y = 4 } },
	cost = 50,
	order = 3,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.e_mult } }
	end,
	calculate = function(self, card, context)
		if context.individual then
			if context.cardarea == G.play and context.other_card:is_suit("Hearts") then
				return {
					message = localize({ type = "variable", key = "a_powmult", vars = { card.ability.extra.e_mult } }),
					Emult_mod = math.min(card.ability.extra.e_mult, Global_Cap),
					colour = G.C.DARK_EDITION,
				}
			end
		end
	end,
	cry_credits = {
		idea = {
			"Lexi"
		},
		art = {
			"MarioFan597"
		},
		code = {
			"Glitchkat10"
		}
	},
}

SMODS.Joker {
	key = "wrathful",
	config = { extra = { e_mult = 1.2 } },
	rarity = "cry_exotic",
	atlas = "v_atlas_1",
	blueprint_compat = true,
	pos = { x = 6, y = 4 },
	soul_pos = { x = 8, y = 4, extra = { x = 7, y = 4 } },
	cost = 50,
	order = 4,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.e_mult } }
	end,
	calculate = function(self, card, context)
		if context.individual then
			if context.cardarea == G.play and context.other_card:is_suit("Spades") then
				return {
					message = localize({ type = "variable", key = "a_powmult", vars = { card.ability.extra.e_mult } }),
					Emult_mod = math.min(card.ability.extra.e_mult, Global_Cap),
					colour = G.C.DARK_EDITION,
				}
			end
		end
	end,
	cry_credits = {
		idea = {
			"Lexi"
		},
		art = {
			"MarioFan597"
		},
		code = {
			"Glitchkat10"
		}
	},
}

SMODS.Joker {
	key = "gluttonous",
	config = { extra = { e_mult = 1.2 } },
	rarity = "cry_exotic",
	atlas = "v_atlas_1",
	blueprint_compat = true,
	pos = { x = 9, y = 4 },
	soul_pos = { x = 11, y = 4, extra = { x = 10, y = 4 } },
	cost = 50,
	order = 5,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.e_mult } }
	end,
	calculate = function(self, card, context)
		if context.individual then
			if context.cardarea == G.play and context.other_card:is_suit("Clubs") then
				return {
					message = localize({ type = "variable", key = "a_powmult", vars = { card.ability.extra.e_mult } }),
					Emult_mod = math.min(card.ability.extra.e_mult, Global_Cap),
					colour = G.C.DARK_EDITION,
				}
			end
		end
	end,
	cry_credits = {
		idea = {
			"Lexi"
		},
		art = {
			"MarioFan597"
		},
		code = {
			"Glitchkat10"
		}
	},
}

SMODS.Joker {
	key = "stencil",
	config = { extra = { mult = 0, mult_gain = 1, joker_slots = 0, slot_gain = 1 } },
	rarity = "cry_exotic",
	atlas =  "v_atlas_1",
	blueprint_compat = true,
	pos = { x = 9, y = 2 },
	soul_pos = { x = 11, y = 2, extra = { x = 10, y = 2 } },
	cost = 50,
	order = 17,
	loc_vars = function(self, info_queue, card)
		return { vars = { card and card.ability.extra.mult,  card and card.ability.extra.mult_gain, card and card.ability.extra.joker_slots, card and card.ability.extra.slot_gain } }
	end,
	calculate = function(self, card, context)
		if context.end_of_round and context.cardarea == G.jokers and not context.blueprint and not context.retrigger_joker then
			card.ability.extra.mult = ((G.jokers.config.card_limit - #G.jokers.cards) * card.ability.extra.mult_gain) + card.ability.extra.mult
			card_eval_status_text(card, "extra", nil, nil, nil, {
					message = localize("k_upgrade_ex"),
					colour = G.C.MULT,
				})
		end

		if context.ending_shop then
			card.ability.extra.joker_slots = card.ability.extra.joker_slots + card.ability.extra.slot_gain
			G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.slot_gain
			card_eval_status_text(card, "extra", nil, nil, nil, {
					message = localize("k_upgrade_ex"),
					colour = G.C.DARK_EDITION,
				})
		end
		if context.joker_main then
			return {
				message = localize({
					type = "variable",
					key = "a_xmult",
					vars = {
						number_format(card.ability.extra.mult),
					},
				}),
				Xmult_mod = to_big(card.ability.extra.mult),
				colour = G.C.MULT,
			}
		end
	end,
	add_to_deck = function(self, card, from_debuff)
 		if G.jokers and not from_debuff then
			card.ability.extra.mult = ((G.jokers.config.card_limit - #G.jokers.cards) * card.ability.extra.mult_gain)
			G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.joker_slots
		end
	end,
	remove_from_deck = function(self, card, from_debuff)
		if G.jokers and not from_debuff then
			G.jokers.config.card_limit = G.jokers.config.card_limit - card.ability.extra.joker_slots
		end
	end,
	cry_credits = {
			idea = {
				"UTNerd24",
				"Glitchkat10"
			},
			art = {
				"Tatteredlurker"
			},
			code = {
				"MarioFan597"
			}
	},
}

SMODS.Joker {
	key = "credit_card",
	config = { extra = { debt = 5000, chips = 1, gain = 0.002 } },
	rarity = "cry_exotic",
	atlas = "v_atlas_1",
	blueprint_compat = true,
	pos = { x = 3, y = 3 },
	soul_pos = { x = 5, y = 3, extra = { x = 4, y = 3 } },
	cost = 50,
	order = 20,
	loc_vars = function(self, info_queue, card)
		return { vars = { card and card.ability.extra.debt, card and card.ability.extra.chips, card and card.ability.extra.gain } }
	end,
	add_to_deck = function(self, card, from_debuff)
		G.GAME.bankrupt_at = G.GAME.bankrupt_at - card.ability.extra.debt
	end,
	remove_from_deck = function(self, card, from_debuff)
		G.GAME.bankrupt_at = G.GAME.bankrupt_at + card.ability.extra.debt
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			if (to_big(card.ability.extra.chips) > to_big(1)) then
				return {
					chip_mod = math.min(card.ability.extra.chips, Global_Cap),
					message = localize { type = "variable", key = "a_xchips", vars = { math.min(card.ability.extra.chips, Global_Cap) } }
				}
			end
		end
		if context.ending_shop and not context.individual and not context.repetition and not (context.blueprint_card or card).getting_sliced then
			local debt = to_big(G.GAME.dollars)
			if debt < to_big(0) then
				card.ability.extra.chips = card.ability.extra.chips + (card.ability.extra.gain * (-1 * debt))
				card_eval_status_text(card, "extra", nil, nil, nil, {
					message = localize("k_upgrade_ex"),
					colour = G.C.CHIPS,
				})
			end
		end
	end,
	cry_credits = {
			idea = {
				"UTNerd24",
				"MarioFan597"
			},
			art = {
				"Tatteredlurker"
			},
			code = {
				"MarioFan597"
			}
	},
}

SMODS.Joker {
	key = "misprint",
	config = { extra = { range = 200} },
	rarity = "cry_exotic",
	atlas = "defectus",
	blueprint_compat = true,
	pos = { x = 0, y = 0 },
	soul_pos = { x = 5, y = 4, extra = { x = 4, y = 4 } },
	cost = 50,
	order = 27,
	loc_vars = function(self, info_queue, card)
		--Taken directly, modified, and uses dependencies from Cryptid's ERROR
		local ok, ret = pcall(Cryptid.predict_card_for_shop)
		if Cryptid.safe_get(G.GAME, "pseudorandom") and G.STAGE == G.STAGES.RUN and ok then
			cry_error_msgs[#cry_error_msgs].string = "%%" .. ret
		else
			cry_error_msgs[#cry_error_msgs].string = "%%J6"
		end
		return {
			main_start = {
				{
					n = G.UIT.O,
					config = {
						object = DynaText({
							--string = asc_misprint_operators,
							string = cry_error_operators,
							colours = { G.C.DARK_EDITION },
							pop_in_rate = 9999999,
							silent = true,
							random_element = true,
							pop_delay = 0.30,
							scale = 0.32,
							min_cycle_time = 0,
						}),
					},
				},
				{
					n = G.UIT.O,
					config = {
						object = DynaText({
							string = cry_error_numbers,
							--string = asc_misprint_numbers,
							colours = { G.C.DARK_EDITION },
							pop_in_rate = 9999999,
							silent = true,
							random_element = true,
							pop_delay = 0.33,
							scale = 0.32,
							min_cycle_time = 0,
						}),
					},
				},
				{
					n = G.UIT.O,
					config = {
						object = DynaText({
							string = cry_error_msgs,
							--string = asc_misprint_msgs,
							colours = { G.C.UI.TEXT_DARK },
							pop_in_rate = 9999999,
							silent = true,
							random_element = true,
							pop_delay = 0.4011,
							scale = 0.32,
							min_cycle_time = 0,
						}),
					},
				},
			},
		}
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			if card.ability.extra.range > 0 then
				local operator = math.random(1, 3) --1 is +, 2 is x, 3 is ^
				local type = math.random(1,2) --1 is chips, 2 is mult
				local result = to_big(math.random(1, card.ability.extra.range)) --Makes sure our result is consistant
				if operator == 1 then
					if type == 1 then
						return {
							message = localize({
								type = "variable",
								key = "a_chips",
								vars = {
									number_format(result),
								},
							}),
							chip_mod = result,
							colour = G.C.CHIPS,
						}
					else
						return {
							message = localize({
								type = "variable",
								key = "a_mult",
								vars = {
									number_format(result),
								},
							}),
							mult_mod = result,
							colour = G.C.MULT,
						}
					end
				else if operator == 2 then
					if type == 1 then
						return {
							message = localize({
								type = "variable",
								key = "a_xchips",
								vars = {
									number_format(result),
								},
							}),
							Xchip_mod = result,
							colour = G.C.CHIPS,
						}
					else
						return {
							message = localize({
								type = "variable",
								key = "a_xmult",
								vars = {
									number_format(result),
								},
							}),
							Xmult_mod = result,
							colour = G.C.MULT,
						}
					end
				else
					if type == 1 then
						return {
							message = localize({
								type = "variable",
								key = "a_powchips",
								vars = {
									number_format(result),
								},
							}),
							Echip_mod = result,
							colour = G.C.DARK_EDITION,
						}
					else
						return {
							message = localize({
								type = "variable",
								key = "a_powmult",
								vars = {
									number_format(result),
								},
							}),
							Emult_mod = result,
							colour = G.C.DARK_EDITION,
						}
					end
				end	
			end
		end
	end
	end,
	cry_credits = {
			idea = {
				"TheOfficialfem"
			},
			art = {
				"Tatteredlurker"
			},
			code = {
				"MarioFan597"
			}
	},
}

--Animation for Misprint's exotic
--This section was taken from potassium which in turn was taken from cryptid
print_dt = 0
local _game_update = Game.update
function Game:update(dt)
	_game_update(self, dt)
	 print_dt = print_dt + dt -- cryptid has a check here but im not sure what it's for
		if G.P_CENTERS and G.P_CENTERS.j_asc_misprint and print_dt > 0.10 then
			print_dt = print_dt - 0.10
			local misprint = G.P_CENTERS.j_asc_misprint
			if misprint.pos.x == 3 and misprint.pos.y == 4 then --Last frame of animation
				misprint.pos.x = 0
				misprint.pos.y = 0
			elseif misprint.pos.x < 5 then --If it isnt the right most image
				misprint.pos.x = misprint.pos.x + 1
			elseif misprint.pos.y < 4 then --If it isnt the bottom most image
				misprint.pos.x = 0
				misprint.pos.y = misprint.pos.y + 1
			end
	        -- oh my god i hate this so much but ARGH
	        -- note that this can't use find_card because it also needs to work in the collection
	        -- unless there's some other way you can do it
	        for _, card in pairs(G.I.CARD) do
	            if card.children.back and card.config.center == misprint then
	                card.children.back:set_sprite_pos(misprint.pos)
	            end
	        end
		end
end

SMODS.Joker {
	key = "scary",
	config = { extra = { power = 1.25 } },
	rarity = "cry_exotic",
	atlas =  "v_atlas_1",
	blueprint_compat = true,
	pos = { x = 6, y = 1 },
	soul_pos = { x = 8, y = 1, extra = { x = 7, y = 1 } },
	cost = 50,
	order = 33,
	loc_vars = function(self, info_queue, card)
		return { vars = { card and card.ability.extra.power } }
	end,
	calculate = function(self, card, context)
		if context.cardarea == G.play and context.individual then
			if context.other_card:is_face() then
				return {
					message = localize({ type = "variable", key = "a_powchips", vars = { card.ability.extra.power } }),
					Echip_mod = math.min(card.ability.extra.power, Global_Cap),
					colour = G.C.DARK_EDITION,
				}
			end
		end
	end,
	cry_credits = {
			idea = {
				"TheOfficialfem"
			},
			art = {
				"MarioFan597"
			},
			code = {
				"MarioFan597"
			}
	},
}

SMODS.Joker {
	key = "abstract",
	config = { extra = { power = 1, gain = 0.3 } },
	rarity = "cry_exotic",
	atlas =  "v_atlas_1",
	blueprint_compat = true,
	pos = { x = 9, y = 1 },
	soul_pos = { x = 11, y = 1, extra = { x = 10, y = 1 } },
	cost = 50,
	order = 34,
	loc_vars = function(self, info_queue, card)
		return { vars = { card and card.ability.extra.power,  card and card.ability.extra.gain } }
	end,
	calculate = function(self, card, context)
		card.ability.extra.power = 1
		--for i = 1, #G.jokers.cards do
		card.ability.extra.power = card.ability.extra.power + (#G.jokers.cards * card.ability.extra.gain)
		--end

		if context.joker_main then
			return {
				message = localize({ type = "variable", key = "a_powmult", vars = { card.ability.extra.power } }),
				Emult_mod = math.min(card.ability.extra.power, Global_Cap),
				colour = G.C.DARK_EDITION,
			}
		end

	end,
	cry_credits = {
			idea = {
				"TheOfficialfem"
			},
			art = {
				"MarioFan597"
			},
			code = {
				"MarioFan597"
			}
	},
}

SMODS.Joker {
	key = "dna",
	config = { extra = { copies = 10} },
	rarity = "cry_exotic",
	atlas = "v_atlas_1",
	blueprint_compat = true,
	pos = { x = 0, y = 3 },
	soul_pos = { x = 2, y = 3, extra = { x = 1, y = 3 } },
	cost = 50,
	order = 51,
	loc_vars = function(self, info_queue, card)
		return { vars = { card and card.ability.extra.copies} }
	end,
	calculate = function(self, card, context)
    if context.joker_main and G.GAME.current_round.hands_played == 0 and #context.full_hand == 1 then
		G.E_MANAGER:add_event(Event({
			trigger = "before",
			delay = 0.75,
			func = function()
			for k, v in pairs(G.hand.cards) do
				if v ~= card.ability.chosen_card then
					v:start_dissolve(nil, _first_dissolve)
					_first_dissolve = true
				end
			end
			return true
		end,
		}))
        local _card = copy_card(context.full_hand[1], nil, nil, G.playing_card)
        for i = 1, card.ability.extra.copies do
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
            message = localize('k_copied_ex'),
            colour = G.C.CHIPS,
            card = self,
           	playing_cards_created = {true}
        	}
    	end 
	end,
	cry_credits = {
			idea = {
				"Lexi",
				"Tatteredlurker"
			},
			art = {
				"Tatteredlurker"
			},
			code = {
				"Math",
				"Mario"
			}
	},
}

SMODS.Joker {
	key = "midas",
	config = { extra = { power = 1.1 } },
	rarity = "cry_exotic",
	atlas =  "v_atlas_1",
	blueprint_compat = true,
	pos = { x = 6, y = 0 },
	soul_pos = { x = 8, y = 0, extra = { x = 7, y = 0 } },
	cost = 50,
	order = 76,
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_gold
		info_queue[#info_queue + 1] = G.P_CENTERS.e_cry_gold
		return { vars = { card and card.ability.extra.power} }
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
					_card:set_edition({cry_gold = true})
				end
				G.E_MANAGER:add_event(Event({
					delay = 0.6,
					func = function()	
						_card:juice_up()
						play_sound("tarot1")
						return true
					end,
				}))
			end
			if converted then
				return {message = "Gold!", colour = G.C.GOLD,}
			end
		end
		if
			context.individual
			and context.cardarea == G.hand
			and context.other_card.ability.effect == "Gold Card"
			and not context.end_of_round
		then
			if context.other_card.debuff then
				return {
					message = localize("k_debuffed"),
					colour = G.C.RED,
					card = card,
				}
			else
				return {
					e_mult = math.min(card.ability.extra.power, Global_Cap),
					colour = G.C.DARK_EDITION,
					card = card,
				}
			end
		end
	end,
	cry_credits = {
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

SMODS.Joker {
	key = "golden",
	config = { extra = { gold = 2, gain = 1, odds = 7 } },
	rarity = "cry_exotic",
	atlas = "v_atlas_1",
	blueprint_compat = false,
	pos = { x = 0, y = 2 },
	soul_pos = { x = 2, y = 2, extra = { x = 1, y = 2 } },
	cost = 50,
	order = 90,
	loc_vars = function(self, info_queue, card)
		return { vars = { cry_prob(card.ability.cry_prob, card.ability.extra.odds, card.ability.cry_rigged), card and card.ability.extra.gold, card and card.ability.extra.gain, card and card.ability.extra.odds} }
	end,

	calc_dollar_bonus = function (self, card)
		if card.ability.extra.gold > 1 then
			if pseudorandom("moooooooooooonside") < cry_prob(card.ability.cry_prob, card.ability.extra.odds, card.ability.cry_rigged) / card.ability.extra.odds then
				card.ability.extra.gold = card.ability.extra.gold + card.ability.extra.gain
				card_eval_status_text(
					card,
					"extra",
					nil,
					nil,
					nil,
					{ message = localize("k_upgrade_ex"), colour = G.C.GOLD }
				)
			end
			return (card.ability.extra.gold * (to_number(G.GAME.dollars) or 0))
		end
	end,
	cry_credits = {
			idea = {
				"yahooyowza",
				"UTNerd24"
			},
			art = {
				"MarioFan597"
			},
			code = {
				"MarioFan597"
			}
	},
}

SMODS.Joker {
	key = "bull",
	config = { extra = { chips = 1, gain = 0.01 } },
	rarity = "cry_exotic",
	atlas = "v_atlas_1",
	blueprint_compat = true,
		pos = { x = 3, y = 5 },
	soul_pos = { x = 5, y = 5, extra = { x = 4, y = 5 } },
	cost = 50,
	order = 1,
	loc_vars = function(self, info_queue, card)
		return { vars = { card and card.ability.extra.chips, card and card.ability.extra.gain } }
	end,
	calculate = function(self, card, context)
	card.ability.extra.chips = 1
	card.ability.extra.chips = card.ability.extra.chips + (to_number(G.GAME.dollars) * card.ability.extra.gain)
	if context.joker_main then
			if card.ability.extra.chips > 0 then
				return {
					Echip_mod = math.min(card.ability.extra.chips, Global_Cap),
					message = localize { type = "variable", key = "a_powchips", vars = { math.min(card.ability.extra.chips, Global_Cap) } }
				}
			end
		end
	end,
	cry_credits = {
			idea = {
				"TheOfficialfem"
			},
			art = {
				"unexian",
				"MarioFan597"
			},
			code = {
				"MarioFan597"
			}
	},
}

SMODS.Joker {
	key = "seltzer",
	config = { extra = { retriggers = 1, played_hands = 10, goal_hands = 10 } },
	rarity = "cry_exotic",
	atlas = "v_atlas_1", 
	blueprint_compat = true,
	pos = { x = 3, y = 0 },
	soul_pos = { x = 5, y = 0, extra = { x = 4, y = 0 } },
	cost = 50,
	order = 102,
	loc_vars = function(self, info_queue, card)
		return { vars = { card and card.ability.extra.retriggers, card and card.ability.extra.played_hands, card and card.ability.extra.goal_hands } }
	end,
	calculate = function(self, card, context)
		if context.cardarea == G.play and context.repetition and not context.repetition_only then
			return {
				message = "Again!",
				repetitions = card.ability.extra.retriggers,
				card = context.other_card
			}
		end
		if context.after then
			card.ability.extra.played_hands = card.ability.extra.played_hands - 1
			if card.ability.extra.played_hands <= 0 then
				card.ability.extra.retriggers = card.ability.extra.retriggers + 1
				card.ability.extra.played_hands = card.ability.extra.goal_hands
				card_eval_status_text(
					card,
					"extra",
					nil,
					nil,
					nil,
					{ message = localize("k_upgrade_ex"), colour = G.C.GOLD }
				)
			end
		end
	end,
	cry_credits = {
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

SMODS.Joker {
	key = "hanging_chad",
	config = { extra = { retriggers = 20 } },
	rarity = "cry_exotic",
	atlas = "v_atlas_1", 
	blueprint_compat = true,
	pos = { x = 6, y = 5 },
	soul_pos = { x = 8, y = 5, extra = { x = 7, y = 5 } },
	cost = 50,
	order = 115,
	loc_vars = function(self, info_queue, card)
		return { vars = { card and card.ability.extra.retriggers } }
	end,
	calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play and (context.other_card == context.scoring_hand[1]) then
            return {
                message = localize('k_again_ex'),
				repetitions = math.min(card.ability.extra.retriggers, Global_Cap)
            }
		end
	end,
	cry_credits = {
			idea = {
				"MarioFan597"
			},
			art = {
				"Tatteredlurker"
			},
			code = {
				"Glitchkat10"
			}
	},
}

SMODS.Joker {
	key = "oops",
	config = { extra = { slot_gain = 1, joker_slots = 0, consumable_slots = 0 } },
	rarity = "cry_exotic",
	atlas = "oops_all_6s",
	blueprint_compat = false,
	pos = { x = 0, y = 0 },
	soul_pos = { x = 1, y = 0, extra = { x = 0, y = 1 } },
	cost = 50,
	order = 126,
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = { key = "cry_rigged", set = "Other", vars = {} }
		return { vars = { card and card.ability.extra.slot_gain, card and card.ability.extra.joker_slots, card and card.ability.extra.consumable_slots } }
	end,

	calculate = function(self, card, context)
		if context.before and not context.blueprint_card and not context.retrigger_joker and not context.repetition then
			--This is directly borrowed/altered from kalidescope
			local selected_joker = math.random(1, #G.jokers.cards)
			local eligiblejokers = {}
			for k, v in pairs(G.jokers.cards) do
				if v.ability.set == "Joker" and not v.sticker and v ~= card then
					table.insert(eligiblejokers, v)
				end
			end
			if #eligiblejokers > 0 then
				local eligible_card =
					pseudorandom_element(eligiblejokers, pseudoseed("nevergonnagiveyouupnevergonnaletyoudown"))
				local sticker = { cry_rigged = true }
				eligible_card.ability.cry_rigged = true
				check_for_unlock({ type = "googol_play_rigged"})
			end
		end

		if context.cardarea == G.jokers and context.before and not context.blueprint_card and not context.retrigger_joker then
			for i = 1, #context.scoring_hand do
				local _card = context.scoring_hand[i]
				converted = true
				local enhancement = "cry_rigged"
				if _card.ability.cry_rigged ~= "Rigged" then
					_card.ability.cry_rigged = true
				end
				G.E_MANAGER:add_event(Event({
					delay = 0.6,
					func = function()	
						_card:juice_up()
						play_sound("tarot1")
						return true
					end,
				}))
			end
			if converted then
				return {message = "RIGGED!!!", colour = G.C.GREEN,}
			end
		end

		if context.joker_main and not context.blueprint_card then
			if math.random(1, 6) == 1 then
				if math.random(1, 2) == 1 then
					card.ability.extra.joker_slots = card.ability.extra.joker_slots + card.ability.extra.slot_gain 
					G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.slot_gain
				else
					card.ability.extra.consumable_slots = card.ability.extra.consumable_slots + card.ability.extra.slot_gain
					G.consumeables.config.card_limit = G.consumeables.config.card_limit + card.ability.extra.slot_gain
				end
				card_eval_status_text(card, "extra", nil, nil, nil, {
					message = localize("k_upgrade_ex"),
					colour = G.C.DARK_EDITION,
				})
			else
				card_eval_status_text(card, "extra", nil, nil, nil, {
					message = localize("k_nope_ex"),
					colour = G.C.DARK_EDITION,
				})
			end
		end
	end,

	add_to_deck = function(self, card, from_debuff)
		if G.jokers and not from_debuff then
			G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.joker_slots
			G.consumeables.config.card_limit = G.consumeables.config.card_limit + card.ability.extra.consumable_slots
		end
	end,

	remove_from_deck = function(self, card, from_debuff)
		if G.jokers and not from_debuff then
			G.jokers.config.card_limit = G.jokers.config.card_limit - card.ability.extra.joker_slots
			G.consumeables.config.card_limit = G.consumeables.config.card_limit - card.ability.extra.consumable_slots
		end
	end,

	cry_credits = {
		idea = {
			"UTNerd24",
			"hssr96",
			"MarioFan597"
		},
		art = {
			"MarioFan597"
		},
		code = {
			"MarioFan597",
			"Jevonn"
		}
	},
}


--Animation for Oops! All 6s's exotic
--This section was taken from potassium which in turn was taken from cryptid
dice_dt = 0
local _game_update = Game.update
function Game:update(dt)
	_game_update(self, dt)
	 dice_dt = dice_dt + dt -- cryptid has a check here but im not sure what it's for
		if G.P_CENTERS and G.P_CENTERS.j_asc_oops and dice_dt > 0.10 then
			dice_dt = dice_dt - 0.10
			local dice = G.P_CENTERS.j_asc_oops
			if dice.soul_pos.x == 4 and dice.soul_pos.y == 1 then --Last frame of animation
				dice.soul_pos.x = 1
				dice.soul_pos.y = 0
			elseif dice.soul_pos.x < 4 then --If it isnt the right most image
				dice.soul_pos.x = dice.soul_pos.x + 1
			elseif dice.soul_pos.y < 1 then --If it isnt the bottom most image
				dice.soul_pos.x = 1
				dice.soul_pos.y = dice.soul_pos.y + 1
			end
	        -- oh my god i hate this so much but ARGH
	        -- note that this can't use find_card because it also needs to work in the collection
	        -- unless there's some other way you can do it
	        for _, card in pairs(G.I.CARD) do
	            if card and card.config.center == dice then
	                card.children.floating_sprite:set_sprite_pos(dice.soul_pos)
	            end
	        end
		end
end

SMODS.Joker {
	key = "duo",
	config = { extra = { power = 2 } },
	rarity = "cry_exotic",
	atlas =  "v_atlas_1",
	blueprint_compat = true,
	pos = { x = 9, y = 0 },
	soul_pos = { x = 11, y = 0, extra = { x = 10, y = 0 } },
	cost = 50,
	order = 131,
	loc_vars = function(self, info_queue, card)
		return { vars = { card and card.ability.extra.power } }
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			--[[if context.scoring_name == "Pair" and context.cardarea == G.jokers and not context.blueprint_card and not context.retrigger_joker then
			--if context.cardarea == G.jokers and context.before and not context.blueprint_card and not context.retrigger_joker then
				--if get_poker_hand_info(G.hand.highlighted) == "Pair" then
					card_list = {}
            		for i = 1, #context.scoring_hand do
           				table.insert(card_list, context.scoring_hand[i])
           			end
            		local rank = average_rank(card_list) or 0
            		-----------
            		local _card = G.hand.cards[i]
					converted = true
            		for i = 1, #G.hand.cards do
					local _card = G.hand.cards[i]
						if _card:get_id() ~= rank and not SMODS.has_no_rank(_card) then
							G.E_MANAGER:add_event(Event({
								func = function()
									assert(SMODS.change_base(_card, _, rank))
									_card:juice_up()
									return true
								end,
								}))
						end
					end
				if converted then
				return { message = rank, colour = G.C.PURPLE }
				end
		end
		]]
			
		if context.poker_hands ~= nil and next(context.poker_hands["Pair"]) then
			return {
				message = localize({ type = "variable", key = "a_powmult", vars = { card.ability.extra.power } }),
				Emult_mod = math.min(card.ability.extra.power, Global_Cap),
				colour = G.C.DARK_EDITION,
				}
			end
		end
	end,
    cry_credits = {
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

SMODS.Joker {
	key = "trio",
	config = { extra = { power = 3 } },
	rarity = "cry_exotic",
	atlas =  "v_atlas_1",
	blueprint_compat = true,
	pos = { x = 0, y = 1 },
	soul_pos = { x = 2, y = 1, extra = { x = 1, y = 1 } },
	cost = 50,
	order = 132,
	loc_vars = function(self, info_queue, card)
		return { vars = { card and card.ability.extra.power } }
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			if context.poker_hands ~= nil and next(context.poker_hands["Three of a Kind"]) then
				return {
					message = localize({ type = "variable", key = "a_powmult", vars = { card.ability.extra.power } }),
					Emult_mod = math.min(card.ability.extra.power, Global_Cap),
					colour = G.C.DARK_EDITION,
				}
			end
		end
	end,
    cry_credits = {
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

SMODS.Joker {
	key = "family",
	config = { extra = { power = 4 } },
	rarity = "cry_exotic",
	atlas =  "v_atlas_1",
	blueprint_compat = true,
	pos = { x = 3, y = 1 },
	soul_pos = { x = 5, y = 1, extra = { x = 4, y = 1 } },
	cost = 50,
	order = 133,
	loc_vars = function(self, info_queue, card)
		return { vars = { card and card.ability.extra.power } }
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			if context.poker_hands ~= nil and next(context.poker_hands["Four of a Kind"]) then
				return {
					message = localize({ type = "variable", key = "a_powmult", vars = { card.ability.extra.power } }),
					Emult_mod = math.min(card.ability.extra.power, Global_Cap),
					colour = G.C.DARK_EDITION,
				}
			end
		end
	end,
    cry_credits = {
			idea = {
				"hssr96"
			},
			art = {
				"MarioFan597"
			},
			code = {
				"MarioFan597"
			}
		},
}

SMODS.Joker {
	key = "order",
	config = { extra = { e_mult = 3 } },
	rarity = "cry_exotic",
	atlas =  "v_atlas_1",
	pos = { x = 6, y = 3 },
	soul_pos = { x = 8, y = 3, extra = { x = 7, y = 3 } },
	cost = 50,
	order = 134,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.e_mult } }
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			if context.poker_hands ~= nil and next(context.poker_hands["Straight"]) then
			return {
				message = localize({
					type = "variable",
					key = "a_powmult",
					vars = {
						number_format(card.ability.extra.e_mult),
					},
				}),
				Emult_mod = math.min(card.ability.extra.e_mult, Global_Cap),
				colour = G.C.DARK_EDITION,
			}
			end
		end
	end,
	cry_credits = {
			idea = {
				"hssr96"
			},
			art = {
				"Oinite12"
			},
			code = {
				"Glitchkat10"
			}
		},
}

SMODS.Joker {
	key = "tribe",
	config = { extra = { e_mult = 2 } },
	rarity = "cry_exotic",
	atlas =  "v_atlas_1",
	pos = { x = 9, y = 3 },
	soul_pos = { x = 11, y = 3, extra = { x = 10, y = 3 } },
	cost = 50,
	order = 135,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.e_mult } }
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			if context.poker_hands ~= nil and next(context.poker_hands["Flush"]) then
			return {
				message = localize({
					type = "variable",
					key = "a_powmult",
					vars = {
						number_format(card.ability.extra.e_mult),
					},
				}),
				Emult_mod = math.min(card.ability.extra.e_mult, Global_Cap),
				colour = G.C.DARK_EDITION,
			}
			end
		end
	end,
	cry_credits = {
			idea = {
				"hssr96"
			},
			art = {
				"Oinite12"
			},
			code = {
				"Glitchkat10"
			}
	},
}

SMODS.Joker{
	key = "drivers_license",
	pos = { x = 0, y = 5 },
	soul_pos = { x = 2, y = 5, extra = { x = 1, y = 5 } },
	rarity = "cry_exotic",
	cost = 50,
	order = 141,
	config = { extra = { base_mult = 1 } },
	blueprint_compat = false,
	atlas = "v_atlas_1",
	loc_vars = function(self, info_queue, card)
		local mod_count = 0
		if G and G.deck and G.deck.cards then
			for _, c in ipairs(G.deck.cards) do
				-- edition
				if c.edition then
					mod_count = mod_count + 1
				end
				-- seal
				if c.seal then
					mod_count = mod_count + 1
				end
				-- enhancement
				if c.ability.set == "Enhanced" then
					mod_count = mod_count + 1
				end
			end
		end
		return {
			vars = {
				math.min(card.ability.extra.base_mult * (2^mod_count), Global_Cap)
			}
		}
	end,
	calculate = function(self, card, context)
		if context.joker_main and not context.blueprint then
			local mod_count = 0
			if G and G.deck and G.deck.cards then
				for _, c in ipairs(G.deck.cards) do
					-- edition
					if c.edition then
						mod_count = mod_count + 1
					end
					-- seal
					if c.seal then
						mod_count = mod_count + 1
					end
					-- enhancement
					if c.ability.set == "Enhanced" then
						mod_count = mod_count + 1
					end
				end
			end
			
			return {
				x_mult = math.min(2^mod_count, Global_Cap)
			}
		end
		return nil
	end,
	cry_credits = {
			idea = {
				"Glitchkat10"
			},
			art = {
				"Tatteredlurker"
			},
			code = {
				"Glitchkat10"
			}
	},
}

SMODS.Joker {
	key = "thanatos",
	config = { extra = { power = 1, gain = 1} },
	rarity = "cry_exotic",
	atlas = "v_atlas_1",
	blueprint_compat = true,
	pos = { x = 3, y = 2 },
	soul_pos = { x = 5, y = 2, extra = { x = 4, y = 2 } },
	cost = 50,
	order = 146,
	loc_vars = function(self, info_queue, card)
		return { vars = { card and card.ability.extra.power, card and card.ability.extra.gain } }
	end,

	calculate = function(self, card, context)
	 if not context.blueprint and context.remove_playing_cards and context.removed then --Check if face cards are removed.
	 	local check = 0
		for _, _card in ipairs(context.removed) do
        	if _card:is_face() then
        		local replacement = copy_card(_card)
        		_card:add_to_deck()
        		table.insert(G.playing_cards, replacement)
        		G.hand:emplace(replacement)
        		playing_card_joker_effects({ replacement })
          		card.ability.extra.power = card.ability.extra.power + card.ability.extra.gain
          		check = check + 1 --We need to do a check here instead of the return statement otherwise it wouldn't count every face card
        	end
      	end
      	if check > 0 then
      		return {
	            	message = localize("k_upgrade_ex"),
	            	colour = G.C.DARK_EDITION,
	            	remove = true
	            	}
	    end
	end

	if context.joker_main then
			if card.ability.extra.power > 1 then
				return {
				message = localize({ type = "variable", key = "a_powmult", vars = { card.ability.extra.power} }),
				Emult_mod = card.ability.extra.power,
				colour = G.C.DARK_EDITION,
				}
			end
		end
	end,
    cry_credits = {
			idea = {
				"hssr96",
				"TheOfficialfem"
			},
			art = {
				"MarioFan597"
			},
			code = {
				"MarioFan597"
			}
	},
}

--[[
SMODS.Joker {
	key = "to_the_moon",
	config = { extra = {  } },
	rarity = "cry_exotic",
	atlas = "v_atlas_1",
	blueprint_compat = true,
	pos = { x = 6, y = 2 },
	soul_pos = { x = 8, y = 2, extra = { x = 7, y = 2 } },
	cost = 50,
	--Modified from code taken directly from event 9 of choclate dice
	add_to_deck= function(self, card, from_debuff)
		SMODS.Events["ev_asc_tripple_money"]:start()
	end,
	calculate = function(self, card, context)
		if
			context.end_of_round
			and not context.individual
			and not context.repetition
			and not context.blueprint
			and not context.retrigger_joker
			and G.GAME.blind.boss
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
    cry_credits = {
			idea = {
				"TheOfficialfem"
			},
			art = {
				"Oinite12"
			},
			code = {
				"MarioFan597"
			}
		},
}
]]--

----------Cryptid Jokers----------

SMODS.Joker {
	key = "gardenfork",
	config = { extra = { money = 1.7 } },
	rarity = "cry_exotic",
	atlas = "c_atlas_1",
	blueprint_compat = true,
	pos = { x = 6, y = 0 },
	soul_pos = { x = 8, y = 0, extra = { x = 7, y = 0 } },
	cost = 50,
	order = 216,
	loc_vars = function(self, info_queue, card)
		return { vars = { card and card.ability.extra.money } }
	end,
	calculate = function(self, card, context)
		if context.cardarea == G.jokers and context.before and context.full_hand then
			local has_ace = false
			local has_7 = false
			for i = 1, #context.full_hand do
				if context.full_hand[i]:get_id() == 14 then
					has_ace = true
				elseif context.full_hand[i]:get_id() == 7 then
					has_7 = true
				end
			end
			if (has_ace or has_7) and G.GAME.dollars > to_big(0) then
				ease_dollars(G.GAME.dollars * card.ability.extra.money)
				return { message = "X" .. card.ability.extra.money, colour = G.C.MONEY }
			end
		end
	end,
    cry_credits = {
			idea = {
				"Adrianinoninja"
			},
			art = {
				"Oinite12"
			},
			code = {
				"Jevonn",
				"MarioFan597"
			}
		},
}

SMODS.Joker {
	key = "oil_lamp", --This is mostly just taken straight from oil lamp's code
	pos = { x = 3, y = 0 },
	soul_pos = { x = 5, y = 0, extra = { x = 4, y = 0 } },
	config = { extra = { increase = 1.2 } },
	rarity = "cry_exotic",
	cost = 50,
	order = 277,
	atlas = "c_atlas_1",
	loc_vars = function(self, info_queue, card)
		card.ability.blueprint_compat_ui = card.ability.blueprint_compat_ui or ""
		card.ability.blueprint_compat_check = nil
		return {
			vars = { card.ability.extra.increase },
		}
	end,
	calculate = function(self, card, context)
		if context.end_of_round and not context.repetition and not context.individual and not context.blueprint then
			local check = false
			for i = 1, #G.jokers.cards do
				if not (G.jokers.cards[i] == card) then
						if not Card.no(G.jokers.cards[i], "immutable", true) then
							check = true
							Cryptid.with_deck_effects(G.jokers.cards[i], function(cards)
								Cryptid.misprintize(
									cards,
									{ min = card.ability.extra.increase, max = card.ability.extra.increase },
									nil,
									true
								)
							end)
					end
				end
			end
			if check then
				card_eval_status_text(
					card,
					"extra",
					nil,
					nil,
					nil,
					{ message = localize("k_upgrade_ex"), colour = G.C.GREEN }
				)
			end
		end
	end,
	cry_credits = {
		idea = {
			"MarioFan597",
		},
		art = {
			"MarioFan597",
		},
		code = {
			"Foegro",
			"MarioFan597",
		},
	},
}

SMODS.Joker {
	key = "high_five",
	config = { extra = {power = 1.1 } },
	rarity = "cry_exotic",
	atlas =  "c_atlas_1",
	blueprint_compat = false,
	pos = { x = 0, y = 0 },
	soul_pos = { x = 2, y = 0, extra = { x = 1, y = 0 } },
	cost = 50,
	order = 287,
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.e_cry_astral
		return { vars = { card and card.ability.extra.power } }
	end,
	calculate = function(self, card, context)
		if
			context.cardarea == G.jokers
			and context.before
			and not context.blueprint_card
			and not context.retrigger_joker
		then
			local five_count = 0
			for i = 1, #context.scoring_hand do
				local _card = context.scoring_hand[i]
				local rank = _card:get_id()
				if rank == 5 then
						five_count = five_count + 1
				end
			end

			if five_count > 0 then
				for i = 1, #context.scoring_hand do
				local _card = context.scoring_hand[i]
				converted = true
				local _card = context.scoring_hand[i]
					if _card:get_id() ~= 5 and not SMODS.has_no_rank(_card) then
						G.E_MANAGER:add_event(Event({
							func = function()
								assert(SMODS.change_base(_card, _, "5"))
								_card:juice_up()
								return true
							end,
						}))
					end
					local enhancement = "cry_astral"
					if _card.ability.effect ~= "Astral" then
						_card:set_edition({cry_astral = true})
					end
					G.E_MANAGER:add_event(Event({
						delay = 0.6,
						func = function()	
							_card:juice_up()
							play_sound("tarot1")
							return true
						end,
					}))
				end
				if converted then
				return { message = "I Wish", colour = G.C.PURPLE }
				end
			end
		end
	end,
    cry_credits = {
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

----------Cryptid Mortal Jokers----------

SMODS.Joker{
	key = "b_cake",
	config = { extra = { chips = 80, reroll = 20 } },
	rarity = 2,
	atlas = "c_atlas_mortal",
	blueprint_compat = true,
	pools = { ["Food"] = true },
	pos = { x = 0, y = 0 },
	cost = 8,
	order = 508,
	loc_vars = function(self, info_queue, card)
	return { vars = { card and card.ability.extra.chips, card and card.ability.extra.reroll } }
	end,
	calculate = function(self, card, context)
	--Taken from crustulum

		if context.reroll_shop and not context.blueprint then
			card.ability.extra.chips = card.ability.extra.chips - card.ability.extra.reroll
			if card.ability.extra.chips > 0 then
				--G.GAME.current_round.free_rerolls = G.GAME.current_round.free_rerolls + 1
				--calculate_reroll_cost(true)
				card_eval_status_text(card, "extra", nil, nil, nil, {
					card_eval_status_text(
					card,
					"extra",
					nil,
					nil,
					nil,
					{message =  "-"..card.ability.extra.reroll, colour = G.C.CHIPS}
				)
				})
				return nil, true
			else
				-- This part plays the animation.
				G.E_MANAGER:add_event(Event({
					func = function()
						play_sound("tarot1")
						card.T.r = -0.2
						card:juice_up(0.3, 0.4)
						card.states.drag.is = true
						card.children.center.pinch.x = true
						-- This part destroys the card.
						G.E_MANAGER:add_event(Event({
							trigger = "after",
							delay = 0.3,
							blockable = false,
							func = function()
								G.jokers:remove_card(card)
								card:remove()
								card = nil
								return true;
							end
						}))
						return true
				end
				}))
				return {
					message = "Eaten!"
				}
			end
		end
		if context.joker_main then
			if card.ability.extra.chips > 0 then
				return {
					chip_mod = math.min(card.ability.extra.chips, Global_Cap),
					message = localize { type = "variable", key = "a_chips", vars = { math.min(card.ability.extra.chips, Global_Cap) } }
				}
			end
		end
	end,
	add_to_deck = function(self, card, from_debuff)
		--This makes the reroll immediately after obtaining free because the game doesn't do that for some reason
		G.GAME.current_round.free_rerolls = G.GAME.current_round.free_rerolls + 1
		calculate_reroll_cost(true)
	end,
	remove_from_deck = function(self, card, from_debuff)
		calculate_reroll_cost(true)
	end,

	cry_credits = {
			idea = {
				"MarioFan597"
			},
			art = {
				"MarioFan597"
			},
			code = {
				"MarioFan597",
				"Jevonn"
			}
	},
}
--[[
SMODS.Joker { --Commented out at the moment as it is also increasing hand size at the moment for some reason
	key = "gemino", --Mostly taken from gemini
	config = { extra = { scale = 2 } },
	rarity = 3,
	atlas = "c_atlas_mortal",
	blueprint_compat = true,
	pos = { x = 1, y = 0 },
	cost = 10,
	order = 515,
	loc_vars = function(self, info_queue, card)
		card.ability.blueprint_compat_ui = card.ability.blueprint_compat_ui or ''; card.ability.blueprint_compat_check = nil
		return {
			vars = { card.ability.extra.scale },
			main_end = (card.area and card.area == G.jokers) and {
        			{n=G.UIT.C, config={align = "bm", minh = 0.4}, nodes={
            				{n=G.UIT.C, config={ref_table = card, align = "m", colour = G.C.JOKER_GREY, r = 0.05, padding = 0.06, func = 'blueprint_compat'}, nodes={
                			{n=G.UIT.T, config={ref_table = card.ability, ref_value = 'blueprint_compat_ui',colour = G.C.UI.TEXT_LIGHT, scale = 0.32*0.8}},
            				}}
        			}}
    			} or nil
		}
	end,
	update = function(self, card, front)
		if G.STAGE == G.STAGES.RUN then
			other_joker = G.jokers.cards[1]
			if other_joker and other_joker ~= card and not (Card.no(other_joker, "immutable", true)) then
                		card.ability.blueprint_compat = 'compatible'
            		else
               			card.ability.blueprint_compat = 'incompatible'
            		end
		end
	end,
	calculate = function(self, card2, context)
		if context.end_of_round and not context.repetition and not context.individual then
			local check = false
			local card = G.jokers.cards[1]
			if not Card.no(G.jokers.cards[1], "immutable", true) then
				Cryptid.with_deck_effects(G.jokers.cards[1], function(card)
					Cryptid.misprintize(card, { min = 2, max = 2 }, nil, true, "+")
				end)
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
	cry_credits = {
			idea = {
				"Googol1e308plex"
			},
			art = {
				"Requiacity",
				"MarioFan597"
			},
			code = {
				"Math",
				"MarioFan597"
			}
	},
}
]]

---Functions-----
--Ruby's Misprint + value fix
--[[
function Cryptid.calculate_misprint(initial, min, max, grow_type, pow_level)
    local big_initial = (type(initial) ~= "table" and to_big(initial)) or initial
    local big_min = (type(min) ~= "table" and to_big(min)) or min
    local big_max = (type(max) ~= "table" and to_big(max)) or max

    local grow = Cryptid.log_random(pseudoseed("cry_misprint" .. G.GAME.round_resets.ante), big_min, big_max)

    local calc = big_initial
    if not grow_type then
        calc = calc * grow
    elseif grow_type == "+" then
        if to_big(math.abs(initial)) > to_big(0.00001) then calc = calc + grow end
    elseif grow_type == "-" then
        calc = calc - grow
    elseif grow_type == "/" then
        calc = calc / grow
    elseif grow_type == "^" then
        pow_level = pow_level or 1
        if pow_level == 1 then
            calc = calc ^ grow
        else
            local function hyper(level, base, height)
                local big_base = (type(base) ~= "table" and to_big(base)) or base
                local big_height = (type(height) ~= "table" and to_big(height)) or height

                if height == 1 then
                    return big_base
                elseif level == 1 then
                    return big_base ^ big_height
                else
                    local inner = hyper(level, base, height - 1)
                    return hyper(level - 1, base, inner)
                end
            end

            calc = hyper(pow_level, calc, grow)
        end
    end

    if calc > to_big(-1e100) and calc < to_big(1e100) then
        calc = to_number(calc)
    end

    return calc
end
]]

------Mod Menu Tabs (Taken directly and modified from more mario jokers)

local current_mod = SMODS.current_mod
local mod_path = SMODS.current_mod.path
asc_config = SMODS.current_mod.config
if asc_config["Insanity Mode!!!"] == nil then
  asc_config["Insanity Mode!!!"] = false
end

local ascensioTabs = function() return {
	{
		label = localize("asc_config"),
		chosen = true,
		tab_definition_function = function()
			asc_nodes = {}
			settings = { n = G.UIT.C, config = { align = "tm", padding = 0.05 }, nodes = {} }
      settings.nodes[#settings.nodes + 1] =
        create_toggle({ label = localize("asc_config_insanity_mode"), ref_table = asc_config, ref_value = "Insanity Mode!!!" })
			config = { n = G.UIT.R, config = { align = "tm", padding = 0 }, nodes = { settings } }
			asc_nodes[#asc_nodes + 1] = config
			return {
				n = G.UIT.ROOT,
				config = {
					emboss = 0.05,
					minh = 6,
					r = 0.1,
					minw = 10,
					align = "cm",
					padding = 0.2,
					colour = G.C.BLACK,
				},
				nodes = asc_nodes,
			}
		end,
	},
} end
SMODS.current_mod.extra_tabs = ascensioTabs
----------------------------------------------
------------MOD CODE END----------------------
