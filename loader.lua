----------Loading Vanilla Jokers----------
local v_jokers = {
	"jimbo",
	"greedy",
	"lusty",
	"wrathful",
	"gluttonous",
	"stencil",
	"four_fingers",
	"mime",
	"credit_card",
	"ceremonial",
	"banner",
	"mystic_summit",
	"misprint",
	"fibonacci",
	"scary",
	"abstract",
	"blackboard",
	"dna",
	"blue",
	"square",
	"midas",
	"to_the_moon",
	"golden",
	"bull",
	"seltzer",
	"campfire",
	"throwback",
	"smeared",
	"hanging_chad",
	"blueprint",
	"oops",
	"duo",
	"trio",
	"family",
	"order",
	"tribe",
	"brainstorm",
	"drivers_license",
	"bootstraps",
	"canio",
	"sock_and_buskin",
}

for i, v in pairs(v_jokers) do
	assert(SMODS.load_file("items/jokers/vanilla/" .. v .. ".lua"))()
end

----------Loading Cryptid Jokers----------
local cry_jokers = {
	"canvas",
	"gardenfork",
	"like_antennas_to_heaven",
	"oil_lamp",
	"hunting_season",
	"high_five",
	"code_joker"
}

for i, v in pairs(cry_jokers) do
	assert(SMODS.load_file("items/jokers/cryptid/" .. v .. ".lua"))()
end

----------Loading Cryptid Mortal Jokers----------
local crym_jokers = {
	"b_cake",
	"b_pie",
	"orion_pax",
	--"accomplice",
	"exorcist",
}

for i, v in pairs(crym_jokers) do
	assert(SMODS.load_file("items/jokers/cryptid_mortals/" .. v .. ".lua"))()
end

---------Loading Ascensio Consumables---------------

local asc_consumables = {
	"ascension",
}

for i, v in pairs(asc_consumables) do
	assert(SMODS.load_file("items/consumables/ascensio/" .. v .. ".lua"))()
end

---------Loading Ascensio Decks---------------

local asc_decks = {
	--"starlight"
}

for i, v in pairs(asc_decks) do
	assert(SMODS.load_file("items/decks/ascensio/" .. v .. ".lua"))()
end

------------Cross Mod---------------------
---------Loading Cryptposting Jokers---------

if next(SMODS.find_mod("cryptposting")) then
	local crp_jokers = {}

	for i, v in pairs(crp_jokers) do
		assert(SMODS.load_file("items/jokers/cryptposting/" .. v .. ".lua"))()
	end

	---------Loading Cryptposting Consumables---------

	local crp_consumables = {}

	for i, v in pairs(crp_consumables) do
		assert(SMODS.load_file("items/consumables/cryptposting/" .. v .. ".lua"))()
	end
end

---------Loading Astronomica Jokers---------

if next(SMODS.find_mod("Astronomica")) then
	local ast_jokers = {
		"stopwatch",
		"facsimile",
	}

	for i, v in pairs(ast_jokers) do
		assert(SMODS.load_file("items/jokers/astronomica/" .. v .. ".lua"))()
	end

	---------Loading Astronomica Consumables---------

	local ast_consumables = {}

	for i, v in pairs(ast_consumables) do
		assert(SMODS.load_file("items/consumables/astronomica/" .. v .. ".lua"))()
	end
end

---------Loading Entropy Jokers---------

if next(SMODS.find_mod("entr")) then
	local entr_jokers = {
		"sunny_joker",
	}

	for i, v in pairs(entr_jokers) do
		assert(SMODS.load_file("items/jokers/entropy/" .. v .. ".lua"))()
	end

	local entr_apoth_jokers = {
		"sunny_joker_entr",
	}

	for i, v in pairs(entr_apoth_jokers) do
		assert(SMODS.load_file("items/jokers/entropy_entropics/" .. v .. ".lua"))()
	end

	---------Loading Entropy Consumables---------

	local entr_consumables = {
		"apotheosis",
	}

	for i, v in pairs(entr_consumables) do
		assert(SMODS.load_file("items/consumables/entropy/" .. v .. ".lua"))()
	end
end

---------Loading Animations---------

assert(SMODS.load_file("lib/cardanim.lua"))()
