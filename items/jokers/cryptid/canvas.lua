SMODS.Joker({
    key = "canvas",
    order = 4,
    pos = { x = 6, y = 3 },
    soul_pos = { x = 8, y = 3, extra = { x = 7, y = 3 } },
    rarity = "cry_exotic",
    cost = 50,
    blueprint_compat = true,
    atlas = "c_atlas_1",
    loc_vars = function(self, info_queue, card)
        if not card.edition or (card.edition and not card.edition.e_negative) then
            info_queue[#info_queue + 1] = G.P_CENTERS.e_negative
        end
        info_queue[#info_queue + 1] = G.P_CENTERS.j_joker
    end,
    calculate = function(self, card, context) --Just taken and modifed from canvas since it is just canvas without restirctions
        if context.retrigger_joker_check and not context.retrigger_joker then
            local num_retriggers = 1
            for i = 1, #G.jokers.cards do
                if card.T.x + card.T.w / 2 < G.jokers.cards[i].T.x + G.jokers.cards[i].T.w / 2 then
                    num_retriggers = num_retriggers + 1
                end
            end
            if card.T and context.other_card.T and (card.T.x + card.T.w / 2 > context.other_card.T.x + context.other_card.T.w / 2) then
                return {
                    message = localize("k_again_ex"),
                    repetitions = num_retriggers,
                    card = card,
                }
            end
        end
        if context.ending_shop and not (context.blueprint or context.retrigger_joker_check or context.retrigger_joker) then
            card_eval_status_text(card, "extra", nil, nil, nil, { message = localize("k_plus_joker"), colour = G.C.FILTER })
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                func = function()
                    local joker = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_joker")
                    joker:set_edition({ negative = true })
                    joker:add_to_deck()
                    G.jokers:emplace(joker)
                    joker:start_materialize()
                    return true
                end,
            }))
        end
    end,
    asc_credits = {
        idea = {
            "hssr96",
            "Googol1e308plex",
            "Gudusername_53951",
        },
        art = {
            "Lil Mr. Slipstream",
        },
        code = {
            "Math",
            "MarioFan597",
        },
    },
})
