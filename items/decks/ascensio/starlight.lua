SMODS.Back({
	key = "starlight",
	atlas = "deck_atlas",
	pos = { x = 0, y = 0 },
	config = { cry_negative_rate = 20, joker_slot = -2, consumables = { "c_asc_ascension" } },
	apply = function(self)
		G.GAME.modifiers.cry_negative_rate = self.config.cry_negative_rate
	end,
	init = function(self)
		SMODS.Edition:take_ownership("negative", {
			get_weight = function(self)
				return self.weight * (G.GAME.modifiers.cry_negative_rate or 1)
			end,
		}, true)
	end,
})
