SMODS.Joker {
	key = "sunny_joker",
	config = { extra = {mult_asc = 2} },
	rarity = "cry_exotic",
	atlas =  "e_atlas_1",
	blueprint_compat = true,
	demicoloncompat = true,
	pos = { x = 0, y = 0 },
	soul_pos = { x = 2, y = 0, extra = { x = 1, y = 0 } },
	cost = 50,
	order = 1,
	loc_vars = function(self, info_queue, card)
        return {
            vars = {
                number_format(card.ability.extra.mult_asc),
            },
        }
    end,
	calculate = function(self, card, context)
        if context.joker_main or context.forcetrigger then
            return {
                asc = lenient_bignum(card.ability.extra.mult_asc),
            }
        end
    end,
    ascxentr_credits = {
			idea = {
				"Poker The Poker"
			},
			art = {
				"Lil. Mr Slipstream"
			},
			code = {
				"MarioFan597"
			}
		},
}