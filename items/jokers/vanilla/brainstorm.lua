SMODS.Atlas {
	key = "brainstorm",
	path = "brainstorm.png",
	px = 71,
	py = 95
}

SMODS.Joker {
	key = "brainstorm",
	config = { extra = {  } },
	rarity = "cry_exotic",
	atlas =  "brainstorm",
	blueprint_compat = true,
	demicoloncompat = true,
	pos = { x = 0, y = 0 },
	soul_pos = { x = 0, y = 5, extra = { x = 0, y = 4 } },
	cost = 50,
	order = 138,
	--Taken from old blueprint and Chad
	calculate = function(self, card, context)
		local other_joker = G.jokers.cards[1]
		local position = 0

		if context.retrigger_joker_check and not context.retrigger_joker and other_joker ~= nil then
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] == card then
					position = i
				end
			end 
			if context.other_card == other_joker and position > 0 then
				return {
					message = localize("k_again_ex"),
					repetitions = position,
					card = card,
				}
			else
				return nil, true
			end
		end

		--[[
		local unallowed_rarietes = {
			"cry_exotic",
			'jen_wondrous',
			'jen_extraordinary',
			'jen_ritualistic',
			'jen_transcendent',
			'jen_omegatranscendent',
			'jen_omnipotent',
			'jen_miscellaneous',
			"entr_hyper_exotic",
			"entr_zenith",
			"crp_mythic",
			"crp_exomythic",
			"crp_exotic_2",
			"crp_:3",
			"crp_cryptastic",
			"crp_exomythicepicawesomeuncommon2mexotic_22exomythic4mecipe",
			"ast_worldbending",
			"ast_empyrean",
		}
		

		local rarity_check = true
		for i, v in pairs(unallowed_rarietes) do
			if other_joker.center.rarity == unallowed_rarietes[i] then
				rarity_check = false
			end
		end
		]]

		--Taken and modifed from Cryptid's smile (:D)
		if (context.ending_shop 
			and not context.individual
			and not context.repetition
			and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit
			and #G.jokers.cards
			and other_joker ~= nil
			and other_joker ~= card)
			or context.forcetrigger
			--and rarity_check
			--and not position == #G.jokers.cards
		then
			local roundcreatejoker = math.min(1, G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer))
			G.GAME.joker_buffer = G.GAME.joker_buffer + roundcreatejoker
			G.E_MANAGER:add_event(Event({
				func = function()
					if roundcreatejoker > 0 then
						local _card
						if other_joker.config.center.rarity == 1 then 
							_card = create_card("Joker", G.jokers, nil, 0, other_joker.edition and other_joker.edition.negative)
						elseif other_joker.config.center.rarity == 2 then  
							_card = create_card("Joker", G.jokers, nil, 0.9, other_joker.edition and other_joker.edition.negative)
						elseif other_joker.config.center.rarity == 4 then 
							_card = create_card("Joker", G.jokers, true, 4, other_joker.edition and other_joker.edition.negative)
						else
							_card = create_card("Joker", G.jokers, nil, other_joker.config.center.rarity, other_joker.edition and other_joker.edition.negative)
						end
						_card:add_to_deck()
						G.jokers:emplace(_card)
						_card:start_materialize()
						G.GAME.joker_buffer = 0
						end
						return true
					end,
				}))
				card_eval_status_text(card, "extra", nil, nil, nil, { message = localize("k_duplicated_ex")}) 
				return nil, true
		end
	end,
    asc_credits = {
			idea = {
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

---Animation

---Body

brain_dt = 0
local _game_update = Game.update
function Game:update(dt)
	_game_update(self, dt)
	 brain_dt = brain_dt + dt -- cryptid has a check here but im not sure what it's for
		if G.P_CENTERS and G.P_CENTERS.j_asc_brainstorm and brain_dt > 0.10 then
			brain_dt = brain_dt - 0.10
			local brain = G.P_CENTERS.j_asc_brainstorm
			if brain.pos.x == 9 and brain.pos.y == 3 then --Last frame of animation
				brain.pos.x = 0
				brain.pos.y = 0
			elseif brain.pos.x < 9 then --If it isnt the right most image
				brain.pos.x = brain.pos.x + 1
			elseif brain.pos.y < 3 then --If it isnt the bottom most image
				brain.pos.x = 0
				brain.pos.y = brain.pos.y + 1
			end
	        -- oh my god i hate this so much but ARGH
	        -- note that this can't use find_card because it also needs to work in the collection
	        -- unless there's some other way you can do it
	        for _, card in pairs(G.I.CARD) do
	            if card.children.back and card.config.center == brain then
	                card.children.back:set_sprite_pos(brain.pos)
	            end
	        end
		end
end

---Soul

storm_dt = 0
local _game_update = Game.update
function Game:update(dt)
	_game_update(self, dt)
	 storm_dt = storm_dt + dt -- cryptid has a check here but im not sure what it's for
		if G.P_CENTERS and G.P_CENTERS.j_asc_brainstorm and storm_dt > 0.10 then
			storm_dt = storm_dt - 0.10
			local storm = G.P_CENTERS.j_asc_brainstorm
			if storm.soul_pos.x == 9 and storm.soul_pos.y == 8 then --Last frame of animation
				storm.soul_pos.x = 0
				storm.soul_pos.y = 5
			elseif storm.soul_pos.x < 9 then --If it isnt the right most image
				storm.soul_pos.x = storm.soul_pos.x + 1
			elseif storm.soul_pos.y < 8 then --If it isnt the bottom most image
				storm.soul_pos.x = 0
				storm.soul_pos.y = storm.soul_pos.y + 1
			end
	        -- oh my god i hate this so much but ARGH
	        -- note that this can't use find_card because it also needs to work in the collection
	        -- unless there's some other way you can do it
	        for _, card in pairs(G.I.CARD) do
	            if card and card.config.center == storm then
	                card.children.floating_sprite:set_sprite_pos(storm.soul_pos)
	            end
	        end
		end
end