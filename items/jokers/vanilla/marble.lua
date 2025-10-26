SMODS.Joker({
    key = "marble",
    rarity = "cry_exotic",
    atlas = "v_atlas_1",
    blueprint_compat = true,
    demicoloncompat = true,
    pos = { x = 3, y = 9 },
    soul_pos = { x = 5, y = 9, extra = { x = 4, y = 9 } },
    cost = 50,

    config = {
        extra = {
            retrigger = 1,
            create = 3,
        },

        immutable = {
            recap = 40,
            cacap = 40,
        },
    },

    loc_vars = function(self, info_queue, card)
        if not card.edition or (card.edition and not card.edition.e_cry_mosaic) then
            info_queue[#info_queue + 1] = G.P_CENTERS.e_cry_mosaic
        end
        info_queue[#info_queue + 1] = G.P_CENTERS.m_stone
        return {
            vars = {
                lenient_bignum(math.min(card.ability.extra.retrigger, card.ability.immutable.recap)),
                lenient_bignum(math.min(card.ability.extra.create, card.ability.immutable.cacap)),
                lenient_bignum(card.ability.immutable.recap),
                lenient_bignum(card.ability.immutable.cacap),
            },
        }
    end,

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play and SMODS.has_enhancement(context.other_card, "m_stone") then
            return {
                message = localize("k_again_ex"),
                repetitions = to_number(math.min(card.ability.immutable.recap, card.ability.extra.retrigger)),
            }
        end

        if context.setting_blind then
            if card.ability.extra.retrigger > card.ability.immutable.recap then
                card.ability.extra.retrigger = card.ability.immutable.recap
            end
            if card.ability.extra.create > card.ability.immutable.cacap then
                card.ability.extra.create = card.ability.immutable.cacap
            end
            local stones = {}
            for _ = 1, to_number(card.ability.extra.create) do
                local stone = SMODS.create_card({
                    set = "Base",
                    enhancement = "m_stone",
                    --edition = "e_cry_mosaic", we have to do this later so we can disable the sound
                    --seal = "Red", --Not using this as stone gives all the retriggers we need
                    area = G.discard,
                })
                if card.ability.extra.create <= 5 and not Talisman.config_file.disable_anims then
                    stone:set_edition("e_cry_mosaic")
                else
                    stone:set_edition("e_cry_mosaic", nil, true)
                end
                table.insert(stones, stone)
                --Modifed VanillaRemade Stone Joker for the visual aspect
                G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                stone.playing_card = G.playing_card
                table.insert(G.playing_cards, stone)
                G.E_MANAGER:add_event(Event({
                    func = function()
                        stone:start_materialize({ G.C.SECONDARY_SET.Enhanced })
                        G.play:emplace(stone)
                        return true
                    end,
                }))
            end
            return {
                message = "+" .. card.ability.extra.create .. " " .. localize("asc_mossaic_stone_cards"),
                colour = G.C.SECONDARY_SET.Enhanced,
                func = function()
                    for _ = 1, to_number(math.min(card.ability.extra.create, card.ability.immutable.cacap)) do
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                G.deck.config.card_limit = G.deck.config.card_limit + 1
                                return true
                            end,
                        }))
                        draw_card(G.play, G.deck, 90, "up")
                        SMODS.calculate_context({ playing_card_added = true, cards = stones })
                    end
                end,
            }
        end
    end,

    asc_credits = {
        idea = {
            "Rhelvetican",
        },
        art = {
            "Tatteredlurker",
        },
        code = {
            "Rhelvetican",
            "MarioFan597",
        },
    },
})
