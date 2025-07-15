SMODS.Joker {
	key = "ceremonial",
	rarity = "cry_exotic",
	atlas = "v_atlas_1",
	blueprint_compat = true,
	demicoloncompat = true,
	pos = { x = 3, y = 7 },
	soul_pos = { x = 5, y = 7, extra = { x = 4, y = 7 } },
    config = { extra = { Emult = 1, Emult_mod = 1, odds = 4 } },
	cost = 50,
    asc_credits = {
			idea = {
				"TheOfficialfem"
			},
			art = {
				"Tatteredlurker"
			},
			code = {
				"Somethingcom515"
			}
	},
    loc_vars = function (self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
        return {vars = {numerator, denominator, card.ability.extra.Emult_mod, card.ability.extra.Emult}}
    end,
    calculate = function (self, card, context)
        if context.setting_blind and not card.getting_sliced and not context.blueprint then
            local eligiblejokers = {}
            for k, v in pairs(G.jokers.cards) do
                if not v.ability.eternal and v ~= card then
                    table.insert(eligiblejokers, v)
                end
            end
            local destroyedcount, addedemult = 0, 0
            if SMODS.pseudorandom_probability(card, 'dagger', 1, card.ability.extra.odds) then
                for k, v in pairs(eligiblejokers) do
                    destroyedcount = destroyedcount + 1
                    v.getting_sliced = true
                    G.GAME.joker_buffer = G.GAME.joker_buffer - 1
                    G.E_MANAGER:add_event(Event({func = function()
                        G.GAME.joker_buffer = 0
                        card.ability.extra.Emult = card.ability.extra.Emult + card.ability.extra.Emult_mod
                        card:juice_up(0.8, 0.8)
                        v:start_dissolve({HEX("57ECAB")}, nil, 1.6)
                    return true end }))
                    addedemult = addedemult + card.ability.extra.Emult_mod
                end
            end
            if destroyedcount > 0 then
                play_sound('slice1', 0.96+math.random()*0.08)
                card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize{type = 'variable', key = 'a_powmult', vars = {card.ability.extra.Emult+addedemult}}, colour = G.C.DARK_EDITION, no_juice = true})
                return nil, true
            end
        end
        if context.forcetrigger then
            card.ability.extra.Emult = card.ability.extra.Emult + card.ability.extra.Emult_mod
        end
        if context.joker_main or context.forcetrigger then
            return {
                emult = card.ability.extra.Emult,
                emult_message = {message = '^' ..card.ability.extra.Emult..' '.. localize('k_mult'), colour =  G.C.DARK_EDITION, sound = 'talisman_emult'}
            }
        end
    end
}