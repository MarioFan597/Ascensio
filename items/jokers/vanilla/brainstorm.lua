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

	animation = {
		macro = {
			type = "skim",
			pos = {
				include = {{x1=0,x2=9,y1=0,y2=3}},
			},
			soul_pos = {
				include = {{x1=0,x2=9,y1=5,y2=8}}
			},
		}
	},

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