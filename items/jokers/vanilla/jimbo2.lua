---@param arrows number
---@param rhs number
local function format_operator(arrows, rhs)
	if arrows == 1 then
		return "^" .. rhs
	else
		if arrows == 2 then
			return "^^" .. rhs
		else
			if arrows == 3 then
				return "^^^" .. rhs
			else
				return "{" .. arrows .. "}" .. rhs
			end
		end
	end
end

SMODS.Joker({
	key = "beyond_jimbo",
	rarity = "asc_transcendent",

	atlas = "v_atlas_1",

	blueprint_compat = true,
	demicoloncompat = true,

	pos = { x = 9, y = 16 },
	soul_pos = { x = 11, y = 16, extra = { x = 10, y = 16 } },

	cost = 1e100,
	order = 1,

	config = {
		extra = {
			operator = 444,
			mult = 44,
		},
	},

	loc_vars = function(_, _, card)
		return {
			vars = {
				format_operator(card.ability.extra.operator, card.ability.extra.mult),
			},
		}
	end,

	calculate = function(_, card, context)
		if context.joker_main or context.forcetrigger then
			return {
				hypermult = { card.ability.extra.operator, card.ability.extra.rhs },
				message = format_operator(card.ability.extra.operator, card.ability.extra.rhs),
				colour = TranscendentGradient,
			}
		end
	end,
})
