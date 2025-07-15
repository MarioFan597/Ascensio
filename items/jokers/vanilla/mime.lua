SMODS.Joker {
	key = "mime",
	config = {extra = {retriggers = 1}},
	rarity = "cry_exotic",
	atlas = "v_atlas_1",
	blueprint_compat = true,
	demicoloncompat = false,
	pos = { x = 6, y = 7 },
	soul_pos = { x = 8, y = 7, extra = { x = 7, y = 7 } },
	cost = 50,
    asc_credits = {
			idea = {
				"UTNerd24"
			},
			art = {
				"Oinite"
			},
			code = {
				"Somethingcom515"
			}
		},
	calculate = function (self, card, context)
		if context.repetition and (context.cardarea == G.hand or context.other_card.edition) then
			return {
				repetitions = card.ability.extra.retriggers * ((context.cardarea == G.hand and 1 or 0) + (context.other_card.edition and 1 or 0))
			}
		end
	end
}

local oldcalcedition = Card.calculate_edition
function Card:calculate_edition(context)
	local g
	if self.edition and context.cardarea == G.hand then
		if next(SMODS.find_card("j_asc_mime")) then
			context.cardarea = G.play
			g = oldcalcedition(self, context)
			context.cardarea = G.hand
		else
			g = oldcalcedition(self, context)
		end
	elseif self.edition and not next(SMODS.find_card("j_asc_mime")) then
		g = oldcalcedition(self, context)
	end
	return g
end