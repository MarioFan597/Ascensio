local pair_ref = pairs
function pairs(any)
    return pair_ref(any or {})
end

local function add_to_deck(jkr)
    jkr:add_to_deck()
    G.jokers:emplace(jkr)
    jkr:juice_up(0.3, 0.5)
end

function Ascensio.isAscendable(jkr)
    return Ascensio.Ascensionable[jkr.config.center.key] and true or false
end

function Ascensio.isApothable(jkr)
    return Ascensio.Apothable[jkr.config.center.key] and true or false
end

function Ascensio.ascendJoker(jkr)
    if Ascensio.Ascensionable[jkr.config.center.key] then
        jkr:start_dissolve()

        local card = SMODS.create_card({
            key = Ascensio.Ascensionable[jkr.config.center.key],
            edition = jkr.edition,
        })

        add_to_deck(card)
    end
end

function Ascensio.apotheosisJoker(jkr)
    if Ascensio.Apothable[jkr.config.center.key] then
        jkr:start_dissolve()

        local card = SMODS.create_card({
            key = Ascensio.Apothable[jkr.config.center.key],
            edition = jkr.edition,
        })

        add_to_deck(card)
    end
end

function Ascensio.descendJoker(jkr)
    if Ascensio.Descensions[jkr.config.center.key] then
        jkr:start_dissolve()

        local card = SMODS.create_card({
            key = Ascensio.Descensions[jkr.config.center.key],
            edition = jkr.edition,
        })

        add_to_deck(card)
    end
end
