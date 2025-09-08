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
        trigger = 'immediate',
        func = function()
            _amount(amount)
            return true
        end
        }))
    end
end