SMODS.Atlas {
	key = "stopwatch",
	path = "stopwatch.png",
	px = 71,
	py = 95
}

SMODS.Joker {
	key = "stopwatch",
	config = { extra = {chips = 0, gold_count = 0, chip_mod = 1,}},
	rarity = "cry_exotic",
	atlas =  "stopwatch",
	blueprint_compat = true,
	pos = { x = 0, y = 0 },
	soul_pos = { x = 2, y = 0, extra = { x = 1, y = 0 } },
	cost = 50,
	order = 703,
	loc_vars = function(self, info_queue, card)
		return {
			vars = {card.ability.extra.chips, card.ability.extra.chip_mod}
		}
	end,
	update = function(self, card, dt)
		local deck_list = {
			--Vanilla
			"b_red",
			"b_blue",
			"b_yellow",
			"b_green",
			"b_black",
			"b_magic",
			"b_nebula",
			"b_ghost",
			"b_abandoned",
			"b_checkered",
			"b_zodiac",
			"b_painted",
			"b_anaglyph",
			"b_plasma",
			"b_erratic",
			--More Mario Jokers
			"b_mmj_n64deck",
			--Cryptid
			"b_cry_very_fair",
			"b_cry_infinite",
			"b_cry_equilibrium",
			"b_cry_misprint",
			"b_cry_CCD",
			"b_cry_wormhole",
			"b_cry_conveyor",
			"b_cry_redeemed",
			"b_cry_glowing",
			"b_cry_critical",
			"b_cry_beta",
			"b_cry_bountiful",
			"b_cry_beige",
			"b_cry_legendary",
			"b_cry_e_deck",
			"b_cry_et_deck",
			"b_cry_sk_deck",
			"b_cry_st_deck",
			"b_cry_sl_deck",
			"b_cry_blank",
			"b_cry_antimatter",
			--Entropy
			"b_entr_twisted",
			"b_entr_redefined",
			"b_entr_containment"
		}
		card.ability.extra.gold_count = 0
		for i, v in pairs(deck_list) do
			if (Cryptid.safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", v, "wins", 8) or 0 ~= 0) then
				card.ability.extra.gold_count = card.ability.extra.gold_count + 1
			end
		end
		card.ability.extra.chip_mod = math.max(card.ability.extra.gold_count, 1)
		local time_elapsed = love.timer.getTime() - AST.start
		card.ability.extra.chips = (math.floor(time_elapsed/1) * card.ability.extra.chip_mod) --/1 means per second, /60 would mean per minute
	end,
	--Taken from old blueprint and Chad
	calculate = function(self, card, context)
		if context.joker_main and card.ability.extra.chips > 0 then
			return {
				message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips } },
				chip_mod = card.ability.extra.chips,
				colour = G.C.CHIPS
			}
		end
	end,
    ascxast_credits = {
			idea = {
				"CapitalChirp",
			},
			art = {
				"hasu"
			},
			code = {
				"MarioFan597"
			}
	},
}


---Animation
stopwatch_dt = 0
local _game_update = Game.update
function Game:update(dt)
	_game_update(self, dt)
	 stopwatch_dt = stopwatch_dt + dt -- cryptid has a check here but im not sure what it's for
		if G.P_CENTERS and G.P_CENTERS.j_asc_stopwatch and stopwatch_dt > 0.10 then
			stopwatch_dt = stopwatch_dt - 0.10
			local stopwatch = G.P_CENTERS.j_asc_stopwatch
			if stopwatch.soul_pos.x == 1 and stopwatch.soul_pos.y == 4 then --Last frame of animation
				stopwatch.soul_pos.x = 2
				stopwatch.soul_pos.y = 0
			elseif stopwatch.soul_pos.x < 4 then --If it isnt the right most image
				stopwatch.soul_pos.x = stopwatch.soul_pos.x + 1
			elseif stopwatch.soul_pos.y < 4 then --If it isnt the bottom most image
				stopwatch.soul_pos.x = 0
				stopwatch.soul_pos.y = stopwatch.soul_pos.y + 1
			end
	        -- oh my god i hate this so much but ARGH
	        -- note that this can't use find_card because it also needs to work in the collection
	        -- unless there's some other way you can do it
	        for _, card in pairs(G.I.CARD) do
	            if card and card.config.center == stopwatch then
	                card.children.floating_sprite:set_sprite_pos(stopwatch.soul_pos)
	            end
	        end
		end
end
