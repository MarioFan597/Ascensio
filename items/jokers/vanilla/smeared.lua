SMODS.Joker({
	key = "smeared",
	rarity = "cry_exotic",
	atlas = "v_atlas_1",
	blueprint_compat = false,
	demicoloncompat = false,
	pos = { x = 9, y = 7 },
	soul_pos = { x = 11, y = 7, extra = { x = 10, y = 7 } },
	cost = 50,
	asc_credits = {
		idea = {
			"CapitalChirp",
		},
		art = {
			"Tatteredlurker",
		},
		code = {
			"Somethingcom515",
		},
	},
})

function is_id(card, ids)
	if next(SMODS.find_card("j_asc_smeared")) then
		return true
	end
	if SMODS.has_no_rank(card) and not card.vampired then
		return false
	end
	for _, value in ipairs(ids) do
		if card:get_id() == value then
			return true
		end
	end
	return false
end

local oldgetid = Card.get_id
function Card:get_id()
	if self.playing_card and next(SMODS.find_card("j_asc_smeared")) then
		return 14
	end
	return oldgetid(self)
end

local oldissuit = Card.is_suit
function Card:is_suit(suit, bypass_debuff, flush_calc)
	if self.playing_card and next(SMODS.find_card("j_asc_smeared")) then
		return true
	end
	return oldissuit(self, suit, bypass_debuff, flush_calc)
end

local oldisface = Card.is_face
function Card:is_face(from_boss)
	if self.playing_card and next(SMODS.find_card("j_asc_smeared")) then
		return true
	end
	return oldisface(self, from_boss)
end

if Card.is_numbered then
	local oldisnumbered = Card.is_numbered
	function Card:is_numbered(from_boss)
		if self.playing_card and next(SMODS.find_card("j_asc_smeared")) then
			return true
		end
		return oldisnumbered(self, from_boss)
	end
end

SMODS.current_mod.set_debuff = function(card)
	if
		next(SMODS.find_card("j_asc_smeared"))
		and card.playing_card
		and (not SMODS.has_no_rank(card) or not SMODS.has_no_suit(card))
	then
		return "prevent_debuff"
	end
end

local ids_op_ref = ids_op
function ids_op(card, op, b, c)
	local id = card:get_id()
	local other_results = false
	if ids_op_ref ~= nil then
		other_results = ids_op_ref(card, op, b, c)
	end

	local function alias(x)
		local has_smeared = next(SMODS.find_card("j_asc_smeared"))
		if card.playing_card and has_smeared then
			return 11
		end
		return x
	end

	if other_results == true then
		return true
	end

	if op == "mod" then
		return (id % b) == c
	end

	if op == "==" then
		local lhs = alias(id)
		local rhs = alias(b)
		return lhs == rhs
	end
	if op == "~=" then
		local lhs = alias(id)
		local rhs = alias(b)
		return lhs ~= rhs
	end

	if op == ">=" then
		return id >= b
	end
	if op == "<=" then
		return id <= b
	end
	if op == ">" then
		return id > b
	end
	if op == "<" then
		return id < b
	end

	error("ids_op: unsupported op " .. tostring(op))
end
