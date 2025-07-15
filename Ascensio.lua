----------------------------------------------
------------MOD CODE -------------------------

-----bignum compatibility using cryptid-----
Cryptid.mod_whitelist["Ascensio"] = true

----------Defining Multiuse Atlases------------------
SMODS.Atlas({
	key = "modicon",
	path = "modicon.png",
	px = 34,
	py = 34,
})

SMODS.Atlas({
	key = "v_atlas_1",
	path = "vanilla_atlas_1.png",
	px = 71,
	py = 95,
})

SMODS.Atlas({
	key = "c_atlas_1",
	path = "cryptid_atlas_1.png",
	px = 71,
	py = 95,
})

SMODS.Atlas({
	key = "c_atlas_mortal",
	path = "cryptid_mortals_atlas.png",
	px = 71,
	py = 95,
})

SMODS.Atlas({
	key = "e_atlas_1",
	path = "entropy_atlas_1.png",
	px = 71,
	py = 95,
})

SMODS.Atlas({
	key = "deck_atlas",
	path = "deck_atlas.png",
	px = 71,
	py = 95,
})

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

----Load the Loader-----
assert(SMODS.load_file("loader.lua"))()

---------Joker Ascension Dictionary-----------

ascensionable = {
	--Vanilla
	j_joker = "j_asc_jimbo",
	j_greedy_joker = "j_asc_greedy",
	j_lusty_joker = "j_asc_lusty",
	j_wrathful_joker = "j_asc_wrathful",
	j_gluttenous_joker = "j_asc_gluttonous", --No Touchie!!!! Sic
	j_stencil = "j_asc_stencil",
	j_four_fingers = "j_asc_four_fingers",
	j_mime = "j_asc_mime",
	j_credit_card = "j_asc_credit_card",
	j_ceremonial = "j_asc_ceremonial",
	j_banner = "j_asc_banner",
	j_mystic_summit = "j_asc_mystic_summit",
	j_misprint = "j_asc_misprint",
	j_fibonacci = "j_asc_fibonacci",
	j_scary_face = "j_asc_scary",
	j_abstract = "j_asc_abstract",
	j_blackboard = "j_asc_blackboard",
	j_dna = "j_asc_dna",
	j_blue_joker = "j_asc_blue",
	j_square = "j_asc_square",
	j_midas_mask = "j_asc_midas",
	j_golden = "j_asc_golden",
	j_bull = "j_asc_bull",
	j_selzer = "j_asc_seltzer", --No Touchie!!!! Sic
	j_campfire = "j_asc_campfire",
	j_throwback = "j_asc_throwback",
	j_hanging_chad = "j_asc_hanging_chad",
	j_blueprint = "j_asc_blueprint",
	j_smeared = "j_asc_smeared",
	j_oops = "j_asc_oops",
	j_duo = "j_asc_duo",
	j_trio = "j_asc_trio",
	j_family = "j_asc_family",
	j_order = "j_asc_order",
	j_tribe = "j_asc_tribe",
	j_brainstorm = "j_asc_brainstorm",
	j_drivers_license = "j_asc_drivers_license",
	j_caino = "j_asc_canio", --No Touchie!!!! Sic
	j_to_the_moon = "j_asc_to_the_moon",

	---Cryptid
	j_cry_canvas = "j_asc_canvas",
	j_cry_gardenfork = "j_asc_gardenfork",
	j_cry_antennastoheaven = "j_asc_like_antennas_to_heaven",
	j_cry_oil_lamp = "j_asc_oil_lamp",
	j_cry_huntingseason = "j_asc_hunting_season",
	j_cry_highfive = "j_asc_high_five",
	j_cry_CodeJoker = "j_asc_code_joker",

	---Cryptid Mortals
	j_asc_b_cake = "j_cry_crustulum",
	j_asc_b_pie = "j_cry_circulus_pistoris",
	j_asc_orion_pax = "j_cry_primus",
	j_asc_gemino = "j_cry_gemino",
	j_asc_exorcist = "j_cry_formidiulosus",
	---Cryptposting
	---Astronomica
	j_ast_facsimile = "j_asc_facsimile",
	j_ast_stopwatch = "j_asc_stopwatch",
	---Entropy
	j_entr_sunny_joker = "j_asc_sunny_joker",
}

---------Joker Ascension Dictionary-----------
apothable = {
	---Entropy
	j_entr_sunny_joker = "j_asc_sunny_joker_entr",
	j_asc_sunny_joker = "j_asc_sunny_joker_entr",
}

------Extra Functions----------
function factorial(n)
	if n == 0 then
		return 1
	else
		return n * factorial(n - 1)
	end
end

---Cryptid's Credit System----
--This was modified and taken from Entropy

---Ascensio Tag
local smcmb = SMODS.create_mod_badges
function SMODS.create_mod_badges(obj, badges)
	smcmb(obj, badges)
	if not SMODS.config.no_mod_badges and obj and obj.asc_credits then
		local function calc_scale_fac(text)
			local size = 0.9
			local font = G.LANG.font
			local max_text_width = 2 - 2 * 0.05 - 4 * 0.03 * size - 2 * 0.03
			local calced_text_width = 0
			-- Math reproduced from DynaText:update_text
			for _, c in utf8.chars(text) do
				local tx = font.FONT:getWidth(c) * (0.33 * size) * G.TILESCALE * font.FONTSCALE
					+ 2.7 * 1 * G.TILESCALE * font.FONTSCALE
				calced_text_width = calced_text_width + tx / (G.TILESIZE * G.TILESCALE)
			end
			local scale_fac = calced_text_width > max_text_width and max_text_width / calced_text_width or 1
			return scale_fac
		end
		if
			obj.asc_credits.art
			or obj.asc_credits.code
			or obj.asc_credits.idea
			or obj.asc_credits.name
			or obj.asc_credits.custom
		then
			local scale_fac = {}
			local min_scale_fac = 1
			local strings = { "Ascēnsiō" }
			for _, v in ipairs({ "name", "idea", "art", "code" }) do
				if obj.asc_credits[v] then
					for i = 1, #obj.asc_credits[v] do
						strings[#strings + 1] =
							localize({ type = "variable", key = "cry_" .. v, vars = { obj.asc_credits[v][i] } })[1]
					end
				end
			end
			if obj.asc_credits.custom then
				strings[#strings + 1] = localize({
					type = "variable",
					key = obj.asc_credits.custom.key,
					vars = { obj.asc_credits.custom.text },
				})
			end
			for i = 1, #strings do
				scale_fac[i] = calc_scale_fac(strings[i])
				min_scale_fac = math.min(min_scale_fac, scale_fac[i])
			end
			local ct = {}
			for i = 1, #strings do
				ct[i] = {
					string = strings[i],
				}
			end
			local cry_badge = {
				n = G.UIT.R,
				config = { align = "cm" },
				nodes = {
					{
						n = G.UIT.R,
						config = {
							align = "cm",
							colour = HEX("235bb0"),
							r = 0.1,
							minw = 2 / min_scale_fac,
							minh = 0.36,
							emboss = 0.05,
							padding = 0.03 * 0.9,
						},
						nodes = {
							{ n = G.UIT.B, config = { h = 0.1, w = 0.03 } },
							{
								n = G.UIT.O,
								config = {
									object = DynaText({
										string = ct or "ERROR",
										colours = { obj.asc_credits and obj.asc_credits.text_colour or G.C.WHITE },
										silent = true,
										float = true,
										shadow = true,
										offset_y = -0.03,
										spacing = 1,
										scale = 0.33 * 0.9,
									}),
								},
							},
							{ n = G.UIT.B, config = { h = 0.1, w = 0.03 } },
						},
					},
				},
			}
			local function eq_col(x, y)
				for i = 1, 4 do
					if x[1] ~= y[1] then
						return false
					end
				end
				return true
			end
			for i = 1, #badges do
				if eq_col(badges[i].nodes[1].config.colour, HEX("235bb0")) then
					badges[i].nodes[1].nodes[2].config.object:remove()
					badges[i] = cry_badge
					break
				end
			end
		end
	end
end

---Ascensio X Astronomica Tag
local smcmb2 = SMODS.create_mod_badges
function SMODS.create_mod_badges(obj, badges)
	smcmb2(obj, badges)
	if not SMODS.config.no_mod_badges and obj and obj.ascxast_credits then
		local function calc_scale_fac(text)
			local size = 0.9
			local font = G.LANG.font
			local max_text_width = 2 - 2 * 0.05 - 4 * 0.03 * size - 2 * 0.03
			local calced_text_width = 0
			-- Math reproduced from DynaText:update_text
			for _, c in utf8.chars(text) do
				local tx = font.FONT:getWidth(c) * (0.33 * size) * G.TILESCALE * font.FONTSCALE
					+ 2.7 * 1 * G.TILESCALE * font.FONTSCALE
				calced_text_width = calced_text_width + tx / (G.TILESIZE * G.TILESCALE)
			end
			local scale_fac = calced_text_width > max_text_width and max_text_width / calced_text_width or 1
			return scale_fac
		end
		if
			obj.ascxast_credits.art
			or obj.ascxast_credits.code
			or obj.ascxast_credits.idea
			or obj.ascxast_credits.name
			or obj.ascxast_credits.custom
		then
			local scale_fac = {}
			local min_scale_fac = 1
			local strings = { "Ascēnsiō X Astronomica" }
			for _, v in ipairs({ "name", "idea", "art", "code" }) do
				if obj.ascxast_credits[v] then
					for i = 1, #obj.ascxast_credits[v] do
						strings[#strings + 1] =
							localize({ type = "variable", key = "cry_" .. v, vars = { obj.ascxast_credits[v][i] } })[1]
					end
				end
			end
			if obj.ascxast_credits.custom then
				strings[#strings + 1] = localize({
					type = "variable",
					key = obj.ascxast_credits.custom.key,
					vars = { obj.ascxast_credits.custom.text },
				})
			end
			for i = 1, #strings do
				scale_fac[i] = calc_scale_fac(strings[i])
				min_scale_fac = math.min(min_scale_fac, scale_fac[i])
			end
			local ct = {}
			for i = 1, #strings do
				ct[i] = {
					string = strings[i],
				}
			end
			local cry_badge = {
				n = G.UIT.R,
				config = { align = "cm" },
				nodes = {
					{
						n = G.UIT.R,
						config = {
							align = "cm",
							colour = HEX("7664AC"),
							r = 0.1,
							minw = 2 / min_scale_fac,
							minh = 0.36,
							emboss = 0.05,
							padding = 0.03 * 0.9,
						},
						nodes = {
							{ n = G.UIT.B, config = { h = 0.1, w = 0.03 } },
							{
								n = G.UIT.O,
								config = {
									object = DynaText({
										string = ct or "ERROR",
										colours = {
											obj.ascxast_credits and obj.ascxast_credits.text_colour or G.C.WHITE,
										},
										silent = true,
										float = true,
										shadow = true,
										offset_y = -0.03,
										spacing = 1,
										scale = 0.33 * 0.9,
									}),
								},
							},
							{ n = G.UIT.B, config = { h = 0.1, w = 0.03 } },
						},
					},
				},
			}
			local function eq_col(x, y)
				for i = 1, 4 do
					if x[1] ~= y[1] then
						return false
					end
				end
				return true
			end
			for i = 1, #badges do
				if eq_col(badges[i].nodes[1].config.colour, HEX("235bb0")) then
					badges[i].nodes[1].nodes[2].config.object:remove()
					badges[i] = cry_badge
					break
				end
			end
		end
	end
end

---Ascensio X Entropy Tag
local smcmb3 = SMODS.create_mod_badges
function SMODS.create_mod_badges(obj, badges)
	smcmb3(obj, badges)
	if not SMODS.config.no_mod_badges and obj and obj.ascxentr_credits then
		local function calc_scale_fac(text)
			local size = 0.9
			local font = G.LANG.font
			local max_text_width = 2 - 2 * 0.05 - 4 * 0.03 * size - 2 * 0.03
			local calced_text_width = 0
			-- Math reproduced from DynaText:update_text
			for _, c in utf8.chars(text) do
				local tx = font.FONT:getWidth(c) * (0.33 * size) * G.TILESCALE * font.FONTSCALE
					+ 2.7 * 1 * G.TILESCALE * font.FONTSCALE
				calced_text_width = calced_text_width + tx / (G.TILESIZE * G.TILESCALE)
			end
			local scale_fac = calced_text_width > max_text_width and max_text_width / calced_text_width or 1
			return scale_fac
		end
		if
			obj.ascxentr_credits.art
			or obj.ascxentr_credits.code
			or obj.ascxentr_credits.idea
			or obj.ascxentr_credits.name
			or obj.ascxentr_credits.custom
		then
			local scale_fac = {}
			local min_scale_fac = 1
			local strings = { "Ascēnsiō X Entropy" }
			for _, v in ipairs({ "name", "idea", "art", "code" }) do
				if obj.ascxentr_credits[v] then
					for i = 1, #obj.ascxentr_credits[v] do
						strings[#strings + 1] =
							localize({ type = "variable", key = "cry_" .. v, vars = { obj.ascxentr_credits[v][i] } })[1]
					end
				end
			end
			if obj.ascxentr_credits.custom then
				strings[#strings + 1] = localize({
					type = "variable",
					key = obj.ascxentr_credits.custom.key,
					vars = { obj.ascxentr_credits.custom.text },
				})
			end
			for i = 1, #strings do
				scale_fac[i] = calc_scale_fac(strings[i])
				min_scale_fac = math.min(min_scale_fac, scale_fac[i])
			end
			local ct = {}
			for i = 1, #strings do
				ct[i] = {
					string = strings[i],
				}
			end
			local cry_badge = {
				n = G.UIT.R,
				config = { align = "cm" },
				nodes = {
					{
						n = G.UIT.R,
						config = {
							align = "cm",
							colour = HEX("912E59"),
							r = 0.1,
							minw = 2 / min_scale_fac,
							minh = 0.36,
							emboss = 0.05,
							padding = 0.03 * 0.9,
						},
						nodes = {
							{ n = G.UIT.B, config = { h = 0.1, w = 0.03 } },
							{
								n = G.UIT.O,
								config = {
									object = DynaText({
										string = ct or "ERROR",
										colours = {
											obj.ascxentr_credits and obj.ascxentr_credits.text_colour or G.C.WHITE,
										},
										silent = true,
										float = true,
										shadow = true,
										offset_y = -0.03,
										spacing = 1,
										scale = 0.33 * 0.9,
									}),
								},
							},
							{ n = G.UIT.B, config = { h = 0.1, w = 0.03 } },
						},
					},
				},
			}
			local function eq_col(x, y)
				for i = 1, 4 do
					if x[1] ~= y[1] then
						return false
					end
				end
				return true
			end
			for i = 1, #badges do
				if eq_col(badges[i].nodes[1].config.colour, HEX("235bb0")) then
					badges[i].nodes[1].nodes[2].config.object:remove()
					badges[i] = cry_badge
					break
				end
			end
		end
	end
end

------Mod Menu Tabs (Taken directly and modified from more mario jokers)

local current_mod = SMODS.current_mod
local mod_path = SMODS.current_mod.path
asc_config = SMODS.current_mod.config
if asc_config["Insanity Mode!!!"] == nil then
	asc_config["Insanity Mode!!!"] = false
end

local ascensioTabs = function()
	return {
		{
			label = localize("asc_config"),
			chosen = true,
			tab_definition_function = function()
				asc_nodes = {}
				settings = { n = G.UIT.C, config = { align = "tm", padding = 0.05 }, nodes = {} }
				settings.nodes[#settings.nodes + 1] = create_toggle({
					label = localize("asc_config_insanity_mode"),
					ref_table = asc_config,
					ref_value = "Insanity Mode!!!",
				})
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
	}
end
SMODS.current_mod.extra_tabs = ascensioTabs
----------------------------------------------
------------MOD CODE END----------------------
