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

-- TODO: Reclarify the fields.

---@class AscensionEntry
---@field source Source Where is the source of the Mortal version of the Joker. Defaults to `Source.Vanilla`.
---@field from string The key of the Mortal joker.
---@field to_exotic string The key of the Ascended joker.
---@field source_file? string Where the Joker is defined in. Defaults to the key of the Mortal Joker with the leading `"j_"` removed. `".lua"` file extension are not to be added.
---@field to_entropic? string The key of the Apotheosis joker.
---@field entropic_file? string Where the Entropic Joker is defined in. Defaults to the key of the Mortal Joker with the leading `"j_"` removed and the `"_entr"` appended. `".lua"` file extension are not to be added.
---@overload fun(self: AscensionEntry): AscensionEntry
AscensionEntry = setmetatable({}, {
    ---@param self AscensionEntry
    __call = function(self)
        local source_file = self.source_file or string.sub(self.from, 3)
        loadFile("items/jokers/" .. self.source .. source_file .. ".lua")

        Ascensionable[self.from] = self.to_exotic

        if Apothable and self.to_entropic ~= nil then
            local entr_source_file = self.entropic_file or (string.sub(self.from, 3) .. "_entr")
            loadFile("items/jokers/" .. self.source .. "entr/" .. entr_source_file .. ".lua")

            Apothable[self.from] = self.to_entropic
            Apothable[self.to_exotic] = self.to_entropic
        end

        return self
    end,
})

AscensionEntry({ source = Source.Vanilla, from = "j_joker", to_exotic = "j_asc_jimbo" })
AscensionEntry({ source = Source.Vanilla, from = "j_greedy_joker", to_exotic = "j_asc_greedy" })
AscensionEntry({ source = Source.Vanilla, from = "j_lusty_joker", to_exotic = "j_asc_lusty" })
AscensionEntry({ source = Source.Vanilla, from = "j_wrathful_joker", to_exotic = "j_asc_wrathful" })
AscensionEntry({ source = Source.Vanilla, from = "j_gluttenous_joker", to_exotic = "j_asc_gluttonous", source_file = "gluttonous" }) -- Sic! Don't correct!
AscensionEntry({ source = Source.Vanilla, from = "j_jolly", to_exotic = "j_asc_jolly" })
AscensionEntry({ source = Source.Vanilla, from = "j_zany", to_exotic = "j_asc_zany" })
AscensionEntry({ source = Source.Vanilla, from = "j_mad", to_exotic = "j_asc_mad" })
AscensionEntry({ source = Source.Vanilla, from = "j_crazy", to_exotic = "j_asc_crazy" })
AscensionEntry({ source = Source.Vanilla, from = "j_droll", to_exotic = "j_asc_droll" })
AscensionEntry({ source = Source.Vanilla, from = "j_sly", to_exotic = "j_asc_sly" })
AscensionEntry({ source = Source.Vanilla, from = "j_wily", to_exotic = "j_asc_wily" })
AscensionEntry({ source = Source.Vanilla, from = "j_clever", to_exotic = "j_asc_clever" })
AscensionEntry({ source = Source.Vanilla, from = "j_devious", to_exotic = "j_asc_devious" })
AscensionEntry({ source = Source.Vanilla, from = "j_crafty", to_exotic = "j_asc_crafty" })
AscensionEntry({ source = Source.Vanilla, from = "j_stencil", to_exotic = "j_asc_stencil" })
AscensionEntry({ source = Source.Vanilla, from = "j_four_fingers", to_exotic = "j_asc_four_fingers" })
AscensionEntry({ source = Source.Vanilla, from = "j_mime", to_exotic = "j_asc_mime" })
AscensionEntry({ source = Source.Vanilla, from = "j_credit_card", to_exotic = "j_asc_credit_card" })
AscensionEntry({ source = Source.Vanilla, from = "j_ceremonial", to_exotic = "j_asc_ceremonial" })
AscensionEntry({ source = Source.Vanilla, from = "j_banner", to_exotic = "j_asc_banner" })
AscensionEntry({ source = Source.Vanilla, from = "j_mystic_summit", to_exotic = "j_asc_mystic_summit" })
AscensionEntry({ source = Source.Vanilla, from = "j_marble", to_exotic = "j_asc_marble", to_entropic = "j_asc_marble_entr" })
AscensionEntry({ source = Source.Vanilla, from = "j_loyalty_card", to_exotic = "j_asc_loyalty_card" })
AscensionEntry({ source = Source.Vanilla, from = "j_misprint", to_exotic = "j_asc_misprint" })
AscensionEntry({ source = Source.Vanilla, from = "j_fibonacci", to_exotic = "j_asc_fibonacci" })
AscensionEntry({ source = Source.Vanilla, from = "j_gros_michel", to_exotic = "j_asc_banana" })
AscensionEntry({ source = Source.Vanilla, from = "j_even_steven", to_exotic = "j_asc_even_steven" })
AscensionEntry({ source = Source.Vanilla, from = "j_odd_todd", to_exotic = "j_asc_odd_todd" })
AscensionEntry({ source = Source.Vanilla, from = "j_space", to_exotic = "j_asc_space" })
AscensionEntry({ source = Source.Vanilla, from = "j_egg", to_exotic = "j_asc_egg" })
AscensionEntry({ source = Source.Vanilla, from = "j_scary_face", to_exotic = "j_asc_scary" })
AscensionEntry({ source = Source.Vanilla, from = "j_abstract", to_exotic = "j_asc_abstract" })
AscensionEntry({ source = Source.Vanilla, from = "j_blackboard", to_exotic = "j_asc_blackboard" })
AscensionEntry({ source = Source.Vanilla, from = "j_ice_cream", to_exotic = "j_asc_ice_cream" })
AscensionEntry({ source = Source.Vanilla, from = "j_dna", to_exotic = "j_asc_dna" })
AscensionEntry({ source = Source.Vanilla, from = "j_blue_joker", to_exotic = "j_asc_blue", source_file = "blue" })
AscensionEntry({ source = Source.Vanilla, from = "j_cavendish", to_exotic = "j_asc_banana" })
AscensionEntry({ source = Source.Vanilla, from = "j_square", to_exotic = "j_asc_square" })
AscensionEntry({ source = Source.Vanilla, from = "j_supernova", to_exotic = "j_asc_supernova" })
AscensionEntry({ source = Source.Vanilla, from = "j_hologram", to_exotic = "j_asc_hologram" })
AscensionEntry({ source = Source.Vanilla, from = "j_obelisk", to_exotic = "j_asc_obelisk" })
AscensionEntry({ source = Source.Vanilla, from = "j_midas_mask", to_exotic = "j_asc_midas" })
AscensionEntry({ source = Source.Vanilla, from = "j_to_the_moon", to_exotic = "j_asc_to_the_moon" })
AscensionEntry({ source = Source.Vanilla, from = "j_golden", to_exotic = "j_asc_golden" })
AscensionEntry({ source = Source.Vanilla, from = "j_bull", to_exotic = "j_asc_bull" })
AscensionEntry({ source = Source.Vanilla, from = "j_selzer", to_exotic = "j_asc_seltzer", source_file = "seltzer" }) -- Sic! Don't correct!
AscensionEntry({ source = Source.Vanilla, from = "j_campfire", to_exotic = "j_asc_campfire" })
AscensionEntry({ source = Source.Vanilla, from = "j_throwback", to_exotic = "j_asc_throwback" })
AscensionEntry({ source = Source.Vanilla, from = "j_hanging_chad", to_exotic = "j_asc_hanging_chad" })
AscensionEntry({ source = Source.Vanilla, from = "j_blueprint", to_exotic = "j_asc_blueprint" })
AscensionEntry({ source = Source.Vanilla, from = "j_mr_bones", to_exotic = "j_asc_mr_bones" })
AscensionEntry({ source = Source.Vanilla, from = "j_sock_and_buskin", to_exotic = "j_asc_sock_and_buskin" })
AscensionEntry({ source = Source.Vanilla, from = "j_wee", to_exotic = "j_asc_wee" })
AscensionEntry({ source = Source.Vanilla, from = "j_oops", to_exotic = "j_asc_oops" })
AscensionEntry({ source = Source.Vanilla, from = "j_duo", to_exotic = "j_asc_duo" })
AscensionEntry({ source = Source.Vanilla, from = "j_trio", to_exotic = "j_asc_trio" })
AscensionEntry({ source = Source.Vanilla, from = "j_family", to_exotic = "j_asc_family" })
AscensionEntry({ source = Source.Vanilla, from = "j_order", to_exotic = "j_asc_order" })
AscensionEntry({ source = Source.Vanilla, from = "j_tribe", to_exotic = "j_asc_tribe" })
AscensionEntry({ source = Source.Vanilla, from = "j_brainstorm", to_exotic = "j_asc_brainstorm" })
AscensionEntry({ source = Source.Vanilla, from = "j_drivers_license", to_exotic = "j_asc_drivers_license" })
AscensionEntry({ source = Source.Vanilla, from = "j_bootstraps", to_exotic = "j_asc_bootstraps" })
AscensionEntry({ source = Source.Vanilla, from = "j_caino", to_exotic = "j_asc_canio", source_file = "canio" }) -- Sic! Don't correct!
AscensionEntry({ source = Source.Vanilla, from = "j_seance", to_exotic = "j_asc_seance" })

AscensionEntry({ source = Source.Cryptid, from = "j_cry_canvas", to_exotic = "j_asc_canvas" })
AscensionEntry({ source = Source.Cryptid, from = "j_cry_sync_catalyst", to_exotic = "j_asc_sync_catalyst" })
AscensionEntry({ source = Source.Cryptid, from = "j_cry_gardenfork", to_exotic = "j_asc_gardenfork" })
AscensionEntry({ source = Source.Cryptid, from = "j_cry_antennastoheaven", to_exotic = "j_asc_like_antennas_to_heaven" })
AscensionEntry({ source = Source.Cryptid, from = "j_cry_chad", to_exotic = "j_asc_chad" })
AscensionEntry({ source = Source.Cryptid, from = "j_cry_oil_lamp", to_exotic = "j_asc_oil_lamp" })
AscensionEntry({ source = Source.Cryptid, from = "j_cry_huntingseason", to_exotic = "j_asc_hunting_season" })
AscensionEntry({ source = Source.Cryptid, from = "j_cry_highfive", to_exotic = "j_asc_high_five" })
AscensionEntry({ source = Source.Cryptid, from = "j_cry_CodeJoker", to_exotic = "j_asc_code_joker" })

-- Mortals for Cryptid Exotics
AscensionEntry({ source = Source.MortalCryptid, from = "j_asc_copy_cat", to_exotic = "j_cry_iterum" })
AscensionEntry({ source = Source.MortalCryptid, from = "j_asc_b_cake", to_exotic = "j_cry_crustulum" })
AscensionEntry({ source = Source.MortalCryptid, from = "j_asc_b_pie", to_exotic = "j_cry_circulus_pistoris" })
AscensionEntry({ source = Source.MortalCryptid, from = "j_asc_orion_pax", to_exotic = "j_cry_primus" })
AscensionEntry({ source = Source.MortalCryptid, from = "j_asc_accomplice", to_exotic = "j_cry_gemino" })
AscensionEntry({ source = Source.MortalCryptid, from = "j_asc_duane", to_exotic = "j_cry_duplicare" })
AscensionEntry({ source = Source.MortalCryptid, from = "j_asc_exorcist", to_exotic = "j_cry_formidiulosus" })

if Entropy then
    AscensionEntry({ source = Source.Entropy, from = "j_entr_sunny_joker", to_exotic = "j_asc_sunny_joker", to_entropic = "j_asc_sunny_joker_entr" })
    AscensionEntry({ source = Source.Entropy, from = "j_entr_chuckle_cola", to_exotic = "j_asc_chuckle_cola" })
end

if next(SMODS.find_mod("Astronomica")) then
    AscensionEntry({ source = Source.Astronomica, from = "j_ast_facsimile", to_exotic = "j_asc_facsimile" })
    AscensionEntry({ source = Source.Astronomica, from = "j_ast_stopwatch", to_exotic = "j_asc_stopwatch" })
end
