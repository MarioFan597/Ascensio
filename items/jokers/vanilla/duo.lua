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