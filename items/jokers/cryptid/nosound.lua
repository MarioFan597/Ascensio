SMODS.Joker({
    key = "nosound",
    config = { extra = { retriggers = 3, odds = 7, },
               immutable = { max_retriggers = 40, multiplier = 1.3 } 
    },
    rarity = "cry_exotic",
    atlas = "c_atlas_1",
    blueprint_compat = true,
    demicoloncompat = true,
    pos = { x = 3, y = 4 },
    soul_pos = { x = 5, y = 4, extra = { x = 4, y = 4 } },
    cost = 50,
    order = 216,
    loc_vars = function(self, info_queue, card)
        local num, denom = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, "Exotic No Sound")
        return { 
            vars = { 
                math.min(card.ability.immutable.max_retriggers, card.ability.extra.retriggers),
                card.ability.immutable.max_retriggers,
                num,
                denom,
                card.ability.immutable.multiplier
            } 
        }
    end,
    calculate = function(self, card, context)
        if context.repetition then --This is the base Joker effect
            if context.cardarea == G.play then 
                if context.other_card:get_id() == 7 then
                    return {
                        message = localize("k_again_ex"),
                        repetitions = to_number(
                            math.min(card.ability.immutable.max_retriggers, card.ability.extra.retriggers)
                        ),
                        card = card,
                    }
                end
            end
        end
        local prob --Keeps track of if we hit the probability or not
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_id() == 7 and SMODS.pseudorandom_probability(card, "No Memory of your card", 1, card.ability.extra.odds, "Exotic No Sound") then
                prob = true
                local jokers = {} --Select a random Joker
                for i = 1, #G.jokers.cards do
                    if not G.jokers.cards[i].debuff then
                        jokers[#jokers + 1] = G.jokers.cards[i]
                    end
                end
                local chosen_joker = pseudorandom_element(jokers, pseudoseed("No Memory"))

                local check = false --Modify selected Joker
                if not Card.no(chosen_joker, "immutable", true) then
                    Cryptid.manipulate(chosen_joker, { value = card.ability.immutable.multiplier })
                    check = true
                end
                if check then
                    card_eval_status_text(
                        card,
                        "extra",
                        nil,
                        nil,
                        nil,
                        { message = localize("k_upgrade_ex"), colour = G.C.GREEN }
                    )
                end
            end
        end

        if context.destroying_card and not context.blueprint then
            if context.destroying_card:get_id() == 7 then
                return { remove = not SMODS.is_eternal(context.destroying_card) }
            end
        end
    end,
    asc_credits = {
        idea = {
            "Grahkon",
        },
        art = {
            "Oinite12",
        },
        code = {
            "MarioFan597",
        },
    },
})
