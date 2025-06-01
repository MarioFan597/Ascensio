SMODS.Atlas {
	key = "hunting_season",
	path = "hunting_season.png",
	px = 71,
	py = 95
}

SMODS.Joker {
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
	calculate = function(self, card, context) --This was taken in part and modified from the original hunting season
		if
			(context.cardarea == G.play or context.cardarea == "unscored")
			and context.destroy_card == context.full_hand[(#context.full_hand + 1) / 2]
			and (#context.full_hand % 2 ~= 0) -- Odd number of cards in played hand
			and #context.full_hand > 1
			and not context.blueprint
			and not context.retrigger_joker
		then
			for _, c in ipairs(context.full_hand) do
				--c.ability.perma_x_chips = c.ability.perma_x_chips or 1
				--if type(context.full_hand[(#context.full_hand + 1) / 2]:get_id()) == number then
					--c.ability.perma_x_chips = c.ability.perma_x_chips + (context.full_hand[(#context.full_hand + 1) / 2]:get_id()-1)
					c.ability.perma_x_mult = c.ability.perma_x_mult + context.full_hand[(#context.full_hand + 1) / 2]:get_id()
			end
			return {
				extra = {message = localize('k_upgrade_ex'), colour = G.C.MULT},
				colour = G.C.MULT,
				card = context.other_card,
 				remove = not context.destroy_card.ability.eternal }
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
}

---Extra
hunting_dt = 0
local _game_update = Game.update
function Game:update(dt)
	_game_update(self, dt)
	 hunting_dt = hunting_dt + dt -- cryptid has a check here but im not sure what it's for
		if G.P_CENTERS and G.P_CENTERS.j_asc_hunting_season and hunting_dt > 0.10 then
			hunting_dt = hunting_dt - 0.10
			local hunting = G.P_CENTERS.j_asc_hunting_season
			if hunting.soul_pos.extra.x == 4 and hunting.soul_pos.extra.y == 5 then --Last frame of animation
				hunting.soul_pos.extra.x = 0
				hunting.soul_pos.extra.y = 1
			elseif hunting.soul_pos.extra.x < 9 then --If it isnt the right most image
				hunting.soul_pos.extra.x = hunting.soul_pos.extra.x + 1
			elseif hunting.soul_pos.extra.y < 5 then --If it isnt the bottom most image
				hunting.soul_pos.extra.x = 0
				hunting.soul_pos.extra.y = hunting.soul_pos.extra.y + 1
			end
	        -- oh my god i hate this so much but ARGH
	        -- note that this can't use find_card because it also needs to work in the collection
	        -- unless there's some other way you can do it
	        for _, card in pairs(G.I.CARD) do
	            if card.children.back and card.config.center == hunting then
	                card.children.floating_sprite2:set_sprite_pos(hunting.soul_pos.extra)
	            end
	        end
		end
end

---Soul

season_dt = 0
local _game_update = Game.update
function Game:update(dt)
	_game_update(self, dt)
	 season_dt = season_dt + dt -- cryptid has a check here but im not sure what it's for
		if G.P_CENTERS and G.P_CENTERS.j_asc_hunting_season and season_dt > 0.10 then
			season_dt = season_dt - 0.10
			local season = G.P_CENTERS.j_asc_hunting_season
			if season.soul_pos.x == 4 and season.soul_pos.y == 10 then --Last frame of animation
				season.soul_pos.x = 0
				season.soul_pos.y = 6
			elseif season.soul_pos.x < 9 then --If it isnt the right most image
				season.soul_pos.x = season.soul_pos.x + 1
			elseif season.soul_pos.y < 10 then --If it isnt the bottom most image
				season.soul_pos.x = 0
				season.soul_pos.y = season.soul_pos.y + 1
			end
	        -- oh my god i hate this so much but ARGH
	        -- note that this can't use find_card because it also needs to work in the collection
	        -- unless there's some other way you can do it
	        for _, card in pairs(G.I.CARD) do
	            if card and card.config.center == season then
	                card.children.floating_sprite:set_sprite_pos(season.soul_pos)
	            end
	        end
		end
end