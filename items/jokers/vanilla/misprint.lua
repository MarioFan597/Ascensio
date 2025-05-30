SMODS.Atlas {
	key = "misprint",
	path = "misprint.png",
	px = 71,
	py = 95
}

SMODS.Joker {
	key = "misprint",
	config = { extra = { range = 200 } },
	rarity = "cry_exotic",
	atlas = "misprint",
	blueprint_compat = true,
	demicoloncompat = true,
	pos = { x = 0, y = 0 },
	soul_pos = { x = 5, y = 4, extra = { x = 4, y = 4 } },
	cost = 50,
	order = 27,

	animation = {
        macro = {
			type = "skim",
			pos = {
				include = {{x1=0,x2=5,y1=0,y2=4}},
				exclude = {{x1=4,x2=5,y1=4,y2=4}}
			},
        }
	},

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
		if (context.joker_main) or context.forcetrigger then
			if lenient_bignum(card.ability.extra.range) > 0 then
				local operator = math.random(1, 3) --1 is +, 2 is x, 3 is ^
				local type = math.random(1,2) --1 is chips, 2 is mult
				local result = lenient_bignum(math.random(1, lenient_bignum(card.ability.extra.range))) --Makes sure our result is consistant
				if operator == 1 then
					if type == 1 then
						return {
							message = localize({
								type = "variable",
								key = "a_chips",
								vars = {
									number_format(lenient_bignum(result)),
								},
							}),
							chip_mod = lenient_bignum(result),
							colour = G.C.CHIPS,
						}
					else
						return {
							message = localize({
								type = "variable",
								key = "a_mult",
								vars = {
									number_format(lenient_bignum(result)),
								},
							}),
							mult_mod = lenient_bignum(result),
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
									number_format(lenient_bignum(result)),
								},
							}),
							Xchip_mod = lenient_bignum(result),
							colour = G.C.CHIPS,
						}
					else
						return {
							message = localize({
								type = "variable",
								key = "a_xmult",
								vars = {
									number_format(lenient_bignum(result)),
								},
							}),
							Xmult_mod = lenient_bignum(result),
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
									number_format(lenient_bignum(result)),
								},
							}),
							Echip_mod = lenient_bignum(result),
							colour = G.C.DARK_EDITION,
						}
					else
						return {
							message = localize({
								type = "variable",
								key = "a_powmult",
								vars = {
									number_format(lenient_bignum(result)),
								},
							}),
							Emult_mod = lenient_bignum(result),
							colour = G.C.DARK_EDITION,
						}
					end
				end	
			end
		end
	end
	end,
	asc_credits = {
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