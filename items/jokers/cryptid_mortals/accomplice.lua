SMODS.Joker { --Commented out at the moment as it is also increasing hand size at the moment for some reason
	key = "accomplice", --Mostly taken from gemini
	config = { extra = { scale = 2 } },
	rarity = 3,
	atlas = "c_atlas_mortal",
	blueprint_compat = true,
	demicoloncompat = true,	
	pos = { x = 1, y = 0 },
	cost = 10,
	order = 515,
	loc_vars = function(self, info_queue, card)
		card.ability.blueprint_compat_ui = card.ability.blueprint_compat_ui or ''; card.ability.blueprint_compat_check = nil
		return {
			vars = { lenient_bignum(card.ability.extra.scale) },
			main_end = (card.area and card.area == G.jokers) and {
        			{n=G.UIT.C, config={align = "bm", minh = 0.4}, nodes={
            				{n=G.UIT.C, config={ref_table = card, align = "m", colour = G.C.JOKER_GREY, r = 0.05, padding = 0.06, func = 'blueprint_compat'}, nodes={
                			{n=G.UIT.T, config={ref_table = card.ability, ref_value = 'blueprint_compat_ui',colour = G.C.UI.TEXT_LIGHT, scale = 0.32*0.8}},
            				}}
        			}}
    			} or nil
		}
	end,
	update = function(self, card, front)
		if G.STAGE == G.STAGES.RUN then
			other_joker = G.jokers.cards[1]
			if other_joker and other_joker ~= card and not (Card.no(other_joker, "immutable", true)) then
                		card.ability.blueprint_compat = 'compatible'
            		else
               			card.ability.blueprint_compat = 'incompatible'
            		end
		end
	end,
	calculate = function(self, card2, context)
		if (context.end_of_round and not context.repetition and not context.individual) or context.forcetrigger then
			local check = false
			local card = G.jokers.cards[1]
			if not Card.no(G.jokers.cards[1], "immutable", true) then
				Cryptid.with_deck_effects(G.jokers.cards[1], function(card)
					Cryptid.misprintize(card, { min = lenient_bignum(card.ability.extra.scale), max = lenient_bignum(card.ability.extra.scale) }, nil, true, "+")
				end)
				check = true
			end
			if check then
				card_eval_status_text(
					context.blueprint_card or card2,
					"extra",
					nil,
					nil,
					nil,
					{ message = localize("k_upgrade_ex"), colour = G.C.GREEN }
				)
			end
			return nil, true
		end
	end,
	asc_credits = {
			idea = {
				"Googol1e308plex"
			},
			art = {
				"Requiacity",
				"MarioFan597"
			},
			code = {
				"Math",
				"MarioFan597"
			}
	},
}

---Functions-----
--Ruby's Misprint + value fix
--[[
function Cryptid.calculate_misprint(initial, min, max, grow_type, pow_level)
    local big_initial = (type(initial) ~= "table" and to_big(initial)) or initial
    local big_min = (type(min) ~= "table" and to_big(min)) or min
    local big_max = (type(max) ~= "table" and to_big(max)) or max

    local grow = Cryptid.log_random(pseudoseed("cry_misprint" .. G.GAME.round_resets.ante), big_min, big_max)

    local calc = big_initial
    if not grow_type then
        calc = calc * grow
    elseif grow_type == "+" then
        if to_big(math.abs(initial)) > to_big(0.00001) then calc = calc + grow end
    elseif grow_type == "-" then
        calc = calc - grow
    elseif grow_type == "/" then
        calc = calc / grow
    elseif grow_type == "^" then
        pow_level = pow_level or 1
        if pow_level == 1 then
            calc = calc ^ grow
        else
            local function hyper(level, base, height)
                local big_base = (type(base) ~= "table" and to_big(base)) or base
                local big_height = (type(height) ~= "table" and to_big(height)) or height

                if height == 1 then
                    return big_base
                elseif level == 1 then
                    return big_base ^ big_height
                else
                    local inner = hyper(level, base, height - 1)
                    return hyper(level - 1, base, inner)
                end
            end

            calc = hyper(pow_level, calc, grow)
        end
    end

    if calc > to_big(-1e100) and calc < to_big(1e100) then
        calc = to_number(calc)
    end

    return calc
end
]]