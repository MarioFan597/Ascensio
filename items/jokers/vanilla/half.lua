
SMODS.Joker({
	key = "half",
	config = { extra = { mult = 1.2 } },
	rarity = "cry_exotic",
	atlas = "v_atlas_1",
	blueprint_compat = true,
	demicoloncompat = true,
	pos = { x = 0, y = 14 },
	soul_pos = { x = 2, y = 14, extra = { x = 1, y = 14 } },
	cost = 50,
	order = 16,
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card and lenient_bignum(card.ability.extra.mult),
			},
		}
	end,
	calculate = function(self, card, context) --I LOVE LUASLOP!!!! LUASLOP MY BELOVED!!!
		if context.joker_main or context.forcetrigger then
            if #context.full_hand <= 2 or context.forcetrigger then --thank you mariofan for condensiong the contexts, very smart and good jojb!!
				return {
					message = "^^" .. lenient_bignum(card.ability.extra.mult) .. " " .. localize("asc_mult"),
					EEmult_mod = lenient_bignum(card.ability.extra.mult),
					colour = G.C.DARK_EDITION,
					card = card,
				}
            else
                return nil
            end
		end
	end,
	asc_credits = {
		idea = {
			"hssr",
		},
		art = {
			"Lil Mr. Slipstream",
		},
		code = {
			"hasu",
            "MarioFan597",
		},
	},
})
