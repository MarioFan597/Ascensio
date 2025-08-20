local supermassive = 1.75e308

---Normalize given number.
---@param n number
---@return number
---N normalized value
local function normalize(n)
	if n ~= n or n == math.huge or n == -math.huge then
		return supermassive
	end
	return n
end

SMODS.Joker({
	key = "egg",
	rarity = "cry_exotic",
	atlas = "v_atlas_1",

	blueprint_compat = true,
	demicoloncompat = true,

	pos = { x = 9, y = 9 },
	soul_pos = { x = 11, y = 9, extra = { x = 10, y = 9 } },

	cost = 0,
	order = 1,

	config = {
		extra = {
			e_sell_gain = 1.1,
			xmult = 1,
		},
	},

	-- Fun fact: if you dont use a variables, name it _ to throws its values away
	-- (the value isn't getting deleted, garbage collector handle it for ya)
	-- Also the linter doesnt yell at me

	loc_vars = function(_, _, card)
		return {
			vars = {
				lenient_bignum(card.ability.extra.e_sell_gain),
				lenient_bignum(card.ability.extra.xmult),
			},
		}
	end,

	calculate = function(_, card, context)
		if context.joker_main or context.forcetrigger then
			return {
				message = localize({
					type = "variable",
					key = "a_xmult",
					vars = {
						number_format(lenient_bignum(card.ability.extra.xmult)),
					},
				}),
				Xmult_mod = lenient_bignum(card.ability.extra.xmult),
				colour = G.C.MULT,
			}
		end

		if context.end_of_round and context.main_eval and not (context.game_over or context.blueprint) then
			card.ability.extra_value = math.max(lenient_bignum(card.ability.extra_value), 10)
			local stdlg = math.ceil(math.log10(lenient_bignum(card.ability.extra_value)))
			card.ability.extra_value =
				math.pow(card.ability.extra_value, lenient_bignum(card.ability.extra.e_sell_gain))
			card:set_cost()

			G.E_MANAGER:add_event(Event({
				func = function()
					card_eval_status_text(
						card,
						"extra",
						nil,
						nil,
						nil,
						{ message = localize("k_val_up"), colour = G.C.MONEY }
					)
					return true
				end,
			}))

			card.ability.extra.xmult = math.min(card.ability.extra.xmult + normalize(stdlg), supermassive)

			card_eval_status_text(card, "extra", nil, nil, nil, {
				message = localize("k_upgrade_ex"),
				colour = G.C.MULT,
			})
		end
	end,

	asc_credits = {
		idea = {
			"OmegaLife",
		},
		art = {
			"Tatteredlurker",
		},
		code = {
			"OmegaLife",
		},
	},
})
