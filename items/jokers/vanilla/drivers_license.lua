local function count_mod()
	local cnt = 0

	if G and G.deck and G.deck.cards then
		for _, card in ipairs(G.deck.cards) do
			-- edition
			if card.edition then
				mod_count = mod_count + 1
			end
			-- seal
			if card.seal then
				mod_count = mod_count + 1
			end

			if next(SMODS.get_enhancements(card)) then
				mod_count = mod_count + 1
			end
		end
	end

	return cnt
end

SMODS.Joker({
	key = "drivers_license",
	pos = { x = 0, y = 5 },
	soul_pos = { x = 2, y = 5, extra = { x = 1, y = 5 } },
	rarity = "cry_exotic",
	cost = 50,
	order = 141,
	blueprint_compat = true,
	demicoloncompat = true,
	atlas = "v_atlas_1",

	config = {
		extra = {
			base = to_big(2),
		},
	},

	loc_vars = function(self, info_queue, card)
		local cnt = count_mod()

		return {
			vars = {
				card.ability.extra.base:pow(cnt),
			},
		}
	end,

	calculate = function(self, card, context)
		if context.joker_main or context.blueprint then
			local cnt = count_mod()

			return {
				x_mult = card.ability.extra.base:pow(cnt),
			}
		end
	end,

	asc_credits = {
		idea = {
			"Glitchkat10",
		},
		art = {
			"Tatteredlurker",
		},
		code = {
			"Glitchkat10",
			"OmegaLife",
		},
	},
})
