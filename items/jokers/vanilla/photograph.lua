local ease_selection_limit

if Entropy then
    ease_selection_limit = Entropy.ChangeFullCSL
else
    -- This is ripped off Entropy.
    -- Original by LordRuby

    ---@param mod integer
    ---@param stroverride string
    local function change_play_limit_no_bs(mod, stroverride)
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
    local function change_discard_limit_no_bs(mod, stroverride)
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

        change_play_limit_no_bs(mod, stroverride)
        change_discard_limit_no_bs(mod, stroverride)
    end
end

SMODS.Joker({
    key = "photograh",
    rarity = "cry_exotic",
    atlas = "v_atlas_1",
    blueprint_compat = true,
    demicoloncompat = true,

    cost = 50,
    order = 23,

    pos = { x = 6, y = 14 },
    soul_pos = { x = 8, y = 14, extra = { x = 7, y = 14 } },

    config = {
        extra = {},

        immutable = {
            csl = 3,
        },
    },

    loc_vars = function(_, _, card)
        return {
            vars = {
                card.ability.immutable.csl,
            },
        }
    end,

    add_to_deck = function(_, card) end,

    remove_from_deck = function(_, card) end,

    calculate = function(_, card, ctx)
        if (ctx.other_joker or ctx.joker_main) or ctx.forcetrigger then
            return { eemult = card.ability.extra.eemult }
        end
    end,
})
