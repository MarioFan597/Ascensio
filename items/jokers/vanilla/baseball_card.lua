---@generic T
---@param f fun(jokers: balatro.Card): T
---@param ctx? CalcContext
local function uncommons(f, ctx)
    for _, jokers in ipairs(G.jokers.cards) do
        if jokers.config.center.rarity == 2 or (ctx and ctx.forcetrigger) then
            f(jokers)
        end
    end
end

SMODS.Joker({
    key = "baseball_card",
    rarity = "cry_exotic",
    atlas = "v_atlas_1",
    blueprint_compat = true,
    demicoloncompat = true,

    cost = 50,
    order = 23,

    pos = { x = 9, y = 15 },
    soul_pos = { x = 11, y = 15, extra = { x = 10, y = 15 } },

    config = {
        extra = {
            xval = 1.5,
            emult = 1.25,
        },
    },

    loc_vars = function(_, _, card)
        return {
            vars = {
                card.ability.extra.xval,
                card.ability.extra.emult,
            },
        }
    end,

    calculate = function(_, card, ctx)
        if ctx.other_joker then
            if ctx.other_joker.config.center.rarity == 2 or ctx.forcetrigger then
                return { emult = card.ability.extra.emult }
            end
        end

        if (ctx.beat_boss and ctx.main_eval) or ctx.forcetrigger then
            uncommons(function(jkr)
                Cryptid.manipulate(jkr, { value = card.ability.extra.xval })
            end, ctx)

            return {
                message = "Upgraded!",
            }
        end
    end,

    asc_credits = Ascensio.Credit({
        idea = { "Rhelvetican", "Grahkon" },
        art = { "???" },
        coding = { "Rhelvetican" },
    }),
})
