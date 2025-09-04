Ascensionable = {}

if Entropy then
    Apothable = {}
end

---@param path string Path to the file
---@param id? string Mod ID. Defaults to `SMODS.current_mod`.
---@return any?
function loadFile(path, id)
    local chunk, err = SMODS.load_file(path, id)
    if err ~= nil or chunk == nil then
        return err
    end

    chunk()
end

loadFile("Atlas.lua")

-- Load libraries.
loadFile("lib/cardanim.lua")
loadFile("lib/number.lua")
loadFile("lib/hooks.lua")

---@enum Source
Source = {
    Vanilla = "vanilla/",
    Cryptid = "cryptid/",
    Entropy = "entropy/",
    Astronomica = "astronomica/",
    Cryptposting = "cryptposting/",

    MortalCryptid = "cryptid/mortal/",
}

---@param key string
---@param source Source
---@return string
function get_source_file(key, source)
    if source == "vanilla/" then
        return string.sub(key, 3)
    else
        if source == "entropy/" then
            return string.sub(key, 8)
        else
            return string.sub(key, 7)
        end
    end
end

-- TODO: Reclarify the fields.

---@class AscensionEntry
---@field source Source Where is the source of the Mortal version of the Joker. Defaults to `Source.Vanilla`.
---@field from string The key of the Mortal joker.
---@field to_exotic string The key of the Ascended joker.
---@field source_file? string Where the Joker is defined in. Defaults to the key of the Mortal Joker with the leading `"j_"` removed. `".lua"` file extension are not to be added.
---@field to_entropic? string The key of the Apotheosis joker.
---@field entropic_file? string Where the Entropic Joker is defined in. Defaults to the key of the Mortal Joker with the leading `"j_"` removed and the `"_entr"` appended. `".lua"` file extension are not to be added.
---@overload fun(self: AscensionEntry): AscensionEntry
Ascension = setmetatable({}, {
    ---@param self AscensionEntry
    __call = function(self)
        return self
    end,
})

---@type AscensionEntry[]
AscensionIndex = {}

-- Vanilla Ascensions
table.insert(AscensionIndex, Ascension({ source = Source.Vanilla, from = "j_joker", to_exotic = "j_asc_jimbo", source_file = "jimbo" }))
table.insert(AscensionIndex, Ascension({ source = Source.Vanilla, from = "j_greedy_joker", to_exotic = "j_asc_greedy" }))
table.insert(AscensionIndex, Ascension({ source = Source.Vanilla, from = "j_lusty_joker", to_exotic = "j_asc_lusty" }))
table.insert(AscensionIndex, Ascension({ source = Source.Vanilla, from = "j_wrathful_joker", to_exotic = "j_asc_wrathful" }))
table.insert(AscensionIndex, Ascension({ source = Source.Vanilla, from = "j_gluttenous_joker", to_exotic = "j_asc_gluttonous", source_file = "gluttonous" })) -- Sic! Don't correct!
table.insert(AscensionIndex, Ascension({ source = Source.Vanilla, from = "j_jolly", to_exotic = "j_asc_jolly" }))
table.insert(AscensionIndex, Ascension({ source = Source.Vanilla, from = "j_zany", to_exotic = "j_asc_zany" }))
table.insert(AscensionIndex, Ascension({ source = Source.Vanilla, from = "j_mad", to_exotic = "j_asc_mad" }))
table.insert(AscensionIndex, Ascension({ source = Source.Vanilla, from = "j_crazy", to_exotic = "j_asc_crazy" }))
table.insert(AscensionIndex, Ascension({ source = Source.Vanilla, from = "j_droll", to_exotic = "j_asc_droll" }))
table.insert(AscensionIndex, Ascension({ source = Source.Vanilla, from = "j_sly", to_exotic = "j_asc_sly" }))
table.insert(AscensionIndex, Ascension({ source = Source.Vanilla, from = "j_wily", to_exotic = "j_asc_wily" }))
table.insert(AscensionIndex, Ascension({ source = Source.Vanilla, from = "j_clever", to_exotic = "j_asc_clever" }))
table.insert(AscensionIndex, Ascension({ source = Source.Vanilla, from = "j_devious", to_exotic = "j_asc_devious" }))
table.insert(AscensionIndex, Ascension({ source = Source.Vanilla, from = "j_crafty", to_exotic = "j_asc_crafty" }))
table.insert(AscensionIndex, Ascension({ source = Source.Vanilla, from = "j_stencil", to_exotic = "j_asc_stencil" }))
table.insert(AscensionIndex, Ascension({ source = Source.Vanilla, from = "j_four_fingers", to_exotic = "j_asc_four_fingers" }))
table.insert(AscensionIndex, Ascension({ source = Source.Vanilla, from = "j_mime", to_exotic = "j_asc_mime" }))
table.insert(AscensionIndex, Ascension({ source = Source.Vanilla, from = "j_credit_card", to_exotic = "j_asc_credit_card" }))
table.insert(AscensionIndex, Ascension({ source = Source.Vanilla, from = "j_ceremonial", to_exotic = "j_asc_ceremonial" }))
table.insert(AscensionIndex, Ascension({ source = Source.Vanilla, from = "j_banner", to_exotic = "j_asc_banner" }))
table.insert(AscensionIndex, Ascension({ source = Source.Vanilla, from = "j_mystic_summit", to_exotic = "j_asc_mystic_summit" }))
table.insert(AscensionIndex, Ascension({ source = Source.Vanilla, from = "j_marble", to_exotic = "j_asc_marble", to_entropic = "j_asc_marble_entr" }))
table.insert(AscensionIndex, Ascension({ source = Source.Vanilla, from = "j_loyalty_card", to_exotic = "j_asc_loyalty_card" }))
table.insert(AscensionIndex, Ascension({ source = Source.Vanilla, from = "j_misprint", to_exotic = "j_asc_misprint" }))
table.insert(AscensionIndex, Ascension({ source = Source.Vanilla, from = "j_fibonacci", to_exotic = "j_asc_fibonacci" }))
table.insert(AscensionIndex, Ascension({ source = Source.Vanilla, from = "j_gros_michel", to_exotic = "j_asc_banana" }))
table.insert(AscensionIndex, Ascension({ source = Source.Vanilla, from = "j_even_steven", to_exotic = "j_asc_even_steven" }))
table.insert(AscensionIndex, Ascension({ source = Source.Vanilla, from = "j_odd_todd", to_exotic = "j_asc_odd_todd" }))
table.insert(AscensionIndex, Ascension({ source = Source.Vanilla, from = "j_space", to_exotic = "j_asc_space" }))
table.insert(AscensionIndex, Ascension({ source = Source.Vanilla, from = "j_egg", to_exotic = "j_asc_egg" }))
table.insert(AscensionIndex, Ascension({ source = Source.Vanilla, from = "j_scary_face", to_exotic = "j_asc_scary" }))
table.insert(AscensionIndex, Ascension({ source = Source.Vanilla, from = "j_abstract", to_exotic = "j_asc_abstract" }))
table.insert(AscensionIndex, Ascension({ source = Source.Vanilla, from = "j_blackboard", to_exotic = "j_asc_blackboard" }))
table.insert(AscensionIndex, Ascension({ source = Source.Vanilla, from = "j_ice_cream", to_exotic = "j_asc_ice_cream" }))
table.insert(AscensionIndex, Ascension({ source = Source.Vanilla, from = "j_dna", to_exotic = "j_asc_dna" }))
table.insert(AscensionIndex, Ascension({ source = Source.Vanilla, from = "j_blue_joker", to_exotic = "j_asc_blue", source_file = "blue" }))
table.insert(AscensionIndex, Ascension({ source = Source.Vanilla, from = "j_cavendish", to_exotic = "j_asc_banana" }))
table.insert(AscensionIndex, Ascension({ source = Source.Vanilla, from = "j_square", to_exotic = "j_asc_square" }))
table.insert(AscensionIndex, Ascension({ source = Source.Vanilla, from = "j_supernova", to_exotic = "j_asc_supernova" }))
table.insert(AscensionIndex, Ascension({ source = Source.Vanilla, from = "j_hologram", to_exotic = "j_asc_hologram" }))
table.insert(AscensionIndex, Ascension({ source = Source.Vanilla, from = "j_obelisk", to_exotic = "j_asc_obelisk" }))
table.insert(AscensionIndex, Ascension({ source = Source.Vanilla, from = "j_midas_mask", to_exotic = "j_asc_midas" }))
table.insert(AscensionIndex, Ascension({ source = Source.Vanilla, from = "j_to_the_moon", to_exotic = "j_asc_to_the_moon" }))
table.insert(AscensionIndex, Ascension({ source = Source.Vanilla, from = "j_golden", to_exotic = "j_asc_golden" }))
table.insert(AscensionIndex, Ascension({ source = Source.Vanilla, from = "j_bull", to_exotic = "j_asc_bull" }))
table.insert(AscensionIndex, Ascension({ source = Source.Vanilla, from = "j_selzer", to_exotic = "j_asc_seltzer", source_file = "seltzer" })) -- Sic! Don't correct!
table.insert(AscensionIndex, Ascension({ source = Source.Vanilla, from = "j_campfire", to_exotic = "j_asc_campfire" }))
table.insert(AscensionIndex, Ascension({ source = Source.Vanilla, from = "j_throwback", to_exotic = "j_asc_throwback" }))
table.insert(AscensionIndex, Ascension({ source = Source.Vanilla, from = "j_hanging_chad", to_exotic = "j_asc_hanging_chad" }))
table.insert(AscensionIndex, Ascension({ source = Source.Vanilla, from = "j_blueprint", to_exotic = "j_asc_blueprint" }))
table.insert(AscensionIndex, Ascension({ source = Source.Vanilla, from = "j_mr_bones", to_exotic = "j_asc_mr_bones" }))
table.insert(AscensionIndex, Ascension({ source = Source.Vanilla, from = "j_sock_and_buskin", to_exotic = "j_asc_sock_and_buskin" }))
table.insert(AscensionIndex, Ascension({ source = Source.Vanilla, from = "j_wee", to_exotic = "j_asc_wee" }))
table.insert(AscensionIndex, Ascension({ source = Source.Vanilla, from = "j_oops", to_exotic = "j_asc_oops" }))
table.insert(AscensionIndex, Ascension({ source = Source.Vanilla, from = "j_duo", to_exotic = "j_asc_duo" }))
table.insert(AscensionIndex, Ascension({ source = Source.Vanilla, from = "j_trio", to_exotic = "j_asc_trio" }))
table.insert(AscensionIndex, Ascension({ source = Source.Vanilla, from = "j_family", to_exotic = "j_asc_family" }))
table.insert(AscensionIndex, Ascension({ source = Source.Vanilla, from = "j_order", to_exotic = "j_asc_order" }))
table.insert(AscensionIndex, Ascension({ source = Source.Vanilla, from = "j_tribe", to_exotic = "j_asc_tribe" }))
table.insert(AscensionIndex, Ascension({ source = Source.Vanilla, from = "j_brainstorm", to_exotic = "j_asc_brainstorm" }))
table.insert(AscensionIndex, Ascension({ source = Source.Vanilla, from = "j_drivers_license", to_exotic = "j_asc_drivers_license" }))
table.insert(AscensionIndex, Ascension({ source = Source.Vanilla, from = "j_bootstraps", to_exotic = "j_asc_bootstraps" }))
table.insert(AscensionIndex, Ascension({ source = Source.Vanilla, from = "j_caino", to_exotic = "j_asc_canio", source_file = "canio" })) -- Sic! Don't correct!
table.insert(AscensionIndex, Ascension({ source = Source.Vanilla, from = "j_seance", to_exotic = "j_asc_seance" }))

-- Cryptid Ascensions
table.insert(AscensionIndex, Ascension({ source = Source.Cryptid, from = "j_cry_canvas", to_exotic = "j_asc_canvas" }))
table.insert(AscensionIndex, Ascension({ source = Source.Cryptid, from = "j_cry_sync_catalyst", to_exotic = "j_asc_sync_catalyst" }))
table.insert(AscensionIndex, Ascension({ source = Source.Cryptid, from = "j_cry_gardenfork", to_exotic = "j_asc_gardenfork" }))
table.insert(AscensionIndex, Ascension({ source = Source.Cryptid, from = "j_cry_antennastoheaven", to_exotic = "j_asc_like_antennas_to_heaven" }))
table.insert(AscensionIndex, Ascension({ source = Source.Cryptid, from = "j_cry_chad", to_exotic = "j_asc_chad" }))
table.insert(AscensionIndex, Ascension({ source = Source.Cryptid, from = "j_cry_oil_lamp", to_exotic = "j_asc_oil_lamp" }))
table.insert(AscensionIndex, Ascension({ source = Source.Cryptid, from = "j_cry_huntingseason", to_exotic = "j_asc_hunting_season" }))
table.insert(AscensionIndex, Ascension({ source = Source.Cryptid, from = "j_cry_highfive", to_exotic = "j_asc_high_five" }))
table.insert(AscensionIndex, Ascension({ source = Source.Cryptid, from = "j_cry_CodeJoker", to_exotic = "j_asc_code_joker" }))

-- Mortals for Cryptid Exotics
table.insert(AscensionIndex, Ascension({ source = Source.MortalCryptid, from = "j_asc_copy_cat", to_exotic = "j_cry_iterum", source_file = "copy_cat" }))
table.insert(AscensionIndex, Ascension({ source = Source.MortalCryptid, from = "j_asc_b_cake", to_exotic = "j_cry_crustulum" }))
table.insert(AscensionIndex, Ascension({ source = Source.MortalCryptid, from = "j_asc_b_pie", to_exotic = "j_cry_circulus_pistoris" }))
table.insert(AscensionIndex, Ascension({ source = Source.MortalCryptid, from = "j_asc_orion_pax", to_exotic = "j_cry_primus" }))
table.insert(AscensionIndex, Ascension({ source = Source.MortalCryptid, from = "j_asc_accomplice", to_exotic = "j_cry_gemino" }))
table.insert(AscensionIndex, Ascension({ source = Source.MortalCryptid, from = "j_asc_duane", to_exotic = "j_cry_duplicare" }))
table.insert(AscensionIndex, Ascension({ source = Source.MortalCryptid, from = "j_asc_exorcist", to_exotic = "j_cry_formidiulosus" }))

-- Entropy Ascensions
if Entropy then
    table.insert(AscensionIndex, Ascension({ source = Source.Entropy, from = "j_entr_sunny_joker", to_exotic = "j_asc_sunny_joker", to_entropic = "j_asc_sunny_joker_entr" }))
    table.insert(AscensionIndex, Ascension({ source = Source.Entropy, from = "j_entr_chuckle_cola", to_exotic = "j_asc_chuckle_cola" }))
end

-- Astronomica Ascensions
if next(SMODS.find_mod("Astronomica")) then
    table.insert(AscensionIndex, Ascension({ source = Source.Astronomica, from = "j_ast_facsimile", to_exotic = "j_asc_facsimile" }))
    table.insert(AscensionIndex, Ascension({ source = Source.Astronomica, from = "j_ast_stopwatch", to_exotic = "j_asc_stopwatch" }))
end

for _, asc in ipairs(AscensionIndex) do
    local source_file = asc.source_file or get_source_file(asc.from, asc.source)
    loadFile("items/jokers/" .. asc.source .. source_file .. ".lua")

    Ascensionable[asc.from] = asc.to_exotic

    if Apothable and asc.to_entropic ~= nil then
        local entr_source_file = asc.entropic_file or (get_source_file(asc.from, asc.source) .. "_entr")
        loadFile("items/jokers/" .. asc.source .. "entr/" .. entr_source_file .. ".lua")

        Apothable[asc.from] = asc.to_entropic
        Apothable[asc.to_exotic] = asc.to_entropic
    end
end
