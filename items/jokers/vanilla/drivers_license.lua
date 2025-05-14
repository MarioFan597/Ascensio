SMODS.Joker{
	key = "drivers_license",
	pos = { x = 0, y = 5 },
	soul_pos = { x = 2, y = 5, extra = { x = 1, y = 5 } },
	rarity = "cry_exotic",
	cost = 50,
	order = 141,
	config = { extra = { base_mult = 1 } },
	blueprint_compat = false,
	atlas = "v_atlas_1",
	loc_vars = function(self, info_queue, card)
		local mod_count = 0
		if G and G.deck and G.deck.cards then
			for _, c in ipairs(G.deck.cards) do
				-- edition
				if c.edition then
					mod_count = mod_count + 1
				end
				-- seal
				if c.seal then
					mod_count = mod_count + 1
				end
				-- enhancement
				if c.ability.set == "Enhanced" then
					mod_count = mod_count + 1
				end
			end
		end
		return {
			vars = {
				math.min(card.ability.extra.base_mult * (2^mod_count), Global_Cap)
			}
		}
	end,
	calculate = function(self, card, context)
		if context.joker_main and not context.blueprint then
			local mod_count = 0
			if G and G.deck and G.deck.cards then
				for _, c in ipairs(G.deck.cards) do
					-- edition
					if c.edition then
						mod_count = mod_count + 1
					end
					-- seal
					if c.seal then
						mod_count = mod_count + 1
					end
					-- enhancement
					if c.ability.set == "Enhanced" then
						mod_count = mod_count + 1
					end
				end
			end
			
			return {
				x_mult = math.min(2^mod_count, Global_Cap)
			}
		end
		return nil
	end,
	cry_credits = {
			idea = {
				"Glitchkat10"
			},
			art = {
				"Tatteredlurker"
			},
			code = {
				"Glitchkat10"
			}
	},
}