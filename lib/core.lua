---@param jkr Card | string
---@return boolean
function Ascensio.isAscendable(jkr)
    if type(jkr) == "string" then return Ascensio.Ascensionable[jkr] ~= nil end
    return Ascensio.Ascensionable[jkr.config.center.key] ~= nil
end

---@param jkr Card
---@return Card
function Ascensio.ascendJoker(jkr)
    if Ascensio.Ascensionable[jkr.config.center.key] then
        jkr:start_dissolve()

        local card = SMODS.add_card({
            key = Ascensio.Ascensionable[jkr.config.center.key],
            edition = jkr.edition,
            area = G.jokers,
        })

        return card
    end

    return jkr
end

if Entropy then
    ---@param jkr Card | string
    ---@return boolean
    function Ascensio.isApothable(jkr)
        if type(jkr) == "string" then return Ascensio.Apothable[jkr] ~= nil end
        return Ascensio.Apothable[jkr.config.center.key] ~= nil
    end

    ---@param jkr Card
    ---@return Card
    function Ascensio.apotheosisJoker(jkr)
        if Ascensio.Apothable[jkr.config.center.key] then
            jkr:start_dissolve()

            local card = SMODS.add_card({
                key = Ascensio.Apothable[jkr.config.center.key],
                edition = jkr.edition,
                area = G.jokers,
            })

            return card
        end

        return jkr
    end
end

---@param jkr Card
---@return Card
function Ascensio.descendJoker(jkr)
    if Ascensio.Descensions[jkr.config.center.key] then
        jkr:start_dissolve()

        local card = SMODS.add_card({
            key = Ascensio.Descensions[jkr.config.center.key],
            edition = jkr.edition,
            area = G.jokers,
        })

        return card
    end

    return jkr
end

---@param samsara? boolean
function Card:setSamsara(samsara)
    self.ability.samsara = ((samsara ~= nil) and samsara or false)
end
