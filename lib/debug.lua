Debug = {}

---@param tbl table
function Debug.dumpTable(tbl)
    for k, v in pairs(tbl) do
        if type(v) == "table" then
            print(k .. " : {")
            Debug.dumpTable(v)
            print("}")
        elseif type(v) == "number" or type(v) == "string" then
            print(k .. " : " .. v)
        elseif type(v) == "boolean" then
            print(k .. " : " .. (v and "true" or "false"))
        else
            print(k .. " : Others")
        end
    end
end

if Cryptid and Cryptid.manipulate then
    ---@param region Card[]
    ---@param args number|{type?: "+"|"X"|"^"|"hyper", value: number|{arrows:number, height:number}}
    function Debug.manipulateAll(region, args)
        for _, card in ipairs(region) do
            if Card.no(card, "immutable", true) then
                if type(args) == "number" then
                    Cryptid.manipulate(card, { value = args })
                else
                    Cryptid.manipulate(card, args)
                end
            end
        end
    end
end
