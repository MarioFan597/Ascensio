-- This is ripped off Entropy.
-- Original by LordRuby

---@param mod integer
---@param stroverride string
local function ease_playing_card_selection_limit(mod, stroverride)
    if SMODS.hand_limit_strings then
        G.GAME.starting_params.play_limit = (G.GAME.starting_params.play_limit or 5) + mod
        G.hand.config.highlighted_limit = math.max(G.GAME.starting_params.discard_limit or 5, G.GAME.starting_params.play_limit or 5)
        local str = stroverride or G.GAME.starting_params.play_limit or ""
        SMODS.hand_limit_strings.play = G.GAME.starting_params.play_limit ~= 5 and localize("b_limit") .. str or ""
    else
        G.hand.config.highlighted_limit = G.hand.config.highlighted_limit + mod
    end
end

---@param mod integer
---@param stroverride string
local function ease_discard_selection_limit(mod, stroverride)
    G.GAME.starting_params.discard_limit = (G.GAME.starting_params.discard_limit or 5) + mod
    G.hand.config.highlighted_limit = math.max(G.GAME.starting_params.discard_limit or 5, G.GAME.starting_params.play_limit or 5)
    local str = stroverride or G.GAME.starting_params.discard_limit or ""
    SMODS.hand_limit_strings.discard = G.GAME.starting_params.discard_limit ~= 5 and localize("b_limit") .. str or ""
end

---@param mod integer
---@param stroverride string
ease_selection_limit = function(mod, stroverride)
    if not SMODS.hand_limit_strings then
        SMODS.hand_limit_strings = {}
    end

    ease_playing_card_selection_limit(mod, stroverride)
    ease_discard_selection_limit(mod, stroverride)
end

SMODS.Joker({
    key = "photograph",
    rarity = "cry_exotic",
    atlas = "v_atlas_1",
    blueprint_compat = true,
    demicoloncompat = true,

    cost = 50,
    order = 23,

    pos = { x = 12, y = 14 },
    soul_pos = { x = 14, y = 14, extra = { x = 13, y = 14 } },

    config = {
        extra = {
            xmult = 3,
            emult = 1.1,
        },

        immutable = {
            csl = 3,
        },
    },

    loc_vars = function(_, _, card)
        return {
            vars = {
                card.ability.immutable.csl,
                card.ability.extra.xmult,
                card.ability.extra.emult,
            },
        }
    end,

    add_to_deck = function(_, card)
        ease_selection_limit(card.ability.immutable.csl)
    end,

    remove_from_deck = function(_, card)
        ease_selection_limit(-card.ability.immutable.csl)
    end,

    calculate = function(_, card, ctx)
        if ctx.individual and ctx.cardarea == G.play then
            local first_face_scored = 0

            for i = 1, #ctx.scoring_hand do
                if ctx.scoring_hand[i]:is_face() then
                    first_face_scored = i
                    break
                end
            end

            if first_face_scored ~= 0 and ctx.scoring_hand then
                for i, scored_card in ipairs(ctx.scoring_hand) do
                    if scored_card == ctx.other_card then
                        if i < first_face_scored then
                            return { xmult = card.ability.extra.xmult }
                        else
                            return { emult = card.ability.extra.emult }
                        end
                    end
                end
            end
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
            "lordruby",
        },
    },
})
