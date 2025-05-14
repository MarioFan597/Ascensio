----------------------------------------------
------------MOD CODE -------------------------
---
---
---
Global_Cap = 1000000
----------Defining Atlases------------------
SMODS.Atlas {
	key = "modicon",
	path = "modicon.png",
	px = 34,
	py = 34
}

SMODS.Atlas {
	key = "v_atlas_1",
	path = "vanilla_atlas_1.png",
	px = 71,
	py = 95
}

SMODS.Atlas {
	key = "c_atlas_1",
	path = "cryptid_atlas_1.png",
	px = 71,
	py = 95
}

SMODS.Atlas {
	key = "c_atlas_mortal",
	path = "cryptid_mortals_atlas.png",
	px = 71,
	py = 95
}

SMODS.Atlas {
	key = "ascension",
	path = "ascension.png",
	px = 71,
	py = 95
}

SMODS.Atlas {
	key = "oops_all_6s",
	path = "oops_all_6s.png",
	px = 71,
	py = 95
}

SMODS.Atlas {
	key = "defectus",
	path = "defectus.png",
	px = 71,
	py = 95
}

--[[
SMODS.Atlas {
	key = "gluttony",
	path = "gluttony.png",
	px = 71,
	py = 95
}


-----Defining Sounds------
SMODS.Sound{
	key = "mani",
	path = "mani.ogg"
}
--]]

----------Defining Consumables----------
--Borrowed and modyfied from MoreMarioJoker's powerup card and cryptid's gateway
local ascensionable = {
			j_joker = "j_asc_jimbo",
			j_greedy_joker = "j_asc_greedy",
			j_lusty_joker = "j_asc_lusty",
			j_wrathful_joker = "j_asc_wrathful",
			j_gluttonous_joker = "j_asc_gluttonous",
			j_stencil = "j_asc_stencil",
			j_credit_card = "j_asc_credit_card",
			j_misprint = "j_asc_misprint",
			j_scary_face = "j_asc_scary",
			j_abstract = "j_asc_abstract",
			j_dna = "j_asc_dna",
			j_midas_mask = "j_asc_midas",
			j_golden = "j_asc_golden",
			j_bull = "j_asc_bull",
			j_selzer = "j_asc_seltzer",
			j_oops = "j_asc_oops",
			j_duo = "j_asc_duo",
			j_trio = "j_asc_trio",
			j_family = "j_asc_family",
			j_order = "j_asc_order",
			j_tribe = "j_asc_tribe",
			j_drivers_license = "j_asc_drivers_license",
			j_caino = "j_asc_canio",
			-- j_to_the_moon = "j_asc_to_the_moon",
			j_cry_gardenfork = "j_asc_gardenfork",
			j_cry_oil_lamp = "j_asc_oil_lamp",
			j_cry_highfive = "j_asc_high_five",
			j_asc_b_cake = "j_cry_crustulum",
			j_asc_gemino = "j_cry_gemino"
		}

SMODS.Consumable {
	key = "ascension",
	set = "Spectral",
	atlas = "ascension",
	pos = { x = 0, y = 0 },
	soul_pos = { x = 2, y = 0, extra = { x = 1, y = 0 } },
	cost = 4,
	hidden = true,
	config = {},
	can_use = function(self, card)
		if #G.jokers.highlighted == 1 and ascensionable[G.jokers.highlighted[1].config.center.key] then
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
						deletable_jokers[#deletable_jokers + 1] = v
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
				local card = create_card("Joker", G.jokers, nil, "cry_exotic", nil, nil, ascensionable[ascendent.config.center.key], "cry_gateway")
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
	cry_credits = {
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
			"SMG9000"
		},
	},
}

----------Defining Vanilla Jokers----------
local v_jokers = {
	"jimbo",
	"greedy",
	"lusty",
	"wrathful",
	"gluttonous",
	"stencil",
	"credit_card",
	"misprint",
	"scary",
	"abstract",
	"dna",
	"midas",
	--"to_the_moon",
	"golden",
	"bull",
	"seltzer",
	"hanging_chad",
	"oops",
	"duo",
	"trio",
	"family",
	"order",
	"tribe",
	"drivers_license",
	"canio"
}

for i, v in pairs(v_jokers) do
	assert(SMODS.load_file("items/jokers/vanilla/"..v..".lua"))()
end

----------Defining Cryptid Jokers----------
local c_jokers = {
	"gardenfork",
	"oil_lamp",
	"high_five"
}

for i, v in pairs(c_jokers) do
	assert(SMODS.load_file("items/jokers/cryptid/"..v..".lua"))()
end

----------Defining Cryptid Mortal Jokers----------
local cm_jokers = {
	"b_cake",
	--"accomplice"
}

for i, v in pairs(cm_jokers) do
	assert(SMODS.load_file("items/jokers/cryptid_mortals/"..v..".lua"))()
end


------Mod Menu Tabs (Taken directly and modified from more mario jokers)

local current_mod = SMODS.current_mod
local mod_path = SMODS.current_mod.path
asc_config = SMODS.current_mod.config
if asc_config["Insanity Mode!!!"] == nil then
  asc_config["Insanity Mode!!!"] = false
end

local ascensioTabs = function() return {
	{
		label = localize("asc_config"),
		chosen = true,
		tab_definition_function = function()
			asc_nodes = {}
			settings = { n = G.UIT.C, config = { align = "tm", padding = 0.05 }, nodes = {} }
      settings.nodes[#settings.nodes + 1] =
        create_toggle({ label = localize("asc_config_insanity_mode"), ref_table = asc_config, ref_value = "Insanity Mode!!!" })
			config = { n = G.UIT.R, config = { align = "tm", padding = 0 }, nodes = { settings } }
			asc_nodes[#asc_nodes + 1] = config
			return {
				n = G.UIT.ROOT,
				config = {
					emboss = 0.05,
					minh = 6,
					r = 0.1,
					minw = 10,
					align = "cm",
					padding = 0.2,
					colour = G.C.BLACK,
				},
				nodes = asc_nodes,
			}
		end,
	},
} end
SMODS.current_mod.extra_tabs = ascensioTabs
----------------------------------------------
------------MOD CODE END----------------------
