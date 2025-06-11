----------Loading Vanilla Jokers----------
local v_jokers = {
	"jimbo",
	"greedy",
	"lusty",
	"wrathful",
	"gluttonous",
	"stencil",
	"credit_card",
	"mystic_summit",
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
	"blueprint",
	"oops",
	"duo",
	"trio",
	"family",
	"order",
	"tribe",
	"brainstorm",
	"drivers_license",
	"canio"
}

for i, v in pairs(v_jokers) do
	assert(SMODS.load_file("items/jokers/vanilla/"..v..".lua"))()
end

----------Loading Cryptid Jokers----------
local cry_jokers = {
	"gardenfork",
	"like_antennas_to_heaven",
	"oil_lamp",
	"hunting_season",
	"high_five"
}

for i, v in pairs(cry_jokers) do
	assert(SMODS.load_file("items/jokers/cryptid/"..v..".lua"))()
end

----------Loading Cryptid Mortal Jokers----------
local crym_jokers = {
	"b_cake",
	--"accomplice"
}

for i, v in pairs(crym_jokers) do
	assert(SMODS.load_file("items/jokers/cryptid_mortals/"..v..".lua"))()
end

---------Loading Ascensio Consumables---------------

local asc_consumables = {
	"ascension"
}

for i, v in pairs(asc_consumables) do
	assert(SMODS.load_file("items/consumables/ascensio/"..v..".lua"))()
end


------------Cross Mod---------------------
---------Loading Cryptposting Jokers---------

if next(SMODS.find_mod('Cryptposting')) then
	local crp_jokers = {
		
	}

	for i, v in pairs(crp_jokers) do
		assert(SMODS.load_file("items/jokers/cryptposting/"..v..".lua"))()
	end

---------Loading Cryptposting Consumables---------

	local crp_consumables = {
		
	}

	for i, v in pairs(crp_consumables) do
		assert(SMODS.load_file("items/consumables/cryptposting/"..v..".lua"))()
	end

end


---------Loading Astronomica Jokers---------

if next(SMODS.find_mod('Astronomica')) then
	local ast_jokers = {
		"stopwatch",
		"facsimile",

	}

	for i, v in pairs(ast_jokers) do
		assert(SMODS.load_file("items/jokers/astronomica/"..v..".lua"))()
	end

---------Loading Astronomica Consumables---------

	local ast_consumables = {
		
	}

	for i, v in pairs(ast_consumables) do
		assert(SMODS.load_file("items/consumables/astronomica/"..v..".lua"))()
	end

end

---------Loading Entropy Jokers---------

if next(SMODS.find_mod('Entropy')) then
	local entr_jokers = {
		
	}

	for i, v in pairs(entr_jokers) do
		assert(SMODS.load_file("items/jokers/entropy/"..v..".lua"))()
	end

---------Loading Astronomica Consumables---------

	local entr_consumables = {
		
	}

	for i, v in pairs(entr_consumables) do
		assert(SMODS.load_file("items/consumables/entropy/"..v..".lua"))()
	end

end

---------Loading Animations---------

assert(SMODS.load_file("lib/cardanim.lua"))()