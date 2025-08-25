if not Entropy then
	Entropy = {}
end

SMODS.Atlas({
	key = "ascension",
	path = "ascension.png",
	px = 71,
	py = 95,
})

SMODS.Consumable({
	key = "ascension",
	set = "Spectral",
	atlas = "ascension",
	pos = { x = 0, y = 0 },
	soul_pos = { x = 2, y = 0, extra = { x = 1, y = 0 } },
	cost = 4,
	hidden = true,
	config = {},

	can_use = function(_, _)
		if #G.jokers.highlighted == 1 and Ascensionable[G.jokers.highlighted[1].config.center.key] then
			return true
		end
	end,

	use = function(_, _, _, _)
		local ascendant = G.jokers.highlighted[1]
		ascendant:set_eternal(nil)

		if (#SMODS.find_card("j_jen_saint") + #SMODS.find_card("j_jen_saint_attuned")) <= 0 then
			local deletable_jokers = {}
			if asc_config["Insanity Mode!!!"] or false then
				for _, v in pairs(G.jokers.cards) do
					if v == G.jokers.highlighted[1] then
						deletable_jokers[#deletable_jokers + 1] = v
					end
				end
			else
				for _, v in pairs(G.jokers.cards) do
					if not v.ability.eternal then
						if
							next(SMODS.find_mod("entr")) and not Entropy.DeckOrSleeve("doc")
							or to_big(G.GAME.entropy or 0) < to_big(100)
						then
							deletable_jokers[#deletable_jokers + 1] = v
						end
					end
				end
			end

			local _first_dissolve = nil
			G.E_MANAGER:add_event(Event({
				trigger = "before",
				delay = 0.75,
				func = function()
					for k, v in pairs(deletable_jokers) do
						if v.config.center.rarity == "cry_exotic" then
							check_for_unlock({ type = "what_have_you_done" })
						end

						v:start_dissolve(nil, _first_dissolve)
						_first_dissolve = true
					end
					return true
				end,
			}))
		end

		G.E_MANAGER:add_event(Event({
			trigger = "after",
			delay = 0.4,
			func = function()
				play_sound("timpani")

				local card = SMODS.create_card({
					key = Ascensionable[ascendant.config.center.key],
				})

				if ascendant.edition then
					card:set_edition(ascendant.edition, true, true)
				end

				if ascendant.ability.eternal then
					card.ability.eternal = true
				end

				card:add_to_deck()
				G.jokers:emplace(card)
				card:juice_up(0.3, 0.5)

				return true
			end,
		}))

		delay(0.6)
	end,

	in_pool = function()
		if G and G.jokers and G.jokers.cards then
			for _, v in ipairs(G.jokers.cards) do
				if Ascensionable[v.config.center.key] then
					return true
				end
			end
		end
		return false
	end,

	asc_credits = {
		idea = {
			"MarioFan597",
		},
		art = {
			"cozyori",
			"MarioFan597",
		},
		code = {
			"MarioFan597",
			"MathIsFun",
			"SMG9000",
		},
	},
})
