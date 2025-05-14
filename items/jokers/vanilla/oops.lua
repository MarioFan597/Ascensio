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