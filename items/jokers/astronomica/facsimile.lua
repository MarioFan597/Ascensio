SMODS.Atlas {
	key = "facsimile",
	path = "facsimile.png",
	px = 71,
	py = 95
}

SMODS.Joker {
	key = "facsimile",
	config = { extra = {} },
	rarity = "cry_exotic",
	atlas =  "facsimile",
	blueprint_compat = true,
	pos = { x = 0, y = 0 },
	soul_pos = { x = 14, y = 2, extra = { x = 0, y = 1 } },
	cost = 50,
	order = 706,
	--Taken from old blueprint and Chad
	calculate = function(self, card, context)
		local other_joker = nil
		for i = 1, #G.jokers.cards do
			if G.jokers.cards[i] == card then
				other_joker = G.jokers.cards[i - 1]
			end
		end
		if context.retrigger_joker_check and not context.retrigger_joker and other_joker ~= nil then
			local same_count = 0
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i].config.center.key == other_joker.config.center.key then
					same_count = same_count +1
				end
			end
			if context.other_card == other_joker then
				return {
					message = localize("k_again_ex"),
					repetitions = same_count,
					card = card,
				}
			else
				return nil, true
			end
		end
		--Taken and modifed from Cryptid's smile (:D)
		if context.ending_shop 
			and not context.individual
			and not context.repetition
			and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit
			and #G.jokers.cards
			and other_joker ~= nil
			--and not position == #G.jokers.cards
		then
			local roundcreatejoker = math.min(1, G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer))
			G.GAME.joker_buffer = G.GAME.joker_buffer + roundcreatejoker
			G.E_MANAGER:add_event(Event({
				func = function()
					if roundcreatejoker > 0 then
						local _card = copy_card(other_joker, nil, nil, nil, other_joker.edition and other_joker.edition.negative)
						_card:set_edition(other_joker.edition)
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
    ascxast_credits = {
			idea = {
				"Riley",
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
facsimile_dt = 0
local _game_update = Game.update
function Game:update(dt)
	_game_update(self, dt)
	 facsimile_dt = facsimile_dt + dt -- cryptid has a check here but im not sure what it's for
		if G.P_CENTERS and G.P_CENTERS.j_asc_facsimile and facsimile_dt > 0.10 then
			facsimile_dt = facsimile_dt - 0.10
			local facsimile = G.P_CENTERS.j_asc_facsimile
			if facsimile.soul_pos.x == 10 and facsimile.soul_pos.y == 9 then --Last frame of animation
				facsimile.soul_pos.x = 14
				facsimile.soul_pos.y = 2
			elseif facsimile.soul_pos.x > 0 then --If it isnt the left most image
				facsimile.soul_pos.x = facsimile.soul_pos.x - 1
			elseif facsimile.soul_pos.y < 9 then --If it isnt the bottom most image
				facsimile.soul_pos.x = 14
				facsimile.soul_pos.y = facsimile.soul_pos.y + 1
			end
	        -- oh my god i hate this so much but ARGH
	        -- note that this can't use find_card because it also needs to work in the collection
	        -- unless there's some other way you can do it
	        for _, card in pairs(G.I.CARD) do
	            if card and card.config.center == facsimile then
	                card.children.floating_sprite:set_sprite_pos(facsimile.soul_pos)
	            end
	        end
		end
end
