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
