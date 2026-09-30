--- Returns the larger value of 2 numbers
---@param a number
---@param b number
---@return number max
function max(a, b)
    return (a > b) and a or b
end

--- Returns the smaller value of 2 numbers
---@param a number
---@param b number
---@return number max
function min(a, b)
    return (a < b) and a or b
end

--- Check if array contains an item
---@generic T
---@param tbl  T[]                      Array of items.
---@param item T                        Item to check.
---@param cmp? fun(a: T, b: T): boolean Optional comparator function.
---@return boolean
function table.contains(tbl, item, cmp)
    cmp = cmp or function(a, b) return a == b end

    if not cmp then
        for _, tbl_item in ipairs(tbl) do
            if tbl_item == item then return true end
        end
    else
        for _, tbl_item in ipairs(tbl) do
            if cmp(tbl_item, item) then return true end
        end
    end

    return false
end

--- Filter outs elements in array that satisfies a given predicate.
---@generic T
---@param tbl       T[]             Array of items.
---@param predicate fun(T): boolean Predicate.
---@return T[]
function table.filter(tbl, predicate)
    local accum = {}

    for _, item in ipairs(tbl) do
        if predicate(item) then accum[#accum + 1] = item end
    end

    return accum
end

---@generic K, V
---@param tbl table<K, V>?
---@param key K
---@return V?
function table.safe_get(tbl, key)
    if tbl then return tbl[key] end
end

---@generic K, V
---@overload fun(tbl: table<K, V>, key: K): V?
---@overload fun(tbl: table<K, V>, key: K[]): V[]
function table.get(tbl, key)
    if type(key) == "table" and key[1] ~= nil then
        local accum = {}

        for _, skey in ipairs(key) do
            if tbl[skey] ~= nil then
                accum[#accum + 1] = tbl[skey]
            else
                break
            end
        end

        return accum
    else
        return tbl[key]
    end
end

---@generic T
---@param tbl table
---@param key string
---@return T?
function table.safe_nav(tbl, key)
    local buf = "tbl"

    for subkey in string.gmatch(key, "[^%.]+") do
        buf = string.format("%s[%s]", buf, subkey)
    end

    local ok, val = pcall(function()
        local chunk, err = load(buf)
        if err then
            return false, nil
        else
            return chunk()
        end
    end)

    if ok then return val end
end

--- Clones a table, recursively.
---@generic K, V
---@param tbl table<K, V>
---@return table<K, V>
function table.clone(tbl)
    local ret = {}

    for k, v in pairs(tbl) do
        if type(v) == "table" then
            ret[k] = table.clone(v)
        else
            ret[k] = v
        end
    end

    return ret
end

--- Merges two or more tables recursively.
---
--- Only lua-dict tables are merged recursively; lua-list tables are treated as opaque values (overwritten instead of merged).
---@param behavior "keep" | "force" | "error"
---@param ...      table
---@return table
function table.extend(behavior, ...)
    ---@generic T
    ---@param v T
    ---@return T
    local function clone(v)
        if type(v) == "table" then
            return table.clone(v)
        else
            return v
        end
    end

    ---@param target table
    ---@param source table
    local function __extend_deep(target, source)
        for k, v in pairs(source) do
            local _target = target[k]

            if _target == nil then
                target[k] = clone(v)
            elseif type(_target) == "table" and type(v) == "table" then
                __extend_deep(_target, v)
            elseif behavior == "force" then
                target[k] = clone(v)
            elseif behavior == "error" then
                error("Key found in more than one map: " .. k)
            end
        end
    end

    local tbls   = { ... }
    local result = {}

    for _, tbl in ipairs(tbls) do
        __extend_deep(result, tbl)
    end

    return result
end

---@param amount number
function ease_joker_slot(amount)
    G.jokers.config.card_limit = G.jokers.config.card_limit + amount
end

---@param amount  number | table?
---@param instant boolean | any?
function ease_dollars_mult(amount, instant) -- By Omega. Pretty much thunk's ease dollars but with mutiplication
    local function __inner(__inner_amount)
        local one      = 1
        __inner_amount = __inner_amount or 1
        if __inner_amount > one then
            local ui   = G.HUD:get_UIE_by_ID("dollar_text_UI")
            local text = "X" .. localize("$")
            local col  = G.C.MONEY

            inc_career_stat("c_dollars_earned", (__inner_amount - one) * G.GAME.dollars)

            G.GAME.dollars = G.GAME.dollars * __inner_amount
            check_and_set_high_score("most_money", G.GAME.dollars)
            check_for_unlock({ type = "money" })
            ui.config.object:update()
            G.HUD:recalculate()

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

--- These is ripped off Entropy.
--- Original by LordRuby
Ascensio.SelectionLimit = {}

---@param mod          integer
---@param stroverride? string
function Ascensio.SelectionLimit.ease_playing_card(mod, stroverride)
    if SMODS.hand_limit_strings then
        G.GAME.starting_params.play_limit = (G.GAME.starting_params.play_limit or 5) + mod
        G.hand.config.highlighted_limit   = math.max(G.GAME.starting_params.discard_limit or 5, G.GAME.starting_params.play_limit or 5)
        local str                         = stroverride or G.GAME.starting_params.play_limit or ""
        SMODS.hand_limit_strings.play     = G.GAME.starting_params.play_limit ~= 5 and localize("b_limit") .. str or ""
    else
        G.hand.config.highlighted_limit = G.hand.config.highlighted_limit + mod
    end
end

---@param mod          integer
---@param stroverride? string
function Ascensio.SelectionLimit.ease_discard(mod, stroverride)
    G.GAME.starting_params.discard_limit = (G.GAME.starting_params.discard_limit or 5) + mod
    G.hand.config.highlighted_limit      = math.max(G.GAME.starting_params.discard_limit or 5, G.GAME.starting_params.play_limit or 5)
    local str                            = stroverride or G.GAME.starting_params.discard_limit or ""
    SMODS.hand_limit_strings.discard     = G.GAME.starting_params.discard_limit ~= 5 and localize("b_limit") .. str or ""
end

---@param to           integer
---@param stroverride? string
function Ascensio.SelectionLimit.set_playing_card(to, stroverride)
    if SMODS.hand_limit_strings then
        G.GAME.starting_params.play_limit = to
        G.hand.config.highlighted_limit   = math.max(G.GAME.starting_params.discard_limit or 5, G.GAME.starting_params.play_limit or 5)
        local str                         = stroverride or G.GAME.starting_params.play_limit or ""
        SMODS.hand_limit_strings.play     = G.GAME.starting_params.play_limit ~= 5 and localize("b_limit") .. str or ""
    else
        G.hand.config.highlighted_limit = to
    end
end

---@param to           integer
---@param stroverride? string
function Ascensio.SelectionLimit.set_discard(to, stroverride)
    G.GAME.starting_params.discard_limit = to
    G.hand.config.highlighted_limit      = math.max(G.GAME.starting_params.discard_limit or 5, G.GAME.starting_params.play_limit or 5)
    local str                            = stroverride or G.GAME.starting_params.discard_limit or ""
    SMODS.hand_limit_strings.discard     = G.GAME.starting_params.discard_limit ~= 5 and localize("b_limit") .. str or ""
end

---@param mod          integer
---@param stroverride? string
function Ascensio.SelectionLimit.ease(mod, stroverride)
    if not SMODS.hand_limit_strings then
        SMODS.hand_limit_strings = {}
    end

    Ascensio.SelectionLimit.ease_playing_card(mod, stroverride)
    Ascensio.SelectionLimit.ease_discard(mod, stroverride)
end

---@param to           integer
---@param stroverride? string
function Ascensio.SelectionLimit.set(to, stroverride)
    if not SMODS.hand_limit_strings then
        SMODS.hand_limit_strings = {}
    end

    Ascensio.SelectionLimit.set_playing_card(to, stroverride)
    Ascensio.SelectionLimit.set_discard(to, stroverride)
end

---@class AscensioCredits
---@field idea? string[]
---@field art?  string[]
---@field code? string[]
---@overload fun(self: AscensioCredits): AscensioCredits
Ascensio.Credit = setmetatable({}, {
    ---@param this AscensioCredits
    ---@return AscensioCredits
    __call = function(_, this) return this end,
})

---@class (partial) SMODS.Joker
---@field asc_credits? AscensioCredits

---@param num   number
---@param range { min: number } | { max: number } | { min: number, max: number }
---@return boolean
function Ascensio.isInRange(num, range)
    range.min = range.min or -math.huge
    range.max = range.max or math.huge

    return num >= range.min and num <= range.max
end

Ascensio.JSON = require("json")
