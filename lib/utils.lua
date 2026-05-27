--- Returns the larger value of 2 numbers
--- @param a number
--- @param b number
--- @return number max
function max(a, b)
    return (a > b) and a or b
end

--- @generic T
---
--- Check if array contains an item
---
--- @param tbl T[] Array of items.
--- @param item T Item to check.
--- @param cmp? fun(a: T, b: T): boolean Optional comparator function.
--- @return boolean
function table.contains(tbl, item, cmp)
    if not cmp then
        for _, tbl_item in ipairs(tbl) do
            if tbl_item == item then
                return true
            end
        end
    else
        for _, tbl_item in ipairs(tbl) do
            if cmp(tbl_item, item) then
                return true
            end
        end
    end

    return false
end

--- @generic K, V
--- @param tbl table<K, V>?
--- @param key K
--- @return V?
function table.safe_get(tbl, key)
    if tbl then
        return tbl[key]
    end
end

--- @param amount number
function ease_joker_slot(amount)
    G.jokers.config.card_limit = G.jokers.config.card_limit + amount
end

--- @param amount number|table?
--- @param instant any?
function ease_dollars_mult(amount, instant) --By Omega. Pretty much thunk's ease dollars but with mutiplication
    local function __inner(__inner_amount)
        local one = 1
        __inner_amount = __inner_amount or 1
        if __inner_amount > one then
            local ui = G.HUD:get_UIE_by_ID("dollar_text_UI")
            local text = "X" .. localize("$")
            local col = G.C.MONEY

            ---@diagnostic disable-next-line: undefined-global
            inc_career_stat("c_dollars_earned", (__inner_amount - one) * G.GAME.dollars)

            G.GAME.dollars = G.GAME.dollars * __inner_amount
            ---@diagnostic disable-next-line: undefined-global
            check_and_set_high_score("most_money", G.GAME.dollars)
            check_for_unlock({ type = "money" })
            ui.config.object:update()
            G.HUD:recalculate()

            ---@diagnostic disable-next-line: undefined-global
            attention_text({
                text = text .. __inner_amount,
                scale = 0.8,
                hold = 0.7,
                cover = ui.parent,
                cover_colour = col,
                align = "cm",
            })

            play_sound("coin1")
        end
    end

    if instant then
        __inner(amount)
    else
        G.E_MANAGER:add_event(Event({
            trigger = "immediate",
            func = function()
                __inner(amount)
                return true
            end,
        }))
    end
end

-- This is ripped off Entropy.
-- Original by LordRuby

---@param mod integer
---@param stroverride? string
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
---@param stroverride? string
local function ease_discard_selection_limit(mod, stroverride)
    G.GAME.starting_params.discard_limit = (G.GAME.starting_params.discard_limit or 5) + mod
    G.hand.config.highlighted_limit = math.max(G.GAME.starting_params.discard_limit or 5, G.GAME.starting_params.play_limit or 5)
    local str = stroverride or G.GAME.starting_params.discard_limit or ""
    SMODS.hand_limit_strings.discard = G.GAME.starting_params.discard_limit ~= 5 and localize("b_limit") .. str or ""
end

---@param mod integer
---@param stroverride? string
ease_selection_limit = function(mod, stroverride)
    if not SMODS.hand_limit_strings then
        SMODS.hand_limit_strings = {}
    end

    ease_playing_card_selection_limit(mod, stroverride)
    ease_discard_selection_limit(mod, stroverride)
end

---@param to integer
---@param stroverride? string
local function set_playing_card_selection_limit(to, stroverride)
    if SMODS.hand_limit_strings then
        G.GAME.starting_params.play_limit = to
        G.hand.config.highlighted_limit = math.max(G.GAME.starting_params.discard_limit or 5, G.GAME.starting_params.play_limit or 5)
        local str = stroverride or G.GAME.starting_params.play_limit or ""
        SMODS.hand_limit_strings.play = G.GAME.starting_params.play_limit ~= 5 and localize("b_limit") .. str or ""
    else
        G.hand.config.highlighted_limit = to
    end
end

---@param to integer
---@param stroverride? string
local function set_discard_selection_limit(to, stroverride)
    G.GAME.starting_params.discard_limit = to
    G.hand.config.highlighted_limit = math.max(G.GAME.starting_params.discard_limit or 5, G.GAME.starting_params.play_limit or 5)
    local str = stroverride or G.GAME.starting_params.discard_limit or ""
    SMODS.hand_limit_strings.discard = G.GAME.starting_params.discard_limit ~= 5 and localize("b_limit") .. str or ""
end

---@param to integer
---@param stroverride? string
set_selection_limit = function(to, stroverride)
    if not SMODS.hand_limit_strings then
        SMODS.hand_limit_strings = {}
    end

    set_playing_card_selection_limit(to, stroverride)
    set_discard_selection_limit(to, stroverride)
end

---@class AscensioCredits
---@field idea? string[]
---@field art? string[]
---@field code? string[]
---@overload fun(self: AscensioCredits): AscensioCredits
Ascensio.Credit = setmetatable({}, {
    ---@param this AscensioCredits
    ---@return AscensioCredits
    __call = function(_, this)
        return this
    end,
})

---@param num number
---@param range { min?: number, max?: number }
---@return boolean
function Ascensio.isInRange(num, range)
    range.min = range.min or -math.huge
    range.max = range.max or math.huge

    return num >= range.min and num <= range.max
end
