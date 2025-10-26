SMODS.Joker({
	key = "gluttonous",
	config = { extra = { e_mult = 1.2 } },
	rarity = "cry_exotic",
	atlas = "v_atlas_1",
	blueprint_compat = true,
	demicoloncompat = true,
	pos = { x = 9, y = 4 },
	soul_pos = { x = 11, y = 4, extra = { x = 10, y = 4 } },
	cost = 50,
	order = 5,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.e_mult } }
	end,
	calculate = function(self, card, context)
		--[[if context.individual and context.cardarea == G.hand and not context.end_of_round and context.other_card:is_suit("Clubs") then
            if context.other_card.debuff then
                return {
                    message = localize('k_debuffed'),
                    colour = G.C.RED
                }
            else
                return {
                    message = localize({
						type = "variable",
						key = "a_powmult",
						vars = { lenient_bignum(card.ability.extra.e_mult) },
					}),
					Emult_mod = lenient_bignum(card.ability.extra.e_mult),
					colour = G.C.DARK_EDITION,
                }
            end
        end
        ]]
		if context.individual or context.forcetrigger then
			if (context.cardarea == G.play and context.other_card:is_suit("Clubs")) or context.forcetrigger then
				return {
					message = localize({
						type = "variable",
						key = "a_powmult",
						vars = { lenient_bignum(card.ability.extra.e_mult) },
					}),
					Emult_mod = lenient_bignum(card.ability.extra.e_mult),
					colour = G.C.DARK_EDITION,
				}
			end
		end
	end,
	asc_credits = {
		idea = {
			"Lexi",
			"MarioFan597",
		},
		art = {
			"MarioFan597",
		},
		code = {
			"Somethingcom515",
			"Glitchkat10",
		},
	},
})

--Thanks Somethingcom515!
local oldsmodsscorecard = SMODS.score_card
function SMODS.score_card(card, context)
	if
		not G.scorehand
		and card:is_suit("Clubs")
		and next(SMODS.find_card("j_asc_gluttonous"))
		and context.cardarea == G.hand
	then
		G.scorehand = true
		context.cardarea = G.play
		SMODS.score_card(card, context)
		context.cardarea = G.hand
		G.scorehand = nil
	end
	return oldsmodsscorecard(card, context)
end
