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
