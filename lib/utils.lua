---@generic T
---@param tbl T[]
---@param item T
---@return boolean
function table.contains(tbl, item)
    for _, tbl_item in ipairs(tbl) do
        if tbl_item == item then
            return true
        end
    end

    return false
end

---@param amount number
function ease_joker_slot(amount)
    G.jokers.config.card_limit = G.jokers.config.card_limit + amount
end

---@param amount number|table?
function ease_dollars_mult(amount, instant) --By Omega. Pretty much thunk's ease dollars but with mutiplication
    local function _amount(amount)
        local one = 1
        amount = amount or 1
        if amount > one then
            local ui = G.HUD:get_UIE_by_ID("dollar_text_UI")
            local text = "X" .. localize("$")
            local col = G.C.MONEY

            ---@diagnostic disable-next-line: undefined-global
            inc_career_stat("c_dollars_earned", (amount - one) * G.GAME.dollars)

            G.GAME.dollars = G.GAME.dollars * amount
            ---@diagnostic disable-next-line: undefined-global
            check_and_set_high_score("most_money", G.GAME.dollars)
            check_for_unlock({ type = "money" })
            ui.config.object:update()
            G.HUD:recalculate()

            ---@diagnostic disable-next-line: undefined-global
            attention_text({
                text = text .. amount,
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
        _amount(amount)
    else
        G.E_MANAGER:add_event(Event({
            trigger = "immediate",
            func = function()
                _amount(amount)
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
