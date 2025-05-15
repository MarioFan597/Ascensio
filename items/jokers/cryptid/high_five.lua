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