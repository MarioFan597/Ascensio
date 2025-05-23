SMODS.Joker {
	key = "hanging_chad",
	config = { extra = { retriggers = 20 } },
	rarity = "cry_exotic",
	atlas = "v_atlas_1", 
	blueprint_compat = true,
	demicoloncompat = false,
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
	asc_credits = {
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