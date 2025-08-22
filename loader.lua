----------Loading Vanilla Jokers----------
local v_jokers = {
	"jimbo",
	"greedy",
	"lusty",
	"wrathful",
	"gluttonous",
	"jolly",
	"zany",
	"mad",
	"crazy",
	"droll",
	"sly",
	"wily",
	"clever",
	"devious",
	"crafty",
	"stencil",
	"four_fingers",
	"mime",
	"credit_card",
	"ceremonial",
	"banner",
	"mystic_summit",
	"marble",
	"misprint",
	"fibonacci",
	"scary",
	"abstract",
	"banana",
	"even_steven",
	"odd_todd",
	"egg",
	"blackboard",
	"ice_cream",
	"dna",
	"blue",
	--"musa_ingens",
	"square",
	"hologram",
	"midas",
	"to_the_moon",
	"golden",
	"bull",
	"seltzer",
	"smiley_face",
	"campfire",
	"sock_and_buskin",
	"smeared",
	"throwback",
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
}

for _, v in pairs(v_jokers) do
	assert(SMODS.load_file("items/jokers/vanilla/" .. v .. ".lua"))()
end

----------Loading Cryptid Jokers----------
local cry_jokers = {
	"canvas",
	"sync_catalyst",
	"gardenfork",
	"like_antennas_to_heaven",
	"chad",
	"oil_lamp",
	"hunting_season",
	"high_five",
	"code_joker",
}

for _, v in pairs(cry_jokers) do
	assert(SMODS.load_file("items/jokers/cryptid/" .. v .. ".lua"))()
end

----------Loading Cryptid Mortal Jokers----------
local crym_jokers = {
	"b_cake",
	"b_pie",
	"orion_pax",
	"accomplice",
	"duane",
	"exorcist",
}

for _, v in pairs(crym_jokers) do
	assert(SMODS.load_file("items/jokers/cryptid_mortals/" .. v .. ".lua"))()
end

---------Loading Ascensio Consumables---------------

local asc_consumables = {
	"ascension",
}

for _, v in pairs(asc_consumables) do
	assert(SMODS.load_file("items/consumables/ascensio/" .. v .. ".lua"))()
end

---------Loading Ascensio Decks---------------

local asc_decks = {
	"starlight",
}

for _, v in pairs(asc_decks) do
	assert(SMODS.load_file("items/decks/ascensio/" .. v .. ".lua"))()
end

------------Cross Mod---------------------
---------Loading Cryptposting Jokers---------

if next(SMODS.find_mod("cryptposting")) then
	local crp_jokers = {}

	for _, v in pairs(crp_jokers) do
		assert(SMODS.load_file("items/jokers/cryptposting/" .. v .. ".lua"))()
	end

	---------Loading Cryptposting Consumables---------

	local crp_consumables = {}

	for _, v in pairs(crp_consumables) do
		assert(SMODS.load_file("items/consumables/cryptposting/" .. v .. ".lua"))()
	end
end

---------Loading Astronomica Jokers---------

if next(SMODS.find_mod("Astronomica")) then
	local ast_jokers = {
		"stopwatch",
		"facsimile",
	}

	for _, v in pairs(ast_jokers) do
		assert(SMODS.load_file("items/jokers/astronomica/" .. v .. ".lua"))()
	end

	---------Loading Astronomica Consumables---------

	local ast_consumables = {}

	for _, v in pairs(ast_consumables) do
		assert(SMODS.load_file("items/consumables/astronomica/" .. v .. ".lua"))()
	end
end

---------Loading Entropy Jokers---------

if next(SMODS.find_mod("entr")) then
	local entr_jokers = {
		"sunny_joker",
		"chuckle_cola",
	}

	for _, v in pairs(entr_jokers) do
		assert(SMODS.load_file("items/jokers/entropy/" .. v .. ".lua"))()
	end

	--Vanilla Entropics
	local entr_vanilla = {
		"marble_entr",
	}
	for _, v in pairs(entr_vanilla) do
		assert(SMODS.load_file("items/jokers/vanilla_entropics/" .. v .. ".lua"))()
	end

	--Entropy Entropics
	local entr_apoth_jokers = {
		"sunny_joker_entr",
	}

	for _, v in pairs(entr_apoth_jokers) do
		assert(SMODS.load_file("items/jokers/entropy_entropics/" .. v .. ".lua"))()
	end

	---------Loading Entropy Consumables---------

	local entr_consumables = {
		"apotheosis",
	}

	for _, v in pairs(entr_consumables) do
		assert(SMODS.load_file("items/consumables/entropy/" .. v .. ".lua"))()
	end
end

---------Loading Animations---------

assert(SMODS.load_file("lib/cardanim.lua"))()

--------Loading Hooks-----------------------------

assert(SMODS.load_file("lib/hooks.lua"))()
