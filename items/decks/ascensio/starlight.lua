SMODS.Back({
	key = "starlight",
	atlas = "deck_atlas",
	pos = { x = 0, y = 0 },
	config = { cry_negative_rate = 20, joker_slot = -2, consumables = { "c_asc_ascension" } },

	apply = function(self)
		G.GAME.modifiers.cry_negative_rate = self.config.cry_negative_rate
	end,

	init = function(_)
		SMODS.Edition:take_ownership("negative", {
			get_weight = function(self)
				return self.weight * (G.GAME.modifiers.cry_negative_rate or 1)
			end,
		}, true)
	end,
})

if CardSleeves then
	CardSleeves.Sleeve({
		key = "starlight",
		atlas = "sleeves",
		pos = { x = 0, y = 0 },

		unlock_condition = { deck = "Starlight Deck", stake = 1 },

		loc_vars = function(self)
			if self.get_current_deck_key() == "b_asc_starlight" then
				self.config = { cry_negative_rate = 10, joker_slot = -1, consumables = {} }
				return { key = self.key .. "_alt", vars = {} }
			else
				self.config = { cry_negative_rate = 20, joker_slot = -2, consumables = { "c_asc_ascension" } }
				return { key = self.key, vars = {} }
			end
		end,

		apply = function(self)
			G.GAME.modifiers.cry_negative_rate = (G.GAME.modifiers.cry_negative_rate or 1)
				* self.config.cry_negative_rate
			G.GAME.starting_params.joker_slots = G.GAME.starting_params.joker_slots + self.config.joker_slot
		end,
	})
end
