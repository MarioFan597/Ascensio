--Borrowed and modyfied from entropy's beyond

SMODS.Atlas {
	key = "apotheosis",
	path = "apotheosis.png",
	px = 71,
	py = 95
}

SMODS.Consumable {
	key = "apotheosis",
    inversion = "c_asc_ascension",
    pos = {x = 0, y = 0},
    tsoul_pos = {x=2, y=0, extra = {x=1,y=0}},
    dependencies = {
        items = {"set_entr_entropics", "set_entr_inversions"}
    },
    atlas = "apotheosis",
    set = "Omen",
    no_select = true,
    hidden=true,
    soul_rate = 0,
	can_use = function(self, card)
		if #G.jokers.highlighted == 1 and apothable[G.jokers.highlighted[1].config.center.key] then
				return true
		end
	end,
	use = function(self, card, area, copier)
		local ascendent = G.jokers.highlighted[1]
		ascendent:set_eternal(nil)
		if (#SMODS.find_card("j_jen_saint") + #SMODS.find_card("j_jen_saint_attuned")) <= 0 then
			local deletable_jokers = {}
			if asc_config["Insanity Mode!!!"] or false then
				for k, v in pairs(G.jokers.cards) do
					if v == G.jokers.highlighted[1] then
						deletable_jokers[#deletable_jokers + 1] = v
					end
				end
			else
				for k, v in pairs(G.jokers.cards) do
					if not v.ability.eternal then
                		if not Entropy.DeckOrSleeve("doc") or to_big(G.GAME.entropy or 0) < to_big(100) then
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
		--SMODS.add_card({key = ascensionable[G.jokers.highlighted[1].config.center.key]})
		G.E_MANAGER:add_event(Event({
			trigger = "after",
			delay = 0.4,
			func = function()
				play_sound("timpani")
				local card = create_card("Joker", G.jokers, nil, "entr_entropic", nil, nil, apothable[ascendent.config.center.key], "entr_beyond")
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
			for k, v in ipairs(G.jokers.cards) do
				if ascensionable[v.config.center.key] then
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
			"Ruby",
		},
		code = {
			"MarioFan597",
			"Ruby",
			"SMG9000"
		},
	},
}